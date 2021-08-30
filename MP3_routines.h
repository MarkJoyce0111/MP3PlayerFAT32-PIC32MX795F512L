// Module functions


void MP3_Init();
int MP3_Play(char *infname);
void MP3_SCI_Write(char address, unsigned int data_in);
void MP3_SCI_Read(char start_address, char words_count, unsigned int *data_buffer);
void MP3_SDI_Write(char data_);
void MP3_SDI_Write_32(char *data_);
void MP3_Set_Volume(char left, char right);
void MP3_Check_Volume();