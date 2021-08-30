MP3_jsmn_alloc_token:
;jsmn.h,107 :: 		const size_t num_tokens) {
;jsmn.h,109 :: 		if (parser->toknext >= num_tokens) {
ADDIU	R2, R25, 2
LHU	R2, 0(R2)
ANDI	R2, R2, 65535
SLTU	R2, R2, R27
BEQ	R2, R0, L_MP3_jsmn_alloc_token236
NOP	
J	L_MP3_jsmn_alloc_token0
NOP	
L_MP3_jsmn_alloc_token236:
;jsmn.h,110 :: 		return NULL;
MOVZ	R2, R0, R0
J	L_end_jsmn_alloc_token
NOP	
;jsmn.h,111 :: 		}
L_MP3_jsmn_alloc_token0:
;jsmn.h,112 :: 		tok = &tokens[parser->toknext++];
ADDIU	R4, R25, 2
LHU	R3, 0(R4)
ANDI	R2, R3, 65535
SLL	R2, R2, 3
ADDU	R2, R26, R2
; tok start address is: 20 (R5)
MOVZ	R5, R2, R0
ADDIU	R2, R3, 1
SH	R2, 0(R4)
;jsmn.h,113 :: 		tok->start = tok->end = -1;
ADDIU	R4, R5, 2
ADDIU	R3, R5, 4
ORI	R2, R0, 65535
SH	R2, 0(R3)
LH	R2, 0(R3)
SH	R2, 0(R4)
;jsmn.h,114 :: 		tok->size = 0;
ADDIU	R2, R5, 6
SH	R0, 0(R2)
;jsmn.h,118 :: 		return tok;
MOVZ	R2, R5, R0
; tok end address is: 20 (R5)
;jsmn.h,119 :: 		}
L_end_jsmn_alloc_token:
JR	RA
NOP	
; end of MP3_jsmn_alloc_token
MP3_jsmn_fill_token:
;jsmn.h,125 :: 		const int start, const int end) {
;jsmn.h,126 :: 		token->type = type;
SB	R26, 0(R25)
;jsmn.h,127 :: 		token->start = start;
ADDIU	R2, R25, 2
SH	R27, 0(R2)
;jsmn.h,128 :: 		token->end = end;
ADDIU	R2, R25, 4
SH	R28, 0(R2)
;jsmn.h,129 :: 		token->size = 0;
ADDIU	R2, R25, 6
SH	R0, 0(R2)
;jsmn.h,130 :: 		}
L_end_jsmn_fill_token:
JR	RA
NOP	
; end of MP3_jsmn_fill_token
MP3_jsmn_parse_primitive:
;jsmn.h,137 :: 		const size_t num_tokens) {
ADDIU	SP, SP, -20
SW	RA, 0(SP)
; num_tokens start address is: 20 (R5)
LW	R5, 20(SP)
;jsmn.h,141 :: 		start = parser->pos;
LHU	R2, 0(R25)
; start start address is: 24 (R6)
ANDI	R6, R2, 65535
; start end address is: 24 (R6)
; num_tokens end address is: 20 (R5)
;jsmn.h,143 :: 		for (; parser->pos < len && js[parser->pos] != '\0'; parser->pos++) {
L_MP3_jsmn_parse_primitive1:
; start start address is: 24 (R6)
; num_tokens start address is: 20 (R5)
LHU	R2, 0(R25)
ANDI	R2, R2, 65535
SLTU	R2, R2, R27
BNE	R2, R0, L_MP3_jsmn_parse_primitive239
NOP	
J	L_MP3_jsmn_parse_primitive174
NOP	
L_MP3_jsmn_parse_primitive239:
LHU	R2, 0(R25)
ANDI	R2, R2, 65535
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BNE	R2, R0, L_MP3_jsmn_parse_primitive241
NOP	
J	L_MP3_jsmn_parse_primitive173
NOP	
L_MP3_jsmn_parse_primitive241:
L_MP3_jsmn_parse_primitive170:
;jsmn.h,144 :: 		switch (js[parser->pos]) {
LHU	R2, 0(R25)
ANDI	R2, R2, 65535
ADDU	R4, R26, R2
J	L_MP3_jsmn_parse_primitive6
NOP	
;jsmn.h,147 :: 		case ':':
L_MP3_jsmn_parse_primitive8:
;jsmn.h,149 :: 		case '\t':
L_MP3_jsmn_parse_primitive9:
;jsmn.h,150 :: 		case '\r':
L_MP3_jsmn_parse_primitive10:
;jsmn.h,151 :: 		case '\n':
L_MP3_jsmn_parse_primitive11:
;jsmn.h,152 :: 		case ' ':
L_MP3_jsmn_parse_primitive12:
;jsmn.h,153 :: 		case ',':
L_MP3_jsmn_parse_primitive13:
;jsmn.h,154 :: 		case ']':
L_MP3_jsmn_parse_primitive14:
;jsmn.h,155 :: 		case '}':
L_MP3_jsmn_parse_primitive15:
;jsmn.h,156 :: 		goto found;
J	___jsmn_parse_primitive_found
NOP	
;jsmn.h,157 :: 		default:
L_MP3_jsmn_parse_primitive16:
;jsmn.h,159 :: 		break;
J	L_MP3_jsmn_parse_primitive7
NOP	
;jsmn.h,160 :: 		}
L_MP3_jsmn_parse_primitive6:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 58
BNE	R3, R2, L_MP3_jsmn_parse_primitive243
NOP	
J	L_MP3_jsmn_parse_primitive8
NOP	
L_MP3_jsmn_parse_primitive243:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 9
BNE	R3, R2, L_MP3_jsmn_parse_primitive245
NOP	
J	L_MP3_jsmn_parse_primitive9
NOP	
L_MP3_jsmn_parse_primitive245:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 13
BNE	R3, R2, L_MP3_jsmn_parse_primitive247
NOP	
J	L_MP3_jsmn_parse_primitive10
NOP	
L_MP3_jsmn_parse_primitive247:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 10
BNE	R3, R2, L_MP3_jsmn_parse_primitive249
NOP	
J	L_MP3_jsmn_parse_primitive11
NOP	
L_MP3_jsmn_parse_primitive249:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 32
BNE	R3, R2, L_MP3_jsmn_parse_primitive251
NOP	
J	L_MP3_jsmn_parse_primitive12
NOP	
L_MP3_jsmn_parse_primitive251:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 44
BNE	R3, R2, L_MP3_jsmn_parse_primitive253
NOP	
J	L_MP3_jsmn_parse_primitive13
NOP	
L_MP3_jsmn_parse_primitive253:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 93
BNE	R3, R2, L_MP3_jsmn_parse_primitive255
NOP	
J	L_MP3_jsmn_parse_primitive14
NOP	
L_MP3_jsmn_parse_primitive255:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 125
BNE	R3, R2, L_MP3_jsmn_parse_primitive257
NOP	
J	L_MP3_jsmn_parse_primitive15
NOP	
L_MP3_jsmn_parse_primitive257:
J	L_MP3_jsmn_parse_primitive16
NOP	
L_MP3_jsmn_parse_primitive7:
;jsmn.h,161 :: 		if (js[parser->pos] < 32 || js[parser->pos] >= 127) {
LHU	R2, 0(R25)
ANDI	R2, R2, 65535
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
SLTIU	R2, R2, 32
BEQ	R2, R0, L_MP3_jsmn_parse_primitive258
NOP	
J	L_MP3_jsmn_parse_primitive172
NOP	
L_MP3_jsmn_parse_primitive258:
LHU	R2, 0(R25)
ANDI	R2, R2, 65535
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
SLTIU	R2, R2, 127
BNE	R2, R0, L_MP3_jsmn_parse_primitive259
NOP	
J	L_MP3_jsmn_parse_primitive171
NOP	
L_MP3_jsmn_parse_primitive259:
J	L_MP3_jsmn_parse_primitive19
NOP	
; num_tokens end address is: 20 (R5)
L_MP3_jsmn_parse_primitive172:
L_MP3_jsmn_parse_primitive171:
;jsmn.h,162 :: 		parser->pos = start;
SH	R6, 0(R25)
; start end address is: 24 (R6)
;jsmn.h,163 :: 		return JSMN_ERROR_INVAL;
ORI	R2, R0, 65534
J	L_end_jsmn_parse_primitive
NOP	
;jsmn.h,164 :: 		}
L_MP3_jsmn_parse_primitive19:
;jsmn.h,143 :: 		for (; parser->pos < len && js[parser->pos] != '\0'; parser->pos++) {
; num_tokens start address is: 20 (R5)
; start start address is: 24 (R6)
LHU	R2, 0(R25)
ADDIU	R2, R2, 1
SH	R2, 0(R25)
;jsmn.h,165 :: 		}
J	L_MP3_jsmn_parse_primitive1
NOP	
;jsmn.h,143 :: 		for (; parser->pos < len && js[parser->pos] != '\0'; parser->pos++) {
L_MP3_jsmn_parse_primitive174:
L_MP3_jsmn_parse_primitive173:
;jsmn.h,172 :: 		found:
___jsmn_parse_primitive_found:
;jsmn.h,173 :: 		if (tokens == NULL) {
BEQ	R28, R0, L_MP3_jsmn_parse_primitive260
NOP	
J	L_MP3_jsmn_parse_primitive20
NOP	
L_MP3_jsmn_parse_primitive260:
; start end address is: 24 (R6)
; num_tokens end address is: 20 (R5)
;jsmn.h,174 :: 		parser->pos--;
LHU	R2, 0(R25)
ADDIU	R2, R2, -1
SH	R2, 0(R25)
;jsmn.h,175 :: 		return 0;
MOVZ	R2, R0, R0
J	L_end_jsmn_parse_primitive
NOP	
;jsmn.h,176 :: 		}
L_MP3_jsmn_parse_primitive20:
;jsmn.h,177 :: 		token = jsmn_alloc_token(parser, tokens, num_tokens);
; num_tokens start address is: 20 (R5)
; start start address is: 24 (R6)
SW	R27, 4(SP)
; num_tokens end address is: 20 (R5)
SW	R26, 8(SP)
MOVZ	R27, R5, R0
MOVZ	R26, R28, R0
JAL	MP3_jsmn_alloc_token+0
NOP	
LW	R26, 8(SP)
LW	R27, 4(SP)
; token start address is: 12 (R3)
MOVZ	R3, R2, R0
;jsmn.h,178 :: 		if (token == NULL) {
BEQ	R2, R0, L_MP3_jsmn_parse_primitive261
NOP	
J	L_MP3_jsmn_parse_primitive21
NOP	
L_MP3_jsmn_parse_primitive261:
; token end address is: 12 (R3)
;jsmn.h,179 :: 		parser->pos = start;
SH	R6, 0(R25)
; start end address is: 24 (R6)
;jsmn.h,180 :: 		return JSMN_ERROR_NOMEM;
ORI	R2, R0, 65535
J	L_end_jsmn_parse_primitive
NOP	
;jsmn.h,181 :: 		}
L_MP3_jsmn_parse_primitive21:
;jsmn.h,182 :: 		jsmn_fill_token(token, JSMN_PRIMITIVE, start, parser->pos);
; token start address is: 12 (R3)
; start start address is: 24 (R6)
SW	R28, 4(SP)
SW	R27, 8(SP)
SW	R26, 12(SP)
SW	R25, 16(SP)
LHU	R28, 0(R25)
SEH	R27, R6
; start end address is: 24 (R6)
ORI	R26, R0, 4
MOVZ	R25, R3, R0
; token end address is: 12 (R3)
JAL	MP3_jsmn_fill_token+0
NOP	
LW	R25, 16(SP)
LW	R26, 12(SP)
LW	R27, 8(SP)
LW	R28, 4(SP)
;jsmn.h,186 :: 		parser->pos--;
LHU	R2, 0(R25)
ADDIU	R2, R2, -1
SH	R2, 0(R25)
;jsmn.h,187 :: 		return 0;
MOVZ	R2, R0, R0
;jsmn.h,188 :: 		}
L_end_jsmn_parse_primitive:
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of MP3_jsmn_parse_primitive
MP3_jsmn_parse_string:
;jsmn.h,195 :: 		const size_t num_tokens) {
ADDIU	SP, SP, -20
SW	RA, 0(SP)
; num_tokens start address is: 20 (R5)
LW	R5, 20(SP)
;jsmn.h,198 :: 		int start = parser->pos;
LHU	R2, 0(R25)
; start start address is: 24 (R6)
ANDI	R6, R2, 65535
;jsmn.h,200 :: 		parser->pos++;
ADDIU	R2, R2, 1
SH	R2, 0(R25)
; num_tokens end address is: 20 (R5)
; start end address is: 24 (R6)
;jsmn.h,203 :: 		for (; parser->pos < len && js[parser->pos] != '\0'; parser->pos++) {
L_MP3_jsmn_parse_string22:
; start start address is: 24 (R6)
; num_tokens start address is: 20 (R5)
LHU	R2, 0(R25)
ANDI	R2, R2, 65535
SLTU	R2, R2, R27
BNE	R2, R0, L_MP3_jsmn_parse_string263
NOP	
J	L_MP3_jsmn_parse_string193
NOP	
L_MP3_jsmn_parse_string263:
LHU	R2, 0(R25)
ANDI	R2, R2, 65535
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BNE	R2, R0, L_MP3_jsmn_parse_string265
NOP	
J	L_MP3_jsmn_parse_string192
NOP	
L_MP3_jsmn_parse_string265:
L_MP3_jsmn_parse_string180:
;jsmn.h,204 :: 		char c = js[parser->pos];
LHU	R2, 0(R25)
ANDI	R2, R2, 65535
ADDU	R2, R26, R2
LBU	R2, 0(R2)
; c start address is: 16 (R4)
ANDI	R4, R2, 255
;jsmn.h,207 :: 		if (c == '\"') {
ANDI	R3, R2, 255
ORI	R2, R0, 34
BEQ	R3, R2, L_MP3_jsmn_parse_string266
NOP	
J	L_MP3_jsmn_parse_string27
NOP	
L_MP3_jsmn_parse_string266:
; c end address is: 16 (R4)
;jsmn.h,208 :: 		if (tokens == NULL) {
BEQ	R28, R0, L_MP3_jsmn_parse_string267
NOP	
J	L_MP3_jsmn_parse_string28
NOP	
L_MP3_jsmn_parse_string267:
; num_tokens end address is: 20 (R5)
; start end address is: 24 (R6)
;jsmn.h,209 :: 		return 0;
MOVZ	R2, R0, R0
J	L_end_jsmn_parse_string
NOP	
;jsmn.h,210 :: 		}
L_MP3_jsmn_parse_string28:
;jsmn.h,211 :: 		token = jsmn_alloc_token(parser, tokens, num_tokens);
; start start address is: 24 (R6)
; num_tokens start address is: 20 (R5)
SW	R27, 4(SP)
; num_tokens end address is: 20 (R5)
SW	R26, 8(SP)
MOVZ	R27, R5, R0
MOVZ	R26, R28, R0
JAL	MP3_jsmn_alloc_token+0
NOP	
LW	R26, 8(SP)
LW	R27, 4(SP)
; token start address is: 16 (R4)
MOVZ	R4, R2, R0
;jsmn.h,212 :: 		if (token == NULL) {
BEQ	R2, R0, L_MP3_jsmn_parse_string268
NOP	
J	L_MP3_jsmn_parse_string29
NOP	
L_MP3_jsmn_parse_string268:
; token end address is: 16 (R4)
;jsmn.h,213 :: 		parser->pos = start;
SH	R6, 0(R25)
; start end address is: 24 (R6)
;jsmn.h,214 :: 		return JSMN_ERROR_NOMEM;
ORI	R2, R0, 65535
J	L_end_jsmn_parse_string
NOP	
;jsmn.h,215 :: 		}
L_MP3_jsmn_parse_string29:
;jsmn.h,216 :: 		jsmn_fill_token(token, JSMN_STRING, start + 1, parser->pos);
; start start address is: 24 (R6)
; token start address is: 16 (R4)
LHU	R3, 0(R25)
ADDIU	R2, R6, 1
; start end address is: 24 (R6)
SW	R28, 4(SP)
SW	R27, 8(SP)
SW	R26, 12(SP)
SW	R25, 16(SP)
ANDI	R28, R3, 65535
SEH	R27, R2
ORI	R26, R0, 3
MOVZ	R25, R4, R0
; token end address is: 16 (R4)
JAL	MP3_jsmn_fill_token+0
NOP	
LW	R25, 16(SP)
LW	R26, 12(SP)
LW	R27, 8(SP)
LW	R28, 4(SP)
;jsmn.h,220 :: 		return 0;
MOVZ	R2, R0, R0
J	L_end_jsmn_parse_string
NOP	
;jsmn.h,221 :: 		}
L_MP3_jsmn_parse_string27:
;jsmn.h,224 :: 		if (c == '\\' && parser->pos + 1 < len) {
; start start address is: 24 (R6)
; num_tokens start address is: 20 (R5)
; c start address is: 16 (R4)
ANDI	R3, R4, 255
; c end address is: 16 (R4)
ORI	R2, R0, 92
BEQ	R3, R2, L_MP3_jsmn_parse_string269
NOP	
J	L_MP3_jsmn_parse_string194
NOP	
L_MP3_jsmn_parse_string269:
LHU	R2, 0(R25)
ADDIU	R2, R2, 1
ANDI	R2, R2, 65535
SLTU	R2, R2, R27
BNE	R2, R0, L_MP3_jsmn_parse_string270
NOP	
J	L_MP3_jsmn_parse_string195
NOP	
L_MP3_jsmn_parse_string270:
L_MP3_jsmn_parse_string179:
;jsmn.h,226 :: 		parser->pos++;
LHU	R2, 0(R25)
ADDIU	R2, R2, 1
SH	R2, 0(R25)
;jsmn.h,227 :: 		switch (js[parser->pos]) {
LHU	R2, 0(R25)
ANDI	R2, R2, 65535
ADDU	R4, R26, R2
J	L_MP3_jsmn_parse_string33
NOP	
;jsmn.h,229 :: 		case '\"':
L_MP3_jsmn_parse_string35:
;jsmn.h,230 :: 		case '/':
L_MP3_jsmn_parse_string36:
;jsmn.h,231 :: 		case '\\':
L_MP3_jsmn_parse_string37:
;jsmn.h,232 :: 		case 'b':
L_MP3_jsmn_parse_string38:
;jsmn.h,233 :: 		case 'f':
L_MP3_jsmn_parse_string39:
;jsmn.h,234 :: 		case 'r':
L_MP3_jsmn_parse_string40:
;jsmn.h,235 :: 		case 'n':
L_MP3_jsmn_parse_string41:
;jsmn.h,236 :: 		case 't':
L_MP3_jsmn_parse_string42:
;jsmn.h,237 :: 		break;
SEH	R2, R6
MOVZ	R3, R5, R0
J	L_MP3_jsmn_parse_string34
NOP	
;jsmn.h,239 :: 		case 'u':
L_MP3_jsmn_parse_string43:
;jsmn.h,240 :: 		parser->pos++;
LHU	R2, 0(R25)
ADDIU	R2, R2, 1
SH	R2, 0(R25)
;jsmn.h,241 :: 		for (i = 0; i < 4 && parser->pos < len && js[parser->pos] != '\0';
; i start address is: 12 (R3)
MOVZ	R3, R0, R0
; i end address is: 12 (R3)
; num_tokens end address is: 20 (R5)
; start end address is: 24 (R6)
L_MP3_jsmn_parse_string44:
; i start address is: 12 (R3)
; num_tokens start address is: 20 (R5)
; start start address is: 24 (R6)
SEH	R2, R3
SLTI	R2, R2, 4
BNE	R2, R0, L_MP3_jsmn_parse_string271
NOP	
J	L_MP3_jsmn_parse_string189
NOP	
L_MP3_jsmn_parse_string271:
LHU	R2, 0(R25)
ANDI	R2, R2, 65535
SLTU	R2, R2, R27
BNE	R2, R0, L_MP3_jsmn_parse_string272
NOP	
J	L_MP3_jsmn_parse_string188
NOP	
L_MP3_jsmn_parse_string272:
LHU	R2, 0(R25)
ANDI	R2, R2, 65535
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BNE	R2, R0, L_MP3_jsmn_parse_string274
NOP	
J	L_MP3_jsmn_parse_string187
NOP	
L_MP3_jsmn_parse_string274:
L_MP3_jsmn_parse_string178:
;jsmn.h,244 :: 		if (!((js[parser->pos] >= 48 && js[parser->pos] <= 57) ||   /* 0-9 */
LHU	R2, 0(R25)
ANDI	R2, R2, 65535
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
SLTIU	R2, R2, 48
BEQ	R2, R0, L_MP3_jsmn_parse_string275
NOP	
J	L_MP3_jsmn_parse_string182
NOP	
L_MP3_jsmn_parse_string275:
LHU	R2, 0(R25)
ANDI	R2, R2, 65535
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
SLTIU	R2, R2, 58
BNE	R2, R0, L_MP3_jsmn_parse_string276
NOP	
J	L_MP3_jsmn_parse_string181
NOP	
L_MP3_jsmn_parse_string276:
J	L_MP3_jsmn_parse_string54
NOP	
L_MP3_jsmn_parse_string182:
L_MP3_jsmn_parse_string181:
;jsmn.h,245 :: 		(js[parser->pos] >= 65 && js[parser->pos] <= 70) ||   /* A-F */
LHU	R2, 0(R25)
ANDI	R2, R2, 65535
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
SLTIU	R2, R2, 65
BEQ	R2, R0, L_MP3_jsmn_parse_string277
NOP	
J	L_MP3_jsmn_parse_string184
NOP	
L_MP3_jsmn_parse_string277:
LHU	R2, 0(R25)
ANDI	R2, R2, 65535
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
SLTIU	R2, R2, 71
BNE	R2, R0, L_MP3_jsmn_parse_string278
NOP	
J	L_MP3_jsmn_parse_string183
NOP	
L_MP3_jsmn_parse_string278:
J	L_MP3_jsmn_parse_string54
NOP	
L_MP3_jsmn_parse_string184:
L_MP3_jsmn_parse_string183:
;jsmn.h,246 :: 		(js[parser->pos] >= 97 && js[parser->pos] <= 102))) { /* a-f */
LHU	R2, 0(R25)
ANDI	R2, R2, 65535
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
SLTIU	R2, R2, 97
BEQ	R2, R0, L_MP3_jsmn_parse_string279
NOP	
J	L_MP3_jsmn_parse_string186
NOP	
L_MP3_jsmn_parse_string279:
LHU	R2, 0(R25)
ANDI	R2, R2, 65535
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
SLTIU	R2, R2, 103
BNE	R2, R0, L_MP3_jsmn_parse_string280
NOP	
J	L_MP3_jsmn_parse_string185
NOP	
L_MP3_jsmn_parse_string280:
J	L_MP3_jsmn_parse_string54
NOP	
L_MP3_jsmn_parse_string186:
L_MP3_jsmn_parse_string185:
MOVZ	R2, R0, R0
J	L_MP3_jsmn_parse_string53
NOP	
L_MP3_jsmn_parse_string54:
ORI	R2, R0, 1
L_MP3_jsmn_parse_string53:
BEQ	R2, R0, L_MP3_jsmn_parse_string281
NOP	
J	L_MP3_jsmn_parse_string57
NOP	
L_MP3_jsmn_parse_string281:
; i end address is: 12 (R3)
; num_tokens end address is: 20 (R5)
;jsmn.h,247 :: 		parser->pos = start;
SH	R6, 0(R25)
; start end address is: 24 (R6)
;jsmn.h,248 :: 		return JSMN_ERROR_INVAL;
ORI	R2, R0, 65534
J	L_end_jsmn_parse_string
NOP	
;jsmn.h,249 :: 		}
L_MP3_jsmn_parse_string57:
;jsmn.h,250 :: 		parser->pos++;
; start start address is: 24 (R6)
; num_tokens start address is: 20 (R5)
; i start address is: 12 (R3)
LHU	R2, 0(R25)
ADDIU	R2, R2, 1
SH	R2, 0(R25)
;jsmn.h,242 :: 		i++) {
ADDIU	R2, R3, 1
SEH	R3, R2
;jsmn.h,251 :: 		}
; i end address is: 12 (R3)
J	L_MP3_jsmn_parse_string44
NOP	
;jsmn.h,241 :: 		for (i = 0; i < 4 && parser->pos < len && js[parser->pos] != '\0';
L_MP3_jsmn_parse_string189:
L_MP3_jsmn_parse_string188:
L_MP3_jsmn_parse_string187:
;jsmn.h,252 :: 		parser->pos--;
LHU	R2, 0(R25)
ADDIU	R2, R2, -1
SH	R2, 0(R25)
;jsmn.h,253 :: 		break;
SEH	R2, R6
; num_tokens end address is: 20 (R5)
MOVZ	R3, R5, R0
J	L_MP3_jsmn_parse_string34
NOP	
;jsmn.h,255 :: 		default:
L_MP3_jsmn_parse_string58:
;jsmn.h,256 :: 		parser->pos = start;
SH	R6, 0(R25)
; start end address is: 24 (R6)
;jsmn.h,257 :: 		return JSMN_ERROR_INVAL;
ORI	R2, R0, 65534
J	L_end_jsmn_parse_string
NOP	
;jsmn.h,258 :: 		}
L_MP3_jsmn_parse_string33:
; start start address is: 24 (R6)
; num_tokens start address is: 20 (R5)
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 34
BNE	R3, R2, L_MP3_jsmn_parse_string283
NOP	
J	L_MP3_jsmn_parse_string35
NOP	
L_MP3_jsmn_parse_string283:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 47
BNE	R3, R2, L_MP3_jsmn_parse_string285
NOP	
J	L_MP3_jsmn_parse_string36
NOP	
L_MP3_jsmn_parse_string285:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 92
BNE	R3, R2, L_MP3_jsmn_parse_string287
NOP	
J	L_MP3_jsmn_parse_string37
NOP	
L_MP3_jsmn_parse_string287:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 98
BNE	R3, R2, L_MP3_jsmn_parse_string289
NOP	
J	L_MP3_jsmn_parse_string38
NOP	
L_MP3_jsmn_parse_string289:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 102
BNE	R3, R2, L_MP3_jsmn_parse_string291
NOP	
J	L_MP3_jsmn_parse_string39
NOP	
L_MP3_jsmn_parse_string291:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 114
BNE	R3, R2, L_MP3_jsmn_parse_string293
NOP	
J	L_MP3_jsmn_parse_string40
NOP	
L_MP3_jsmn_parse_string293:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 110
BNE	R3, R2, L_MP3_jsmn_parse_string295
NOP	
J	L_MP3_jsmn_parse_string41
NOP	
L_MP3_jsmn_parse_string295:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 116
BNE	R3, R2, L_MP3_jsmn_parse_string297
NOP	
J	L_MP3_jsmn_parse_string42
NOP	
L_MP3_jsmn_parse_string297:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 117
BNE	R3, R2, L_MP3_jsmn_parse_string299
NOP	
J	L_MP3_jsmn_parse_string43
NOP	
L_MP3_jsmn_parse_string299:
; num_tokens end address is: 20 (R5)
J	L_MP3_jsmn_parse_string58
NOP	
; start end address is: 24 (R6)
L_MP3_jsmn_parse_string34:
;jsmn.h,224 :: 		if (c == '\\' && parser->pos + 1 < len) {
; num_tokens start address is: 12 (R3)
; start start address is: 8 (R2)
; num_tokens end address is: 12 (R3)
; start end address is: 8 (R2)
MOVZ	R5, R3, R0
J	L_MP3_jsmn_parse_string191
NOP	
L_MP3_jsmn_parse_string194:
SEH	R2, R6
L_MP3_jsmn_parse_string191:
; num_tokens start address is: 20 (R5)
; start start address is: 8 (R2)
SEH	R6, R2
; start end address is: 8 (R2)
; num_tokens end address is: 20 (R5)
J	L_MP3_jsmn_parse_string190
NOP	
L_MP3_jsmn_parse_string195:
L_MP3_jsmn_parse_string190:
;jsmn.h,203 :: 		for (; parser->pos < len && js[parser->pos] != '\0'; parser->pos++) {
; num_tokens start address is: 20 (R5)
; start start address is: 24 (R6)
LHU	R2, 0(R25)
ADDIU	R2, R2, 1
SH	R2, 0(R25)
;jsmn.h,260 :: 		}
; num_tokens end address is: 20 (R5)
J	L_MP3_jsmn_parse_string22
NOP	
;jsmn.h,203 :: 		for (; parser->pos < len && js[parser->pos] != '\0'; parser->pos++) {
L_MP3_jsmn_parse_string193:
L_MP3_jsmn_parse_string192:
;jsmn.h,261 :: 		parser->pos = start;
SH	R6, 0(R25)
; start end address is: 24 (R6)
;jsmn.h,262 :: 		return JSMN_ERROR_PART;
ORI	R2, R0, 65533
;jsmn.h,263 :: 		}
L_end_jsmn_parse_string:
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of MP3_jsmn_parse_string
_jsmn_parse:
;jsmn.h,269 :: 		jsmntok_t *tokens, const unsigned int num_tokens) {
ADDIU	SP, SP, -24
SW	RA, 0(SP)
; num_tokens start address is: 32 (R8)
LHU	R8, 24(SP)
;jsmn.h,273 :: 		int count = parser->toknext;
ADDIU	R2, R25, 2
LHU	R2, 0(R2)
; count start address is: 28 (R7)
ANDI	R7, R2, 65535
; count end address is: 28 (R7)
; num_tokens end address is: 32 (R8)
;jsmn.h,275 :: 		for (; parser->pos < len && js[parser->pos] != '\0'; parser->pos++) {
L_jsmn_parse59:
; count start address is: 28 (R7)
; num_tokens start address is: 32 (R8)
LHU	R2, 0(R25)
ANDI	R2, R2, 65535
SLTU	R2, R2, R27
BNE	R2, R0, L__jsmn_parse301
NOP	
J	L__jsmn_parse222
NOP	
L__jsmn_parse301:
LHU	R2, 0(R25)
ANDI	R2, R2, 65535
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BNE	R2, R0, L__jsmn_parse303
NOP	
J	L__jsmn_parse221
NOP	
L__jsmn_parse303:
L__jsmn_parse204:
;jsmn.h,279 :: 		c = js[parser->pos];
LHU	R2, 0(R25)
ANDI	R2, R2, 65535
ADDU	R2, R26, R2
LBU	R2, 0(R2)
; c start address is: 24 (R6)
ANDI	R6, R2, 255
;jsmn.h,280 :: 		switch (c) {
J	L_jsmn_parse64
NOP	
;jsmn.h,281 :: 		case '{':
L_jsmn_parse66:
;jsmn.h,282 :: 		case '[':
L_jsmn_parse67:
;jsmn.h,283 :: 		count++;
ADDIU	R2, R7, 1
SEH	R7, R2
;jsmn.h,284 :: 		if (tokens == NULL) {
BEQ	R28, R0, L__jsmn_parse304
NOP	
J	L_jsmn_parse68
NOP	
L__jsmn_parse304:
; c end address is: 24 (R6)
;jsmn.h,285 :: 		break;
J	L_jsmn_parse65
NOP	
;jsmn.h,286 :: 		}
L_jsmn_parse68:
;jsmn.h,287 :: 		token = jsmn_alloc_token(parser, tokens, num_tokens);
; c start address is: 24 (R6)
SW	R27, 4(SP)
SW	R26, 8(SP)
ANDI	R27, R8, 65535
MOVZ	R26, R28, R0
JAL	MP3_jsmn_alloc_token+0
NOP	
LW	R26, 8(SP)
LW	R27, 4(SP)
SW	R2, 20(SP)
;jsmn.h,288 :: 		if (token == NULL) {
BEQ	R2, R0, L__jsmn_parse305
NOP	
J	L_jsmn_parse69
NOP	
L__jsmn_parse305:
; c end address is: 24 (R6)
; count end address is: 28 (R7)
; num_tokens end address is: 32 (R8)
;jsmn.h,289 :: 		return JSMN_ERROR_NOMEM;
ORI	R2, R0, 65535
J	L_end_jsmn_parse
NOP	
;jsmn.h,290 :: 		}
L_jsmn_parse69:
;jsmn.h,291 :: 		if (parser->toksuper != -1) {
; num_tokens start address is: 32 (R8)
; count start address is: 28 (R7)
; c start address is: 24 (R6)
ADDIU	R2, R25, 4
LH	R2, 0(R2)
SEH	R3, R2
LUI	R2, 65535
ORI	R2, R2, 65535
BNE	R3, R2, L__jsmn_parse307
NOP	
J	L_jsmn_parse70
NOP	
L__jsmn_parse307:
;jsmn.h,292 :: 		jsmntok_t *t = &tokens[parser->toksuper];
ADDIU	R2, R25, 4
LH	R2, 0(R2)
SEH	R2, R2
SLL	R2, R2, 3
ADDU	R2, R28, R2
;jsmn.h,299 :: 		t->size++;
ADDIU	R3, R2, 6
LH	R2, 0(R3)
ADDIU	R2, R2, 1
SH	R2, 0(R3)
;jsmn.h,303 :: 		}
L_jsmn_parse70:
;jsmn.h,304 :: 		token->type = (c == '{' ? JSMN_OBJECT : JSMN_ARRAY);
LW	R4, 20(SP)
ANDI	R3, R6, 255
; c end address is: 24 (R6)
ORI	R2, R0, 123
BEQ	R3, R2, L__jsmn_parse308
NOP	
J	L_jsmn_parse71
NOP	
L__jsmn_parse308:
ORI	R2, R0, 1
SB	R2, 12(SP)
J	L_jsmn_parse72
NOP	
L_jsmn_parse71:
ORI	R2, R0, 2
SB	R2, 12(SP)
L_jsmn_parse72:
LBU	R2, 12(SP)
SB	R2, 0(R4)
;jsmn.h,305 :: 		token->start = parser->pos;
LW	R2, 20(SP)
ADDIU	R3, R2, 2
LHU	R2, 0(R25)
SH	R2, 0(R3)
;jsmn.h,306 :: 		parser->toksuper = parser->toknext - 1;
ADDIU	R3, R25, 4
ADDIU	R2, R25, 2
LHU	R2, 0(R2)
ADDIU	R2, R2, -1
SH	R2, 0(R3)
;jsmn.h,307 :: 		break;
J	L_jsmn_parse65
NOP	
;jsmn.h,308 :: 		case '}':
L_jsmn_parse73:
;jsmn.h,309 :: 		case ']':
; c start address is: 24 (R6)
L_jsmn_parse74:
;jsmn.h,310 :: 		if (tokens == NULL) {
BEQ	R28, R0, L__jsmn_parse309
NOP	
J	L_jsmn_parse75
NOP	
L__jsmn_parse309:
; c end address is: 24 (R6)
;jsmn.h,311 :: 		break;
J	L_jsmn_parse65
NOP	
;jsmn.h,312 :: 		}
L_jsmn_parse75:
;jsmn.h,313 :: 		type = (c == '}' ? JSMN_OBJECT : JSMN_ARRAY);
; c start address is: 24 (R6)
ANDI	R3, R6, 255
; c end address is: 24 (R6)
ORI	R2, R0, 125
BEQ	R3, R2, L__jsmn_parse310
NOP	
J	L_jsmn_parse76
NOP	
L__jsmn_parse310:
ORI	R2, R0, 1
SB	R2, 13(SP)
J	L_jsmn_parse77
NOP	
L_jsmn_parse76:
ORI	R2, R0, 2
SB	R2, 13(SP)
L_jsmn_parse77:
LBU	R2, 13(SP)
SB	R2, 14(SP)
;jsmn.h,337 :: 		for (i = parser->toknext - 1; i >= 0; i--) {
ADDIU	R2, R25, 2
LHU	R2, 0(R2)
ADDIU	R2, R2, -1
SH	R2, 18(SP)
; count end address is: 28 (R7)
; num_tokens end address is: 32 (R8)
SEH	R5, R7
ANDI	R4, R8, 65535
L_jsmn_parse78:
; num_tokens start address is: 16 (R4)
; count start address is: 20 (R5)
LH	R2, 18(SP)
SLTI	R2, R2, 0
BEQ	R2, R0, L__jsmn_parse311
NOP	
J	L_jsmn_parse79
NOP	
L__jsmn_parse311:
;jsmn.h,338 :: 		token = &tokens[i];
LH	R2, 18(SP)
SLL	R2, R2, 3
ADDU	R2, R28, R2
SW	R2, 20(SP)
;jsmn.h,339 :: 		if (token->start != -1 && token->end == -1) {
ADDIU	R2, R2, 2
LH	R2, 0(R2)
SEH	R3, R2
LUI	R2, 65535
ORI	R2, R2, 65535
BNE	R3, R2, L__jsmn_parse313
NOP	
J	L__jsmn_parse206
NOP	
L__jsmn_parse313:
LW	R2, 20(SP)
ADDIU	R2, R2, 4
LH	R2, 0(R2)
SEH	R3, R2
LUI	R2, 65535
ORI	R2, R2, 65535
BEQ	R3, R2, L__jsmn_parse314
NOP	
J	L__jsmn_parse205
NOP	
L__jsmn_parse314:
L__jsmn_parse203:
;jsmn.h,340 :: 		if (token->type != type) {
LW	R2, 20(SP)
LBU	R2, 0(R2)
ANDI	R3, R2, 255
LBU	R2, 14(SP)
BNE	R3, R2, L__jsmn_parse316
NOP	
J	L_jsmn_parse84
NOP	
L__jsmn_parse316:
; num_tokens end address is: 16 (R4)
; count end address is: 20 (R5)
;jsmn.h,341 :: 		return JSMN_ERROR_INVAL;
ORI	R2, R0, 65534
J	L_end_jsmn_parse
NOP	
;jsmn.h,342 :: 		}
L_jsmn_parse84:
;jsmn.h,343 :: 		parser->toksuper = -1;
; count start address is: 20 (R5)
; num_tokens start address is: 16 (R4)
ADDIU	R3, R25, 4
ORI	R2, R0, 65535
SH	R2, 0(R3)
;jsmn.h,344 :: 		token->end = parser->pos + 1;
LW	R2, 20(SP)
ADDIU	R3, R2, 4
LHU	R2, 0(R25)
ADDIU	R2, R2, 1
SH	R2, 0(R3)
;jsmn.h,345 :: 		break;
J	L_jsmn_parse79
NOP	
;jsmn.h,339 :: 		if (token->start != -1 && token->end == -1) {
L__jsmn_parse206:
L__jsmn_parse205:
;jsmn.h,337 :: 		for (i = parser->toknext - 1; i >= 0; i--) {
LH	R2, 18(SP)
ADDIU	R2, R2, -1
SH	R2, 18(SP)
;jsmn.h,347 :: 		}
J	L_jsmn_parse78
NOP	
L_jsmn_parse79:
;jsmn.h,349 :: 		if (i == -1) {
LH	R3, 18(SP)
LUI	R2, 65535
ORI	R2, R2, 65535
BEQ	R3, R2, L__jsmn_parse317
NOP	
J	L_jsmn_parse85
NOP	
L__jsmn_parse317:
; num_tokens end address is: 16 (R4)
; count end address is: 20 (R5)
;jsmn.h,350 :: 		return JSMN_ERROR_INVAL;
ORI	R2, R0, 65534
J	L_end_jsmn_parse
NOP	
;jsmn.h,351 :: 		}
L_jsmn_parse85:
;jsmn.h,352 :: 		for (; i >= 0; i--) {
; count start address is: 20 (R5)
; num_tokens start address is: 16 (R4)
SH	R5, 4(SP)
; count end address is: 20 (R5)
ANDI	R5, R4, 65535
LH	R4, 4(SP)
L_jsmn_parse86:
; num_tokens end address is: 16 (R4)
; count start address is: 16 (R4)
; num_tokens start address is: 20 (R5)
LH	R2, 18(SP)
SLTI	R2, R2, 0
BEQ	R2, R0, L__jsmn_parse318
NOP	
J	L_jsmn_parse87
NOP	
L__jsmn_parse318:
;jsmn.h,353 :: 		token = &tokens[i];
LH	R2, 18(SP)
SLL	R2, R2, 3
ADDU	R2, R28, R2
SW	R2, 20(SP)
;jsmn.h,354 :: 		if (token->start != -1 && token->end == -1) {
ADDIU	R2, R2, 2
LH	R2, 0(R2)
SEH	R3, R2
LUI	R2, 65535
ORI	R2, R2, 65535
BNE	R3, R2, L__jsmn_parse320
NOP	
J	L__jsmn_parse208
NOP	
L__jsmn_parse320:
LW	R2, 20(SP)
ADDIU	R2, R2, 4
LH	R2, 0(R2)
SEH	R3, R2
LUI	R2, 65535
ORI	R2, R2, 65535
BEQ	R3, R2, L__jsmn_parse321
NOP	
J	L__jsmn_parse207
NOP	
L__jsmn_parse321:
L__jsmn_parse202:
;jsmn.h,355 :: 		parser->toksuper = i;
ADDIU	R3, R25, 4
LH	R2, 18(SP)
SH	R2, 0(R3)
;jsmn.h,356 :: 		break;
J	L_jsmn_parse87
NOP	
;jsmn.h,354 :: 		if (token->start != -1 && token->end == -1) {
L__jsmn_parse208:
L__jsmn_parse207:
;jsmn.h,352 :: 		for (; i >= 0; i--) {
LH	R2, 18(SP)
ADDIU	R2, R2, -1
SH	R2, 18(SP)
;jsmn.h,358 :: 		}
J	L_jsmn_parse86
NOP	
L_jsmn_parse87:
;jsmn.h,360 :: 		break;
ANDI	R8, R5, 65535
; num_tokens end address is: 20 (R5)
; count end address is: 16 (R4)
SEH	R7, R4
J	L_jsmn_parse65
NOP	
;jsmn.h,361 :: 		case '\"':
L_jsmn_parse92:
;jsmn.h,362 :: 		r = jsmn_parse_string(parser, js, len, tokens, num_tokens);
; num_tokens start address is: 32 (R8)
; count start address is: 28 (R7)
ANDI	R2, R8, 65535
ADDIU	SP, SP, -4
SW	R2, 0(SP)
JAL	MP3_jsmn_parse_string+0
NOP	
ADDIU	SP, SP, 4
SH	R2, 16(SP)
;jsmn.h,363 :: 		if (r < 0) {
SEH	R2, R2
SLTI	R2, R2, 0
BNE	R2, R0, L__jsmn_parse322
NOP	
J	L_jsmn_parse93
NOP	
L__jsmn_parse322:
; count end address is: 28 (R7)
; num_tokens end address is: 32 (R8)
;jsmn.h,364 :: 		return r;
LH	R2, 16(SP)
J	L_end_jsmn_parse
NOP	
;jsmn.h,365 :: 		}
L_jsmn_parse93:
;jsmn.h,366 :: 		count++;
; num_tokens start address is: 32 (R8)
; count start address is: 28 (R7)
ADDIU	R2, R7, 1
; count end address is: 28 (R7)
; count start address is: 16 (R4)
SEH	R4, R2
;jsmn.h,367 :: 		if (parser->toksuper != -1 && tokens != NULL) {
ADDIU	R2, R25, 4
LH	R2, 0(R2)
SEH	R3, R2
LUI	R2, 65535
ORI	R2, R2, 65535
BNE	R3, R2, L__jsmn_parse324
NOP	
J	L__jsmn_parse210
NOP	
L__jsmn_parse324:
BNE	R28, R0, L__jsmn_parse326
NOP	
J	L__jsmn_parse209
NOP	
L__jsmn_parse326:
L__jsmn_parse201:
;jsmn.h,368 :: 		tokens[parser->toksuper].size++;
ADDIU	R2, R25, 4
LH	R2, 0(R2)
SEH	R2, R2
SLL	R2, R2, 3
ADDU	R2, R28, R2
ADDIU	R3, R2, 6
LH	R2, 0(R3)
ADDIU	R2, R2, 1
SH	R2, 0(R3)
;jsmn.h,367 :: 		if (parser->toksuper != -1 && tokens != NULL) {
L__jsmn_parse210:
L__jsmn_parse209:
;jsmn.h,370 :: 		break;
; count end address is: 16 (R4)
SEH	R7, R4
J	L_jsmn_parse65
NOP	
;jsmn.h,371 :: 		case '\t':
L_jsmn_parse97:
;jsmn.h,372 :: 		case '\r':
; count start address is: 28 (R7)
L_jsmn_parse98:
;jsmn.h,373 :: 		case '\n':
L_jsmn_parse99:
;jsmn.h,374 :: 		case ' ':
L_jsmn_parse100:
;jsmn.h,375 :: 		break;
J	L_jsmn_parse65
NOP	
;jsmn.h,376 :: 		case ':':
L_jsmn_parse101:
;jsmn.h,377 :: 		parser->toksuper = parser->toknext - 1;
ADDIU	R3, R25, 4
ADDIU	R2, R25, 2
LHU	R2, 0(R2)
ADDIU	R2, R2, -1
SH	R2, 0(R3)
;jsmn.h,378 :: 		break;
J	L_jsmn_parse65
NOP	
;jsmn.h,379 :: 		case ',':
L_jsmn_parse102:
;jsmn.h,380 :: 		if (tokens != NULL && parser->toksuper != -1 &&
BNE	R28, R0, L__jsmn_parse328
NOP	
J	L__jsmn_parse225
NOP	
L__jsmn_parse328:
ADDIU	R2, R25, 4
LH	R2, 0(R2)
SEH	R3, R2
LUI	R2, 65535
ORI	R2, R2, 65535
BNE	R3, R2, L__jsmn_parse330
NOP	
J	L__jsmn_parse226
NOP	
L__jsmn_parse330:
;jsmn.h,381 :: 		tokens[parser->toksuper].type != JSMN_ARRAY &&
ADDIU	R2, R25, 4
LH	R2, 0(R2)
SEH	R2, R2
SLL	R2, R2, 3
ADDU	R2, R28, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 2
BNE	R3, R2, L__jsmn_parse332
NOP	
J	L__jsmn_parse227
NOP	
L__jsmn_parse332:
;jsmn.h,382 :: 		tokens[parser->toksuper].type != JSMN_OBJECT) {
ADDIU	R2, R25, 4
LH	R2, 0(R2)
SEH	R2, R2
SLL	R2, R2, 3
ADDU	R2, R28, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 1
BNE	R3, R2, L__jsmn_parse334
NOP	
J	L__jsmn_parse228
NOP	
L__jsmn_parse334:
L__jsmn_parse200:
;jsmn.h,386 :: 		for (i = parser->toknext - 1; i >= 0; i--) {
ADDIU	R2, R25, 2
LHU	R2, 0(R2)
ADDIU	R2, R2, -1
SH	R2, 18(SP)
; count end address is: 28 (R7)
; num_tokens end address is: 32 (R8)
SEH	R5, R7
ANDI	R4, R8, 65535
L_jsmn_parse106:
; num_tokens start address is: 16 (R4)
; count start address is: 20 (R5)
LH	R2, 18(SP)
SLTI	R2, R2, 0
BEQ	R2, R0, L__jsmn_parse335
NOP	
J	L_jsmn_parse107
NOP	
L__jsmn_parse335:
;jsmn.h,387 :: 		if (tokens[i].type == JSMN_ARRAY || tokens[i].type == JSMN_OBJECT) {
LH	R2, 18(SP)
SLL	R2, R2, 3
ADDU	R2, R28, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 2
BNE	R3, R2, L__jsmn_parse337
NOP	
J	L__jsmn_parse212
NOP	
L__jsmn_parse337:
LH	R2, 18(SP)
SLL	R2, R2, 3
ADDU	R2, R28, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 1
BNE	R3, R2, L__jsmn_parse339
NOP	
J	L__jsmn_parse211
NOP	
L__jsmn_parse339:
J	L_jsmn_parse111
NOP	
L__jsmn_parse212:
L__jsmn_parse211:
;jsmn.h,388 :: 		if (tokens[i].start != -1 && tokens[i].end == -1) {
LH	R2, 18(SP)
SLL	R2, R2, 3
ADDU	R2, R28, R2
ADDIU	R2, R2, 2
LH	R2, 0(R2)
SEH	R3, R2
LUI	R2, 65535
ORI	R2, R2, 65535
BNE	R3, R2, L__jsmn_parse341
NOP	
J	L__jsmn_parse214
NOP	
L__jsmn_parse341:
LH	R2, 18(SP)
SLL	R2, R2, 3
ADDU	R2, R28, R2
ADDIU	R2, R2, 4
LH	R2, 0(R2)
SEH	R3, R2
LUI	R2, 65535
ORI	R2, R2, 65535
BEQ	R3, R2, L__jsmn_parse342
NOP	
J	L__jsmn_parse213
NOP	
L__jsmn_parse342:
L__jsmn_parse198:
;jsmn.h,389 :: 		parser->toksuper = i;
ADDIU	R3, R25, 4
LH	R2, 18(SP)
SH	R2, 0(R3)
;jsmn.h,390 :: 		break;
J	L_jsmn_parse107
NOP	
;jsmn.h,388 :: 		if (tokens[i].start != -1 && tokens[i].end == -1) {
L__jsmn_parse214:
L__jsmn_parse213:
;jsmn.h,392 :: 		}
L_jsmn_parse111:
;jsmn.h,386 :: 		for (i = parser->toknext - 1; i >= 0; i--) {
LH	R2, 18(SP)
ADDIU	R2, R2, -1
SH	R2, 18(SP)
;jsmn.h,393 :: 		}
J	L_jsmn_parse106
NOP	
L_jsmn_parse107:
;jsmn.h,380 :: 		if (tokens != NULL && parser->toksuper != -1 &&
SEH	R3, R5
; count end address is: 20 (R5)
ANDI	R2, R4, 65535
J	L__jsmn_parse218
NOP	
; num_tokens end address is: 16 (R4)
L__jsmn_parse225:
ANDI	R2, R8, 65535
SEH	R3, R7
L__jsmn_parse218:
; num_tokens start address is: 8 (R2)
; count start address is: 12 (R3)
; count end address is: 12 (R3)
; num_tokens end address is: 8 (R2)
J	L__jsmn_parse217
NOP	
L__jsmn_parse226:
ANDI	R2, R8, 65535
SEH	R3, R7
L__jsmn_parse217:
;jsmn.h,381 :: 		tokens[parser->toksuper].type != JSMN_ARRAY &&
; num_tokens start address is: 8 (R2)
; count start address is: 12 (R3)
; count end address is: 12 (R3)
; num_tokens end address is: 8 (R2)
J	L__jsmn_parse216
NOP	
L__jsmn_parse227:
ANDI	R2, R8, 65535
SEH	R3, R7
L__jsmn_parse216:
;jsmn.h,382 :: 		tokens[parser->toksuper].type != JSMN_OBJECT) {
; num_tokens start address is: 8 (R2)
; count start address is: 12 (R3)
SEH	R7, R3
; count end address is: 12 (R3)
; num_tokens end address is: 8 (R2)
J	L__jsmn_parse215
NOP	
L__jsmn_parse228:
ANDI	R2, R8, 65535
L__jsmn_parse215:
;jsmn.h,396 :: 		break;
; num_tokens start address is: 8 (R2)
; count start address is: 28 (R7)
ANDI	R8, R2, 65535
; num_tokens end address is: 8 (R2)
J	L_jsmn_parse65
NOP	
;jsmn.h,423 :: 		default:
L_jsmn_parse115:
;jsmn.h,425 :: 		r = jsmn_parse_primitive(parser, js, len, tokens, num_tokens);
; num_tokens start address is: 32 (R8)
ANDI	R2, R8, 65535
ADDIU	SP, SP, -4
SW	R2, 0(SP)
JAL	MP3_jsmn_parse_primitive+0
NOP	
ADDIU	SP, SP, 4
SH	R2, 16(SP)
;jsmn.h,426 :: 		if (r < 0) {
SEH	R2, R2
SLTI	R2, R2, 0
BNE	R2, R0, L__jsmn_parse343
NOP	
J	L_jsmn_parse116
NOP	
L__jsmn_parse343:
; count end address is: 28 (R7)
; num_tokens end address is: 32 (R8)
;jsmn.h,427 :: 		return r;
LH	R2, 16(SP)
J	L_end_jsmn_parse
NOP	
;jsmn.h,428 :: 		}
L_jsmn_parse116:
;jsmn.h,429 :: 		count++;
; num_tokens start address is: 32 (R8)
; count start address is: 28 (R7)
ADDIU	R2, R7, 1
; count end address is: 28 (R7)
; count start address is: 16 (R4)
SEH	R4, R2
;jsmn.h,430 :: 		if (parser->toksuper != -1 && tokens != NULL) {
ADDIU	R2, R25, 4
LH	R2, 0(R2)
SEH	R3, R2
LUI	R2, 65535
ORI	R2, R2, 65535
BNE	R3, R2, L__jsmn_parse345
NOP	
J	L__jsmn_parse220
NOP	
L__jsmn_parse345:
BNE	R28, R0, L__jsmn_parse347
NOP	
J	L__jsmn_parse219
NOP	
L__jsmn_parse347:
L__jsmn_parse197:
;jsmn.h,431 :: 		tokens[parser->toksuper].size++;
ADDIU	R2, R25, 4
LH	R2, 0(R2)
SEH	R2, R2
SLL	R2, R2, 3
ADDU	R2, R28, R2
ADDIU	R3, R2, 6
LH	R2, 0(R3)
ADDIU	R2, R2, 1
SH	R2, 0(R3)
;jsmn.h,430 :: 		if (parser->toksuper != -1 && tokens != NULL) {
L__jsmn_parse220:
L__jsmn_parse219:
;jsmn.h,433 :: 		break;
; count end address is: 16 (R4)
SEH	R7, R4
J	L_jsmn_parse65
NOP	
;jsmn.h,440 :: 		}
L_jsmn_parse64:
; count start address is: 28 (R7)
; c start address is: 24 (R6)
ANDI	R3, R6, 255
ORI	R2, R0, 123
BNE	R3, R2, L__jsmn_parse349
NOP	
J	L_jsmn_parse66
NOP	
L__jsmn_parse349:
ANDI	R3, R6, 255
ORI	R2, R0, 91
BNE	R3, R2, L__jsmn_parse351
NOP	
J	L_jsmn_parse67
NOP	
L__jsmn_parse351:
ANDI	R3, R6, 255
ORI	R2, R0, 125
BNE	R3, R2, L__jsmn_parse353
NOP	
J	L_jsmn_parse73
NOP	
L__jsmn_parse353:
ANDI	R3, R6, 255
ORI	R2, R0, 93
BNE	R3, R2, L__jsmn_parse355
NOP	
J	L_jsmn_parse74
NOP	
L__jsmn_parse355:
ANDI	R3, R6, 255
ORI	R2, R0, 34
BNE	R3, R2, L__jsmn_parse357
NOP	
J	L_jsmn_parse92
NOP	
L__jsmn_parse357:
ANDI	R3, R6, 255
ORI	R2, R0, 9
BNE	R3, R2, L__jsmn_parse359
NOP	
J	L_jsmn_parse97
NOP	
L__jsmn_parse359:
ANDI	R3, R6, 255
ORI	R2, R0, 13
BNE	R3, R2, L__jsmn_parse361
NOP	
J	L_jsmn_parse98
NOP	
L__jsmn_parse361:
ANDI	R3, R6, 255
ORI	R2, R0, 10
BNE	R3, R2, L__jsmn_parse363
NOP	
J	L_jsmn_parse99
NOP	
L__jsmn_parse363:
ANDI	R3, R6, 255
ORI	R2, R0, 32
BNE	R3, R2, L__jsmn_parse365
NOP	
J	L_jsmn_parse100
NOP	
L__jsmn_parse365:
ANDI	R3, R6, 255
ORI	R2, R0, 58
BNE	R3, R2, L__jsmn_parse367
NOP	
J	L_jsmn_parse101
NOP	
L__jsmn_parse367:
ANDI	R3, R6, 255
; c end address is: 24 (R6)
ORI	R2, R0, 44
BNE	R3, R2, L__jsmn_parse369
NOP	
J	L_jsmn_parse102
NOP	
L__jsmn_parse369:
J	L_jsmn_parse115
NOP	
; count end address is: 28 (R7)
; num_tokens end address is: 32 (R8)
L_jsmn_parse65:
;jsmn.h,275 :: 		for (; parser->pos < len && js[parser->pos] != '\0'; parser->pos++) {
; count start address is: 28 (R7)
; num_tokens start address is: 32 (R8)
LHU	R2, 0(R25)
ADDIU	R2, R2, 1
SH	R2, 0(R25)
;jsmn.h,441 :: 		}
; num_tokens end address is: 32 (R8)
J	L_jsmn_parse59
NOP	
;jsmn.h,275 :: 		for (; parser->pos < len && js[parser->pos] != '\0'; parser->pos++) {
L__jsmn_parse222:
L__jsmn_parse221:
;jsmn.h,443 :: 		if (tokens != NULL) {
BNE	R28, R0, L__jsmn_parse371
NOP	
J	L__jsmn_parse229
NOP	
L__jsmn_parse371:
;jsmn.h,444 :: 		for (i = parser->toknext - 1; i >= 0; i--) {
ADDIU	R2, R25, 2
LHU	R2, 0(R2)
ADDIU	R2, R2, -1
SH	R2, 18(SP)
; count end address is: 28 (R7)
SEH	R4, R7
L_jsmn_parse121:
; count start address is: 16 (R4)
LH	R2, 18(SP)
SLTI	R2, R2, 0
BEQ	R2, R0, L__jsmn_parse372
NOP	
J	L_jsmn_parse122
NOP	
L__jsmn_parse372:
;jsmn.h,446 :: 		if (tokens[i].start != -1 && tokens[i].end == -1) {
LH	R2, 18(SP)
SLL	R2, R2, 3
ADDU	R2, R28, R2
ADDIU	R2, R2, 2
LH	R2, 0(R2)
SEH	R3, R2
LUI	R2, 65535
ORI	R2, R2, 65535
BNE	R3, R2, L__jsmn_parse374
NOP	
J	L__jsmn_parse224
NOP	
L__jsmn_parse374:
LH	R2, 18(SP)
SLL	R2, R2, 3
ADDU	R2, R28, R2
ADDIU	R2, R2, 4
LH	R2, 0(R2)
SEH	R3, R2
LUI	R2, 65535
ORI	R2, R2, 65535
BEQ	R3, R2, L__jsmn_parse375
NOP	
J	L__jsmn_parse223
NOP	
L__jsmn_parse375:
; count end address is: 16 (R4)
L__jsmn_parse196:
;jsmn.h,447 :: 		return JSMN_ERROR_PART;
ORI	R2, R0, 65533
J	L_end_jsmn_parse
NOP	
;jsmn.h,446 :: 		if (tokens[i].start != -1 && tokens[i].end == -1) {
L__jsmn_parse224:
; count start address is: 16 (R4)
L__jsmn_parse223:
;jsmn.h,444 :: 		for (i = parser->toknext - 1; i >= 0; i--) {
LH	R2, 18(SP)
ADDIU	R2, R2, -1
SH	R2, 18(SP)
;jsmn.h,449 :: 		}
J	L_jsmn_parse121
NOP	
L_jsmn_parse122:
;jsmn.h,450 :: 		}
SEH	R2, R4
J	L_jsmn_parse120
NOP	
; count end address is: 16 (R4)
L__jsmn_parse229:
;jsmn.h,443 :: 		if (tokens != NULL) {
SEH	R2, R7
;jsmn.h,450 :: 		}
L_jsmn_parse120:
;jsmn.h,452 :: 		return count;
; count start address is: 8 (R2)
; count end address is: 8 (R2)
;jsmn.h,453 :: 		}
L_end_jsmn_parse:
LW	RA, 0(SP)
ADDIU	SP, SP, 24
JR	RA
NOP	
; end of _jsmn_parse
_jsmn_init:
;jsmn.h,459 :: 		JSMN_API void jsmn_init(jsmn_parser *parser) {
;jsmn.h,460 :: 		parser->pos = 0;
SH	R0, 0(R25)
;jsmn.h,461 :: 		parser->toknext = 0;
ADDIU	R2, R25, 2
SH	R0, 0(R2)
;jsmn.h,462 :: 		parser->toksuper = -1;
ADDIU	R3, R25, 4
ORI	R2, R0, 65535
SH	R2, 0(R3)
;jsmn.h,463 :: 		}
L_end_jsmn_init:
JR	RA
NOP	
; end of _jsmn_init
_Init:
;MP3.c,72 :: 		void Init() {
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;MP3.c,73 :: 		AD1PCFG = 0xFFFF;            // Configure AN pins as digital I/O
SW	R25, 4(SP)
SW	R26, 8(SP)
ORI	R2, R0, 65535
SW	R2, Offset(AD1PCFG+0)(GP)
;MP3.c,74 :: 		JTAGEN_bit = 0;              // Disable JTAG
_LX	
INS	R2, R0, BitPos(JTAGEN_bit+0), 1
_SX	
;MP3.c,75 :: 		TFT_BLED_Direction = 0;      // Set TFT backlight pin as output
LUI	R2, BitMask(TRISD2_bit+0)
ORI	R2, R2, BitMask(TRISD2_bit+0)
_SX	
;MP3.c,76 :: 		TFT_Init_ILI9341_8bit(320, 240);// Initialize TFT display
ORI	R26, R0, 240
ORI	R25, R0, 320
JAL	_TFT_Init_ILI9341_8bit+0
NOP	
;MP3.c,77 :: 		TFT_BLED = 1;                // Turn on TFT backlight
LUI	R2, BitMask(LATD2_bit+0)
ORI	R2, R2, BitMask(LATD2_bit+0)
_SX	
;MP3.c,78 :: 		Init_Ext_Mem();
JAL	_Init_Ext_Mem+0
NOP	
;MP3.c,79 :: 		}
L_end_Init:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _Init
_DrawFrame:
;MP3.c,82 :: 		void DrawFrame(){
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;MP3.c,83 :: 		TFT_Fill_Screen(CL_WHITE);
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
SW	R28, 16(SP)
ORI	R25, R0, 65535
JAL	_TFT_Fill_Screen+0
NOP	
;MP3.c,84 :: 		TFT_Set_Pen(CL_BLACK, 1);
ORI	R26, R0, 1
MOVZ	R25, R0, R0
JAL	_TFT_Set_Pen+0
NOP	
;MP3.c,85 :: 		TFT_Line(20, 220, 300, 220);
ORI	R28, R0, 220
ORI	R27, R0, 300
ORI	R26, R0, 220
ORI	R25, R0, 20
JAL	_TFT_Line+0
NOP	
;MP3.c,86 :: 		TFT_Line(20,  46, 300,  46);
ORI	R28, R0, 46
ORI	R27, R0, 300
ORI	R26, R0, 46
ORI	R25, R0, 20
JAL	_TFT_Line+0
NOP	
;MP3.c,87 :: 		TFT_Set_Font(&HandelGothic_BT21x22_Regular, CL_RED, FO_HORIZONTAL);
MOVZ	R27, R0, R0
ORI	R26, R0, 63488
LUI	R25, hi_addr(_HandelGothic_BT21x22_Regular+0)
ORI	R25, R25, lo_addr(_HandelGothic_BT21x22_Regular+0)
JAL	_TFT_Set_Font+0
NOP	
;MP3.c,88 :: 		TFT_Write_Text("FAT-32  Audio  MP3  Test", 45, 14);
ORI	R27, R0, 14
ORI	R26, R0, 45
LUI	R25, hi_addr(?lstr2_MP3+0)
ORI	R25, R25, lo_addr(?lstr2_MP3+0)
JAL	_TFT_Write_Text+0
NOP	
;MP3.c,89 :: 		TFT_Set_Font(&Verdana12x13_Regular, CL_BLACK, FO_HORIZONTAL);
MOVZ	R27, R0, R0
MOVZ	R26, R0, R0
LUI	R25, hi_addr(_Verdana12x13_Regular+0)
ORI	R25, R25, lo_addr(_Verdana12x13_Regular+0)
JAL	_TFT_Set_Font+0
NOP	
;MP3.c,90 :: 		TFT_Write_Text("EasyPIC Fusion v7", 19, 223);
ORI	R27, R0, 223
ORI	R26, R0, 19
LUI	R25, hi_addr(?lstr3_MP3+0)
ORI	R25, R25, lo_addr(?lstr3_MP3+0)
JAL	_TFT_Write_Text+0
NOP	
;MP3.c,91 :: 		TFT_Set_Font(&Verdana12x13_Regular, CL_RED, FO_HORIZONTAL);
MOVZ	R27, R0, R0
ORI	R26, R0, 63488
LUI	R25, hi_addr(_Verdana12x13_Regular+0)
ORI	R25, R25, lo_addr(_Verdana12x13_Regular+0)
JAL	_TFT_Set_Font+0
NOP	
;MP3.c,92 :: 		TFT_Write_Text("Mark  Joyce", 232, 223);
ORI	R27, R0, 223
ORI	R26, R0, 232
LUI	R25, hi_addr(?lstr4_MP3+0)
ORI	R25, R25, lo_addr(?lstr4_MP3+0)
JAL	_TFT_Write_Text+0
NOP	
;MP3.c,93 :: 		TFT_Set_Font(&TFT_defaultFont, CL_BLACK, FO_HORIZONTAL);
MOVZ	R27, R0, R0
MOVZ	R26, R0, R0
LUI	R25, hi_addr(_TFT_defaultFont+0)
ORI	R25, R25, lo_addr(_TFT_defaultFont+0)
JAL	_TFT_Set_Font+0
NOP	
;MP3.c,94 :: 		}
L_end_DrawFrame:
LW	R28, 16(SP)
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _DrawFrame
_printItPlay:
;MP3.c,96 :: 		void printItPlay(char *infname)
ADDIU	SP, SP, -28
SW	RA, 0(SP)
;MP3.c,98 :: 		char txt[] = "Playing:";
SW	R26, 4(SP)
SW	R27, 8(SP)
ADDIU	R23, SP, 16
ADDIU	R22, R23, 9
LUI	R24, hi_addr(?ICSprintItPlay_txt_L0+0)
ORI	R24, R24, lo_addr(?ICSprintItPlay_txt_L0+0)
JAL	___CC2DW+0
NOP	
;MP3.c,99 :: 		TFT_Set_Font(TFT_defaultFont, CL_BLACK, FO_HORIZONTAL);
SW	R25, 12(SP)
MOVZ	R27, R0, R0
MOVZ	R26, R0, R0
LUI	R25, hi_addr(_TFT_defaultFont+0)
ORI	R25, R25, lo_addr(_TFT_defaultFont+0)
JAL	_TFT_Set_Font+0
NOP	
;MP3.c,100 :: 		TFT_Write_Text(txt, 20, 50);
ADDIU	R2, SP, 16
ORI	R27, R0, 50
ORI	R26, R0, 20
MOVZ	R25, R2, R0
JAL	_TFT_Write_Text+0
NOP	
LW	R25, 12(SP)
;MP3.c,101 :: 		TFT_Write_Text(infname, 20, 70);
ORI	R27, R0, 70
ORI	R26, R0, 20
JAL	_TFT_Write_Text+0
NOP	
;MP3.c,102 :: 		}
L_end_printItPlay:
LW	R27, 8(SP)
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 28
JR	RA
NOP	
; end of _printItPlay
_printItEnd:
;MP3.c,104 :: 		void printItEnd(char *infname)
ADDIU	SP, SP, -32
SW	RA, 0(SP)
;MP3.c,106 :: 		char txt[] = "Playing:";
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
ADDIU	R23, SP, 20
ADDIU	R22, R23, 9
LUI	R24, hi_addr(?ICSprintItEnd_txt_L0+0)
ORI	R24, R24, lo_addr(?ICSprintItEnd_txt_L0+0)
JAL	___CC2DW+0
NOP	
;MP3.c,107 :: 		TFT_Set_Font(TFT_defaultFont, CL_WHITE, FO_HORIZONTAL);
SW	R25, 16(SP)
MOVZ	R27, R0, R0
ORI	R26, R0, 65535
LUI	R25, hi_addr(_TFT_defaultFont+0)
ORI	R25, R25, lo_addr(_TFT_defaultFont+0)
JAL	_TFT_Set_Font+0
NOP	
;MP3.c,108 :: 		TFT_Write_Text(txt, 20, 50);
ADDIU	R2, SP, 20
ORI	R27, R0, 50
ORI	R26, R0, 20
MOVZ	R25, R2, R0
JAL	_TFT_Write_Text+0
NOP	
LW	R25, 16(SP)
;MP3.c,109 :: 		TFT_Write_Text(infname, 20, 70);
ORI	R27, R0, 70
ORI	R26, R0, 20
JAL	_TFT_Write_Text+0
NOP	
;MP3.c,110 :: 		TFT_Write_Text("END", 20, 70);
ORI	R27, R0, 70
ORI	R26, R0, 20
LUI	R25, hi_addr(?lstr5_MP3+0)
ORI	R25, R25, lo_addr(?lstr5_MP3+0)
JAL	_TFT_Write_Text+0
NOP	
;MP3.c,111 :: 		}
L_end_printItEnd:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 32
JR	RA
NOP	
; end of _printItEnd
_play:
;MP3.c,113 :: 		void play(char *infname)
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;MP3.c,116 :: 		MP3_Play(infname);
JAL	_MP3_Play+0
NOP	
;MP3.c,118 :: 		}
L_end_play:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _play
MP3_jsoneq:
;MP3.c,121 :: 		static int jsoneq(const char *json, jsmntok_t *tok, const char *s) {
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;MP3.c,122 :: 		if (tok->type == JSMN_STRING && (int)strlen(s) == tok->end - tok->start &&
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
LBU	R2, 0(R26)
ANDI	R3, R2, 255
ORI	R2, R0, 3
BEQ	R3, R2, L_MP3_jsoneq383
NOP	
J	L_MP3_jsoneq233
NOP	
L_MP3_jsoneq383:
SW	R25, 16(SP)
MOVZ	R25, R27, R0
JAL	_strlen+0
NOP	
LW	R25, 16(SP)
ADDIU	R5, R26, 4
ADDIU	R3, R26, 2
LH	R4, 0(R3)
LH	R3, 0(R5)
SUBU	R4, R3, R4
SEH	R3, R2
SEH	R2, R4
BEQ	R3, R2, L_MP3_jsoneq384
NOP	
J	L_MP3_jsoneq232
NOP	
L_MP3_jsoneq384:
;MP3.c,123 :: 		strncmp(json + tok->start, s, tok->end - tok->start) == 0) {
ADDIU	R2, R26, 4
LH	R3, 0(R2)
ADDIU	R2, R26, 2
LH	R2, 0(R2)
SUBU	R3, R3, R2
SEH	R2, R2
ADDU	R2, R25, R2
MOVZ	R26, R27, R0
ANDI	R27, R3, 255
MOVZ	R25, R2, R0
JAL	_strncmp+0
NOP	
SEH	R2, R2
BEQ	R2, R0, L_MP3_jsoneq385
NOP	
J	L_MP3_jsoneq231
NOP	
L_MP3_jsoneq385:
L_MP3_jsoneq230:
;MP3.c,124 :: 		return 0;
MOVZ	R2, R0, R0
J	L_end_jsoneq
NOP	
;MP3.c,122 :: 		if (tok->type == JSMN_STRING && (int)strlen(s) == tok->end - tok->start &&
L_MP3_jsoneq233:
L_MP3_jsoneq232:
;MP3.c,123 :: 		strncmp(json + tok->start, s, tok->end - tok->start) == 0) {
L_MP3_jsoneq231:
;MP3.c,126 :: 		return -1;
ORI	R2, R0, 65535
;MP3.c,127 :: 		}
;MP3.c,126 :: 		return -1;
;MP3.c,127 :: 		}
L_end_jsoneq:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of MP3_jsoneq
_checkForFAT:
;MP3.c,129 :: 		void checkForFAT()
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;MP3.c,132 :: 		err = FAT32_Init(); // Start SD Card ~ FAT32
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
JAL	_FAT32_Init+0
NOP	
; err start address is: 20 (R5)
SEB	R5, R2
;MP3.c,133 :: 		if (err < 0)        //  If Error - No SD card or imcompatable/wrong format inserted.
SEH	R2, R5
SLTI	R2, R2, 0
BNE	R2, R0, L__checkForFAT387
NOP	
J	L_checkForFAT130
NOP	
L__checkForFAT387:
;MP3.c,135 :: 		TFT_Set_Font(TFT_defaultFont, CL_RED, FO_HORIZONTAL);
MOVZ	R27, R0, R0
ORI	R26, R0, 63488
LUI	R25, hi_addr(_TFT_defaultFont+0)
ORI	R25, R25, lo_addr(_TFT_defaultFont+0)
JAL	_TFT_Set_Font+0
NOP	
;MP3.c,136 :: 		TFT_Write_Text("Please  Insert  SD  Card!", 80, 50);
SH	R5, 16(SP)
ORI	R27, R0, 50
ORI	R26, R0, 80
LUI	R25, hi_addr(?lstr6_MP3+0)
ORI	R25, R25, lo_addr(?lstr6_MP3+0)
JAL	_TFT_Write_Text+0
NOP	
; err end address is: 20 (R5)
LH	R5, 16(SP)
SEH	R3, R5
;MP3.c,138 :: 		while(err < 0)  //  If ERROR ...retry each second
L_checkForFAT131:
; err start address is: 12 (R3)
SEH	R2, R3
; err end address is: 12 (R3)
SLTI	R2, R2, 0
BNE	R2, R0, L__checkForFAT388
NOP	
J	L_checkForFAT132
NOP	
L__checkForFAT388:
;MP3.c,140 :: 		err = FAT32_Init();
JAL	_FAT32_Init+0
NOP	
; err start address is: 12 (R3)
SEB	R3, R2
;MP3.c,141 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_checkForFAT133:
ADDIU	R24, R24, -1
BNE	R24, R0, L_checkForFAT133
NOP	
;MP3.c,142 :: 		}
; err end address is: 12 (R3)
J	L_checkForFAT131
NOP	
L_checkForFAT132:
;MP3.c,143 :: 		TFT_Set_Font(TFT_defaultFont, CL_WHITE, FO_HORIZONTAL);
MOVZ	R27, R0, R0
ORI	R26, R0, 65535
LUI	R25, hi_addr(_TFT_defaultFont+0)
ORI	R25, R25, lo_addr(_TFT_defaultFont+0)
JAL	_TFT_Set_Font+0
NOP	
;MP3.c,144 :: 		TFT_Write_Text("Please  Insert  SD  Card!", 80, 50);
ORI	R27, R0, 50
ORI	R26, R0, 80
LUI	R25, hi_addr(?lstr7_MP3+0)
ORI	R25, R25, lo_addr(?lstr7_MP3+0)
JAL	_TFT_Write_Text+0
NOP	
;MP3.c,145 :: 		}
L_checkForFAT130:
;MP3.c,147 :: 		}
L_end_checkForFAT:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _checkForFAT
_getFileData:
;MP3.c,149 :: 		void getFileData(char *fileData, char *rfName)
ADDIU	SP, SP, -32
SW	RA, 0(SP)
;MP3.c,153 :: 		rfHandle = FAT32_Open(rfName, FILE_READ);
SW	R26, 4(SP)
SW	R27, 8(SP)
SW	R26, 12(SP)
SW	R25, 16(SP)
MOVZ	R25, R26, R0
ORI	R26, R0, 1
JAL	_FAT32_Open+0
NOP	
LW	R25, 16(SP)
LW	R26, 12(SP)
SB	R2, 20(SP)
;MP3.c,154 :: 		FAT32_Size(rfName, &fsize);
ADDIU	R2, SP, 28
SW	R25, 12(SP)
MOVZ	R25, R26, R0
MOVZ	R26, R2, R0
JAL	_FAT32_Size+0
NOP	
LW	R25, 12(SP)
;MP3.c,156 :: 		for (i = 0; i < fsize; i++)
SW	R0, 24(SP)
L_getFileData135:
LW	R3, 28(SP)
LW	R2, 24(SP)
SLTU	R2, R2, R3
BNE	R2, R0, L__getFileData390
NOP	
J	L_getFileData136
NOP	
L__getFileData390:
;MP3.c,158 :: 		FAT32_Read(rfHandle, fileData, 100);
SW	R26, 12(SP)
SW	R25, 16(SP)
ORI	R27, R0, 100
MOVZ	R26, R25, R0
LB	R25, 20(SP)
JAL	_FAT32_Read+0
NOP	
LW	R25, 16(SP)
LW	R26, 12(SP)
;MP3.c,156 :: 		for (i = 0; i < fsize; i++)
LW	R2, 24(SP)
ADDIU	R2, R2, 1
SW	R2, 24(SP)
;MP3.c,160 :: 		}
J	L_getFileData135
NOP	
L_getFileData136:
;MP3.c,161 :: 		}
L_end_getFileData:
LW	R27, 8(SP)
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 32
JR	RA
NOP	
; end of _getFileData
_writeFile:
;MP3.c,163 :: 		void writeFile(char *fileData, char *rfName)
ADDIU	SP, SP, -24
SW	RA, 0(SP)
;MP3.c,168 :: 		rfHandle = FAT32_Open(rfName, FILE_WRITE);
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
SW	R25, 16(SP)
MOVZ	R25, R26, R0
ORI	R26, R0, 2
JAL	_FAT32_Open+0
NOP	
LW	R25, 16(SP)
SB	R2, 20(SP)
;MP3.c,169 :: 		size = strlen(fileData);
JAL	_strlen+0
NOP	
; size start address is: 8 (R2)
SEH	R2, R2
;MP3.c,170 :: 		FAT32_Write(rfHandle, fileData, size);
MOVZ	R27, R2, R0
; size end address is: 8 (R2)
MOVZ	R26, R25, R0
LB	R25, 20(SP)
JAL	_FAT32_Write+0
NOP	
;MP3.c,171 :: 		FAT32_Close(rfHandle);
LB	R25, 20(SP)
JAL	_FAT32_Close+0
NOP	
;MP3.c,173 :: 		}
L_end_writeFile:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 24
JR	RA
NOP	
; end of _writeFile
_TerminateString:
;MP3.c,175 :: 		void TerminateString(char *notTerminated, char terminator, char *buf)
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;MP3.c,180 :: 		size = strlen(notTerminated);
JAL	_strlen+0
NOP	
; size start address is: 16 (R4)
SEH	R4, R2
;MP3.c,181 :: 		for (i = 0; i < size; i++) // Correct char array by adding terminating char /0
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; size end address is: 16 (R4)
; i end address is: 20 (R5)
L_TerminateString138:
; i start address is: 20 (R5)
; size start address is: 16 (R4)
SLT	R2, R5, R4
BNE	R2, R0, L__TerminateString393
NOP	
J	L_TerminateString139
NOP	
L__TerminateString393:
;MP3.c,183 :: 		buf[i] = notTerminated[i];
ADDU	R3, R27, R5
ADDU	R2, R25, R5
LBU	R2, 0(R2)
SB	R2, 0(R3)
;MP3.c,184 :: 		if(buf[i] == terminator)
ADDU	R2, R27, R5
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ANDI	R2, R26, 255
BEQ	R3, R2, L__TerminateString394
NOP	
J	L_TerminateString141
NOP	
L__TerminateString394:
; size end address is: 16 (R4)
;MP3.c,186 :: 		buf[i + 1] = 0;
ADDIU	R2, R5, 1
; i end address is: 20 (R5)
ADDU	R2, R27, R2
SB	R0, 0(R2)
;MP3.c,187 :: 		break;
J	L_TerminateString139
NOP	
;MP3.c,188 :: 		}
L_TerminateString141:
;MP3.c,181 :: 		for (i = 0; i < size; i++) // Correct char array by adding terminating char /0
; i start address is: 20 (R5)
; size start address is: 16 (R4)
ADDIU	R2, R5, 1
MOVZ	R5, R2, R0
;MP3.c,189 :: 		}
; size end address is: 16 (R4)
; i end address is: 20 (R5)
J	L_TerminateString138
NOP	
L_TerminateString139:
;MP3.c,190 :: 		}
L_end_TerminateString:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _TerminateString
_runParser:
;MP3.c,192 :: 		void runParser(char *JSONstring, char *key, int get)
ADDIU	SP, SP, -1064
SW	RA, 0(SP)
;MP3.c,198 :: 		int success = 0;
SW	R28, 4(SP)
MOVZ	R30, R0, R0
SH	R30, 1052(SP)
;MP3.c,202 :: 		jsmn_init(&p);
ADDIU	R2, SP, 22
SH	R27, 8(SP)
SW	R26, 12(SP)
SW	R25, 16(SP)
MOVZ	R25, R2, R0
JAL	_jsmn_init+0
NOP	
LW	R25, 16(SP)
LW	R26, 12(SP)
LH	R27, 8(SP)
;MP3.c,205 :: 		r = jsmn_parse(&p, JSONstring, strlen(JSONstring), t, sizeof(t) / sizeof(t[0]));
ADDIU	R2, SP, 28
SW	R2, 1060(SP)
JAL	_strlen+0
NOP	
ADDIU	R4, SP, 22
LW	R3, 1060(SP)
SH	R27, 8(SP)
SW	R26, 12(SP)
SW	R25, 16(SP)
MOVZ	R28, R3, R0
SEH	R27, R2
MOVZ	R26, R25, R0
MOVZ	R25, R4, R0
ORI	R2, R0, 128
ADDIU	SP, SP, -4
SH	R2, 0(SP)
JAL	_jsmn_parse+0
NOP	
ADDIU	SP, SP, 4
LW	R25, 16(SP)
LW	R26, 12(SP)
LH	R27, 8(SP)
SH	R2, 20(SP)
;MP3.c,207 :: 		if (r < 0)
SEH	R2, R2
SLTI	R2, R2, 0
BNE	R2, R0, L__runParser396
NOP	
J	L_runParser142
NOP	
L__runParser396:
;MP3.c,209 :: 		TFT_Write_Text("Failed to parse JSON",0,50);
SH	R27, 8(SP)
SW	R26, 12(SP)
SW	R25, 16(SP)
ORI	R27, R0, 50
MOVZ	R26, R0, R0
LUI	R25, hi_addr(?lstr8_MP3+0)
ORI	R25, R25, lo_addr(?lstr8_MP3+0)
JAL	_TFT_Write_Text+0
NOP	
LW	R25, 16(SP)
LW	R26, 12(SP)
LH	R27, 8(SP)
;MP3.c,210 :: 		}
J	L_runParser143
NOP	
L_runParser142:
;MP3.c,213 :: 		TFT_Write_Text("All cool Bra ",0,50);
SH	R27, 8(SP)
SW	R26, 12(SP)
SW	R25, 16(SP)
ORI	R27, R0, 50
MOVZ	R26, R0, R0
LUI	R25, hi_addr(?lstr9_MP3+0)
ORI	R25, R25, lo_addr(?lstr9_MP3+0)
JAL	_TFT_Write_Text+0
NOP	
LW	R25, 16(SP)
LW	R26, 12(SP)
LH	R27, 8(SP)
;MP3.c,214 :: 		}
L_runParser143:
;MP3.c,216 :: 		for (i = 1; i < r; i++) {
; i start address is: 24 (R6)
ORI	R6, R0, 1
; i end address is: 24 (R6)
SEH	R24, R6
L_runParser144:
; i start address is: 96 (R24)
SEH	R3, R24
LH	R2, 20(SP)
SLT	R2, R3, R2
BNE	R2, R0, L__runParser397
NOP	
J	L_runParser145
NOP	
L__runParser397:
;MP3.c,218 :: 		if (jsoneq(JSONstring, &t[i], key) == 0)
ADDIU	R3, SP, 28
SEH	R2, R24
SLL	R2, R2, 3
ADDU	R2, R3, R2
SH	R27, 8(SP)
SW	R26, 12(SP)
SW	R25, 16(SP)
MOVZ	R27, R26, R0
MOVZ	R26, R2, R0
JAL	MP3_jsoneq+0
NOP	
LW	R25, 16(SP)
LW	R26, 12(SP)
LH	R27, 8(SP)
SEH	R2, R2
BEQ	R2, R0, L__runParser398
NOP	
J	L__runParser234
NOP	
L__runParser398:
;MP3.c,220 :: 		for (j = 0; j < t[i + 1].size; j++)
; j start address is: 88 (R22)
MOVZ	R22, R0, R0
; i end address is: 96 (R24)
; j end address is: 88 (R22)
SEH	R21, R22
L_runParser148:
; j start address is: 84 (R21)
; i start address is: 96 (R24)
ADDIU	R2, R24, 1
ADDIU	R3, SP, 28
SEH	R2, R2
SLL	R2, R2, 3
ADDU	R2, R3, R2
ADDIU	R2, R2, 6
LH	R2, 0(R2)
SEH	R3, R21
SEH	R2, R2
SLT	R2, R3, R2
BNE	R2, R0, L__runParser399
NOP	
J	L_runParser149
NOP	
L__runParser399:
;MP3.c,222 :: 		jsmntok_t *g = &t[i + j + 2];
ADDU	R2, R24, R21
ADDIU	R2, R2, 2
ADDIU	R3, SP, 28
SEH	R2, R2
SLL	R2, R2, 3
ADDU	R5, R3, R2
;MP3.c,225 :: 		sprintf(buffer, "%.*s\n", g->end - g->start, JSONstring + g->start);
ADDIU	R2, R5, 2
LH	R4, 0(R2)
SEH	R2, R4
ADDU	R3, R25, R2
ADDIU	R2, R5, 4
LH	R2, 0(R2)
SUBU	R2, R2, R4
SW	R26, 8(SP)
SW	R25, 12(SP)
ADDIU	SP, SP, -16
SW	R3, 12(SP)
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_10_MP3+0)
ORI	R2, R2, lo_addr(?lstr_10_MP3+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_buffer+0)
ORI	R2, R2, lo_addr(_buffer+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 16
LW	R25, 12(SP)
LW	R26, 8(SP)
;MP3.c,227 :: 		if(j == get)
SEH	R3, R21
SEH	R2, R27
BEQ	R3, R2, L__runParser400
NOP	
J	L_runParser151
NOP	
L__runParser400:
; j end address is: 84 (R21)
;MP3.c,230 :: 		break;
J	L_runParser149
NOP	
;MP3.c,231 :: 		}
L_runParser151:
;MP3.c,220 :: 		for (j = 0; j < t[i + 1].size; j++)
; j start address is: 84 (R21)
ADDIU	R2, R21, 1
; j end address is: 84 (R21)
; j start address is: 88 (R22)
SEH	R22, R2
;MP3.c,232 :: 		}
; j end address is: 88 (R22)
SEH	R21, R22
J	L_runParser148
NOP	
L_runParser149:
;MP3.c,233 :: 		if (success == 1)
LH	R3, 1052(SP)
ORI	R2, R0, 1
BEQ	R3, R2, L__runParser401
NOP	
J	L_runParser152
NOP	
L__runParser401:
;MP3.c,236 :: 		}
L_runParser152:
;MP3.c,237 :: 		i += t[i + 1].size + 1;
ADDIU	R2, R24, 1
ADDIU	R3, SP, 28
SEH	R2, R2
SLL	R2, R2, 3
ADDU	R2, R3, R2
ADDIU	R2, R2, 6
LH	R2, 0(R2)
ADDIU	R2, R2, 1
ADDU	R2, R24, R2
; i end address is: 96 (R24)
; i start address is: 12 (R3)
SEH	R3, R2
; i end address is: 12 (R3)
;MP3.c,238 :: 		}
J	L_runParser147
NOP	
L__runParser234:
;MP3.c,218 :: 		if (jsoneq(JSONstring, &t[i], key) == 0)
SEH	R3, R24
;MP3.c,238 :: 		}
L_runParser147:
;MP3.c,216 :: 		for (i = 1; i < r; i++) {
; i start address is: 12 (R3)
ADDIU	R2, R3, 1
; i end address is: 12 (R3)
; i start address is: 24 (R6)
SEH	R6, R2
;MP3.c,239 :: 		}
SEH	R24, R6
; i end address is: 24 (R6)
J	L_runParser144
NOP	
L_runParser145:
;MP3.c,244 :: 		}
L_end_runParser:
LW	R28, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 1064
JR	RA
NOP	
; end of _runParser
_Init_Ext_Mem:
;MP3.c,246 :: 		void Init_Ext_Mem() {
ADDIU	SP, SP, -24
SW	RA, 0(SP)
;MP3.c,249 :: 		char *rfName = "ExtFile.RES";
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
SW	R28, 16(SP)
LUI	R30, hi_addr(?lstr11_MP3+0)
ORI	R30, R30, lo_addr(?lstr11_MP3+0)
SW	R30, 20(SP)
;MP3.c,251 :: 		rfHandle    = -1;
ORI	R2, R0, 255
SB	R2, Offset(_rfHandle+0)(GP)
;MP3.c,252 :: 		rfStartSect = 0;
SW	R0, Offset(_rfStartSect+0)(GP)
;MP3.c,263 :: 		_SPI_SS_DISABLE,               // pri. prescaler = _SPI_PRESCALE_PRI_4
MOVZ	R28, R0, R0
;MP3.c,262 :: 		40,           // sec. prescaler = _SPI_PRESCALE_SEC_1
ORI	R27, R0, 40
;MP3.c,261 :: 		_SPI_8_BIT,                    // master_mode    = _SPI_MASTER
MOVZ	R26, R0, R0
;MP3.c,260 :: 		SPI3_Init_Advanced(_SPI_MASTER,                   // Initialize SPI1 module
ORI	R25, R0, 32
;MP3.c,266 :: 		_SPI_IDLE_2_ACTIVE);           // clock_idle     = _SPI_CLK_IDLE_HIGH
ORI	R2, R0, 256
ADDIU	SP, SP, -8
SH	R2, 4(SP)
;MP3.c,265 :: 		_SPI_CLK_IDLE_LOW,             // data_sample    = _SPI_DATA_SAMPLE_END
SH	R0, 2(SP)
;MP3.c,264 :: 		_SPI_DATA_SAMPLE_MIDDLE,       // slave_select   = _SPI_SS_DISABLE (Only for slave mod)
SH	R0, 0(SP)
;MP3.c,266 :: 		_SPI_IDLE_2_ACTIVE);           // clock_idle     = _SPI_CLK_IDLE_HIGH
JAL	_SPI3_Init_Advanced+0
NOP	
ADDIU	SP, SP, 8
;MP3.c,270 :: 		if (!FAT32_Init()) {
JAL	_FAT32_Init+0
NOP	
BEQ	R2, R0, L__Init_Ext_Mem403
NOP	
J	L_Init_Ext_Mem153
NOP	
L__Init_Ext_Mem403:
;MP3.c,275 :: 		_SPI_SS_DISABLE,               // pri. prescaler = _SPI_PRESCALE_PRI_4
MOVZ	R28, R0, R0
;MP3.c,274 :: 		40,           // sec. prescaler = _SPI_PRESCALE_SEC_1
ORI	R27, R0, 40
;MP3.c,273 :: 		_SPI_8_BIT,                    // master_mode    = _SPI_MASTER
MOVZ	R26, R0, R0
;MP3.c,272 :: 		SPI3_Init_Advanced(_SPI_MASTER,                   // Initialize SPI1 module
ORI	R25, R0, 32
;MP3.c,278 :: 		_SPI_IDLE_2_ACTIVE);           // clock_idle     = _SPI_CLK_IDLE_HIGH
ORI	R2, R0, 256
ADDIU	SP, SP, -8
SH	R2, 4(SP)
;MP3.c,277 :: 		_SPI_CLK_IDLE_LOW,             // data_sample    = _SPI_DATA_SAMPLE_END
SH	R0, 2(SP)
;MP3.c,276 :: 		_SPI_DATA_SAMPLE_MIDDLE,       // slave_select   = _SPI_SS_DISABLE (Only for slave mod)
SH	R0, 0(SP)
;MP3.c,278 :: 		_SPI_IDLE_2_ACTIVE);           // clock_idle     = _SPI_CLK_IDLE_HIGH
JAL	_SPI3_Init_Advanced+0
NOP	
ADDIU	SP, SP, 8
;MP3.c,282 :: 		rfHandle    = FAT32_Open(rfName, 0x01);
ORI	R26, R0, 1
LW	R25, 20(SP)
JAL	_FAT32_Open+0
NOP	
SB	R2, Offset(_rfHandle+0)(GP)
;MP3.c,283 :: 		rfStartSect = FAT32_ClustToSect(fat32_fdesc[rfHandle]._1stClust);
SEB	R3, R2
ORI	R2, R0, 28
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_fat32_fdesc+0)
ORI	R2, R2, lo_addr(_fat32_fdesc+0)
ADDU	R2, R2, R3
LW	R25, 0(R2)
JAL	_FAT32_ClustToSect+0
NOP	
SW	R2, Offset(_rfStartSect+0)(GP)
;MP3.c,284 :: 		}
L_Init_Ext_Mem153:
;MP3.c,285 :: 		}
L_end_Init_Ext_Mem:
LW	R28, 16(SP)
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 24
JR	RA
NOP	
; end of _Init_Ext_Mem
_TFT_Get_Data:
;MP3.c,287 :: 		char *TFT_Get_Data(unsigned long fPos, unsigned long bytesToGet, unsigned long *pBytesGot) {
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;MP3.c,290 :: 		*pBytesGot = 0;
SW	R0, 0(R27)
;MP3.c,292 :: 		if (rfHandle < 0) {
LB	R2, Offset(_rfHandle+0)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__TFT_Get_Data405
NOP	
J	L_TFT_Get_Data154
NOP	
L__TFT_Get_Data405:
;MP3.c,293 :: 		return 0; // return with nil if handle was bad.
MOVZ	R2, R0, R0
J	L_end_TFT_Get_Data
NOP	
;MP3.c,294 :: 		}
L_TFT_Get_Data154:
;MP3.c,302 :: 		f32_sector.fSectNum = rfStartSect + fPos / 512;
SRL	R3, R25, 9
LW	R2, Offset(_rfStartSect+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(_f32_sector+0)(GP)
;MP3.c,303 :: 		Mmc_Read_Sector(f32_sector.fSectNum, f32_sector.fSect);
SW	R27, 4(SP)
SW	R26, 8(SP)
SW	R25, 12(SP)
LUI	R26, hi_addr(_f32_sector+4)
ORI	R26, R26, lo_addr(_f32_sector+4)
MOVZ	R25, R2, R0
JAL	_Mmc_Read_Sector+0
NOP	
LW	R25, 12(SP)
LW	R26, 8(SP)
LW	R27, 4(SP)
;MP3.c,306 :: 		scOffset = fPos % 512;
ANDI	R3, R25, 511
; scOffset start address is: 16 (R4)
MOVZ	R4, R3, R0
;MP3.c,307 :: 		if(bytesToGet > 512-scOffset)
ORI	R2, R0, 512
SUBU	R2, R2, R3
ANDI	R2, R2, 65535
SLTU	R2, R2, R26
BNE	R2, R0, L__TFT_Get_Data406
NOP	
J	L_TFT_Get_Data155
NOP	
L__TFT_Get_Data406:
;MP3.c,308 :: 		*pBytesGot = 512-scOffset;
ORI	R2, R0, 512
SUBU	R2, R2, R4
ANDI	R2, R2, 65535
SW	R2, 0(R27)
J	L_TFT_Get_Data156
NOP	
L_TFT_Get_Data155:
;MP3.c,310 :: 		*pBytesGot = bytesToGet;
SW	R26, 0(R27)
L_TFT_Get_Data156:
;MP3.c,312 :: 		return &f32_sector.fSect + scOffset;
ANDI	R3, R4, 65535
; scOffset end address is: 16 (R4)
LUI	R2, hi_addr(_f32_sector+4)
ORI	R2, R2, lo_addr(_f32_sector+4)
ADDU	R2, R2, R3
;MP3.c,313 :: 		}
L_end_TFT_Get_Data:
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _TFT_Get_Data
_main:
;MP3.c,315 :: 		void main(){
ADDIU	SP, SP, -116
;MP3.c,323 :: 		char *rfName = "config.txt";
LUI	R30, hi_addr(?lstr12_MP3+0)
ORI	R30, R30, lo_addr(?lstr12_MP3+0)
SW	R30, 112(SP)
;MP3.c,336 :: 		Init();                      // Initialize MCU
JAL	_Init+0
NOP	
;MP3.c,338 :: 		DrawFrame();                 // Draw graphical frame
JAL	_DrawFrame+0
NOP	
;MP3.c,339 :: 		MP3_Init();                  // Start using mp3 codec
JAL	_MP3_Init+0
NOP	
;MP3.c,340 :: 		checkForFAT();
JAL	_checkForFAT+0
NOP	
;MP3.c,343 :: 		TFT_Set_Ext_Buffer(TFT_Get_Data);
LUI	R25, hi_addr(_TFT_Get_Data+0)
ORI	R25, R25, lo_addr(_TFT_Get_Data+0)
JAL	_TFT_Set_Ext_Buffer+0
NOP	
;MP3.c,347 :: 		FAT32_Delete(rfName);                //
LW	R25, 112(SP)
JAL	_FAT32_Delete+0
NOP	
;MP3.c,348 :: 		writeFile(JSON_STRING, rfName);      //
LW	R26, 112(SP)
LW	R25, Offset(MP3_JSON_STRING+0)(GP)
JAL	_writeFile+0
NOP	
;MP3.c,353 :: 		rfHandle = FAT32_Open(rfName, FILE_READ);
ORI	R26, R0, 1
LW	R25, 112(SP)
JAL	_FAT32_Open+0
NOP	
SB	R2, 108(SP)
;MP3.c,354 :: 		FAT32_Size(rfName, &fsize);
ADDIU	R2, SP, 4
MOVZ	R26, R2, R0
LW	R25, 112(SP)
JAL	_FAT32_Size+0
NOP	
;MP3.c,356 :: 		for (i = 0; i < fsize; i++)
SW	R0, 0(SP)
L_main157:
LW	R3, 4(SP)
LW	R2, 0(SP)
SLTU	R2, R2, R3
BNE	R2, R0, L__main408
NOP	
J	L_main158
NOP	
L__main408:
;MP3.c,358 :: 		FAT32_Read(rfHandle, fileData, fsize);
LW	R27, 4(SP)
LUI	R26, hi_addr(_fileData+0)
ORI	R26, R26, lo_addr(_fileData+0)
LB	R25, 108(SP)
JAL	_FAT32_Read+0
NOP	
;MP3.c,356 :: 		for (i = 0; i < fsize; i++)
LW	R2, 0(SP)
ADDIU	R2, R2, 1
SW	R2, 0(SP)
;MP3.c,359 :: 		}
J	L_main157
NOP	
L_main158:
;MP3.c,360 :: 		FAT32_Close(rfHandle);
LB	R25, 108(SP)
JAL	_FAT32_Close+0
NOP	
;MP3.c,361 :: 		Delay_ms(100);
LUI	R24, 40
ORI	R24, R24, 45226
L_main160:
ADDIU	R24, R24, -1
BNE	R24, R0, L_main160
NOP	
;MP3.c,364 :: 		TerminateString(&fileData, '}', &res);
LUI	R27, hi_addr(_res+0)
ORI	R27, R27, lo_addr(_res+0)
ORI	R26, R0, 125
LUI	R25, hi_addr(_fileData+0)
ORI	R25, R25, lo_addr(_fileData+0)
JAL	_TerminateString+0
NOP	
;MP3.c,367 :: 		TFT_Ext_Image(10,20,0x00000003, 1);
ORI	R28, R0, 1
ORI	R27, R0, 3
ORI	R26, R0, 20
ORI	R25, R0, 10
JAL	_TFT_Ext_Image+0
NOP	
;MP3.c,370 :: 		for (i = 0; i < 6; i++)
SW	R0, 0(SP)
L_main162:
LW	R2, 0(SP)
SLTIU	R2, R2, 6
BNE	R2, R0, L__main409
NOP	
J	L_main163
NOP	
L__main409:
;MP3.c,373 :: 		runParser(res, "text", i);
LW	R27, 0(SP)
LUI	R26, hi_addr(?lstr13_MP3+0)
ORI	R26, R26, lo_addr(?lstr13_MP3+0)
LUI	R25, hi_addr(_res+0)
ORI	R25, R25, lo_addr(_res+0)
JAL	_runParser+0
NOP	
;MP3.c,374 :: 		TerminateString(&buffer, '*', &textBuffer);
ADDIU	R2, SP, 58
MOVZ	R27, R2, R0
ORI	R26, R0, 42
LUI	R25, hi_addr(_buffer+0)
ORI	R25, R25, lo_addr(_buffer+0)
JAL	_TerminateString+0
NOP	
;MP3.c,375 :: 		TFT_Write_Text(&textBuffer, 0, spacer);
ADDIU	R2, SP, 58
LH	R27, Offset(_spacer+0)(GP)
MOVZ	R26, R0, R0
MOVZ	R25, R2, R0
JAL	_TFT_Write_Text+0
NOP	
;MP3.c,376 :: 		spacer += 10;
LH	R2, Offset(_spacer+0)(GP)
ADDIU	R2, R2, 10
SH	R2, Offset(_spacer+0)(GP)
;MP3.c,377 :: 		runParser(res, "audio", i);
LW	R27, 0(SP)
LUI	R26, hi_addr(?lstr14_MP3+0)
ORI	R26, R26, lo_addr(?lstr14_MP3+0)
LUI	R25, hi_addr(_res+0)
ORI	R25, R25, lo_addr(_res+0)
JAL	_runParser+0
NOP	
;MP3.c,378 :: 		TerminateString(&buffer, '3', &buf);
ADDIU	R2, SP, 8
MOVZ	R27, R2, R0
ORI	R26, R0, 51
LUI	R25, hi_addr(_buffer+0)
ORI	R25, R25, lo_addr(_buffer+0)
JAL	_TerminateString+0
NOP	
;MP3.c,379 :: 		TFT_Write_Text(&buf, 0, spacer);
ADDIU	R2, SP, 8
LH	R27, Offset(_spacer+0)(GP)
MOVZ	R26, R0, R0
MOVZ	R25, R2, R0
JAL	_TFT_Write_Text+0
NOP	
;MP3.c,380 :: 		spacer += 15;
LH	R2, Offset(_spacer+0)(GP)
ADDIU	R2, R2, 15
SH	R2, Offset(_spacer+0)(GP)
;MP3.c,381 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_main165:
ADDIU	R24, R24, -1
BNE	R24, R0, L_main165
NOP	
;MP3.c,382 :: 		play(buf);
ADDIU	R2, SP, 8
MOVZ	R25, R2, R0
JAL	_play+0
NOP	
;MP3.c,383 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_main167:
ADDIU	R24, R24, -1
BNE	R24, R0, L_main167
NOP	
;MP3.c,370 :: 		for (i = 0; i < 6; i++)
LW	R2, 0(SP)
ADDIU	R2, R2, 1
SW	R2, 0(SP)
;MP3.c,384 :: 		}
J	L_main162
NOP	
L_main163:
;MP3.c,413 :: 		TFT_Set_Font(TFT_defaultFont, CL_BLACK, FO_HORIZONTAL);
MOVZ	R27, R0, R0
MOVZ	R26, R0, R0
LUI	R25, hi_addr(_TFT_defaultFont+0)
ORI	R25, R25, lo_addr(_TFT_defaultFont+0)
JAL	_TFT_Set_Font+0
NOP	
;MP3.c,414 :: 		TFT_Write_Text("END", 80, 50);
ORI	R27, R0, 50
ORI	R26, R0, 80
LUI	R25, hi_addr(?lstr15_MP3+0)
ORI	R25, R25, lo_addr(?lstr15_MP3+0)
JAL	_TFT_Write_Text+0
NOP	
;MP3.c,416 :: 		}
L_end_main:
L__main_end_loop:
J	L__main_end_loop
NOP	
; end of _main
