_MP3_SCI_Write:
;MP3_routines.c,65 :: 		void MP3_SCI_Write(char address, unsigned int data_in) {
ADDIU	SP, SP, -12
SW	RA, 0(SP)
SW	R25, 4(SP)
SH	R26, 10(SP)
;MP3_routines.c,66 :: 		BSYNC = 1;
LUI	R2, BitMask(LATG15_bit+0)
ORI	R2, R2, BitMask(LATG15_bit+0)
_SX	
;MP3_routines.c,68 :: 		MP3_CS = 0;                   // select MP3 SCI
LUI	R2, BitMask(LATG14_bit+0)
ORI	R2, R2, BitMask(LATG14_bit+0)
_SX	
;MP3_routines.c,69 :: 		SPI3_Write(WRITE_CODE);
SB	R25, 8(SP)
ORI	R25, R0, 2
JAL	_SPI3_Write+0
NOP	
LBU	R25, 8(SP)
;MP3_routines.c,70 :: 		SPI3_Write(address);
ANDI	R25, R25, 255
JAL	_SPI3_Write+0
NOP	
;MP3_routines.c,71 :: 		SPI3_Write(Hi(data_in));      // high byte
ADDIU	R2, SP, 10
ADDIU	R2, R2, 1
LBU	R25, 0(R2)
JAL	_SPI3_Write+0
NOP	
;MP3_routines.c,72 :: 		SPI3_Write(Lo(data_in));      // low byte
ADDIU	R2, SP, 10
LBU	R25, 0(R2)
JAL	_SPI3_Write+0
NOP	
;MP3_routines.c,73 :: 		MP3_CS = 1;                   // deselect MP3 SCI
LUI	R2, BitMask(LATG14_bit+0)
ORI	R2, R2, BitMask(LATG14_bit+0)
_SX	
;MP3_routines.c,76 :: 		while (DREQ == 0)
L_MP3_SCI_Write0:
_LX	
EXT	R2, R2, BitPos(RG12_bit+0), 1
BEQ	R2, R0, L__MP3_SCI_Write51
NOP	
J	L_MP3_SCI_Write1
NOP	
L__MP3_SCI_Write51:
;MP3_routines.c,77 :: 		;
J	L_MP3_SCI_Write0
NOP	
L_MP3_SCI_Write1:
;MP3_routines.c,78 :: 		}
L_end_MP3_SCI_Write:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _MP3_SCI_Write
_MP3_SCI_Read:
;MP3_routines.c,81 :: 		void MP3_SCI_Read(char start_address, char words_count, unsigned int* data_buffer) {
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;MP3_routines.c,84 :: 		MP3_CS = 0;                   // select MP3 SCI
LUI	R2, BitMask(LATG14_bit+0)
ORI	R2, R2, BitMask(LATG14_bit+0)
_SX	
;MP3_routines.c,85 :: 		SPI3_Write(READ_CODE);        // Enter into reading mode
SB	R25, 4(SP)
ORI	R25, R0, 3
JAL	_SPI3_Write+0
NOP	
LBU	R25, 4(SP)
;MP3_routines.c,86 :: 		SPI3_Write(start_address);    // Start reading from the starting address
ANDI	R25, R25, 255
JAL	_SPI3_Write+0
NOP	
;MP3_routines.c,88 :: 		while (words_count) {         // read words_count words byte per byte
L_MP3_SCI_Read2:
BNE	R26, R0, L__MP3_SCI_Read54
NOP	
J	L_MP3_SCI_Read3
NOP	
L__MP3_SCI_Read54:
;MP3_routines.c,89 :: 		words_count--;
ADDIU	R2, R26, -1
ANDI	R26, R2, 255
;MP3_routines.c,90 :: 		temp = SPI3_Read(0);
SB	R25, 4(SP)
MOVZ	R25, R0, R0
JAL	_SPI3_Read+0
NOP	
;MP3_routines.c,91 :: 		temp = temp << 8;
ANDI	R2, R2, 65535
SLL	R2, R2, 8
; temp start address is: 12 (R3)
ANDI	R3, R2, 65535
;MP3_routines.c,92 :: 		temp = temp + SPI3_Read(0);
MOVZ	R25, R0, R0
JAL	_SPI3_Read+0
NOP	
LBU	R25, 4(SP)
ADDU	R2, R3, R2
; temp end address is: 12 (R3)
;MP3_routines.c,93 :: 		*data_buffer = temp;
SH	R2, 0(R27)
;MP3_routines.c,94 :: 		data_buffer++;
ADDIU	R2, R27, 2
MOVZ	R27, R2, R0
;MP3_routines.c,95 :: 		}
J	L_MP3_SCI_Read2
NOP	
L_MP3_SCI_Read3:
;MP3_routines.c,96 :: 		MP3_CS = 1;                   // deselect MP3 SCI
LUI	R2, BitMask(LATG14_bit+0)
ORI	R2, R2, BitMask(LATG14_bit+0)
_SX	
;MP3_routines.c,99 :: 		while (DREQ == 0)
L_MP3_SCI_Read4:
_LX	
EXT	R2, R2, BitPos(RG12_bit+0), 1
BEQ	R2, R0, L__MP3_SCI_Read55
NOP	
J	L_MP3_SCI_Read5
NOP	
L__MP3_SCI_Read55:
;MP3_routines.c,100 :: 		;
J	L_MP3_SCI_Read4
NOP	
L_MP3_SCI_Read5:
;MP3_routines.c,101 :: 		}
L_end_MP3_SCI_Read:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _MP3_SCI_Read
_MP3_SDI_Write:
;MP3_routines.c,104 :: 		void MP3_SDI_Write(char data_) {
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;MP3_routines.c,105 :: 		MP3_CS = 1;                   // deselect MP3 SCI
LUI	R2, BitMask(LATG14_bit+0)
ORI	R2, R2, BitMask(LATG14_bit+0)
_SX	
;MP3_routines.c,106 :: 		BSYNC = 0;
LUI	R2, BitMask(LATG15_bit+0)
ORI	R2, R2, BitMask(LATG15_bit+0)
_SX	
;MP3_routines.c,109 :: 		while (DREQ == 0)
L_MP3_SDI_Write6:
_LX	
EXT	R2, R2, BitPos(RG12_bit+0), 1
BEQ	R2, R0, L__MP3_SDI_Write57
NOP	
J	L_MP3_SDI_Write7
NOP	
L__MP3_SDI_Write57:
;MP3_routines.c,110 :: 		;
J	L_MP3_SDI_Write6
NOP	
L_MP3_SDI_Write7:
;MP3_routines.c,112 :: 		SPI3_Write(data_);            // write data to MP3 codec
ANDI	R25, R25, 255
JAL	_SPI3_Write+0
NOP	
;MP3_routines.c,113 :: 		BSYNC = 1;
LUI	R2, BitMask(LATG15_bit+0)
ORI	R2, R2, BitMask(LATG15_bit+0)
_SX	
;MP3_routines.c,114 :: 		}
L_end_MP3_SDI_Write:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _MP3_SDI_Write
_MP3_SDI_Write_32:
;MP3_routines.c,117 :: 		void MP3_SDI_Write_32(char* data_) {
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;MP3_routines.c,120 :: 		MP3_CS = 1;
LUI	R2, BitMask(LATG14_bit+0)
ORI	R2, R2, BitMask(LATG14_bit+0)
_SX	
;MP3_routines.c,121 :: 		BSYNC = 0;
LUI	R2, BitMask(LATG15_bit+0)
ORI	R2, R2, BitMask(LATG15_bit+0)
_SX	
;MP3_routines.c,124 :: 		while (DREQ == 0)
L_MP3_SDI_Write_328:
_LX	
EXT	R2, R2, BitPos(RG12_bit+0), 1
BEQ	R2, R0, L__MP3_SDI_Write_3259
NOP	
J	L_MP3_SDI_Write_329
NOP	
L__MP3_SDI_Write_3259:
;MP3_routines.c,125 :: 		;
J	L_MP3_SDI_Write_328
NOP	
L_MP3_SDI_Write_329:
;MP3_routines.c,127 :: 		for (i = 0; i < 32; i++)
; i start address is: 12 (R3)
MOVZ	R3, R0, R0
; i end address is: 12 (R3)
L_MP3_SDI_Write_3210:
; i start address is: 12 (R3)
ANDI	R2, R3, 255
SLTIU	R2, R2, 32
BNE	R2, R0, L__MP3_SDI_Write_3260
NOP	
J	L_MP3_SDI_Write_3211
NOP	
L__MP3_SDI_Write_3260:
;MP3_routines.c,128 :: 		SPI3_Write(data_[i]);
ANDI	R2, R3, 255
ADDU	R2, R25, R2
SW	R25, 4(SP)
LBU	R25, 0(R2)
JAL	_SPI3_Write+0
NOP	
LW	R25, 4(SP)
;MP3_routines.c,127 :: 		for (i = 0; i < 32; i++)
ADDIU	R2, R3, 1
ANDI	R3, R2, 255
;MP3_routines.c,128 :: 		SPI3_Write(data_[i]);
; i end address is: 12 (R3)
J	L_MP3_SDI_Write_3210
NOP	
L_MP3_SDI_Write_3211:
;MP3_routines.c,129 :: 		BSYNC = 1;
LUI	R2, BitMask(LATG15_bit+0)
ORI	R2, R2, BitMask(LATG15_bit+0)
_SX	
;MP3_routines.c,130 :: 		}
L_end_MP3_SDI_Write_32:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _MP3_SDI_Write_32
_MP3_Set_Volume:
;MP3_routines.c,133 :: 		void MP3_Set_Volume(char left, char right) {
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;MP3_routines.c,136 :: 		volume = (left << 8) + right;             // calculate value
SW	R25, 4(SP)
SW	R26, 8(SP)
ANDI	R2, R25, 255
SLL	R3, R2, 8
ANDI	R2, R26, 255
ADDU	R2, R3, R2
;MP3_routines.c,137 :: 		MP3_SCI_Write(SCI_VOL_ADDR, volume);    // Write value to VOL register
ANDI	R26, R2, 65535
ORI	R25, R0, 11
JAL	_MP3_SCI_Write+0
NOP	
;MP3_routines.c,138 :: 		}
L_end_MP3_Set_Volume:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _MP3_Set_Volume
_MP3_Check_Volume:
;MP3_routines.c,141 :: 		void MP3_Check_Volume() {
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;MP3_routines.c,144 :: 		BtnLeftDown_Direction = 1;             // set pin direction as input
SW	R25, 4(SP)
SW	R26, 8(SP)
LUI	R2, BitMask(TRISA4_bit+0)
ORI	R2, R2, BitMask(TRISA4_bit+0)
_SX	
;MP3_routines.c,145 :: 		BtnLeftUp_Direction = 1;
LUI	R2, BitMask(TRISA5_bit+0)
ORI	R2, R2, BitMask(TRISA5_bit+0)
_SX	
;MP3_routines.c,146 :: 		BtnRightDown_Direction = 1;
LUI	R2, BitMask(TRISA0_bit+0)
ORI	R2, R2, BitMask(TRISA0_bit+0)
_SX	
;MP3_routines.c,147 :: 		BtnRightUp_Direction = 1;
LUI	R2, BitMask(TRISA1_bit+0)
ORI	R2, R2, BitMask(TRISA1_bit+0)
_SX	
;MP3_routines.c,148 :: 		BtnLeftDown = 0;                       // set pin value to zero
LUI	R2, BitMask(RA4_bit+0)
ORI	R2, R2, BitMask(RA4_bit+0)
_SX	
;MP3_routines.c,149 :: 		BtnLeftUp = 0;
LUI	R2, BitMask(RA5_bit+0)
ORI	R2, R2, BitMask(RA5_bit+0)
_SX	
;MP3_routines.c,150 :: 		BtnRightDown = 0;
LUI	R2, BitMask(RA0_bit+0)
ORI	R2, R2, BitMask(RA0_bit+0)
_SX	
;MP3_routines.c,151 :: 		BtnRightUp = 0;
LUI	R2, BitMask(RA1_bit+0)
ORI	R2, R2, BitMask(RA1_bit+0)
_SX	
;MP3_routines.c,153 :: 		old_volume_left = volume_left;         // save volume values
; old_volume_left start address is: 16 (R4)
LBU	R4, Offset(_volume_left+0)(GP)
;MP3_routines.c,154 :: 		old_volume_right = volume_right;
; old_volume_right start address is: 20 (R5)
LBU	R5, Offset(_volume_right+0)(GP)
;MP3_routines.c,156 :: 		if (BtnLeftDown) {                      // RD3 pressed = LEFT VOLUME DOWN command
_LX	
EXT	R2, R2, BitPos(RA4_bit+0), 1
BNE	R2, R0, L__MP3_Check_Volume64
NOP	
J	L_MP3_Check_Volume13
NOP	
L__MP3_Check_Volume64:
;MP3_routines.c,157 :: 		if (volume_left < 255) {
LBU	R2, Offset(_volume_left+0)(GP)
SLTIU	R2, R2, 255
BNE	R2, R0, L__MP3_Check_Volume65
NOP	
J	L_MP3_Check_Volume14
NOP	
L__MP3_Check_Volume65:
;MP3_routines.c,158 :: 		volume_left++;
LBU	R2, Offset(_volume_left+0)(GP)
ADDIU	R2, R2, 1
SB	R2, Offset(_volume_left+0)(GP)
;MP3_routines.c,159 :: 		}
L_MP3_Check_Volume14:
;MP3_routines.c,160 :: 		}
L_MP3_Check_Volume13:
;MP3_routines.c,161 :: 		if (BtnLeftUp) {                        // RD2 pressed = LEFT VOLUME UP command
_LX	
EXT	R2, R2, BitPos(RA5_bit+0), 1
BNE	R2, R0, L__MP3_Check_Volume67
NOP	
J	L_MP3_Check_Volume15
NOP	
L__MP3_Check_Volume67:
;MP3_routines.c,162 :: 		if (volume_left > 0) {
LBU	R2, Offset(_volume_left+0)(GP)
SLTIU	R2, R2, 1
BEQ	R2, R0, L__MP3_Check_Volume68
NOP	
J	L_MP3_Check_Volume16
NOP	
L__MP3_Check_Volume68:
;MP3_routines.c,163 :: 		volume_left--;
LBU	R2, Offset(_volume_left+0)(GP)
ADDIU	R2, R2, -1
SB	R2, Offset(_volume_left+0)(GP)
;MP3_routines.c,164 :: 		}
L_MP3_Check_Volume16:
;MP3_routines.c,165 :: 		}
L_MP3_Check_Volume15:
;MP3_routines.c,166 :: 		if (BtnRightDown) {                     // RD1 pressed = RIGHT VOLUME DOWN command
_LX	
EXT	R2, R2, BitPos(RA0_bit+0), 1
BNE	R2, R0, L__MP3_Check_Volume70
NOP	
J	L_MP3_Check_Volume17
NOP	
L__MP3_Check_Volume70:
;MP3_routines.c,167 :: 		if (volume_right < 255) {
LBU	R2, Offset(_volume_right+0)(GP)
SLTIU	R2, R2, 255
BNE	R2, R0, L__MP3_Check_Volume71
NOP	
J	L_MP3_Check_Volume18
NOP	
L__MP3_Check_Volume71:
;MP3_routines.c,168 :: 		volume_right++;
LBU	R2, Offset(_volume_right+0)(GP)
ADDIU	R2, R2, 1
SB	R2, Offset(_volume_right+0)(GP)
;MP3_routines.c,169 :: 		}
L_MP3_Check_Volume18:
;MP3_routines.c,170 :: 		}
L_MP3_Check_Volume17:
;MP3_routines.c,171 :: 		if (BtnRightUp) {                       // RD0 pressed = RIGHT VOLUME UP command
_LX	
EXT	R2, R2, BitPos(RA1_bit+0), 1
BNE	R2, R0, L__MP3_Check_Volume73
NOP	
J	L_MP3_Check_Volume19
NOP	
L__MP3_Check_Volume73:
;MP3_routines.c,172 :: 		if (volume_right > 0) {
LBU	R2, Offset(_volume_right+0)(GP)
SLTIU	R2, R2, 1
BEQ	R2, R0, L__MP3_Check_Volume74
NOP	
J	L_MP3_Check_Volume20
NOP	
L__MP3_Check_Volume74:
;MP3_routines.c,173 :: 		volume_right--;
LBU	R2, Offset(_volume_right+0)(GP)
ADDIU	R2, R2, -1
SB	R2, Offset(_volume_right+0)(GP)
;MP3_routines.c,174 :: 		}
L_MP3_Check_Volume20:
;MP3_routines.c,175 :: 		}
L_MP3_Check_Volume19:
;MP3_routines.c,178 :: 		if ((volume_left != old_volume_left) || (volume_right != old_volume_right)) {
ANDI	R3, R4, 255
; old_volume_left end address is: 16 (R4)
LBU	R2, Offset(_volume_left+0)(GP)
BEQ	R2, R3, L__MP3_Check_Volume75
NOP	
J	L__MP3_Check_Volume49
NOP	
L__MP3_Check_Volume75:
ANDI	R3, R5, 255
; old_volume_right end address is: 20 (R5)
LBU	R2, Offset(_volume_right+0)(GP)
BEQ	R2, R3, L__MP3_Check_Volume76
NOP	
J	L__MP3_Check_Volume48
NOP	
L__MP3_Check_Volume76:
J	L_MP3_Check_Volume23
NOP	
L__MP3_Check_Volume49:
L__MP3_Check_Volume48:
;MP3_routines.c,179 :: 		MP3_Set_Volume(volume_left, volume_right);
LBU	R26, Offset(_volume_right+0)(GP)
LBU	R25, Offset(_volume_left+0)(GP)
JAL	_MP3_Set_Volume+0
NOP	
;MP3_routines.c,180 :: 		}
L_MP3_Check_Volume23:
;MP3_routines.c,181 :: 		}
L_end_MP3_Check_Volume:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _MP3_Check_Volume
_MP3_Init:
;MP3_routines.c,184 :: 		void MP3_Init() {
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;MP3_routines.c,186 :: 		MP3_CS_Direction = 0;               // Configure MP3_CS as output
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
SW	R28, 16(SP)
LUI	R2, BitMask(TRISG14_bit+0)
ORI	R2, R2, BitMask(TRISG14_bit+0)
_SX	
;MP3_routines.c,187 :: 		MP3_CS = 1;               // Deselect MP3_CS
LUI	R2, BitMask(LATG14_bit+0)
ORI	R2, R2, BitMask(LATG14_bit+0)
_SX	
;MP3_routines.c,188 :: 		MP3_RST_Direction = 0;               // Configure MP3_RST as output
LUI	R2, BitMask(TRISG13_bit+0)
ORI	R2, R2, BitMask(TRISG13_bit+0)
_SX	
;MP3_routines.c,189 :: 		MP3_RST = 1;               // Set MP3_RST pin
LUI	R2, BitMask(LATG13_bit+0)
ORI	R2, R2, BitMask(LATG13_bit+0)
_SX	
;MP3_routines.c,191 :: 		DREQ_Direction = 1;               // Configure DREQ as input
LUI	R2, BitMask(TRISG12_bit+0)
ORI	R2, R2, BitMask(TRISG12_bit+0)
_SX	
;MP3_routines.c,192 :: 		BSYNC_Direction = 0;               // Configure BSYNC as output
LUI	R2, BitMask(TRISG15_bit+0)
ORI	R2, R2, BitMask(TRISG15_bit+0)
_SX	
;MP3_routines.c,193 :: 		BSYNC = 0;               // Clear BSYNC
LUI	R2, BitMask(LATG15_bit+0)
ORI	R2, R2, BitMask(LATG15_bit+0)
_SX	
;MP3_routines.c,196 :: 		SPI3_Init_Advanced(_SPI_MASTER, _SPI_8_BIT, 40, _SPI_SS_DISABLE, _SPI_DATA_SAMPLE_MIDDLE, _SPI_CLK_IDLE_LOW, _SPI_IDLE_2_ACTIVE);
MOVZ	R28, R0, R0
ORI	R27, R0, 40
MOVZ	R26, R0, R0
ORI	R25, R0, 32
ORI	R2, R0, 256
ADDIU	SP, SP, -8
SH	R2, 4(SP)
SH	R0, 2(SP)
SH	R0, 0(SP)
JAL	_SPI3_Init_Advanced+0
NOP	
ADDIU	SP, SP, 8
;MP3_routines.c,199 :: 		MP3_RST = 0;
LUI	R2, BitMask(LATG13_bit+0)
ORI	R2, R2, BitMask(LATG13_bit+0)
_SX	
;MP3_routines.c,200 :: 		Delay_ms(10);
LUI	R24, 4
ORI	R24, R24, 4522
L_MP3_Init24:
ADDIU	R24, R24, -1
BNE	R24, R0, L_MP3_Init24
NOP	
;MP3_routines.c,201 :: 		MP3_RST = 1;
LUI	R2, BitMask(LATG13_bit+0)
ORI	R2, R2, BitMask(LATG13_bit+0)
_SX	
;MP3_routines.c,204 :: 		while (DREQ == 0)
L_MP3_Init26:
_LX	
EXT	R2, R2, BitPos(RG12_bit+0), 1
BEQ	R2, R0, L__MP3_Init78
NOP	
J	L_MP3_Init27
NOP	
L__MP3_Init78:
;MP3_routines.c,205 :: 		;
J	L_MP3_Init26
NOP	
L_MP3_Init27:
;MP3_routines.c,207 :: 		MP3_SCI_Write(SCI_MODE_ADDR, 0x0800);
ORI	R26, R0, 2048
MOVZ	R25, R0, R0
JAL	_MP3_SCI_Write+0
NOP	
;MP3_routines.c,208 :: 		MP3_SCI_Write(SCI_BASS_ADDR, 0x7A00);
ORI	R26, R0, 31232
ORI	R25, R0, 2
JAL	_MP3_SCI_Write+0
NOP	
;MP3_routines.c,209 :: 		MP3_SCI_Write(SCI_CLOCKF_ADDR, 0x2000);   // default 12 288 000 Hz
ORI	R26, R0, 8192
ORI	R25, R0, 3
JAL	_MP3_SCI_Write+0
NOP	
;MP3_routines.c,212 :: 		volume_left = 20;            // Set volume to initial value
ORI	R2, R0, 20
SB	R2, Offset(_volume_left+0)(GP)
;MP3_routines.c,213 :: 		volume_right = 20;
ORI	R2, R0, 20
SB	R2, Offset(_volume_right+0)(GP)
;MP3_routines.c,214 :: 		MP3_Set_Volume(volume_left, volume_right);
ORI	R26, R0, 20
ORI	R25, R0, 20
JAL	_MP3_Set_Volume+0
NOP	
;MP3_routines.c,215 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_MP3_Init28:
ADDIU	R24, R24, -1
BNE	R24, R0, L_MP3_Init28
NOP	
;MP3_routines.c,216 :: 		}
L_end_MP3_Init:
LW	R28, 16(SP)
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _MP3_Init
_initSPI:
;MP3_routines.c,217 :: 		void initSPI(void)
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;MP3_routines.c,219 :: 		SPI3_Init_Advanced(_SPI_MASTER, _SPI_8_BIT, 80, _SPI_SS_DISABLE, _SPI_DATA_SAMPLE_MIDDLE, _SPI_CLK_IDLE_HIGH, _SPI_ACTIVE_2_IDLE);
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
SW	R28, 16(SP)
MOVZ	R28, R0, R0
ORI	R27, R0, 80
MOVZ	R26, R0, R0
ORI	R25, R0, 32
ADDIU	SP, SP, -8
SH	R0, 4(SP)
ORI	R2, R0, 64
SH	R2, 2(SP)
SH	R0, 0(SP)
JAL	_SPI3_Init_Advanced+0
NOP	
ADDIU	SP, SP, 8
;MP3_routines.c,220 :: 		}
L_end_initSPI:
LW	R28, 16(SP)
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _initSPI
MP3_routines_constToVar:
;MP3_routines.c,222 :: 		static char* constToVar(char* dst, const char* src)
;MP3_routines.c,226 :: 		tmp = dst;
; tmp start address is: 12 (R3)
; tmp start address is: 12 (R3)
MOVZ	R3, R25, R0
; tmp end address is: 12 (R3)
;MP3_routines.c,227 :: 		for (;;)
L_MP3_routines_constToVar30:
;MP3_routines.c,229 :: 		*dst = *src;
; tmp start address is: 12 (R3)
; tmp end address is: 12 (R3)
LBU	R2, 0(R26)
SB	R2, 0(R25)
;MP3_routines.c,230 :: 		if (*src == 0) break;
LBU	R2, 0(R26)
ANDI	R2, R2, 255
BEQ	R2, R0, L_MP3_routines_constToVar81
NOP	
J	L_MP3_routines_constToVar33
NOP	
L_MP3_routines_constToVar81:
; tmp end address is: 12 (R3)
; tmp start address is: 12 (R3)
J	L_MP3_routines_constToVar31
NOP	
L_MP3_routines_constToVar33:
;MP3_routines.c,231 :: 		src++;
ADDIU	R2, R26, 1
MOVZ	R26, R2, R0
;MP3_routines.c,232 :: 		dst++;
ADDIU	R2, R25, 1
MOVZ	R25, R2, R0
;MP3_routines.c,233 :: 		}
J	L_MP3_routines_constToVar30
NOP	
L_MP3_routines_constToVar31:
;MP3_routines.c,234 :: 		return tmp;
MOVZ	R2, R3, R0
; tmp end address is: 12 (R3)
;MP3_routines.c,235 :: 		}
L_end_constToVar:
JR	RA
NOP	
; end of MP3_routines_constToVar
_MP3_Play:
;MP3_routines.c,238 :: 		int MP3_Play(char *infname)
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;MP3_routines.c,241 :: 		short fileHandle = -1;
SW	R26, 4(SP)
SW	R27, 8(SP)
LUI	R30, 65535
ORI	R30, R30, 65535
SB	R30, 16(SP)
LUI	R30, 65535
ORI	R30, R30, 65535
SH	R30, 18(SP)
;MP3_routines.c,242 :: 		int err = -1;
;MP3_routines.c,245 :: 		while(fileHandle < 0)
L_MP3_Play34:
LB	R2, 16(SP)
SLTI	R2, R2, 0
BNE	R2, R0, L__MP3_Play83
NOP	
J	L_MP3_Play35
NOP	
L__MP3_Play83:
;MP3_routines.c,247 :: 		fileHandle = FAT32_Open(infname, FILE_READ);
SW	R25, 12(SP)
ORI	R26, R0, 1
JAL	_FAT32_Open+0
NOP	
LW	R25, 12(SP)
SB	R2, 16(SP)
;MP3_routines.c,248 :: 		}
J	L_MP3_Play34
NOP	
L_MP3_Play35:
;MP3_routines.c,250 :: 		if (fileHandle >= 0) // If not Error
LB	R2, 16(SP)
SLTI	R2, R2, 0
BEQ	R2, R0, L__MP3_Play84
NOP	
J	L_MP3_Play36
NOP	
L__MP3_Play84:
;MP3_routines.c,253 :: 		fileHandle = FAT32_Size(infname, &file_size);
SW	R25, 12(SP)
LUI	R26, hi_addr(_file_size+0)
ORI	R26, R26, lo_addr(_file_size+0)
JAL	_FAT32_Size+0
NOP	
LW	R25, 12(SP)
SB	R2, 16(SP)
;MP3_routines.c,256 :: 		while (file_size > BUFFER_SIZE)
L_MP3_Play37:
LW	R2, Offset(_file_size+0)(GP)
SLTIU	R2, R2, 449
BEQ	R2, R0, L__MP3_Play85
NOP	
J	L_MP3_Play38
NOP	
L__MP3_Play85:
;MP3_routines.c,258 :: 		FAT32_Read(fileHandle, mp3_buffer, BUFFER_SIZE);
SW	R25, 12(SP)
ORI	R27, R0, 448
LUI	R26, hi_addr(_mp3_buffer+0)
ORI	R26, R26, lo_addr(_mp3_buffer+0)
LB	R25, 16(SP)
JAL	_FAT32_Read+0
NOP	
LW	R25, 12(SP)
;MP3_routines.c,259 :: 		for (i = 0; i < BUFFER_SIZE / BYTES_2_WRITE; i++)
; i start address is: 24 (R6)
MOVZ	R6, R0, R0
; i end address is: 24 (R6)
MOVZ	R4, R6, R0
L_MP3_Play39:
; i start address is: 16 (R4)
SLTIU	R2, R4, 14
BNE	R2, R0, L__MP3_Play86
NOP	
J	L_MP3_Play40
NOP	
L__MP3_Play86:
;MP3_routines.c,261 :: 		MP3_SDI_Write_32(mp3_buffer + i * BYTES_2_WRITE);
SLL	R3, R4, 5
LUI	R2, hi_addr(_mp3_buffer+0)
ORI	R2, R2, lo_addr(_mp3_buffer+0)
ADDU	R2, R2, R3
SW	R25, 12(SP)
MOVZ	R25, R2, R0
JAL	_MP3_SDI_Write_32+0
NOP	
LW	R25, 12(SP)
;MP3_routines.c,259 :: 		for (i = 0; i < BUFFER_SIZE / BYTES_2_WRITE; i++)
ADDIU	R2, R4, 1
; i end address is: 16 (R4)
; i start address is: 24 (R6)
MOVZ	R6, R2, R0
;MP3_routines.c,262 :: 		}
MOVZ	R4, R6, R0
; i end address is: 24 (R6)
J	L_MP3_Play39
NOP	
L_MP3_Play40:
;MP3_routines.c,263 :: 		file_size -= BUFFER_SIZE;
LW	R2, Offset(_file_size+0)(GP)
ADDIU	R2, R2, -448
SW	R2, Offset(_file_size+0)(GP)
;MP3_routines.c,264 :: 		}
J	L_MP3_Play37
NOP	
L_MP3_Play38:
;MP3_routines.c,267 :: 		FAT32_Read(fileHandle, mp3_buffer, BUFFER_SIZE);
SW	R25, 12(SP)
ORI	R27, R0, 448
LUI	R26, hi_addr(_mp3_buffer+0)
ORI	R26, R26, lo_addr(_mp3_buffer+0)
LB	R25, 16(SP)
JAL	_FAT32_Read+0
NOP	
LW	R25, 12(SP)
;MP3_routines.c,269 :: 		for (i = 0; i < file_size; i++)
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; i end address is: 20 (R5)
MOVZ	R3, R5, R0
L_MP3_Play42:
; i start address is: 12 (R3)
LW	R2, Offset(_file_size+0)(GP)
SLTU	R2, R3, R2
BNE	R2, R0, L__MP3_Play87
NOP	
J	L_MP3_Play43
NOP	
L__MP3_Play87:
;MP3_routines.c,271 :: 		MP3_SDI_Write(mp3_buffer[i]);
LUI	R2, hi_addr(_mp3_buffer+0)
ORI	R2, R2, lo_addr(_mp3_buffer+0)
ADDU	R2, R2, R3
SW	R25, 12(SP)
LBU	R25, 0(R2)
JAL	_MP3_SDI_Write+0
NOP	
LW	R25, 12(SP)
;MP3_routines.c,269 :: 		for (i = 0; i < file_size; i++)
ADDIU	R2, R3, 1
; i end address is: 12 (R3)
; i start address is: 20 (R5)
MOVZ	R5, R2, R0
;MP3_routines.c,272 :: 		}
MOVZ	R3, R5, R0
; i end address is: 20 (R5)
J	L_MP3_Play42
NOP	
L_MP3_Play43:
;MP3_routines.c,274 :: 		while(err != 0)
L_MP3_Play45:
LH	R2, 18(SP)
BNE	R2, R0, L__MP3_Play89
NOP	
J	L_MP3_Play46
NOP	
L__MP3_Play89:
;MP3_routines.c,276 :: 		err = FAT32_Close(fileHandle);
SW	R25, 12(SP)
LB	R25, 16(SP)
JAL	_FAT32_Close+0
NOP	
LW	R25, 12(SP)
SEB	R2, R2
SH	R2, 18(SP)
;MP3_routines.c,277 :: 		}
J	L_MP3_Play45
NOP	
L_MP3_Play46:
;MP3_routines.c,278 :: 		}
L_MP3_Play36:
;MP3_routines.c,279 :: 		}
L_end_MP3_Play:
LW	R27, 8(SP)
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _MP3_Play
