#include <built_in.h>
#include "__Lib_FAT32.h"

// CODEC V1053E connections
sbit MP3_CS_Direction          at TRISG14_bit;
sbit MP3_CS                    at LATG14_bit;
sbit MP3_RST_Direction         at TRISG13_bit;
sbit MP3_RST                   at LATG13_bit;
sbit DREQ_Direction            at TRISG12_bit;
sbit DREQ                      at RG12_bit;
sbit BSYNC_Direction           at TRISG15_bit;
sbit BSYNC                     at LATG15_bit;

// MMC module connections
sbit Mmc_Chip_Select_Direction at TRISD12_bit;
sbit Mmc_Chip_Select           at LATD12_bit;  // for writing to output pin always use latch (PIC18 family)
sbit Mmc_Card_Detect_Direction at TRISD13_bit;
sbit Mmc_Card_Detect           at RD13_bit;    // for detecting microSD card presence

// Buttons for Left/Right Volume control
sbit BtnLeftDown_Direction  at TRISA4_bit;
sbit BtnLeftUp_Direction    at TRISA5_bit;
sbit BtnRightDown_Direction at TRISA0_bit;
sbit BtnRightUp_Direction   at TRISA1_bit;
sbit BtnLeftDown            at RA4_bit;
sbit BtnLeftUp              at RA5_bit;
sbit BtnRightDown           at RA0_bit;
sbit BtnRightUp             at RA1_bit;

// VS1053E constants
const char WRITE_CODE = 0x02;
const char READ_CODE = 0x03;

// Module constants
const char SCI_BASE_ADDR = 0x00;
const char SCI_MODE_ADDR = 0x00;
const char SCI_STATUS_ADDR = 0x01;
const char SCI_BASS_ADDR = 0x02;
const char SCI_CLOCKF_ADDR = 0x03;
const char SCI_DECODE_TIME_ADDR = 0x04;
const char SCI_AUDATA_ADDR = 0x05;
const char SCI_WRAM_ADDR = 0x06;
const char SCI_WRAMADDR_ADDR = 0x07;
const char SCI_HDAT0_ADDR = 0x08;
const char SCI_HDAT1_ADDR = 0x09;
const char SCI_AIADDR_ADDR = 0x0A;
const char SCI_VOL_ADDR = 0x0B;
const char SCI_AICTRL0_ADDR = 0x0C;
const char SCI_AICTRL1_ADDR = 0x0D;
const char SCI_AICTRL2_ADDR = 0x0E;
const char SCI_AICTRL3_ADDR = 0x0F;

// Global Variables
unsigned long file_size;
const BYTES_2_WRITE = 32;
const BUFFER_SIZE = 448;
char mp3_buffer[BUFFER_SIZE];
char volume_left, volume_right;





// Function writes one byte to MP3 SCI
void MP3_SCI_Write(char address, unsigned int data_in) {
        BSYNC = 1;

        MP3_CS = 0;                   // select MP3 SCI
        SPI3_Write(WRITE_CODE);
        SPI3_Write(address);
        SPI3_Write(Hi(data_in));      // high byte
        SPI3_Write(Lo(data_in));      // low byte
        MP3_CS = 1;                   // deselect MP3 SCI

        // wait until DREQ becomes 1, see MP3 codec datasheet, Serial Protocol for SCI
        while (DREQ == 0)
                ;
}

// Function reads words_count words from MP3 SCI
void MP3_SCI_Read(char start_address, char words_count, unsigned int* data_buffer) {
        unsigned int temp;

        MP3_CS = 0;                   // select MP3 SCI
        SPI3_Write(READ_CODE);        // Enter into reading mode
        SPI3_Write(start_address);    // Start reading from the starting address

        while (words_count) {         // read words_count words byte per byte
                words_count--;
                temp = SPI3_Read(0);
                temp = temp << 8;
                temp = temp + SPI3_Read(0);
                *data_buffer = temp;
                data_buffer++;
        }
        MP3_CS = 1;                   // deselect MP3 SCI

        // wait until DREQ becomes 1, see MP3 codec datasheet, Serial Protocol for SCI
        while (DREQ == 0)
                ;
}

// Function write one byte to MP3 SDI
void MP3_SDI_Write(char data_) {
        MP3_CS = 1;                   // deselect MP3 SCI
        BSYNC = 0;

        // wait until DREQ becomes 1, see MP3 codec datasheet, Serial Protocol for SCI
        while (DREQ == 0)
                ;

        SPI3_Write(data_);            // write data to MP3 codec
        BSYNC = 1;
}

// Function Write 32 bytes to MP3 SDI
void MP3_SDI_Write_32(char* data_) {
        char i;

        MP3_CS = 1;
        BSYNC = 0;

        // wait until DREQ becomes 1, see MP3 codec datasheet, Serial Protocol for SCI
        while (DREQ == 0)
                ;

        for (i = 0; i < 32; i++)
                SPI3_Write(data_[i]);
        BSYNC = 1;
}

// Function set volume on the left and right channel
void MP3_Set_Volume(char left, char right) {
        unsigned int volume;

        volume = (left << 8) + right;             // calculate value
        MP3_SCI_Write(SCI_VOL_ADDR, volume);    // Write value to VOL register
}

// Function updates volume if volume Buttons are pressed
void MP3_Check_Volume() {
        char old_volume_left, old_volume_right;

        BtnLeftDown_Direction = 1;             // set pin direction as input
        BtnLeftUp_Direction = 1;
        BtnRightDown_Direction = 1;
        BtnRightUp_Direction = 1;
        BtnLeftDown = 0;                       // set pin value to zero
        BtnLeftUp = 0;
        BtnRightDown = 0;
        BtnRightUp = 0;

        old_volume_left = volume_left;         // save volume values
        old_volume_right = volume_right;

        if (BtnLeftDown) {                      // RD3 pressed = LEFT VOLUME DOWN command
                if (volume_left < 255) {
                        volume_left++;
                }
        }
        if (BtnLeftUp) {                        // RD2 pressed = LEFT VOLUME UP command
                if (volume_left > 0) {
                        volume_left--;
                }
        }
        if (BtnRightDown) {                     // RD1 pressed = RIGHT VOLUME DOWN command
                if (volume_right < 255) {
                        volume_right++;
                }
        }
        if (BtnRightUp) {                       // RD0 pressed = RIGHT VOLUME UP command
                if (volume_right > 0) {
                        volume_right--;
                }
        }

        // if volume values are changed, set volume to new values
        if ((volume_left != old_volume_left) || (volume_right != old_volume_right)) {
                MP3_Set_Volume(volume_left, volume_right);
        }
}

// Function initializes MP3 codec
void MP3_Init() {

        MP3_CS_Direction = 0;               // Configure MP3_CS as output
        MP3_CS = 1;               // Deselect MP3_CS
        MP3_RST_Direction = 0;               // Configure MP3_RST as output
        MP3_RST = 1;               // Set MP3_RST pin

        DREQ_Direction = 1;               // Configure DREQ as input
        BSYNC_Direction = 0;               // Configure BSYNC as output
        BSYNC = 0;               // Clear BSYNC

        // Initialize SPI3 module
        SPI3_Init_Advanced(_SPI_MASTER, _SPI_8_BIT, 40, _SPI_SS_DISABLE, _SPI_DATA_SAMPLE_MIDDLE, _SPI_CLK_IDLE_LOW, _SPI_IDLE_2_ACTIVE);

        // Hardware reset
        MP3_RST = 0;
        Delay_ms(10);
        MP3_RST = 1;

        // wait until DREQ becomes 1, see MP3 codec datasheet, Serial Protocol for SCI
        while (DREQ == 0)
                ;

        MP3_SCI_Write(SCI_MODE_ADDR, 0x0800);
        MP3_SCI_Write(SCI_BASS_ADDR, 0x7A00);
        MP3_SCI_Write(SCI_CLOCKF_ADDR, 0x2000);   // default 12 288 000 Hz

        // Maximum volume is 0x00 and total silence is 0xFE.
        volume_left = 20;            // Set volume to initial value
        volume_right = 20;
        MP3_Set_Volume(volume_left, volume_right);
        Delay_ms(1000);
}
void initSPI(void)
{
        SPI3_Init_Advanced(_SPI_MASTER, _SPI_8_BIT, 80, _SPI_SS_DISABLE, _SPI_DATA_SAMPLE_MIDDLE, _SPI_CLK_IDLE_HIGH, _SPI_ACTIVE_2_IDLE);
}

static char* constToVar(char* dst, const char* src)
{
        char* tmp;

        tmp = dst;
        for (;;)
        {
                *dst = *src;
                if (*src == 0) break;
                src++;
                dst++;
        }
        return tmp;
}

// Function plays mp3 file
int MP3_Play(char *infname)
{
  unsigned long i;
  short fileHandle = -1;
  int err = -1;

  // Let's Begin
  while(fileHandle < 0)
  {
   fileHandle = FAT32_Open(infname, FILE_READ);
  }

  if (fileHandle >= 0) // If not Error
  {
      //Get file size
      fileHandle = FAT32_Size(infname, &file_size);
      
// send file blocks to MP3 SDI
      while (file_size > BUFFER_SIZE)
      {
              FAT32_Read(fileHandle, mp3_buffer, BUFFER_SIZE);
              for (i = 0; i < BUFFER_SIZE / BYTES_2_WRITE; i++)
              {
                      MP3_SDI_Write_32(mp3_buffer + i * BYTES_2_WRITE);
              }
              file_size -= BUFFER_SIZE;
      }

      // send the rest of the file to MP3 SDI
      FAT32_Read(fileHandle, mp3_buffer, BUFFER_SIZE);

      for (i = 0; i < file_size; i++)
      {
              MP3_SDI_Write(mp3_buffer[i]);
      }

      while(err != 0)
      {
         err = FAT32_Close(fileHandle);
      }
  }
}