#line 1 "C:/Users/Mark/Desktop/FAT32_MP3/MP3_routines.c"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic32/include/built_in.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic32/packages/fat32 library/uses/__lib_fat32.h"
#line 29 "c:/users/public/documents/mikroelektronika/mikroc pro for pic32/packages/fat32 library/uses/__lib_fat32.h"
typedef unsigned short uint8;
typedef signed short int8;
typedef unsigned int uint16;
typedef signed int int16;
typedef unsigned long uint32;
typedef signed long int32;
typedef unsigned long long uint64;
typedef signed long long int64;

static const uint16 SECTOR_SIZE = 512;









static const uint8
 FILE_READ = 0x01,
 FILE_WRITE = 0x02,
 FILE_APPEND = 0x04;






static const uint8
 ATTR_NONE = 0x00,
 ATTR_READ_ONLY = 0x01,
 ATTR_HIDDEN = 0x02,
 ATTR_SYSTEM = 0x04,
 ATTR_VOLUME_ID = 0x08,
 ATTR_DIRECTORY = 0x10,
 ATTR_ARCHIVE = 0x20,
 ATTR_DEVICE = 0x40,

 ATTR_RESERVED = 0x80;

static const uint8
 ATTR_LONG_NAME = ATTR_READ_ONLY |
 ATTR_HIDDEN |
 ATTR_SYSTEM |
 ATTR_VOLUME_ID;

static const uint8
 ATTR_FILE_MASK = ATTR_READ_ONLY |
 ATTR_HIDDEN |
 ATTR_SYSTEM |
 ATTR_ARCHIVE,

 ATTR_LONG_NAME_MASK = ATTR_READ_ONLY |
 ATTR_HIDDEN |
 ATTR_SYSTEM |
 ATTR_VOLUME_ID |
 ATTR_DIRECTORY |
 ATTR_ARCHIVE;






static const int8



 OK = 0,
 ERROR = -1,
 FOUND = 1,



 E_READ = -1,
 E_WRITE = -2,
 E_INIT_CARD = -3,
 E_BOOT_SIGN = -4,
 E_BOOT_REC = -5,
 E_FILE_SYS_INFO = -6,
 E_DEVICE_SIZE = -7,
 E_FAT_TYPE = -8,
 E_VOLUME_LABEL = -9,



 E_LAST_ENTRY = -10,
 E_FREE_ENTRY = -11,
 E_CLUST_NUM = -12,
 E_NO_SWAP_SPACE = -13,
 E_NO_SPACE = -14,
 E_LAST_CLUST = -15,



 E_DIR_NAME = -20,
 E_ISNT_DIR = -21,
 E_DIR_EXISTS = -22,
 E_DIR_NOTFOUND = -23,
 E_DIR_NOTEMPTY = -24,
 E_DIR_SIZE = -25,



 E_FILE_NAME = -30,
 E_ISNT_FILE = -31,
 E_FILE_EXISTS = -32,
 E_FILE_NOTFOUND = -33,
 E_FILE_NOTEMPTY = -34,
 E_MAX_FILES = -35,
 E_FILE_NOTOPENED = -36,
 E_FILE_EOF = -37,
 E_FILE_READ = -38,
 E_FILE_WRITE = -39,
 E_FILE_HANDLE = -40,
 E_FILE_READ_ONLY = -41,
 E_FILE_OPENED = -42,



 E_TIME_YEAR = -50,
 E_TIME_MONTH = -51,
 E_TIME_DAY = -52,
 E_TIME_HOUR = -53,
 E_TIME_MINUTE = -54,
 E_TIME_SECOND = -55,



 E_NAME_NULL = -60,
 E_CHAR_UNALLOWED = -61,
 E_LFN_ORD = -62,
 E_LFN_CHK = -63,
 E_LFN_ATTR = -64,
 E_LFN_MAX_SINONIM = -65,
 E_NAME_TOLONG = -66,
 E_NAME_EXIST = -67,



 E_PARAM = -80,
 E_REAPCK = -81,
 E_DELETE = -82,
 E_DELETE_NUM = -83,
 E_ATTR = -84;



typedef struct
{
 uint8 State[1];
 uint8 __1[3];
 uint8 Type[1];
 uint8 __2[3];
 uint8 Boot[4];
 uint8 Size[4];
}
FAT32_PART;



typedef struct
{
 uint8 __1[446];
 FAT32_PART Part[4];
 uint8 BootSign[2];
}
FAT32_MBR;



typedef struct
{
 uint8 JmpCode[3];
 uint8 __1[8];
 uint8 BytesPSect[2];
 uint8 SectsPClust[1];
 uint8 Reserved[2];
 uint8 FATCopies[1];
 uint8 RootEntries[2];
 uint8 __2[2];
 uint8 MediaDesc[1];
 uint8 __3[10];
 uint8 Sects[4];
 uint8 SectsPFAT[4];
 uint8 Flags[2];
 uint8 __4[2];
 uint8 RootClust[4];
 uint8 FSISect[2];
 uint8 BootBackup[2];
 uint8 __5[14];
 uint8 ExtSign[1];
 uint8 __6[4];
 uint8 VolName[11];
 uint8 FATName[8];
 uint8 __7[420];
 uint8 BootSign[2];
}
FAT32_BR;



typedef struct
{
 uint8 LeadSig[4];
 uint8 __1[480];
 uint8 StrucSig[4];
 uint8 FreeCount[4];
 uint8 NextFree[4];
 uint8 __2[14];
 uint8 TrailSig[2];
}
FAT32_FSI;


typedef struct
{
 uint8 Entry[4];
}
FAT32_FATENT;



typedef struct
{
 uint8 NameExt[11];
 uint8 Attrib[1];
 uint8 NT[1];
 uint8 __1[1];
 uint8 CTime[2];
 uint8 CDate[2];
 uint8 ATime[2];
 uint8 HiClust[2];
 uint8 MTime[2];
 uint8 MDate[2];
 uint8 LoClust[2];
 uint8 Size[4];
}
FAT32_DIRENT;



typedef struct
{
 uint8 OrdField[1];
 uint8 UC0[2];
 uint8 UC1[2];
 uint8 UC2[2];
 uint8 UC3[2];
 uint8 UC4[2];
 uint8 Attrib[1];
 uint8 __1[1];
 uint8 Checksum[1];
 uint8 UC5[2];
 uint8 UC6[2];
 uint8 UC7[2];
 uint8 UC8[2];
 uint8 UC9[2];
 uint8 UC10[2];
 uint8 __2[2];
 uint8 UC11[2];
 uint8 UC12[2];
}
FAT32_LFNENT;



typedef uint32 __CLUSTER;
typedef uint32 __SECTOR;
typedef uint32 __ENTRY;

typedef int8 __HANDLE;



typedef struct
{
 uint16 Year;
 uint8 Month;
 uint8 Day;
 uint8 Hour;
 uint8 Minute;
 uint8 Second;
}
__TIME;



typedef struct
{
 uint8 State;
 uint8 Type;
 __SECTOR Boot;
 uint32 Size;
}
__PART;



typedef struct
{
 __PART Part[1];
 uint16 BytesPSect;
 uint8 SectsPClust;
 uint16 Reserved;
 uint8 FATCopies;
 uint32 SectsPFAT;
 uint16 Flags;
 __SECTOR FAT;
 __CLUSTER Root;
 uint16 RootEntries;
 __SECTOR Data;
 __SECTOR FSI;
 uint32 ClFreeCount;
 __CLUSTER ClNextFree;
}
__INFO;

typedef struct
{
 char Path[270];
 uint16 Length;
}
__PATH;


typedef struct
{
 char NameExt[255];
 uint8 Attrib;

 uint32 Size;
 __CLUSTER _1stClust;

 __CLUSTER EntryClust;
 __ENTRY Entry;
}
__DIR;


typedef struct
{
 __CLUSTER _1stClust;
 __CLUSTER CurrClust;

 __CLUSTER EntryClust;
 __ENTRY Entry;

 uint32 Cursor;
 uint32 Length;

 uint8 Mode;
 uint8 Attr;
}
__FILE;
#line 389 "c:/users/public/documents/mikroelektronika/mikroc pro for pic32/packages/fat32 library/uses/__lib_fat32.h"
typedef struct
{
 __SECTOR fSectNum;
 char fSect[SECTOR_SIZE];
}
__RAW_SECTOR;


extern const char CRLF_F32[];
extern const uint8 FAT32_MAX_FILES;
extern const uint8 f32_fsi_template[SECTOR_SIZE];
extern const uint8 f32_br_template[SECTOR_SIZE];
extern __FILE fat32_fdesc[];
extern __RAW_SECTOR f32_sector;


extern int8 FAT32_Dev_Init (void);
extern int8 FAT32_Dev_Read_Sector (__SECTOR sc, char* buf);
extern int8 FAT32_Dev_Write_Sector (__SECTOR sc, char* buf);
extern int8 FAT32_Dev_Multi_Read_Stop();
extern int8 FAT32_Dev_Multi_Read_Sector(char* buf);
extern int8 FAT32_Dev_Multi_Read_Start(__SECTOR sc);
extern int8 FAT32_Put_Char (char ch);


int8 FAT32_Init (void);
int8 FAT32_Format (char *devLabel);
int8 FAT32_ScanDisk (uint32 *totClust, uint32 *freeClust, uint32 *badClust);
int8 FAT32_GetFreeSpace(uint32 *freeClusts, uint16 *bytesPerClust);

int8 FAT32_ChangeDir (char *dname);
int8 FAT32_MakeDir (char *dname);
int8 FAT32_Dir (void);
int8 FAT32_FindFirst (__DIR *pDE);
int8 FAT32_FindNext (__DIR *pDE);
int8 FAT32_Delete (char *fn);
int8 FAT32_DeleteRec (char *fn);
int8 FAT32_Exists (char *name);
int8 FAT32_Rename (char *oldName, char *newName);
int8 FAT32_Open (char *fn, uint8 mode);
int8 FAT32_Eof (__HANDLE fHandle);
int8 FAT32_Read (__HANDLE fHandle, char* rdBuf, uint16 len);
int8 FAT32_Write (__HANDLE fHandle, char* wrBuf, uint16 len);
int8 FAT32_Seek (__HANDLE fHandle, uint32 pos);
int8 FAT32_Tell (__HANDLE fHandle, uint32 *pPos);
int8 FAT32_Close (__HANDLE fHandle);
int8 FAT32_Size (char *fname, uint32 *pSize);
int8 FAT32_GetFileHandle(char *fname, __HANDLE *handle);

int8 FAT32_SetTime (__TIME *pTM);
int8 FAT32_IncTime (uint32 Sec);

int8 FAT32_GetCTime (char *fname, __TIME *pTM);
int8 FAT32_GetMTime (char *fname, __TIME *pTM);

int8 FAT32_SetAttr (char *fname, uint8 attr);
int8 FAT32_GetAttr (char *fname, uint8* attr);

int8 FAT32_GetError (void);

int8 FAT32_MakeSwap (char *name, __SECTOR nSc, __CLUSTER *pCl);
int8 FAT32_ReadSwap (__HANDLE fHandle, char* rdBuf, uint16 len);
int8 FAT32_WriteSwap (__HANDLE fHandle, char* wrBuf, uint16 len);
int8 FAT32_SeekSwap (__HANDLE fHandle, uint32 pos);

const char* FAT32_getVersion();
uint8* FAT32_GetCurrentPath( void );

__CLUSTER FAT32_SectToClust(__SECTOR sc);
__SECTOR FAT32_ClustToSect(__CLUSTER cl);
#line 5 "C:/Users/Mark/Desktop/FAT32_MP3/MP3_routines.c"
sbit MP3_CS_Direction at TRISG14_bit;
sbit MP3_CS at LATG14_bit;
sbit MP3_RST_Direction at TRISG13_bit;
sbit MP3_RST at LATG13_bit;
sbit DREQ_Direction at TRISG12_bit;
sbit DREQ at RG12_bit;
sbit BSYNC_Direction at TRISG15_bit;
sbit BSYNC at LATG15_bit;


sbit Mmc_Chip_Select_Direction at TRISD12_bit;
sbit Mmc_Chip_Select at LATD12_bit;
sbit Mmc_Card_Detect_Direction at TRISD13_bit;
sbit Mmc_Card_Detect at RD13_bit;


sbit BtnLeftDown_Direction at TRISA4_bit;
sbit BtnLeftUp_Direction at TRISA5_bit;
sbit BtnRightDown_Direction at TRISA0_bit;
sbit BtnRightUp_Direction at TRISA1_bit;
sbit BtnLeftDown at RA4_bit;
sbit BtnLeftUp at RA5_bit;
sbit BtnRightDown at RA0_bit;
sbit BtnRightUp at RA1_bit;


const char WRITE_CODE = 0x02;
const char READ_CODE = 0x03;


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


unsigned long file_size;
const BYTES_2_WRITE = 32;
const BUFFER_SIZE = 448;
char mp3_buffer[BUFFER_SIZE];
char volume_left, volume_right;






void MP3_SCI_Write(char address, unsigned int data_in) {
 BSYNC = 1;

 MP3_CS = 0;
 SPI3_Write(WRITE_CODE);
 SPI3_Write(address);
 SPI3_Write( ((char *)&data_in)[1] );
 SPI3_Write( ((char *)&data_in)[0] );
 MP3_CS = 1;


 while (DREQ == 0)
 ;
}


void MP3_SCI_Read(char start_address, char words_count, unsigned int* data_buffer) {
 unsigned int temp;

 MP3_CS = 0;
 SPI3_Write(READ_CODE);
 SPI3_Write(start_address);

 while (words_count) {
 words_count--;
 temp = SPI3_Read(0);
 temp = temp << 8;
 temp = temp + SPI3_Read(0);
 *data_buffer = temp;
 data_buffer++;
 }
 MP3_CS = 1;


 while (DREQ == 0)
 ;
}


void MP3_SDI_Write(char data_) {
 MP3_CS = 1;
 BSYNC = 0;


 while (DREQ == 0)
 ;

 SPI3_Write(data_);
 BSYNC = 1;
}


void MP3_SDI_Write_32(char* data_) {
 char i;

 MP3_CS = 1;
 BSYNC = 0;


 while (DREQ == 0)
 ;

 for (i = 0; i < 32; i++)
 SPI3_Write(data_[i]);
 BSYNC = 1;
}


void MP3_Set_Volume(char left, char right) {
 unsigned int volume;

 volume = (left << 8) + right;
 MP3_SCI_Write(SCI_VOL_ADDR, volume);
}


void MP3_Check_Volume() {
 char old_volume_left, old_volume_right;

 BtnLeftDown_Direction = 1;
 BtnLeftUp_Direction = 1;
 BtnRightDown_Direction = 1;
 BtnRightUp_Direction = 1;
 BtnLeftDown = 0;
 BtnLeftUp = 0;
 BtnRightDown = 0;
 BtnRightUp = 0;

 old_volume_left = volume_left;
 old_volume_right = volume_right;

 if (BtnLeftDown) {
 if (volume_left < 255) {
 volume_left++;
 }
 }
 if (BtnLeftUp) {
 if (volume_left > 0) {
 volume_left--;
 }
 }
 if (BtnRightDown) {
 if (volume_right < 255) {
 volume_right++;
 }
 }
 if (BtnRightUp) {
 if (volume_right > 0) {
 volume_right--;
 }
 }


 if ((volume_left != old_volume_left) || (volume_right != old_volume_right)) {
 MP3_Set_Volume(volume_left, volume_right);
 }
}


void MP3_Init() {

 MP3_CS_Direction = 0;
 MP3_CS = 1;
 MP3_RST_Direction = 0;
 MP3_RST = 1;

 DREQ_Direction = 1;
 BSYNC_Direction = 0;
 BSYNC = 0;


 SPI3_Init_Advanced(_SPI_MASTER, _SPI_8_BIT, 40, _SPI_SS_DISABLE, _SPI_DATA_SAMPLE_MIDDLE, _SPI_CLK_IDLE_LOW, _SPI_IDLE_2_ACTIVE);


 MP3_RST = 0;
 Delay_ms(10);
 MP3_RST = 1;


 while (DREQ == 0)
 ;

 MP3_SCI_Write(SCI_MODE_ADDR, 0x0800);
 MP3_SCI_Write(SCI_BASS_ADDR, 0x7A00);
 MP3_SCI_Write(SCI_CLOCKF_ADDR, 0x2000);


 volume_left = 20;
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


int MP3_Play(char *infname)
{
 unsigned long i;
 short fileHandle = -1;
 int err = -1;


 while(fileHandle < 0)
 {
 fileHandle = FAT32_Open(infname, FILE_READ);
 }

 if (fileHandle >= 0)
 {

 fileHandle = FAT32_Size(infname, &file_size);


 while (file_size > BUFFER_SIZE)
 {
 FAT32_Read(fileHandle, mp3_buffer, BUFFER_SIZE);
 for (i = 0; i < BUFFER_SIZE / BYTES_2_WRITE; i++)
 {
 MP3_SDI_Write_32(mp3_buffer + i * BYTES_2_WRITE);
 }
 file_size -= BUFFER_SIZE;
 }


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
