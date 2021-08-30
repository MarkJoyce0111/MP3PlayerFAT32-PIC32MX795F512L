/*
 * Project name:
     MP3 (Demonstration of on-board audio module)
     Now for FAT32
 * Copyright:
     (c) Mikroelektronika, 2012.
 * Revision History:
     20120810:
       - initial release (FJ);
     20200920:
       - Fat 32 Mark Joyce 2020
 * Description:
     This project demonstrates communication with VS1011E mp3 codec.
     Program reads one mp3 file from SDHC and sends it to VS1011E for decoding
     and playing. SDHC and MP3_SCI share Hardware SPI module.
 * Test configuration:
     MCU:             P32MX795F512L
                      http://ww1.microchip.com/downloads/en/DeviceDoc/61156F.pdf
     Dev.Board:       EasyPIC Fusion v7 - ac:MP3
                      http://www.mikroe.com/easypic-fusion/
     Oscillator:      XT-PLL, 80.0000MHz
     Ext. Modules:    EasyTFT display - ac:EasyTFT
     SW:              mikroC PRO for PIC32
                      http://www.mikroe.com/mikroc/pic32/
 * NOTES:
     - Turn on SPI and AUDIO switches at switch SW13. (board specific)
     - Turn on microSD card switches at SW14. (board specific)
     - Turn on TFT backlight on SW11.1. (board specific)
     - Put PORTA switches in the pull-down position and turn on Button Press
       Level switch SW10 for PORTA&C.
     - Use RA1 and RA5 to increase volume for left and right channels,
       RA0 and RA4 do decrease volume for left and right channels, respecively.
     - MP3 file should have the following name : "hello_my_name_is_mark.mp3.mp3".
     Attention! Trap for new players.
     - ! The audio jack on the decoder is not compatable with all plugs (headphones etc), you may
          have to pull it out a bit to make a connection.
 */
#include "MP3_routines.h"
#include "resources.h"
#include "jsmn.h"
#include "__Lib_FAT32.h"
#include "ExtFile.h"

char buffer[50];
char globalTextBuffer[50];
char fileData[300];
char res[300];
int spacer = 65;
short rfHandle;
unsigned long rfStartSect;




static const char *JSON_STRING = "{\"uid\": 1234567890123123811,\n"
"\"audio\": [\"hello_my_name_is_mark.mp3\", \"food.mp3\", \"help.mp3\", \"yes.mp3\", \"no.mp3\", \"i_would_like.mp3\"],\n"
"\"text\": [\"Hello my name is Mark*\", \"food*\", \"Help*\", \"Yes*\", \"No*\", \"I would like *\"]}";


 
/*
static const char *JSON_STRING =
    "{\"user\": \"mark_joyce\", \n"
     "\"screen_text\": [\"Hello, my name is Mark\", \"I would like \", \"food\", \"help\"],\n"
     "\"file_names\": [\"hello_my_name_is_mark.mp3\", \"i_would_like.mp3\", \"food.mp3\", \"help.mp3\"]}";

   */

void Init_Ext_Mem();

// MCU initialization
void Init() {
  AD1PCFG = 0xFFFF;            // Configure AN pins as digital I/O
  JTAGEN_bit = 0;              // Disable JTAG
  TFT_BLED_Direction = 0;      // Set TFT backlight pin as output
  TFT_Init_ILI9341_8bit(320, 240);// Initialize TFT display
  TFT_BLED = 1;                // Turn on TFT backlight
  Init_Ext_Mem();
}

// Graphical frame
void DrawFrame(){
  TFT_Fill_Screen(CL_WHITE);
  TFT_Set_Pen(CL_BLACK, 1);
  TFT_Line(20, 220, 300, 220);
  TFT_Line(20,  46, 300,  46);
  TFT_Set_Font(&HandelGothic_BT21x22_Regular, CL_RED, FO_HORIZONTAL);
  TFT_Write_Text("FAT-32  Audio  MP3  Test", 45, 14);
  TFT_Set_Font(&Verdana12x13_Regular, CL_BLACK, FO_HORIZONTAL);
  TFT_Write_Text("EasyPIC Fusion v7", 19, 223);
  TFT_Set_Font(&Verdana12x13_Regular, CL_RED, FO_HORIZONTAL);
  TFT_Write_Text("Mark  Joyce", 232, 223);
  TFT_Set_Font(&TFT_defaultFont, CL_BLACK, FO_HORIZONTAL);
}

void printItPlay(char *infname)
{
  char txt[] = "Playing:";
  TFT_Set_Font(TFT_defaultFont, CL_BLACK, FO_HORIZONTAL);
  TFT_Write_Text(txt, 20, 50);
  TFT_Write_Text(infname, 20, 70);
}

void printItEnd(char *infname)
{
  char txt[] = "Playing:";
  TFT_Set_Font(TFT_defaultFont, CL_WHITE, FO_HORIZONTAL);
  TFT_Write_Text(txt, 20, 50);
  TFT_Write_Text(infname, 20, 70);
  TFT_Write_Text("END", 20, 70);
}

void play(char *infname)
{
 //printItPlay(infname);
 MP3_Play(infname);
 //printItEnd(infname);
}


static int jsoneq(const char *json, jsmntok_t *tok, const char *s) {
  if (tok->type == JSMN_STRING && (int)strlen(s) == tok->end - tok->start &&
      strncmp(json + tok->start, s, tok->end - tok->start) == 0) {
    return 0;
  }
  return -1;
}

void checkForFAT()
{
  int err;
  err = FAT32_Init(); // Start SD Card ~ FAT32
  if (err < 0)        //  If Error - No SD card or imcompatable/wrong format inserted.
  {
      TFT_Set_Font(TFT_defaultFont, CL_RED, FO_HORIZONTAL);
      TFT_Write_Text("Please  Insert  SD  Card!", 80, 50);

      while(err < 0)  //  If ERROR ...retry each second
      {
          err = FAT32_Init();
          Delay_ms(1000);
      }
      TFT_Set_Font(TFT_defaultFont, CL_WHITE, FO_HORIZONTAL);
      TFT_Write_Text("Please  Insert  SD  Card!", 80, 50);
  }

}

void getFileData(char *fileData, char *rfName)
{
   short rfHandle;
   unsigned long i, fsize;
   rfHandle = FAT32_Open(rfName, FILE_READ);
   FAT32_Size(rfName, &fsize);

   for (i = 0; i < fsize; i++)
   {
      FAT32_Read(rfHandle, fileData, 100);

   }
}

void writeFile(char *fileData, char *rfName)
{
   short rfHandle;
   long size;
   unsigned long i, fsize;
   rfHandle = FAT32_Open(rfName, FILE_WRITE);
   size = strlen(fileData);
   FAT32_Write(rfHandle, fileData, size);
   FAT32_Close(rfHandle);

}

void TerminateString(char *notTerminated, char terminator, char *buf)
{
  long size, i;
  //char buf[200];

  size = strlen(notTerminated);
  for (i = 0; i < size; i++) // Correct char array by adding terminating char /0
  {
    buf[i] = notTerminated[i];
    if(buf[i] == terminator)
    {
      buf[i + 1] = 0;
      break;
    }
  }
}

void runParser(char *JSONstring, char *key, int get)
{
  int r;
  int i, j;

  //char buf[50];
  int success = 0;

  jsmn_parser p;
  jsmntok_t t[128]; // We expect no more than 128 tokens
  jsmn_init(&p);

  
  r = jsmn_parse(&p, JSONstring, strlen(JSONstring), t, sizeof(t) / sizeof(t[0]));

  if (r < 0)
  {
     TFT_Write_Text("Failed to parse JSON",0,50);
  }
  else
  {
     TFT_Write_Text("All cool Bra ",0,50);
  }
  
  for (i = 1; i < r; i++) {

        if (jsoneq(JSONstring, &t[i], key) == 0)
        {
            for (j = 0; j < t[i + 1].size; j++)
            {
              jsmntok_t *g = &t[i + j + 2];

              //printf("  * %.*s\n", g->end - g->start, JSON_STRING + g->start);
              sprintf(buffer, "%.*s\n", g->end - g->start, JSONstring + g->start);

              if(j == get)
               {
                 success == 1;
                 break;
               }
            }
            if (success == 1)
            {
              //break;
            }
            i += t[i + 1].size + 1;
         }
      }
      //TerminateString(&buffer, '*', &buf);
      //play(buf);
      
      //TFT_Write_Text(&buf , 0, 70);
}

void Init_Ext_Mem() {


  char *rfName = "ExtFile.RES";

  rfHandle    = -1;
  rfStartSect = 0;

  // ensure ft8xx is not selected (because of shared SPI lines)
  // adjust this code to suite hw configuration
  //FT800_CS_Direction = 0;
  //FT800_CS = 1;

  // Init MMC SPI interface at low speed - 5Mhz
  SPI3_Init_Advanced(_SPI_MASTER,                   // Initialize SPI1 module
                     _SPI_8_BIT,                    // master_mode    = _SPI_MASTER
                     40,           // sec. prescaler = _SPI_PRESCALE_SEC_1
                     _SPI_SS_DISABLE,               // pri. prescaler = _SPI_PRESCALE_PRI_4
                     _SPI_DATA_SAMPLE_MIDDLE,       // slave_select   = _SPI_SS_DISABLE (Only for slave mod)
                     _SPI_CLK_IDLE_LOW,             // data_sample    = _SPI_DATA_SAMPLE_END
                     _SPI_IDLE_2_ACTIVE);           // clock_idle     = _SPI_CLK_IDLE_HIGH
                                                    // edge           = _SPI_ACTIVE_2_IDLE

  // Init FAT32 stack
  if (!FAT32_Init()) {
    // Reinitialize SPI at higher speed - 20Mhz
    SPI3_Init_Advanced(_SPI_MASTER,                   // Initialize SPI1 module
                       _SPI_8_BIT,                    // master_mode    = _SPI_MASTER
                       40,           // sec. prescaler = _SPI_PRESCALE_SEC_1
                       _SPI_SS_DISABLE,               // pri. prescaler = _SPI_PRESCALE_PRI_4
                       _SPI_DATA_SAMPLE_MIDDLE,       // slave_select   = _SPI_SS_DISABLE (Only for slave mod)
                       _SPI_CLK_IDLE_LOW,             // data_sample    = _SPI_DATA_SAMPLE_END
                       _SPI_IDLE_2_ACTIVE);           // clock_idle     = _SPI_CLK_IDLE_HIGH
                                                      // edge           = _SPI_ACTIVE_2_IDLE

    // Open resource file for read
    rfHandle    = FAT32_Open(rfName, 0x01);
    rfStartSect = FAT32_ClustToSect(fat32_fdesc[rfHandle]._1stClust);
 }
}

char *TFT_Get_Data(unsigned long fPos, unsigned long bytesToGet, unsigned long *pBytesGot) {
  unsigned int  scOffset;

  *pBytesGot = 0;

  if (rfHandle < 0) {
    return 0; // return with nil if handle was bad.
  }

  // We will utilize some of the fat32 implied features
  // (such as built in sector buffer) to reduce ram memory consumpiton.
  // You can't use this approach if this buffer is going to be used
  // from another thread (i.e. using fat32 routines in interrupt...)
  // In that case or if you have plenty of ram memory use separate
  // as large as possible data buffer.
  f32_sector.fSectNum = rfStartSect + fPos / 512;
  Mmc_Read_Sector(f32_sector.fSectNum, f32_sector.fSect);

  // 512 bytes sector buffer implied.
  scOffset = fPos % 512;
  if(bytesToGet > 512-scOffset)
    *pBytesGot = 512-scOffset;
  else
    *pBytesGot = bytesToGet;

  return &f32_sector.fSect + scOffset;
}

void main(){

  //int spacer = 110;
  unsigned long i, j, size, fsize;
  const int delay = 1000;
  //char *myNameIsMark = "hello_my_name_is_mark.mp3";
  char buf[50];
  char textBuffer[50];
  char *rfName = "config.txt";
  short rfHandle;

  //Add more files like this, I have tested these file name lengths.
  /*
  char *iWouldLike = "i_would_like.mp3";
  char *food = "food.mp3";

  char *yes = "yes.mp3";
  char *no = "no.mp3";
  char *wouldYouLike = "do_you_want_to_play_with_me.mp3";
  */

  Init();                      // Initialize MCU

  DrawFrame();                 // Draw graphical frame
  MP3_Init();                  // Start using mp3 codec
  checkForFAT();


  TFT_Set_Ext_Buffer(TFT_Get_Data);
  
  ///////////////////////////////////////
  //Debug stuff, write dummy config file/
  FAT32_Delete(rfName);                //
  writeFile(JSON_STRING, rfName);      //
  ///////////////////////////////////////
  
  
  //Get data from config file.
  rfHandle = FAT32_Open(rfName, FILE_READ);
  FAT32_Size(rfName, &fsize);

  for (i = 0; i < fsize; i++)
  {
    FAT32_Read(rfHandle, fileData, fsize);
  }
  FAT32_Close(rfHandle);
  Delay_ms(100);

  //Insert terminator ie \0 into char array.
  TerminateString(&fileData, '}', &res);
  //TFT_Write_Text(res, 0,200);

   TFT_Ext_Image(10,20,0x00000003, 1);
  //Delay_ms(1000);
  //Parse JSON string.
  for (i = 0; i < 6; i++)
  {

    runParser(res, "text", i);
    TerminateString(&buffer, '*', &textBuffer);
    TFT_Write_Text(&textBuffer, 0, spacer);
    spacer += 10;
    runParser(res, "audio", i);
    TerminateString(&buffer, '3', &buf);
    TFT_Write_Text(&buf, 0, spacer);
    spacer += 15;
    Delay_ms(1000);
    play(buf);
    Delay_ms(1000);
  }
  
  //Insert terminator ie \0 into char array.
  //TerminateString(buffer, '3', &buf);
  
  //Play the file.
  //play(buf);

  // Play some MP3's  ; look in MP3_routines.c  --->
  //play(myNameIsMark);
  //Delay_ms(delay);
  
  
  
  /*
  //Add more files and load them here, for example.
  play(iWouldLike);                  // Play mp3 file
  play(food);                  // Play mp3 file
  Delay_ms(delay);
  play(iWouldLike);
  play(help);                // Play mp3 file
  Delay_ms(delay);
  play(yes);                // Play mp3 file
  Delay_ms(delay);
  play(no);                // Play mp3 file
  Delay_ms(delay);
  play(wouldYouLike);                // Play mp3 file
  */

  TFT_Set_Font(TFT_defaultFont, CL_BLACK, FO_HORIZONTAL);
  TFT_Write_Text("END", 80, 50);

}