CODE_BA9000:
	TAX					;$BA9000  \
	PHK					;$BA9001   |
	PLB					;$BA9002   |
	JMP (DATA_BA9006,x)			;$BA9003  /

DATA_BA9006:
	dw king_zing_sprite_code		;0000 king_zing_main
	dw king_zing_ring_zinger_sprite_code	;0002 king_zing_ring_zinger_main
	dw king_zing_smoke_effect_sprite_code	;0004 king_zing_smoke_effect_main
	dw king_zing_stinger_sprite_code	;0006 king_zing_stinger_main
	dw king_zing_spikes_sprite_code		;0008 king_zing_spikes_main
	dw kreepy_krows_body_sprite_code	;000A kreepy_krows_body_main
	dw kreepy_krows_eggs_sprite_code	;000C kreepy_krows_eggs_main
	dw kreepy_krows_head_sprite_code	;000E kreepy_krows_head_main

CODE_BA9016:
	STY $5E					;$BA9016  \
	JSL CODE_BCFE0A				;$BA9018   |
	LDX current_sprite			;$BA901C   |
	BCC CODE_BA9041				;$BA901E   |
	LDY $6A					;$BA9020   |
	LDA $5E					;$BA9022   |
	ORA $0032,y				;$BA9024   |
	STA $0032,y				;$BA9027   |
	LDA $12,x				;$BA902A   |
	EOR $20,x				;$BA902C   |
	AND #$4000				;$BA902E   |
	EOR $20,x				;$BA9031   |
	AND #$C000				;$BA9033   |
	CLC					;$BA9036   |
	ADC current_sprite			;$BA9037   |
	SEC					;$BA9039   |
	SBC #aux_sprite_table			;$BA903A   |
	STA $0034,y				;$BA903D   |
	SEC					;$BA9040   |
CODE_BA9041:					;	   |
	RTL					;$BA9041  /

CODE_BA9042:
	%pea_mask_dbr(DATA_BAABA8)		;$BA9042  \
	PLB					;$BA9045   |
	PLB					;$BA9046   |
	RTS					;$BA9047  /

king_zing_sprite_code:
	PHB					;$BA9048  \
	PHK					;$BA9049   |
	PLB					;$BA904A   |
	LDX current_sprite			;$BA904B   |
	LDA $42,x				;$BA904D   |
	BNE CODE_BA909F				;$BA904F   |
	JSL CODE_B4AEAF				;$BA9051   |
	STZ $0765				;$BA9055   |
	STZ $32,x				;$BA9058   |
	STZ $06A1				;$BA905A   |
	STZ $06A3				;$BA905D   |
	STZ $06A5				;$BA9060   |
	LDA #DATA_B6AE87			;$BA9063   |
	STA $00065A				;$BA9066   |
	LDA #$0009				;$BA906A   |
	STA $000652				;$BA906D   |
	LDA #$0002				;$BA9071   |
	STA $00070B				;$BA9074   |
	LDY #$00A0				;$BA9078   |
	JSL CODE_BB842C				;$BA907B   |
	LDA alternate_sprite			;$BA907F   |
	LDX current_sprite			;$BA9081   |
	STX $0654				;$BA9083   |
	STA $000656				;$BA9086   |
	STA $42,x				;$BA908A   |
	STZ $44,x				;$BA908C   |
	LDA #$000A				;$BA908E   |
	STA $000755				;$BA9091   |
	LDA #DATA_BA9318			;$BA9095   |
	STA $000757				;$BA9098   |
	JSR CODE_BA9B0E				;$BA909C   |
CODE_BA909F:					;	   |
	LDA.l $000652				;$BA909F   |
	BNE CODE_BA90A8				;$BA90A3   |
	BRL CODE_BA94CF				;$BA90A5  /

CODE_BA90A8:
	INC $19AA				;$BA90A8  \
	LDA.l $000709				;$BA90AB   |
	BEQ CODE_BA90D5				;$BA90AF   |
	DEC $0709				;$BA90B1   |
	BNE CODE_BA90D1				;$BA90B4   |
	LDA #zinger_yellow_sprite_palette	;$BA90B6   |
	JSL set_sprite_palette_direct_global	;$BA90B9   |
	LDX current_sprite			;$BA90BD   |
	LDA $2E,x				;$BA90BF   |
	AND #$FDFF				;$BA90C1   |
	STA $2E,x				;$BA90C4   |
	STZ $32,x				;$BA90C6   |
	LDX $0656				;$BA90C8   |
	BEQ CODE_BA90D5				;$BA90CB   |
	STZ $32,x				;$BA90CD   |
	BRA CODE_BA90D5				;$BA90CF  /

CODE_BA90D1:
	JSL CODE_B6D82B				;$BA90D1  \
CODE_BA90D5:					;	   |
	LDX current_sprite			;$BA90D5   |
	LDA $2E,x				;$BA90D7   |
CODE_BA90D9:					;	   |
	BIT #$0200				;$BA90D9   |
	BEQ CODE_BA9114				;$BA90DC   |
	LDA.l $000765				;$BA90DE   |
	BEQ CODE_BA9114				;$BA90E2   |
	DEC $0765				;$BA90E4   |
	BRL CODE_BA911F				;$BA90E7  /

	JSL CODE_BCFB58				;$BA90EA   |
	LDA #$0C7B				;$BA90EE   |
	JSL CODE_B6CF65				;$BA90F1   |
	BCC CODE_BA911F				;$BA90F5   |
	LDA #$001E				;$BA90F7   |
	LDY #$FE00				;$BA90FA   |
	JSL CODE_B3A600				;$BA90FD   |
	LDX $0654				;$BA9101   |
	LDA $2E,x				;$BA9104   |
	ORA #$0200				;$BA9106   |
	STA $2E,x				;$BA9109   |
	LDA #$0014				;$BA910B   |
	STA $000765				;$BA910E   |
	BRA CODE_BA911F				;$BA9112  /

CODE_BA9114:
	JSL CODE_BCFB58				;$BA9114  \
	LDA #$0000				;$BA9118   |
	JSL CODE_B6CF65				;$BA911B   |
CODE_BA911F:					;	   |
	LDX current_sprite			;$BA911F   |
	LDA $2E,x				;$BA9121   |
	BIT #$4000				;$BA9123   |
	BNE CODE_BA912B				;$BA9126   |
	BRL CODE_BA91C4				;$BA9128  /

CODE_BA912B:
	STZ $32,x				;$BA912B  \
	LDA.l $000717				;$BA912D   |
	BEQ CODE_BA9192				;$BA9131   |
	DEC $0717				;$BA9133   |
	BNE CODE_BA9192				;$BA9136   |
	LDA $2E,x				;$BA9138   |
	AND #$BFFF				;$BA913A   |
	STA $2E,x				;$BA913D   |
	LDX $0654				;$BA913F   |
	LDA #$2800				;$BA9142   |
	STA $4E,x				;$BA9145   |
	STZ $4C,x				;$BA9147   |
	LDY #$00C0				;$BA9149   |
	JSL CODE_BB842C				;$BA914C   |
	LDX alternate_sprite			;$BA9150   |
	STZ $4A,x				;$BA9152   |
	LDA #$0001				;$BA9154   |
	STA $1E,x				;$BA9157   |
	LDY #$00C0				;$BA9159   |
	JSL CODE_BB842C				;$BA915C   |
	LDX alternate_sprite			;$BA9160   |
	LDA #$4000				;$BA9162   |
	STA $4A,x				;$BA9165   |
	LDA #$000F				;$BA9167   |
	STA $1E,x				;$BA916A   |
	LDY #$00C0				;$BA916C   |
	JSL CODE_BB842C				;$BA916F   |
	LDX alternate_sprite			;$BA9173   |
	LDA #$8000				;$BA9175   |
	STA $4A,x				;$BA9178   |
	LDA #$001E				;$BA917A   |
	STA $1E,x				;$BA917D   |
	LDY #$00C0				;$BA917F   |
	JSL CODE_BB842C				;$BA9182   |
	LDX alternate_sprite			;$BA9186   |
	LDA #$C000				;$BA9188   |
	STA $4A,x				;$BA918B   |
	LDA #$002D				;$BA918D   |
	STA $1E,x				;$BA9190   |
CODE_BA9192:					;	   |
	LDA.l $00071D				;$BA9192   |
	BEQ CODE_BA91C1				;$BA9196   |
	DEC $071D				;$BA9198   |
	BNE CODE_BA91C1				;$BA919B   |
	LDA.l $000656				;$BA919D   |
	STA current_sprite			;$BA91A1   |
	JSL delete_sprite_handle_deallocation	;$BA91A3   |
	LDA.l $000654				;$BA91A7   |
	STA current_sprite			;$BA91AB   |
	STZ $0656				;$BA91AD   |
	LDA #$0240				;$BA91B0   |
	JSL set_sprite_animation		;$BA91B3   |
	LDX current_sprite			;$BA91B7   |
	LDA $0A,x				;$BA91B9   |
	CLC					;$BA91BB   |
	ADC #$FFF8				;$BA91BC   |
	STA $0A,x				;$BA91BF   |
CODE_BA91C1:					;	   |
	BRL CODE_BA924E				;$BA91C1  /

CODE_BA91C4:
	LDA.l $000652				;$BA91C4  \
	CMP #$0004				;$BA91C8   |
	BCC CODE_BA91D4				;$BA91CB   |
	LDA $2E,x				;$BA91CD   |
	BIT #$0200				;$BA91CF   |
	BNE CODE_BA923C				;$BA91D2   |
CODE_BA91D4:					;	   |
	LDA $2E,x				;$BA91D4   |
	BIT #$0400				;$BA91D6   |
	BEQ CODE_BA91E1				;$BA91D9   |
	JSR CODE_BA9697				;$BA91DB   |
	BRL CODE_BA924E				;$BA91DE  /

CODE_BA91E1:
	BIT #$0004				;$BA91E1  \
	BEQ CODE_BA91EC				;$BA91E4   |
	JSL CODE_B6ADF1				;$BA91E6   |
	BRA CODE_BA91F1				;$BA91EA  /

CODE_BA91EC:
	BIT #$0001				;$BA91EC  \
	BEQ CODE_BA923C				;$BA91EF   |
CODE_BA91F1:					;	   |
	LDA.l $000652				;$BA91F1   |
	CMP #$0004				;$BA91F5   |
	BCS CODE_BA91FE				;$BA91F8   |
	JSL CODE_B6ADC6				;$BA91FA   |
CODE_BA91FE:					;	   |
	JSR CODE_BA9324				;$BA91FE   |
	LDA.l $000652				;$BA9201   |
	CMP #$0004				;$BA9205   |
	BCC CODE_BA920D				;$BA9208   |
	BRL CODE_BA924B				;$BA920A  /

CODE_BA920D:
	LDX current_sprite			;$BA920D  \
	LDA.l $000709				;$BA920F   |
	BNE CODE_BA924B				;$BA9213   |
	LDA.l $00071F				;$BA9215   |
	BNE CODE_BA922F				;$BA9219   |
	LDA #zinger_yellow_sprite_palette	;$BA921B   |
	JSL set_sprite_palette_direct_global	;$BA921E   |
	LDX current_sprite			;$BA9222   |
	LDA $32,x				;$BA9224   |
	BEQ CODE_BA924B				;$BA9226   |
	STZ $32,x				;$BA9228   |
	JSR CODE_BA960F				;$BA922A   |
	BRA CODE_BA924B				;$BA922D  /

CODE_BA922F:
	LDX current_sprite			;$BA922F  \
	STZ $32,x				;$BA9231   |
	LDA #zinger_red_sprite_palette		;$BA9233   |
	JSL set_sprite_palette_direct_global	;$BA9236   |
	BRA CODE_BA924B				;$BA923A  /

CODE_BA923C:
	LDA $44,x				;$BA923C  \
	JSL CODE_B6B68F				;$BA923E   |
	LDX current_sprite			;$BA9242   |
	LDA $44,x				;$BA9244   |
	BNE CODE_BA924B				;$BA9246   |
	JSR CODE_BA9B0E				;$BA9248   |
CODE_BA924B:					;	   |
	JSR CODE_BA9274				;$BA924B   |
CODE_BA924E:					;	   |
	LDX current_sprite			;$BA924E   |
	LDA $4C,x				;$BA9250   |
	CLC					;$BA9252   |
	ADC #$0180				;$BA9253   |
	STA $4C,x				;$BA9256   |
	LDA.l $00071F				;$BA9258   |
	BNE CODE_BA9269				;$BA925C   |
	LDA.l $0006A5				;$BA925E   |
	ORA #$1000				;$BA9262   |
	STA $0006A5				;$BA9265   |
CODE_BA9269:					;	   |
	STZ $071F				;$BA9269   |
CODE_BA926C:					;	   |
	JSL CODE_B9D100				;$BA926C   |
	PLB					;$BA9270   |
	JML [$05A9]				;$BA9271  /

CODE_BA9274:
	LDX current_sprite			;$BA9274  \
	LDA $2E,x				;$BA9276   |
	EOR #$2000				;$BA9278   |
	STA $2E,x				;$BA927B   |
	LDA.l $00070D				;$BA927D   |
	BEQ CODE_BA92F1				;$BA9281   |
	DEC $070D				;$BA9283   |
	BNE CODE_BA92F1				;$BA9286   |
	LDA #$077C				;$BA9288   |
	JSL queue_sound_effect			;$BA928B   |
	LDA.l $00070F				;$BA928F   |
	STA $00070D				;$BA9293   |
	LDA #$0008				;$BA9297   |
	STA $000650				;$BA929A   |
	JSR CODE_BA9042				;$BA929E   |
	LDA.l $000652				;$BA92A1   |
	ASL A					;$BA92A5   |
	TAY					;$BA92A6   |
	LDA DATA_BAABA8,y			;$BA92A7   |
	TAY					;$BA92AA   |
	LDA $000A,y				;$BA92AB   |
CODE_BA92AE:					;	   |
	PHA					;$BA92AE   |
	LDY #DATA_FF1EAA			;$BA92AF   |
	JSL CODE_BB8418				;$BA92B2   |
	LDY alternate_sprite			;$BA92B6   |
	PLX					;$BA92B8   |
	LDA $0000,x				;$BA92B9   |
	STA $0020,y				;$BA92BC   |
	LDA $0002,x				;$BA92BF   |
	STA $0024,y				;$BA92C2   |
	LDA $0004,x				;$BA92C5   |
	STA $0026,y				;$BA92C8   |
	LDA $0006,x				;$BA92CB   |
	STA $002A,y				;$BA92CE   |
	LDA $0008,x				;$BA92D1   |
	STA $0042,y				;$BA92D4   |
	LDA $000A,x				;$BA92D7   |
	STA $0044,y				;$BA92DA   |
	LDA $000C,x				;$BA92DD   |
	PHX					;$BA92E0   |
	JSL CODE_B9D09B				;$BA92E1   |
	PLA					;$BA92E5   |
	CLC					;$BA92E6   |
	ADC #$000E				;$BA92E7   |
	DEC $0650				;$BA92EA   |
	BNE CODE_BA92AE				;$BA92ED   |
	PHK					;$BA92EF   |
	PLB					;$BA92F0   |
CODE_BA92F1:					;	   |
	RTS					;$BA92F1  /

CODE_BA92F2:
	JSR CODE_BA92F6				;$BA92F2  \
	RTL					;$BA92F5  /

CODE_BA92F6:
	LDA #$0005				;$BA92F6  \
	STA $0006ED				;$BA92F9   |
	STA $000715				;$BA92FD   |
	LDA #DATA_BA9314			;$BA9301   |
	STA $0006EB				;$BA9304   |
	STA $000713				;$BA9308   |
	LDA #DATA_BA9318			;$BA930C   |
	STA $000711				;$BA930F   |
	RTS					;$BA9313  /

;king zing damage flash palette addresses
DATA_BA9314:
	dw zinger_yellow_sprite_palette
	dw zinger_red_sprite_palette

;king zing stinger palette ID's
DATA_BA9318:
	dw $0098
	dw $0099
	dw $009A
	dw $009B
	dw $009A
	dw $0099

DATA_BA9324:

CODE_BA9324:
	LDX current_sprite			;$BA9324  \
	LDA $0006E9				;$BA9326   |
	BEQ CODE_BA935E				;$BA932A   |
	DEC $06E9				;$BA932C   |
	BEQ CODE_BA9334				;$BA932F   |
	BRL CODE_BA935E				;$BA9331  /

CODE_BA9334:
	LDX $0656				;$BA9334  \
	STZ $32,x				;$BA9337   |
	LDX current_sprite			;$BA9339   |
	STZ $0765				;$BA933B   |
	LDA $2E,x				;$BA933E   |
	AND #$FDFE				;$BA9340   |
	STA $2E,x				;$BA9343   |
	LDA #zinger_yellow_sprite_palette	;$BA9345   |
	JSL set_sprite_palette_direct_global	;$BA9348   |
	STZ $070D				;$BA934C   |
	LDX current_sprite			;$BA934F   |
	STZ $44,x				;$BA9351   |
	LDA #DATA_B6AE87			;$BA9353   |
	STA $46,x				;$BA9356   |
	JSR CODE_BA9B0E				;$BA9358   |
	BRL CODE_BA9439				;$BA935B  /

CODE_BA935E:
	LDY active_kong_sprite			;$BA935E  \
	LDA $06,x				;$BA9361   |
	CLC					;$BA9363   |
	ADC #$0000				;$BA9364   |
	CMP $0006,y				;$BA9367   |
	BCC CODE_BA9399				;$BA936A   |
	LDA $2E,x				;$BA936C   |
	BIT #$0002				;$BA936E   |
	BNE CODE_BA937D				;$BA9371   |
	LDA $12,x				;$BA9373   |
	BIT #$4000				;$BA9375   |
	BNE CODE_BA937D				;$BA9378   |
	JSR CODE_BA9484				;$BA937A   |
CODE_BA937D:					;	   |
	LDY active_kong_sprite			;$BA937D   |
	LDA $06,x				;$BA9380   |
	CLC					;$BA9382   |
	ADC #$FFF0				;$BA9383   |
	CMP $0006,y				;$BA9386   |
	BCS CODE_BA938F				;$BA9389   |
	STZ $26,x				;$BA938B   |
	BRA CODE_BA9397				;$BA938D  /

CODE_BA938F:
	LDA #$0000				;$BA938F  \
	CLC					;$BA9392   |
	SBC $28,x				;$BA9393   |
	STA $26,x				;$BA9395   |
CODE_BA9397:					;	   |
	BRA CODE_BA93C0				;$BA9397  /

CODE_BA9399:
	LDA $2E,x				;$BA9399  \
	BIT #$0002				;$BA939B   |
	BNE CODE_BA93AA				;$BA939E   |
	LDA $12,x				;$BA93A0   |
	BIT #$4000				;$BA93A2   |
	BEQ CODE_BA93AA				;$BA93A5   |
	JSR CODE_BA9484				;$BA93A7   |
CODE_BA93AA:					;	   |
	LDY active_kong_sprite			;$BA93AA   |
	LDA $06,x				;$BA93AD   |
	CLC					;$BA93AF   |
	ADC #$0010				;$BA93B0   |
	CMP $0006,y				;$BA93B3   |
	BCC CODE_BA93BC				;$BA93B6   |
	STZ $26,x				;$BA93B8   |
	BRA CODE_BA93C0				;$BA93BA  /

CODE_BA93BC:
	LDA $28,x				;$BA93BC  \
	STA $26,x				;$BA93BE   |
CODE_BA93C0:					;	   |
	LDY active_kong_sprite			;$BA93C0   |
	LDA $0A,x				;$BA93C3   |
	CLC					;$BA93C5   |
	ADC #$FFF6				;$BA93C6   |
	CMP $000A,y				;$BA93C9   |
	BCC CODE_BA93EA				;$BA93CC   |
	LDY active_kong_sprite			;$BA93CE   |
	LDA $0A,x				;$BA93D1   |
	CLC					;$BA93D3   |
	ADC #$FFF6				;$BA93D4   |
	CMP $000A,y				;$BA93D7   |
	BCS CODE_BA93E0				;$BA93DA   |
	STZ $2A,x				;$BA93DC   |
	BRA CODE_BA93E8				;$BA93DE  /

CODE_BA93E0:
	LDA #$0000				;$BA93E0  \
	CLC					;$BA93E3   |
	SBC $28,x				;$BA93E4   |
	STA $2A,x				;$BA93E6   |
CODE_BA93E8:					;	   |
	BRA CODE_BA9400				;$BA93E8  /

CODE_BA93EA:
	LDY active_kong_sprite			;$BA93EA  \
	LDA $0A,x				;$BA93ED   |
	CLC					;$BA93EF   |
	ADC #$FFF7				;$BA93F0   |
	CMP $000A,y				;$BA93F3   |
	BCC CODE_BA93FC				;$BA93F6   |
	STZ $2A,x				;$BA93F8   |
	BRA CODE_BA9400				;$BA93FA  /

CODE_BA93FC:
	LDA $28,x				;$BA93FC  \
	STA $2A,x				;$BA93FE   |
CODE_BA9400:					;	   |
	JSL CODE_B6D7F0				;$BA9400   |
	LDA $26,x				;$BA9404   |
	CLC					;$BA9406   |
	ADC $0006E5				;$BA9407   |
	STA $26,x				;$BA940B   |
	LDA $2A,x				;$BA940D   |
	CLC					;$BA940F   |
	ADC $0006E7				;$BA9410   |
	STA $2A,x				;$BA9414   |
	LDA $22,x				;$BA9416   |
	JSL interpolate_x_velocity_global	;$BA9418   |
	LDX current_sprite			;$BA941C   |
	LDA $22,x				;$BA941E   |
	JSL interpolate_y_velocity_global	;$BA9420   |
	JSL apply_position_from_velocity_global	;$BA9424   |
	LDX current_sprite			;$BA9428   |
	LDY $0656				;$BA942A   |
	BEQ CODE_BA9439				;$BA942D   |
	LDA $06,x				;$BA942F   |
	STA $0006,y				;$BA9431   |
	LDA $0A,x				;$BA9434   |
	STA $000A,y				;$BA9436   |
CODE_BA9439:					;	   |
	RTS					;$BA9439  /

CODE_BA943A:
	JSL CODE_B6DC1F				;$BA943A  \
	LDX $0656				;$BA943E   |
	JSL CODE_B6DC1F				;$BA9441   |
	LDX $0654				;$BA9445   |
	LDA $2E,x				;$BA9448   |
	AND #$FF7F				;$BA944A   |
	STA $2E,x				;$BA944D   |
	RTL					;$BA944F  /

CODE_BA9450:
	LDA $2E,x				;$BA9450  \
	AND #$FFFD				;$BA9452   |
	STA $2E,x				;$BA9455   |
	LDA.l $000652				;$BA9457   |
	CMP #$0004				;$BA945B   |
	BCS CODE_BA9465				;$BA945E   |
	LDA #$0240				;$BA9460   |
	BRA CODE_BA9468				;$BA9463  /

CODE_BA9465:
	LDA #$0230				;$BA9465  \
CODE_BA9468:					;	   |
	JSL set_sprite_animation		;$BA9468   |
	LDX $0656				;$BA946C   |
	BEQ CODE_BA947F				;$BA946F   |
	STX current_sprite			;$BA9471   |
	LDA #$0232				;$BA9473   |
	JSL set_sprite_animation		;$BA9476   |
	LDX $0654				;$BA947A   |
	STX current_sprite			;$BA947D   |
CODE_BA947F:					;	   |
	RTL					;$BA947F  /

CODE_BA9480:
	JSR CODE_BA9484				;$BA9480  \
	RTL					;$BA9483  /

CODE_BA9484:
	PHY					;$BA9484  \
	LDX current_sprite			;$BA9485   |
	LDA $2E,x				;$BA9487   |
	ORA #$0080				;$BA9489   |
	STA $2E,x				;$BA948C   |
	LDA $36,x				;$BA948E   |
	STA $00065C				;$BA9490   |
	LDY $0656				;$BA9494   |
	LDA $0036,y				;$BA9497   |
	STA $00065E				;$BA949A   |
	LDA $2E,x				;$BA949E   |
	ORA #$0002				;$BA94A0   |
	STA $2E,x				;$BA94A3   |
	LDA.l $000652				;$BA94A5   |
	CMP #$0004				;$BA94A9   |
	BCS CODE_BA94B3				;$BA94AC   |
	LDA #$0241				;$BA94AE   |
	BRA CODE_BA94B6				;$BA94B1  /

CODE_BA94B3:
	LDA #$0231				;$BA94B3  \
CODE_BA94B6:					;	   |
	JSL set_sprite_animation		;$BA94B6   |
	LDA.l $000656				;$BA94BA   |
	BEQ CODE_BA94CD				;$BA94BE   |
	PHX					;$BA94C0   |
	STA current_sprite			;$BA94C1   |
	LDA #$0233				;$BA94C3   |
	JSL set_sprite_animation		;$BA94C6   |
	PLX					;$BA94CA   |
	STX current_sprite			;$BA94CB   |
CODE_BA94CD:					;	   |
	PLY					;$BA94CD   |
	RTS					;$BA94CE  /

CODE_BA94CF:
	LDA #$000F				;$BA94CF  \
	JSL interpolate_x_velocity_global	;$BA94D2   |
	LDA #$0001				;$BA94D6   |
	JSL interpolate_y_velocity_global	;$BA94D9   |
	JSL apply_position_from_velocity_global	;$BA94DD   |
	LDX current_sprite			;$BA94E1   |
	LDA $26,x				;$BA94E3   |
	CMP $20,x				;$BA94E5   |
	BNE CODE_BA94EF				;$BA94E7   |
	EOR #$FFFF				;$BA94E9   |
	INC A					;$BA94EC   |
	STA $26,x				;$BA94ED   |
CODE_BA94EF:					;	   |
	DEC $0757				;$BA94EF   |
	BNE CODE_BA94FF				;$BA94F2   |
	JSL set_current_level_as_cleared	;$BA94F4   |
	LDA #$0027				;$BA94F8   |
	JSL set_player_interaction_global	;$BA94FB   |
CODE_BA94FF:					;	   |
	BRL CODE_BA926C				;$BA94FF  /

CODE_BA9502:
	PHY					;$BA9502  \
	LDA #$067A				;$BA9503   | 
	JSL queue_sound_effect			;$BA9506   | Play king_zing_hit sound effect
	LDX current_sprite			;$BA950A   |
	PHX					;$BA950C   |
	JSR CODE_BA92F6				;$BA950D   |
	LDX $0654				;$BA9510   |
	STX current_sprite			;$BA9513   |
	LDA $2E,x				;$BA9515   |
	BIT #$0080				;$BA9517   |
	BEQ CODE_BA9520				;$BA951A   |
	JSL CODE_BA943A				;$BA951C   |
CODE_BA9520:					;	   |
	LDA #$00B4				;$BA9520   |
	STA $000709				;$BA9523   |
	LDA $2E,x				;$BA9527   |
	ORA #$1200				;$BA9529   |
	AND #$FFFD				;$BA952C   |
	STA $2E,x				;$BA952F   |
	DEC $0652				;$BA9531   |
	LDA.l $000652				;$BA9534   |
	CMP #$0003				;$BA9538   |
	BEQ CODE_BA9540				;$BA953B   |
	BRL CODE_BA95C3				;$BA953D  /

CODE_BA9540:
	LDA #$00AA				;$BA9540  \
	STA $000717				;$BA9543   |
	LDX #DATA_BA98E6			;$BA9547   |
	LDA $0000,x				;$BA954A   |
	STA $000650				;$BA954D   |
	PHX					;$BA9551   |
	LDY.w #DATA_FF1EC8			;$BA9552   |
	JSR CODE_BA9769				;$BA9555   |
	LDX alternate_sprite			;$BA9558   |
	STX $0658				;$BA955A   |
	LDA #$023F				;$BA955D   |
	JSL CODE_B9D09B				;$BA9560   |
	LDA #$0000				;$BA9564   |
	JSL request_sprite_palette_global	;$BA9567   |
	LDY alternate_sprite			;$BA956B   |
	EOR $0012,y				;$BA956D   |
	AND #$0E00				;$BA9570   |
	EOR $0012,y				;$BA9573   |
	STA $0012,y				;$BA9576   |
	PLA					;$BA9579   |
	CLC					;$BA957A   |
	ADC #$000C				;$BA957B   |
	TAX					;$BA957E   |
	DEC $0650				;$BA957F   |
	JSR CODE_BA9736				;$BA9582   |
	LDX #DATA_BA9918			;$BA9585   |
	LDA $0000,x				;$BA9588   |
	STA $000650				;$BA958B   |
	PHX					;$BA958F   |
	LDY.w #DATA_FF1EC8			;$BA9590   |
	JSR CODE_BA9769				;$BA9593   |
	LDX alternate_sprite			;$BA9596   |
	STX $0658				;$BA9598   |
	LDA #$023E				;$BA959B   |
	JSL CODE_B9D09B				;$BA959E   |
	LDA #$0014				;$BA95A2   |
	JSL request_sprite_palette_global	;$BA95A5   |
	LDY alternate_sprite			;$BA95A9   |
	EOR $0012,y				;$BA95AB   |
	AND #$0E00				;$BA95AE   |
	EOR $0012,y				;$BA95B1   |
	STA $0012,y				;$BA95B4   |
	PLA					;$BA95B7   |
	CLC					;$BA95B8   |
	ADC #$000C				;$BA95B9   |
	TAX					;$BA95BC   |
	DEC $0650				;$BA95BD   |
	JSR CODE_BA9736				;$BA95C0   |
CODE_BA95C3:					;	   |
	DEC $070B				;$BA95C3   |
	LDA #$0234				;$BA95C6   |
	JSL set_sprite_animation		;$BA95C9   |
	LDX $0656				;$BA95CD   |
	STX current_sprite			;$BA95D0   |
	STZ $1E,x				;$BA95D2   |
	LDA #$0235				;$BA95D4   |
	JSL set_sprite_animation		;$BA95D7   |
	LDX $0654				;$BA95DB   |
	STX current_sprite			;$BA95DE   |
	LDA #DATA_B6CE3B			;$BA95E0   |
	STA $20,x				;$BA95E3   |
	LDA #DATA_B6CEA7			;$BA95E5   |
	STA $22,x				;$BA95E8   |
	LDA #$0001				;$BA95EA   |
	STA $24,x				;$BA95ED   |
	STA $26,x				;$BA95EF   |
	LDY active_kong_sprite			;$BA95F1   |
	LDA $06,x				;$BA95F4   |
	CMP $0006,y				;$BA95F6   |
	BCS CODE_BA9600				;$BA95F9   |
	LDA #$FFFF				;$BA95FB   |
	BRA CODE_BA9603				;$BA95FE  /

CODE_BA9600:
	LDA #$0001				;$BA9600  \
CODE_BA9603:					;	   |
	STA $28,x				;$BA9603   |
	LDA #CODE_B6AF3E			;$BA9605   |
	STA $44,x				;$BA9608   |
	PLX					;$BA960A   |
	STX current_sprite			;$BA960B   |
	PLY					;$BA960D   |
	RTS					;$BA960E  /

CODE_BA960F:
	LDA #$067A				;$BA960F  \
	JSL queue_sound_effect			;$BA9612   |
	JSR CODE_BA92F6				;$BA9616   |
	LDX $0654				;$BA9619   |
	STX current_sprite			;$BA961C   |
	LDA #$0014				;$BA961E   |
	STA $000765				;$BA9621   |
	LDA #$00B4				;$BA9625   |
	STA $000709				;$BA9628   |
	LDA $2E,x				;$BA962C   |
	ORA #$0200				;$BA962E   |
	AND #$FFFD				;$BA9631   |
	STA $2E,x				;$BA9634   |
	DEC $0652				;$BA9636   |
	BNE CODE_BA967E				;$BA9639   |
	STZ $24,x				;$BA963B   |
	LDA #$0180				;$BA963D   |
	STA $2A,x				;$BA9640   |
	LDA #$02E0				;$BA9642   |
	STA $20,x				;$BA9645   |
	LDA #$0300				;$BA9647   |
	STA $26,x				;$BA964A   |
	LDA #$0190				;$BA964C   |
	STA $000757				;$BA964F   |
	LDA.l $000654				;$BA9653   |
	STA alternate_sprite			;$BA9657   |
	LDA #$02A1				;$BA9659   |
	JSL CODE_B9D09B				;$BA965C   |
	LDA #$047F				;$BA9660   |
	JSL queue_sound_effect			;$BA9663   |
	LDY #$0196				;$BA9667   |
	JSL CODE_BB842C				;$BA966A   |
	LDY #$0198				;$BA966E   |
	JSL CODE_BB842C				;$BA9671   |
	LDY #$019A				;$BA9675   |
	JSL CODE_BB842C				;$BA9678   |
	BRA CODE_BA9696				;$BA967C  /

CODE_BA967E:
	LDA $2E,x				;$BA967E  \
	ORA #$0400				;$BA9680   |
	STA $2E,x				;$BA9683   |
	LDA #DATA_BA96CA			;$BA9685   |
	STA $20,x				;$BA9688   |
	LDA #DATA_BA9736			;$BA968A   |
	STA $22,x				;$BA968D   |
	LDA #$0001				;$BA968F   |
	STA $24,x				;$BA9692   |
	STA $26,x				;$BA9694   |
CODE_BA9696:					;	   |
	RTS					;$BA9696  /

CODE_BA9697:
	LDX current_sprite			;$BA9697  \
	LDA $20,x				;$BA9699   |
	CMP $22,x				;$BA969B   |
	BEQ CODE_BA96BA				;$BA969D   |
	DEC $24,x				;$BA969F   |
	BNE CODE_BA96B9				;$BA96A1   |
	LDA $26,x				;$BA96A3   |
	STA $24,x				;$BA96A5   |
	LDY $20,x				;$BA96A7   |
	LDA $06,x				;$BA96A9   |
	CLC					;$BA96AB   |
	ADC $0000,y				;$BA96AC   |
	STA $06,x				;$BA96AF   |
	INY					;$BA96B1   |
	INY					;$BA96B2   |
	STY $20,x				;$BA96B3   |
	JSL CODE_B68D59				;$BA96B5   |
CODE_BA96B9:					;	   |
	RTS					;$BA96B9  /

CODE_BA96BA:
	LDA $2E,x				;$BA96BA  \
	AND #$FBFF				;$BA96BC   |
	STA $2E,x				;$BA96BF   |
	STZ $26,x				;$BA96C1   |
	STZ $2A,x				;$BA96C3   |
	STZ $20,x				;$BA96C5   |
	STZ $24,x				;$BA96C7   |
	RTS					;$BA96C9  /


;king zing damage shake offsets (ring zinger phase)
DATA_BA96CA:
	dw $0003, $0003
	dw $0003, $FFFD
	dw $FFFD, $FFFD
	dw $0003, $0003
	dw $0003, $FFFD
	dw $FFFD, $FFFD
	dw $0003, $0003
	dw $0003, $FFFD
	dw $FFFD, $FFFD
	dw $0003, $0003
	dw $0003, $FFFD
	dw $FFFD, $FFFD
	dw $0003, $0003
	dw $0003, $FFFD
	dw $FFFD, $FFFD
	dw $0003, $0003
	dw $0003, $FFFD
	dw $FFFD, $FFFD
	dw $0003, $0003
	dw $0003, $FFFD 	
	dw $FFFD, $FFFD
	dw $0003, $0003
	dw $0003, $FFFD
	dw $FFFD, $FFFD
	dw $0003, $0003
	dw $0003, $FFFD
	dw $FFFD, $FFFD

DATA_BA9736:

CODE_BA9736:
	PHX					;$BA9736  \
	LDY #DATA_FF1EC8			;$BA9737   |
	JSR CODE_BA9762				;$BA973A   |
	LDX alternate_sprite			;$BA973D   |
	LDA.l $000658				;$BA973F   |
	STA $48,x				;$BA9743   |
	PLA					;$BA9745   |
	CLC					;$BA9746   |
	ADC #$000C				;$BA9747   |
	TAX					;$BA974A   |
	DEC $0650				;$BA974B   |
	BNE CODE_BA9736				;$BA974E   |
	RTS					;$BA9750  /

CODE_BA9751:
	LDY $0654				;$BA9751  \
	LDA $002E,y				;$BA9754   |
	ORA #$8000				;$BA9757   |
	STA $002E,y				;$BA975A   |
	JSL delete_sprite_handle_deallocation	;$BA975D   |
	RTL					;$BA9761  /

CODE_BA9762:
	PHX					;$BA9762  \
	JSL CODE_BB8418				;$BA9763   |
	BRA CODE_BA976E				;$BA9767  /

CODE_BA9769:
	PHX					;$BA9769  \
	JSL CODE_BB8432				;$BA976A   |
CODE_BA976E:					;	   |
	PLX					;$BA976E   |
	LDY alternate_sprite			;$BA976F   |
	LDA $0002,x				;$BA9771   |
	STA $004A,y				;$BA9774   |
	LDA $0004,x				;$BA9777   |
	STA $004C,y				;$BA977A   |
	LDA $0006,x				;$BA977D   |
	STA $0024,y				;$BA9780   |
	LDA $0008,x				;$BA9783   |
	STA $002A,y				;$BA9786   |
	LDA $000A,x				;$BA9789   |
	STA $0046,y				;$BA978C   |
	LDA $000C,x				;$BA978F   |
	STA $0042,y				;$BA9792   |
	RTS					;$BA9795  /

king_zing_ring_zinger_sprite_code:
	LDA.l $000652				;$BA9796  \
	BEQ CODE_BA97AE				;$BA979A   |
	LDY current_sprite			;$BA979C   |
	LDA $0054,y				;$BA979E   |
	STA $8E					;$BA97A1   |
	LDA $002E,y				;$BA97A3   |
	AND #$00FF				;$BA97A6   |
	ASL A					;$BA97A9   |
	TAX					;$BA97AA   |
	JMP (DATA_BA97B5,x)			;$BA97AB  /

CODE_BA97AE:
	JSL delete_sprite_handle_deallocation	;$BA97AE  \
	BRL CODE_BA97F0				;$BA97B2  /

DATA_BA97B5:
	dw CODE_BA97BF
	dw CODE_BA97F3
	dw CODE_BA982C
	dw CODE_BA98A5
	dw CODE_BA98C4


CODE_BA97BF:
	TYX					;$BA97BF  \
	INC $2E,x				;$BA97C0   |
	LDA $12,x				;$BA97C2   |
	AND #$CFFF				;$BA97C4   |
	ORA #$2000				;$BA97C7   |
	STA $12,x				;$BA97CA   |
	LDA #$00D4				;$BA97CC   |
	STA $02,x				;$BA97CF   |
	LDA #$000A				;$BA97D1   |
	STA $52,x				;$BA97D4   |
	LDA #$0001				;$BA97D6   |
	STA $4C,x				;$BA97D9   |
	LDA #$C000				;$BA97DB   |
	STA $1C,x				;$BA97DE   |
	LDY $0654				;$BA97E0   |
	LDA $0006,y				;$BA97E3   |
	STA $06,x				;$BA97E6   |
	LDA $000A,y				;$BA97E8   |
	STA $0A,x				;$BA97EB   |
	JSR CODE_BA9884				;$BA97ED   |
CODE_BA97F0:					;	   |
	JML [$05A9]				;$BA97F0  /

CODE_BA97F3:
	TYX					;$BA97F3  \
	DEC $1E,x				;$BA97F4   |
	BNE CODE_BA97F0				;$BA97F6   |
	LDA #$067B				;$BA97F8   |
	JSL queue_sound_effect			;$BA97FB   |
	LDX current_sprite			;$BA97FF   |
	INC $2E,x				;$BA9801   |
	STZ $1C,x				;$BA9803   |
	STZ $32,x				;$BA9805   |
	LDA #$0120				;$BA9807   |
	STA $30,x				;$BA980A   |
	JSR CODE_BA9884				;$BA980C   |
	LDY.w #DATA_FF16BA			;$BA980F   |
	JSL CODE_BB8432				;$BA9812   |
	LDA #$0242				;$BA9816   |
	JSL CODE_B9D09B				;$BA9819   |
	LDX alternate_sprite			;$BA981D   |
	INC $02,x				;$BA981F   |
	LDA.l $0006A5				;$BA9821   |
	AND #$EFFF				;$BA9825   |
	STA $0006A5				;$BA9828   |
CODE_BA982C:					;	   |
	INC $071F				;$BA982C   |
	LDA #$0118				;$BA982F   |
	JSL check_throwable_collision_global	;$BA9832   |
	BCS CODE_BA9845				;$BA9836   |
	JSL CODE_BCFB58				;$BA9838   |
	LDA #$5000				;$BA983C   |
	JSL CODE_B6CF65				;$BA983F   |
	BCC CODE_BA987A				;$BA9843   |
CODE_BA9845:					;	   |
	BNE CODE_BA987A				;$BA9845   |
	DEC $4C,x				;$BA9847   |
	BNE CODE_BA987A				;$BA9849   |
	LDA #$0199				;$BA984B   |
	JSL defeat_sprite_using_anim_global	;$BA984E   |
	LDA #$050E				;$BA9852   |
	JSL queue_sound_effect			;$BA9855   |
	LDX $6A					;$BA9859   |
	LDA #$0100				;$BA985B   |
	BIT $12,x				;$BA985E   |
	BVC CODE_BA9865				;$BA9860   |
	LDA #$FF00				;$BA9862   |
CODE_BA9865:					;	   |
	LDX current_sprite			;$BA9865   |
	STA $26,x				;$BA9867   |
	STA $20,x				;$BA9869   |
	LDA #$F800				;$BA986B   |
	STA $24,x				;$BA986E   |
	LDA #$0004				;$BA9870   |
	STA $52,x				;$BA9873   |
	INC $2E,x				;$BA9875   |
	JML [$05A9]				;$BA9877  /

CODE_BA987A:
	JSR CODE_BA9884				;$BA987A  \
	JSL CODE_B9D100				;$BA987D   |
	JML [$05A9]				;$BA9881  /

CODE_BA9884:
	LDY $0654				;$BA9884  \
	LDX current_sprite			;$BA9887   |
	LDA $0006,y				;$BA9889   |
	STA $42,x				;$BA988C   |
	LDA $000A,y				;$BA988E   |
	STA $44,x				;$BA9891   |
	LDA $004C,y				;$BA9893   |
	CLC					;$BA9896   |
	ADC $4A,x				;$BA9897   |
	STA $46,x				;$BA9899   |
	LDA $004E,y				;$BA989B   |
	STA $48,x				;$BA989E   |
	JSL process_current_movement		;$BA98A0   |
	RTS					;$BA98A4  /

CODE_BA98A5:
	JSL process_current_movement		;$BA98A5  \
	JSL CODE_B9D100				;$BA98A9   |
	JSL CODE_BBBB69				;$BA98AD   |
	BCC CODE_BA98C1				;$BA98B1   |
	LDX current_sprite			;$BA98B3   |
	LDA #$C000				;$BA98B5   |
	STA $1C,x				;$BA98B8   |
	INC $2E,x				;$BA98BA   |
	LDA #$0168				;$BA98BC   |
	STA $4C,x				;$BA98BF   |
CODE_BA98C1:					;	   |
	JML [$05A9]				;$BA98C1  /

CODE_BA98C4:
	TYX					;$BA98C4  \
	LDA.l $0006A5				;$BA98C5   |
	BIT #$1000				;$BA98C9   |
	BNE CODE_BA98E0				;$BA98CC   |
	DEC $4C,x				;$BA98CE   |
	BNE CODE_BA98DD				;$BA98D0   |
	STZ $2E,x				;$BA98D2   |
	INC $1E,x				;$BA98D4   |
	LDA #$0240				;$BA98D6   |
	JSL set_sprite_animation		;$BA98D9   |
CODE_BA98DD:					;	   |
	JML [$05A9]				;$BA98DD  /

CODE_BA98E0:
	JSL delete_sprite_handle_deallocation	;$BA98E0  \
	BRA CODE_BA98DD				;$BA98E4  /

DATA_BA98E6:
	db $04, $00, $EA, $FF, $DD, $FF, $80, $FF
	db $00, $00, $02, $00, $51, $00, $19, $00
	db $F2, $FF, $C0, $FF, $00, $00, $02, $00
	db $51, $00, $FC, $FF, $E7, $FF, $A0, $FF
	db $00, $00, $02, $00, $51, $00, $14, $00
	db $E2, $FF, $A0, $FF, $00, $00, $02, $00
	db $51, $00

DATA_BA9918:
	db $03, $00, $00, $00, $D6, $FF, $80, $FF
	db $00, $00, $02, $00, $51, $00, $E7, $FF
	db $F2, $FF, $C0, $FF, $00, $00, $01, $00
	db $51, $00, $00, $00, $FA, $FF, $A0, $FF
	db $00, $00, $01, $00, $51, $00

king_zing_smoke_effect_sprite_code:
	LDX $0654				;$BA993E  \
	LDA $2E,x				;$BA9941   |
	BIT #$8000				;$BA9943   |
	BEQ CODE_BA994E				;$BA9946   |
	JSL delete_sprite_no_deallocation	;$BA9948   |
	BRA CODE_BA99A6				;$BA994C  /

CODE_BA994E:
	LDX current_sprite			;$BA994E  \
	LDY $48,x				;$BA9950   |
	BEQ CODE_BA995C				;$BA9952   |
	LDA $0042,y				;$BA9954   |
	BEQ CODE_BA9964				;$BA9957   |
	BRL CODE_BA99A6				;$BA9959  /

CODE_BA995C:
	LDA $42,x				;$BA995C  \
	BEQ CODE_BA9979				;$BA995E   |
	DEC $42,x				;$BA9960   |
	BNE CODE_BA99A6				;$BA9962   |
CODE_BA9964:					;	   |
	STZ $1C,x				;$BA9964   |
	LDY $0654				;$BA9966   |
	LDA $0006,y				;$BA9969   |
	CLC					;$BA996C   |
	ADC $4A,x				;$BA996D   |
	STA $06,x				;$BA996F   |
	LDA $000A,y				;$BA9971   |
	CLC					;$BA9974   |
	ADC $4C,x				;$BA9975   |
	STA $0A,x				;$BA9977   |
CODE_BA9979:					;	   |
	LDA $44,x				;$BA9979   |
	JSL interpolate_x_velocity_global	;$BA997B   |
	LDX current_sprite			;$BA997F   |
	LDA $46,x				;$BA9981   |
	JSL interpolate_y_velocity_global	;$BA9983   |
	JSL apply_position_from_velocity_global	;$BA9987   |
	LDX current_sprite			;$BA998B   |
	LDY $48,x				;$BA998D   |
	BEQ CODE_BA99A2				;$BA998F   |
	LDA $0012,y				;$BA9991   |
	STA $12,x				;$BA9994   |
	LDA $001A,y				;$BA9996   |
	STA $1A,x				;$BA9999   |
	LDA $0016,y				;$BA999B   |
	STA $16,x				;$BA999E   |
	BRA CODE_BA99A6				;$BA99A0  /

CODE_BA99A2:
	JSL CODE_B9D100				;$BA99A2  \
CODE_BA99A6:					;	   |
	JML [$05A9]				;$BA99A6  /

	%offset(DATA_BA99A7, -2)
DATA_BA99A9:
	db $E7, $FF, $FE, $FF, $13, $00, $15, $00

king_zing_stinger_sprite_code:
	PHB					;$BA99B1  \
	PHK					;$BA99B2   |
	PLB					;$BA99B3   |
	LDA.l $000652				;$BA99B4   | Get king zing hit points
	BNE .CODE_BA99BD			;$BA99B8   |
	BRL CODE_BA9A71				;$BA99BA  /

.CODE_BA99BD:
	LDX $0654				;$BA99BD  \ Get index of king zing sprite
	LDA $2E,x				;$BA99C0   | Get king zing state
	BIT #$0200				;$BA99C2   |
	BNE CODE_BA9A24				;$BA99C5   |
	JSL CODE_BCFB58				;$BA99C7   | Else populate sprite clipping
	LDA #$0000				;$BA99CB   | Load collision flags
	JSL CODE_B6CF65				;$BA99CE   | Check complex player collision
	LDX $0656				;$BA99D2   | Get index of self
	LDY #DATA_BA99A7			;$BA99D5   |
	JSL CODE_B6E736				;$BA99D8   |
	LDA #$0200				;$BA99DC   |
	LDY #$0000				;$BA99DF   |
	JSL CODE_BA9016				;$BA99E2   |
	BCC CODE_BA9A22				;$BA99E6   |
	LDA.l $000656				;$BA99E8   | Get index of self
	CMP $6A					;$BA99EC   | Check if its the current colliding sprite
	BEQ CODE_BA9A22				;$BA99EE   | If yes
	LDX $6A					;$BA99F0   | Else get current colliding sprite
	LDA $2E,x				;$BA99F2   |
	CMP #$0001				;$BA99F4   | Check if its in state 1
	BEQ CODE_BA9A22				;$BA99F7   | If yes
	JSL CODE_B6FE9E				;$BA99F9   | Else spawn hit star sprite
	LDX current_sprite			;$BA99FD   | Get stinger sprite
	LDA $32,x				;$BA99FF   |
	ORA #$0008				;$BA9A01   | Set some flag
	STA $32,x				;$BA9A04   |
	LDX $6A					;$BA9A06   | Get current colliding sprite (should be squawks egg)
	LDA #$0001				;$BA9A08   |
	STA $2E,x				;$BA9A0B   | Set its state to 1
	LDA #$FC00				;$BA9A0D   |
	STA $24,x				;$BA9A10   | Set current Y velocity
	LDA $DB					;$BA9A12   |
	CMP $E3					;$BA9A14   |
	BMI CODE_BA9A20				;$BA9A16   |
	LDA $20,x				;$BA9A18   | Get current X velocity
	EOR #$FFFF				;$BA9A1A   |
	INC A					;$BA9A1D   | Invert and update it
	STA $20,x				;$BA9A1E   | 
CODE_BA9A20:					;	   |
	STZ $26,x				;$BA9A20   | Clear target X velocity
CODE_BA9A22:					;	   |
	BRA CODE_BA9A55				;$BA9A22  /

CODE_BA9A24:
	LDX $0654				;$BA9A24  \ Get index of king zing sprite
	LDA.l $000765				;$BA9A27   |
	BNE CODE_BA9A71				;$BA9A2B   |
	BRL CODE_BA9A71				;$BA9A2D  /

;dead code? looks like it would apply the knockback interaction to the player on collision
	LDX current_sprite			;$BA9A30   |
	JSL CODE_BCFB58				;$BA9A32   |
	LDA #$0C7B				;$BA9A36   |
	JSL CODE_B6CF65				;$BA9A39   |
	BCC CODE_BA9A71				;$BA9A3D   |
	LDA #$001E				;$BA9A3F   |
	LDY #$FE00				;$BA9A42   |
	JSL CODE_B3A600				;$BA9A45   |
	LDX $0654				;$BA9A49   |
	LDA #$0014				;$BA9A4C   |
	STA $000765				;$BA9A4F   |
	BRA CODE_BA9A71				;$BA9A53  /

CODE_BA9A55:
	LDY $0654				;$BA9A55  \ Get index of king zing sprite
	LDA $002E,y				;$BA9A58   |
	BIT #$0001				;$BA9A5B   |
	BNE CODE_BA9A71				;$BA9A5E   |
	LDX current_sprite			;$BA9A60   | Get stinger sprite
	LDA.l $000765				;$BA9A62   |
	BNE CODE_BA9A71				;$BA9A66   |
	LDA $32,x				;$BA9A68   |
	BEQ CODE_BA9A71				;$BA9A6A   |
	STZ $32,x				;$BA9A6C   |
	JSR CODE_BA9502				;$BA9A6E   |
CODE_BA9A71:					;	   |
	DEC $0755				;$BA9A71   |
	BNE CODE_BA9A96				;$BA9A74   |
	LDA #$000A				;$BA9A76   |
	STA $000755				;$BA9A79   |
	LDY $0757				;$BA9A7D   |
	LDA $0000,y				;$BA9A80   |
	INY					;$BA9A83   |
	INY					;$BA9A84   |
	CPY #DATA_BA9324			;$BA9A85   |
	BNE CODE_BA9A8D				;$BA9A88   |
	LDY #DATA_BA9318			;$BA9A8A   |
CODE_BA9A8D:					;	   |
	STY $0757				;$BA9A8D   |
	LDX current_sprite			;$BA9A90   |
	JSL set_sprite_palette_global		;$BA9A92   |
CODE_BA9A96:					;	   |
	JSL CODE_B9D100				;$BA9A96   | Process animation
	PLB					;$BA9A9A   |
	JML [$05A9]				;$BA9A9B  / Done processing sprite

king_zing_spikes_sprite_code:
	LDX current_sprite			;$BA9A9E  \
	LDA $42,x				;$BA9AA0   |
	JSL interpolate_x_velocity_global	;$BA9AA2   |
	LDX current_sprite			;$BA9AA6   |
	LDA $44,x				;$BA9AA8   |
	JSL interpolate_y_velocity_global	;$BA9AAA   |
	LDX $0654				;$BA9AAE   |
	LDA $2E,x				;$BA9AB1   |
	BIT #$2000				;$BA9AB3   |
	BEQ CODE_BA9AC9				;$BA9AB6   |
	JSL CODE_BCFB58				;$BA9AB8   |
	LDA #$0000				;$BA9ABC   |
	JSL CODE_B6CF65				;$BA9ABF   |
	JSL apply_position_from_velocity_global	;$BA9AC3   |
	BRA CODE_BA9ACD				;$BA9AC7  /

CODE_BA9AC9:
	JSL CODE_B8D5E0				;$BA9AC9  \
CODE_BA9ACD:					;	   |
	LDX current_sprite			;$BA9ACD   |
	LDA $1E,x				;$BA9ACF   |
	BIT #$0007				;$BA9AD1   |
	BEQ CODE_BA9ADC				;$BA9AD4   |
CODE_BA9AD6:					;	   |
	JSL delete_sprite_handle_deallocation	;$BA9AD6   |
	BRA CODE_BA9B0B				;$BA9ADA  /

CODE_BA9ADC:
	LDA $20,x				;$BA9ADC  \
	ORA $24,x				;$BA9ADE   |
	BEQ CODE_BA9AD6				;$BA9AE0   |
	LDX current_sprite			;$BA9AE2   |
	LDY $0654				;$BA9AE4   |
	LDA $20,x				;$BA9AE7   |
	BNE CODE_BA9AF9				;$BA9AE9   |
	LDA $002E,y				;$BA9AEB   |
	BIT #$2000				;$BA9AEE   |
	BNE CODE_BA9AF7				;$BA9AF1   |
	INC $06,x				;$BA9AF3   |
	BRA CODE_BA9AF9				;$BA9AF5  /

CODE_BA9AF7:
	DEC $06,x				;$BA9AF7  \
CODE_BA9AF9:					;	   |
	LDA $24,x				;$BA9AF9   |
	BNE CODE_BA9B0B				;$BA9AFB   |
	LDA $002E,y				;$BA9AFD   |
	BIT #$2000				;$BA9B00   |
	BNE CODE_BA9B09				;$BA9B03   |
	INC $0A,x				;$BA9B05   |
	BRA CODE_BA9B0B				;$BA9B07  /

CODE_BA9B09:
	DEC $0A,x				;$BA9B09  \
CODE_BA9B0B:					;	   |
	JML [$05A9]				;$BA9B0B  /

CODE_BA9B0E:
	JSR CODE_BA9B16				;$BA9B0E  \
	LDA $44,x				;$BA9B11   |
	BEQ CODE_BA9B0E				;$BA9B13   |
	RTS					;$BA9B15  /

CODE_BA9B16:
	PHB					;$BA9B16  \
	LDA #$B600				;$BA9B17   |
	PHA					;$BA9B1A   |
	PLB					;$BA9B1B   |
	PLB					;$BA9B1C   |
	LDY $46,x				;$BA9B1D   |
	LDA $0000,y				;$BA9B1F   |
	ASL A					;$BA9B22   |
	ASL A					;$BA9B23   |
	PHY					;$BA9B24   |
	TAY					;$BA9B25   |
	LDA.w DATA_B6B69F,y			;$BA9B26   |
	STA $46,x				;$BA9B29   |
	LDA.w DATA_B6B6A1,y			;$BA9B2B   |
	STA $44,x				;$BA9B2E   |
	PLY					;$BA9B30   |
	INY					;$BA9B31   |
	INY					;$BA9B32   |
	JSL CODE_B6B697				;$BA9B33   |
	PLB					;$BA9B37   |
	LDX current_sprite			;$BA9B38   |
	STY $46,x				;$BA9B3A   |
	RTS					;$BA9B3C  /

kreepy_krows_body_sprite_code:
	PHB					;$BA9B3D  \
	PHK					;$BA9B3E   |
	PLB					;$BA9B3F   |
	LDX current_sprite			;$BA9B40   |
	LDX current_sprite			;$BA9B42   |
	LDA $42,x				;$BA9B44   |
	BNE CODE_BA9B91				;$BA9B46   |
	JSL CODE_B4AEAF				;$BA9B48   |
	STZ $04,x				;$BA9B4C   |
	STZ $32,x				;$BA9B4E   |
	STZ $06A1				;$BA9B50   |
	STZ $06A3				;$BA9B53   |
	STZ $06A5				;$BA9B56   |
	STZ $0707				;$BA9B59   |
	STZ $0701				;$BA9B5C   |
	STZ $0703				;$BA9B5F   |
	STZ $06FB				;$BA9B62   |
	LDA #$0010				;$BA9B65   |
	STA $2E,x				;$BA9B68   |
	LDA #DATA_B6AFE7			;$BA9B6A   |
	STA $00065A				;$BA9B6D   |
	LDA #$0003				;$BA9B71   |
	STA $000652				;$BA9B74   |
	LDY #$009E				;$BA9B78   |
	JSL CODE_BB842C				;$BA9B7B   |
	LDA alternate_sprite			;$BA9B7F   |
	LDX current_sprite			;$BA9B81   |
	STX $0654				;$BA9B83   |
	STA $000656				;$BA9B86   |
	STA $42,x				;$BA9B8A   |
	STZ $44,x				;$BA9B8C   |
	JSR CODE_BA9B0E				;$BA9B8E   |
CODE_BA9B91:					;	   |
	LDA.l $000652				;$BA9B91   |
	BNE CODE_BA9B9A				;$BA9B95   |
	BRL CODE_BA9FA0				;$BA9B97  /

CODE_BA9B9A:
	LDX current_sprite			;$BA9B9A  \
	LDA $32,x				;$BA9B9C   |
	BEQ CODE_BA9BA5				;$BA9B9E   |
	STZ $32,x				;$BA9BA0   |
	JSR CODE_BA9C64				;$BA9BA2   |
CODE_BA9BA5:					;	   |
	LDA $2E,x				;$BA9BA5   |
	BIT #$0200				;$BA9BA7   |
	BEQ CODE_BA9BDD				;$BA9BAA   |
	LDA $04,x				;$BA9BAC   |
	BEQ CODE_BA9BB5				;$BA9BAE   |
	DEC $04,x				;$BA9BB0   |
	BRL CODE_BA9BF1				;$BA9BB2  /

CODE_BA9BB5:
	JSL CODE_BCFB58				;$BA9BB5  \
	LDA #$007B				;$BA9BB9   |
	JSL CODE_B6CF65				;$BA9BBC   |
	BCC CODE_BA9BF1				;$BA9BC0   |
	LDA #$001E				;$BA9BC2   |
	LDY #$FE00				;$BA9BC5   |
	JSL CODE_B3A600				;$BA9BC8   |
	LDX $0654				;$BA9BCC   |
	LDA $2E,x				;$BA9BCF   |
	ORA #$0200				;$BA9BD1   |
	STA $2E,x				;$BA9BD4   |
	LDA #$0014				;$BA9BD6   |
	STA $04,x				;$BA9BD9   |
	BRA CODE_BA9BF1				;$BA9BDB  /

CODE_BA9BDD:
	JSL CODE_BCFB58				;$BA9BDD  \
	LDA #$0000				;$BA9BE1   |
	JSL CODE_B6CF65				;$BA9BE4   |
	BCC CODE_BA9BF1				;$BA9BE8   |
	BEQ CODE_BA9BF1				;$BA9BEA   |
	CMP #$0002				;$BA9BEC   |
	BNE CODE_BA9BF1				;$BA9BEF   |
CODE_BA9BF1:					;	   |
	LDA $44,x				;$BA9BF1   |
	JSL CODE_B6B68F				;$BA9BF3   |
	LDX current_sprite			;$BA9BF7   |
	LDA $44,x				;$BA9BF9   |
	BNE CODE_BA9C00				;$BA9BFB   |
	JSR CODE_BA9B0E				;$BA9BFD   |
CODE_BA9C00:					;	   |
	JSR CODE_BA9D02				;$BA9C00   |
	JSR CODE_BA9E91				;$BA9C03   |
CODE_BA9C06:					;	   |
	JSL CODE_B9D100				;$BA9C06   |
	PLB					;$BA9C0A   |
	JML [$05A9]				;$BA9C0B  /

kreepy_krows_eggs_sprite_code:
	LDX active_kong_sprite			;$BA9C0E  \
	LDA $2E,x				;$BA9C11   |
	ASL A					;$BA9C13   |
	ASL A					;$BA9C14   |
	TAX					;$BA9C15   |
	LDA.l DATA_B896B7,x			;$BA9C16   |
	AND #$0040				;$BA9C1A   |
	BNE CODE_BA9C2A				;$BA9C1D   |
	JSL CODE_BCFB58				;$BA9C1F   |
	LDA #$0C18				;$BA9C23   |
	JSL CODE_B6CF65				;$BA9C26   |
CODE_BA9C2A:					;	   |
	LDX current_sprite			;$BA9C2A   |
	LDA $32,x				;$BA9C2C   |
	BEQ CODE_BA9C47				;$BA9C2E   |
	LDA #$0000				;$BA9C30   |
	PHB					;$BA9C33   | 
	PHK					;$BA9C34   |
	PLB					;$BA9C35   |
	JSR.w CODE_B6F266		 	;$BA9C36   | This code was probably from B6 krow code and got moved, would have spawned egg shell pieces
	PLB					;$BA9C39   |
	JSL delete_sprite_handle_deallocation	;$BA9C3A   | Would have deleted egg sprite and played a barrel break sound
	LDA #$041A				;$BA9C3E   | 
	JSL queue_sound_effect			;$BA9C41   |
	BRA CODE_BA9C61				;$BA9C45  /

CODE_BA9C47:
	LDA $42,x				;$BA9C47  \
	JSL interpolate_x_velocity_global	;$BA9C49   |
	LDX current_sprite			;$BA9C4D   |
	LDA $44,x				;$BA9C4F   |
	JSL interpolate_y_velocity_global	;$BA9C51   |
	JSL apply_position_from_velocity_global	;$BA9C55   |
	JSL CODE_BBBB8D				;$BA9C59   |
	JSL CODE_B9D100				;$BA9C5D   |
CODE_BA9C61:					;	   |
	JML [$05A9]				;$BA9C61  /

CODE_BA9C64:
	PHY					;$BA9C64  \
	LDX current_sprite			;$BA9C65   |
	PHX					;$BA9C67   |
	LDX $0654				;$BA9C68   |
	STX current_sprite			;$BA9C6B   |
	LDA $2E,x				;$BA9C6D   |
	ORA #$1200				;$BA9C6F   |
	AND #$FFF5				;$BA9C72   |
	STA $2E,x				;$BA9C75   |
	DEC $0652				;$BA9C77   |
	BNE CODE_BA9CA4				;$BA9C7A   |
	STZ $2E,x				;$BA9C7C   |
	LDA #$0201				;$BA9C7E   |
	JSL set_sprite_animation		;$BA9C81   |
	LDY $0656				;$BA9C85   |
	LDA #$01FC				;$BA9C88   |
	STY alternate_sprite			;$BA9C8B   |
	JSL CODE_B9D09B				;$BA9C8D   |
	LDA #DATA_BAA0B8			;$BA9C91   |
	STA $000658				;$BA9C94   |
	LDA #$000A				;$BA9C98   |
	STA $00065A				;$BA9C9B   |
	STZ $065C				;$BA9C9F   |
	BRA CODE_BA9CFD				;$BA9CA2  /

CODE_BA9CA4:
	LDA.l $000652				;$BA9CA4  \
	CMP #$0002				;$BA9CA8   |
	BEQ CODE_BA9CB2				;$BA9CAB   |
	LDA #DATA_B6B413			;$BA9CAD   |
	BRA CODE_BA9CB5				;$BA9CB0  /

CODE_BA9CB2:
	LDA #DATA_B6B1ED			;$BA9CB2  \
CODE_BA9CB5:					;	   |
	STA $46,x				;$BA9CB5   |
	STZ $1E,x				;$BA9CB7   |
	LDA #$0207				;$BA9CB9   |
	JSL set_sprite_animation		;$BA9CBC   |
	LDX $0656				;$BA9CC0   |
	STX current_sprite			;$BA9CC3   |
	STZ $1E,x				;$BA9CC5   |
	LDA #$0208				;$BA9CC7   |
	JSL set_sprite_animation		;$BA9CCA   |
	LDX $0654				;$BA9CCE   |
	STX current_sprite			;$BA9CD1   |
	LDA #DATA_B6CE3B			;$BA9CD3   |
	STA $20,x				;$BA9CD6   |
	LDA #DATA_B6CEA7			;$BA9CD8   |
	STA $22,x				;$BA9CDB   |
	LDA #$0001				;$BA9CDD   |
	STA $24,x				;$BA9CE0   |
	STA $26,x				;$BA9CE2   |
	LDY active_kong_sprite			;$BA9CE4   |
	LDA $06,x				;$BA9CE7   |
	CMP $0006,y				;$BA9CE9   |
	BCS CODE_BA9CF3				;$BA9CEC   |
	LDA #$FFFF				;$BA9CEE   |
	BRA CODE_BA9CF6				;$BA9CF1  /

CODE_BA9CF3:
	LDA #$0001				;$BA9CF3  \
CODE_BA9CF6:					;	   |
	STA $28,x				;$BA9CF6   |
	LDA #CODE_B6CEBE			;$BA9CF8   |
	STA $44,x				;$BA9CFB   |
CODE_BA9CFD:					;	   |
	PLX					;$BA9CFD   |
	STX current_sprite			;$BA9CFE   |
	PLY					;$BA9D00   |
	RTS					;$BA9D01  /

CODE_BA9D02:
	LDX $06FB				;$BA9D02  \
	BNE CODE_BA9D0A				;$BA9D05   |
	BRL CODE_BA9D96				;$BA9D07  /

CODE_BA9D0A:
	LDA $2E,x				;$BA9D0A  \
	CMP #$0005				;$BA9D0C   |
	BEQ CODE_BA9D14				;$BA9D0F   |
	BRL CODE_BA9D96				;$BA9D11  /

CODE_BA9D14:
	LDA #$0439				;$BA9D14  \
	JSL queue_sound_effect			;$BA9D17   |
	LDA #$053B				;$BA9D1B   |
	JSL queue_sound_effect			;$BA9D1E   |
	LDA #$063C				;$BA9D22   |
	JSL queue_sound_effect			;$BA9D25   |
	LDA #$073A				;$BA9D29   |
	JSL queue_sound_effect			;$BA9D2C   |
	LDY.w #DATA_FF1E74			;$BA9D30   | Spawn barrel
	JSL CODE_BB8432				;$BA9D33   |
	LDY $06FD				;$BA9D37   |
	JSL CODE_B4C175				;$BA9D3A   | Get RNG
	STA $000650				;$BA9D3E   |
	STA CPU.dividen				;$BA9D42   |
	LDA #$0003				;$BA9D45   |
	CMP $000650				;$BA9D48   |
	BCS CODE_BA9D60				;$BA9D4C   |
	SEP #$20				;$BA9D4E   |
	STA CPU.divisor				;$BA9D50   |
	REP #$20				;$BA9D53   |
	LDA #$0008				;$BA9D55   |
CODE_BA9D58:					;	   |
	DEC A					;$BA9D58   |
	BNE CODE_BA9D58				;$BA9D59   |
	LDA CPU.multiply_result			;$BA9D5B   |
	BRA CODE_BA9D64				;$BA9D5E  /

CODE_BA9D60:
	LDA.l $000650				;$BA9D60  \
CODE_BA9D64:					;	   |
	ASL A					;$BA9D64   |
	ASL A					;$BA9D65   |
	CLC					;$BA9D66   |
	ADC $0006FD				;$BA9D67   |
	TAY					;$BA9D6B   |
	PHB					;$BA9D6C   |
	%pea_mask_dbr(DATA_B6AFE7)		;$BA9D6D   |
	PLB					;$BA9D70   |
	PLB					;$BA9D71   |
	JSR CODE_BA9E84				;$BA9D72   |
	PLB					;$BA9D75   |
	STZ $32,x				;$BA9D76   |
	STX $0707				;$BA9D78   |
	LDA $12,x				;$BA9D7B   |
	AND #$CFFF				;$BA9D7D   |
	ORA #$3000				;$BA9D80   |
	STA $12,x				;$BA9D83   |
	STX current_sprite			;$BA9D85   |
	LDY.w #DATA_FF1E58			;$BA9D87   |
	JSL CODE_BB8432				;$BA9D8A   |
	LDX $0654				;$BA9D8E   |
	STX current_sprite			;$BA9D91   |
	STZ $06FB				;$BA9D93   |
CODE_BA9D96:					;	   |
	LDX current_sprite			;$BA9D96   |
	LDA $2E,x				;$BA9D98   |
	BIT #$0001				;$BA9D9A   |
	BNE CODE_BA9DA2				;$BA9D9D   |
	BRL CODE_BA9E83				;$BA9D9F  /

CODE_BA9DA2:
	LDA.l $000658				;$BA9DA2  \
	BEQ CODE_BA9DAE				;$BA9DA6   |
	DEC $0658				;$BA9DA8   |
	BRL CODE_BA9E83				;$BA9DAB  /

CODE_BA9DAE:
	LDY $06F7				;$BA9DAE  \
	LDA $0000,y				;$BA9DB1   |
	ASL A					;$BA9DB4   |
	CLC					;$BA9DB5   |
	ADC #DATA_BAA134			;$BA9DB6   |
	TAX					;$BA9DB9   |
	LDA $0002,y				;$BA9DBA   |
	STA $0006F5				;$BA9DBD   |
	INY					;$BA9DC1   |
	INY					;$BA9DC2   |
	INY					;$BA9DC3   |
	INY					;$BA9DC4   |
	STY $06F7				;$BA9DC5   |
	LDY $0000,x				;$BA9DC8   |
	PHY					;$BA9DCB   |
	LDA $0010,y				;$BA9DCC   |
	BMI CODE_BA9DD6				;$BA9DCF   |
	LDY.w #DATA_FF1E32			;$BA9DD1   |
	BRA CODE_BA9DD9				;$BA9DD4  /

CODE_BA9DD6:
	LDY.w #DATA_FF1E0C			;$BA9DD6  \
CODE_BA9DD9:					;	   |
	JSL CODE_BB8432				;$BA9DD9   |
	PLX					;$BA9DDD   |
	LDY alternate_sprite			;$BA9DDE   |
	LDA $0000,x				;$BA9DE0   |
	STA $0006,y				;$BA9DE3   |
	LDA $0002,x				;$BA9DE6   |
	STA $000A,y				;$BA9DE9   |
	LDA $0004,x				;$BA9DEC   |
	STA $0046,y				;$BA9DEF   |
	LDA $0006,x				;$BA9DF2   |
	STA $0026,y				;$BA9DF5   |
	LDA $0008,x				;$BA9DF8   |
	STA $000C,y				;$BA9DFB   |
	LDA $000A,x				;$BA9DFE   |
	STA $000E,y				;$BA9E01   |
	LDA $000C,x				;$BA9E04   |
	STA $0022,y				;$BA9E07   |
	LDA $000E,x				;$BA9E0A   |
	STA $0028,y				;$BA9E0D   |
	LDA $0010,x				;$BA9E10   |
	STA $0020,y				;$BA9E13   |
	LDA $0012,x				;$BA9E16   |
	STA $004E,y				;$BA9E19   |
	LDA $0014,x				;$BA9E1C   |
	STA $0050,y				;$BA9E1F   |
	LDA #$0001				;$BA9E22   |
	STA $002E,y				;$BA9E25   |
	LDA.l $0006F9				;$BA9E28   |
	BNE CODE_BA9E4D				;$BA9E2C   |
	LDA $0012,y				;$BA9E2E   |
	AND #$CFFF				;$BA9E31   |
	ORA #$3000				;$BA9E34   |
	STA $0012,y				;$BA9E37   |
	STY $06FB				;$BA9E3A   |
	STY current_sprite			;$BA9E3D   |
	LDX $0654				;$BA9E3F   |
	STX current_sprite			;$BA9E42   |
	LDA #$0532				;$BA9E44   |
	JSL queue_sound_effect			;$BA9E47   |
	BRA CODE_BA9E68				;$BA9E4B  /

CODE_BA9E4D:
	LDA $0012,y				;$BA9E4D  \
	AND #$CFFF				;$BA9E50   |
	ORA #$1000				;$BA9E53   |
	STA $0012,y				;$BA9E56   |
	TYX					;$BA9E59   |
	LDA #$0061				;$BA9E5A   |
	JSL set_sprite_palette_global		;$BA9E5D   |
	LDA #$0532				;$BA9E61   |
	JSL queue_sound_effect			;$BA9E64   |
CODE_BA9E68:					;	   |
	DEC $06F9				;$BA9E68   |
	DEC $06F3				;$BA9E6B   |
	BEQ CODE_BA9E7A				;$BA9E6E   |
	LDA.l $0006F5				;$BA9E70   |
	STA $000658				;$BA9E74   |
	BRA CODE_BA9E83				;$BA9E78  /

CODE_BA9E7A:
	LDX current_sprite			;$BA9E7A  \
	LDA $2E,x				;$BA9E7C   |
	AND #$FFFE				;$BA9E7E   |
	STA $2E,x				;$BA9E81   |
CODE_BA9E83:					;	   |
	RTS					;$BA9E83  /

CODE_BA9E84:
	LDX alternate_sprite			;$BA9E84  \
	LDA $0000,y				;$BA9E86   |
	STA $06,x				;$BA9E89   |
	LDA $0002,y				;$BA9E8B   |
	STA $0A,x				;$BA9E8E   |
	RTS					;$BA9E90  /

CODE_BA9E91:
	LDY active_kong_sprite			;$BA9E91  \
	LDA $000A,y				;$BA9E94   |
	CMP #$0378				;$BA9E97   |
	BCC CODE_BA9EBE				;$BA9E9A   |
	CMP #$0608				;$BA9E9C   |
	BCC CODE_BA9F1F				;$BA9E9F   |
	CMP #$08B0				;$BA9EA1   |
	BCC CODE_BA9EBE				;$BA9EA4   |
	CMP #$0AAB				;$BA9EA6   |
	BCC CODE_BA9EE8				;$BA9EA9   |
	CMP #$0AE2				;$BA9EAB   |
	BCC CODE_BA9ECD				;$BA9EAE   |
	CMP #$0B80				;$BA9EB0   |
	BCC CODE_BA9EB6				;$BA9EB3   |
	RTS					;$BA9EB5  /

CODE_BA9EB6:
	LDA #$0050				;$BA9EB6  \
	STA $000701				;$BA9EB9   |
	RTS					;$BA9EBD  /

CODE_BA9EBE:
	LDA #$0050				;$BA9EBE  \
	STA $000701				;$BA9EC1   |
	LDA #$0014				;$BA9EC5   |
	STA $000703				;$BA9EC8   |
	RTS					;$BA9ECC  /

CODE_BA9ECD:
	LDX current_sprite			;$BA9ECD  \
	LDA $2E,x				;$BA9ECF   |
	BIT #$0004				;$BA9ED1   |
	BNE CODE_BA9EE7				;$BA9ED4   |
	JSR CODE_BA9EEE				;$BA9ED6   |
	LDA #$020A				;$BA9ED9   |
	STA $06,x				;$BA9EDC   |
	LDX current_sprite			;$BA9EDE   |
	LDA $2E,x				;$BA9EE0   |
	ORA #$0004				;$BA9EE2   |
	STA $2E,x				;$BA9EE5   |
CODE_BA9EE7:					;	   |
	RTS					;$BA9EE7  /

CODE_BA9EE8:
	LDA.l $000701				;$BA9EE8  \
	BNE CODE_BA9F1B				;$BA9EEC   |
CODE_BA9EEE:					;	   |
	JSR CODE_BA9F8C				;$BA9EEE   |
	LDA $0006,y				;$BA9EF1   |
	STA $06,x				;$BA9EF4   |
	LDA $17C0				;$BA9EF6   |
	SEC					;$BA9EF9   |
	SBC #$0020				;$BA9EFA   |
	STA $0A,x				;$BA9EFD   |
	LDA #$0200				;$BA9EFF   |
	STA $24,x				;$BA9F02   |
	LDA #$0280				;$BA9F04   |
	STA $2A,x				;$BA9F07   |
	STZ $20,x				;$BA9F09   |
	STZ $26,x				;$BA9F0B   |
	STZ $42,x				;$BA9F0D   |
	LDA #$0002				;$BA9F0F   |
	STA $44,x				;$BA9F12   |
	LDA #$0064				;$BA9F14   |
	STA $000701				;$BA9F17   |
CODE_BA9F1B:					;	   |
	DEC $0701				;$BA9F1B   |
	RTS					;$BA9F1E  /

CODE_BA9F1F:
	LDA.l $000701				;$BA9F1F  \
	BNE CODE_BA9F52				;$BA9F23   |
	JSR CODE_BA9F8C				;$BA9F25   |
	LDA $0006,y				;$BA9F28   |
	STA $06,x				;$BA9F2B   |
	LDA $17C0				;$BA9F2D   |
	SEC					;$BA9F30   |
	SBC #$0020				;$BA9F31   |
	STA $0A,x				;$BA9F34   |
	LDA #$0200				;$BA9F36   |
	STA $24,x				;$BA9F39   |
	LDA #$0280				;$BA9F3B   |
	STA $2A,x				;$BA9F3E   |
	STZ $20,x				;$BA9F40   |
	STZ $26,x				;$BA9F42   |
	STZ $42,x				;$BA9F44   |
	LDA #$0002				;$BA9F46   |
	STA $44,x				;$BA9F49   |
	LDA #$0064				;$BA9F4B   |
	STA $000701				;$BA9F4E   |
CODE_BA9F52:					;	   |
	DEC $0701				;$BA9F52   |
	LDA.l $000703				;$BA9F55   |
	BNE CODE_BA9F88				;$BA9F59   |
	JSR CODE_BA9F8C				;$BA9F5B   |
	LDA $000A,y				;$BA9F5E   |
	STA $0A,x				;$BA9F61   |
	LDA $17BA				;$BA9F63   |
	SEC					;$BA9F66   |
	SBC #$0020				;$BA9F67   |
	STA $06,x				;$BA9F6A   |
	LDA #$0200				;$BA9F6C   |
	STA $20,x				;$BA9F6F   |
	LDA #$0280				;$BA9F71   |
	STA $26,x				;$BA9F74   |
	STZ $24,x				;$BA9F76   |
	STZ $2A,x				;$BA9F78   |
	LDA #$0002				;$BA9F7A   |
	STA $42,x				;$BA9F7D   |
	STZ $44,x				;$BA9F7F   |
	LDA #$0064				;$BA9F81   |
	STA $000703				;$BA9F84   |
CODE_BA9F88:					;	   |
	DEC $0703				;$BA9F88   |
	RTS					;$BA9F8B  /


;spawns a kreepy krow egg and plays the egg fall sound
CODE_BA9F8C:
	LDA #$0565				;$BA9F8C  \
	JSL queue_sound_effect			;$BA9F8F   |
	LDY #$00A4				;$BA9F93   |
	JSL CODE_BB842C				;$BA9F96   |
	LDX alternate_sprite			;$BA9F9A   |
	LDY active_kong_sprite			;$BA9F9C   |
	RTS					;$BA9F9F  /

CODE_BA9FA0:
	LDA.l $00065C				;$BA9FA0  \
	ASL A					;$BA9FA4   |
	TXY					;$BA9FA5   |
	TAX					;$BA9FA6   |
	JMP (DATA_BA9FAA,x)			;$BA9FA7  /

DATA_BA9FAA:
	dw CODE_BA9FB0
	dw CODE_BAA023
	dw CODE_BAA08E


CODE_BA9FB0:
	TYX					;$BA9FB0  \
	DEC $065A				;$BA9FB1   |
	BNE CODE_BA9FDF				;$BA9FB4   |
	LDA #$000A				;$BA9FB6   |
	STA $00065A				;$BA9FB9   |
	LDY $0658				;$BA9FBD   |
	LDA $0002,y				;$BA9FC0   |
	BEQ CODE_BA9FE2				;$BA9FC3   |
	PHY					;$BA9FC5   |
	JSL set_sprite_palette_global		;$BA9FC6   |
	PLY					;$BA9FCA   |
	LDX $0656				;$BA9FCB   |
	LDA $0000,y				;$BA9FCE   |
	PHY					;$BA9FD1   |
	JSL set_sprite_palette_global		;$BA9FD2   |
	PLA					;$BA9FD6   |
	CLC					;$BA9FD7   |
	ADC #$0004				;$BA9FD8   |
	STA $000658				;$BA9FDB   |
CODE_BA9FDF:					;	   |
	BRL CODE_BA9C06				;$BA9FDF  /

CODE_BA9FE2:
	INC $065C				;$BA9FE2  \
	LDA #$057C				;$BA9FE5   | play kreepy krow destroyed sound effect
	JSL queue_sound_effect			;$BA9FE8   |
	LDY #$0138				;$BA9FEC   |
	JSL CODE_BB842C				;$BA9FEF   |
	LDY #$019C				;$BA9FF3   |
	JSL CODE_BB842C				;$BA9FF6   |
	LDY #$019E				;$BA9FFA   |
	JSL CODE_BB842C				;$BA9FFD   |
	LDY #$01A0				;$BAA001   |
	JSL CODE_BB842C				;$BAA004   |
	LDY #$013C				;$BAA008   |
	JSL CODE_BB842C				;$BAA00B   |
	LDX $0654				;$BAA00F   | get index of body sprite
	LDA #$C000				;$BAA012   | 
	STA $1C,x				;$BAA015   | make it invisible
	STZ $3A,x				;$BAA017   |
	LDX $0656				;$BAA019   | get index of head sprite
	STA $1C,x				;$BAA01C   | make it invisible
	STZ $3A,x				;$BAA01E   |
	STZ $0658				;$BAA020   |
CODE_BAA023:					;	   |
	LDY #$013A				;$BAA023   |
	JSL CODE_BB8412				;$BAA026   |
	LDX $0654				;$BAA02A   |
	LDY alternate_sprite			;$BAA02D   |
	LDA $06,x				;$BAA02F   |
	STA $0006,y				;$BAA031   |
	LDA $0A,x				;$BAA034   |
	STA $000A,y				;$BAA036   |
	LDX $0658				;$BAA039   |
	LDA.l DATA_BAC8AB,x			;$BAA03C   |
	STA $0020,y				;$BAA040   |
	LDA.l DATA_BAC8AD,x			;$BAA043   |
	STA $0026,y				;$BAA047   |
	LDA.l DATA_BAC8AF,x			;$BAA04A   |
	STA $0024,y				;$BAA04E   |
	LDA.l DATA_BAC8B1,x			;$BAA051   |
	STA $002A,y				;$BAA055   |
	LDA.l DATA_BAC8B3,x			;$BAA058   |
	AND #$00FF				;$BAA05C   |
	STA $0042,y				;$BAA05F   |
	LDA.l DATA_BAC8B4,x			;$BAA062   |
	AND #$00FF				;$BAA066   |
	STA $0044,y				;$BAA069   |
	LDA.l DATA_BAC8B5,x			;$BAA06C   |
	STA $003A,y				;$BAA070   |
	TXA					;$BAA073   |
	CLC					;$BAA074   |
	ADC #$000C				;$BAA075   |
	TAX					;$BAA078   |
	LDA.l DATA_BAC8AB,x			;$BAA079   |
	CMP #$0001				;$BAA07D   |
	BNE CODE_BAA0B2				;$BAA080   |
	LDA #$0078				;$BAA082   |
	STA $00065A				;$BAA085   |
	LDX current_sprite			;$BAA089   |
	INC $065C				;$BAA08B   |
CODE_BAA08E:					;	   |
	LDA.l $00065A				;$BAA08E   |
	BEQ CODE_BAA099				;$BAA092   |
	DEC $065A				;$BAA094   |
	BNE CODE_BAA0AF				;$BAA097   |
CODE_BAA099:					;	   |
	LDX active_kong_sprite			;$BAA099   |
	LDA $1E,x				;$BAA09C   |
	LSR A					;$BAA09E   |
	BCC CODE_BAA0AF				;$BAA09F   |
	DEC $065A				;$BAA0A1   |
	JSL set_current_level_as_cleared	;$BAA0A4   |
	LDA #$0027				;$BAA0A8   |
	JSL set_player_interaction_global	;$BAA0AB   |
CODE_BAA0AF:					;	   |
	BRL CODE_BA9C06				;$BAA0AF  /

CODE_BAA0B2:
	STX $0658				;$BAA0B2  \
	BRL CODE_BA9C06				;$BAA0B5  /


;kreepy krow death flash palette ID's
DATA_BAA0B8:
	dw $00B8
	dw $00B9
	dw $0082
	dw $0083
	dw $00B8
	dw $00B9
	dw $0082
	dw $0083
	dw $0084
	dw $0085
	dw $0082
	dw $0083
	dw $0084
	dw $0085
	dw $0086
	dw $0087
	dw $0086
	dw $0087
	dw !null_pointer, !null_pointer


;kreepy krow mini-necky spawning data

;number of mini-neckys to spawn per phase, mini-necky data
DATA_BAA0E0:
	%offset(DATA_BAA0E2, 2)
	dw $0008, .phase_3 			;Phase 3
	dw $0006, .phase_2 			;Phase 2
	dw $0004, .phase_1			;Phase 1

;index into mini-necky variable setup table, delay before next spawn
.phase_1:
	dw $0001, $0078
	dw $0002, $0078
	dw $0001, $0078
	dw $0002, $0000

.phase_2:
	dw $0003, $005A
	dw $0004, $005A
	dw $0003, $005A
	dw $0004, $005A
	dw $0003, $0069
	dw $0004, $0000

.phase_3:
	dw $0005, $003C
	dw $0006, $003C
	dw $0005, $003C
	dw $0006, $003C
	dw $0005, $003C
	dw $0006, $004B
	dw $0005, $003C
	dw $0006, $0000

;mini-necky variables setup table
DATA_BAA134:
	dw !null_pointer 			;00
	dw .DATA_BAA142				;01
	dw .DATA_BAA158				;02
	dw .DATA_BAA16E				;03
	dw .DATA_BAA184				;04
	dw .DATA_BAA19A				;05
	dw .DATA_BAA1B0				;06

.DATA_BAA142:
	dw $0260				;X position
	dw $0BD0 				;Y position
	dw $0202 				;$46,x (Movement behavior related?)
	dw $0014 				;$48,x (Movement behavior related?)
	dw $0800 				;Potential terrain tile position
	dw $FF80 				;Distance from potential ground
	dw $0000				;$22,x
	dw $FB00 				;$28,x
	dw $FF00 				;Current X velocity
	dw $001E				;$4E,x (Time before diving)
	dw $002D				;$50,x (Time before stops moving?)

.DATA_BAA158:
	dw $0100
	dw $0BD0
	dw $0202
	dw $0014
	dw $0800
	dw $FF80
	dw $0000
	dw $0500
	dw $0100
	dw $001E
	dw $002D

.DATA_BAA16E:
	dw $0260
	dw $0700
	dw $0202
	dw $0014
	dw $0800
	dw $FF80
	dw $0000
	dw $FB00
	dw $FF00
	dw $0014
	dw $002D

.DATA_BAA184:
	dw $0100
	dw $0700
	dw $0202
	dw $0014
	dw $0800
	dw $FF80
	dw $0000
	dw $0500
	dw $0100
	dw $0014
	dw $002D

.DATA_BAA19A:
	dw $0260
	dw $01B0
	dw $0202
	dw $0014
	dw $0800
	dw $FF80
	dw $0000
	dw $FB00
	dw $FF00
	dw $000A
	dw $002D

.DATA_BAA1B0:
	dw $0100
	dw $01B0
	dw $0202
	dw $0014
	dw $0800
	dw $FF80
	dw $0000
	dw $0500
	dw $0100
	dw $000A
	dw $002D

kreepy_krows_head_sprite_code:
	LDA $000652				;$BAA1C6  \
	BNE CODE_BAA1CF				;$BAA1CA   |
	BRL CODE_BAA219				;$BAA1CC  /

CODE_BAA1CF:
	LDX current_sprite			;$BAA1CF  \
	LDA $32,x				;$BAA1D1   |
	BEQ CODE_BAA1DA				;$BAA1D3   |
	STZ $32,x				;$BAA1D5   |
	JSR CODE_BA9C64				;$BAA1D7   |
CODE_BAA1DA:					;	   |
	LDX $0654				;$BAA1DA   |
	LDA $2E,x				;$BAA1DD   |
	BIT #$0200				;$BAA1DF   |
	BNE CODE_BAA1F1				;$BAA1E2   |
	JSL CODE_BCFB58				;$BAA1E4   |
	LDA #$0000				;$BAA1E8   |
	JSL CODE_B6CF65				;$BAA1EB   |
	BRA CODE_BAA219				;$BAA1EF  /

CODE_BAA1F1:
	LDX $0654				;$BAA1F1  \
	LDA $04,x				;$BAA1F4   |
	BNE CODE_BAA219				;$BAA1F6   |
	LDX current_sprite			;$BAA1F8   |
	JSL CODE_BCFB58				;$BAA1FA   |
	LDA #$007B				;$BAA1FE   |
	JSL CODE_B6CF65				;$BAA201   |
	BCC CODE_BAA219				;$BAA205   |
	LDA #$001E				;$BAA207   |
	LDY #$FE00				;$BAA20A   |
	JSL CODE_B3A600				;$BAA20D   |
	LDX $0654				;$BAA211   |
	LDA #$0014				;$BAA214   |
	STA $04,x				;$BAA217   |
CODE_BAA219:					;	   |
	LDX current_sprite			;$BAA219   |
	JSL CODE_B9D100				;$BAA21B   |
	JML [$05A9]				;$BAA21F  /


;amount of kleever fragments to spawn
DATA_BAA222:
	dw $0012

;kleever fragment spawning data
DATA_BAA224:
	dw DATA_FF245C
	dw $0000, $0000
	dw $FF00, $FE80, $FE00, $0500
	dw $0003, $0002
	dw $0000
	dw $021B

DATA_BAA23A:
	dw DATA_FF245C
	dw $0000, $0000
	dw $00B0, $0130, $FD70, $0600
	dw $0003, $0002
	dw $8000
	dw $021C

DATA_BAA250:
	dw DATA_FF2440
	dw $FFFE, $FFF2
	dw $FD80, $FBB0, $FE50, $0500
	dw $0004, $0003
	dw $0000
	dw $0223

DATA_BAA266:
	dw DATA_FF2440
	dw $0002, $FFF2
	dw $0220, $0340, $FE80, $0400
	dw $0004, $0003
	dw $4000
	dw $021D

DATA_BAA27C:
	dw DATA_FF23EC
	dw $0000, $FFEA
	dw $0024, $0080, $FB80, $0400
	dw $0004, $0003
	dw $0000
	dw $021F

DATA_BAA292:
	dw DATA_FF2408
	dw $0000, $FFE2
	dw $FFA0, $FEA0, $FB00, $0400
	dw $0002, $0003
	dw $4000
	dw $0220

DATA_BAA2A8:
	dw DATA_FF2424
	dw $FFFC, $FFE6
	dw $FD80, $FC00, $FE00, $03B0
	dw $0005, $0004
	dw $4000
	dw $0221

DATA_BAA2BE:
	dw DATA_FF2424
	dw $0004, $FFCC
	dw $0100, $0300, $FB80, $0480
	dw $0004, $0003
	dw $4000
	dw $0221

DATA_BAA2D4:
	dw DATA_FF2424
	dw $FFFC, $FFCE
	dw $FFF0, $FFB0, $F980, $04B0
	dw $0003, $0004
	dw $4000
	dw $0222

DATA_BAA2EA:
	dw DATA_FF2408
	dw $0003, $FFCC
	dw $02B0, $03C0, $FE60, $0400
	dw $0005, $0004
	dw $0000
	dw $0220

DATA_BAA300:
	dw DATA_FF2440
	dw $0000, $FFD3
	dw $FD00, $FB80, $FD00, $0200
	dw $0004, $0004
	dw $0000
	dw $021D

DATA_BAA316:
	dw DATA_FF23EC
	dw $0000, $FFD9
	dw $0280, $03C0, $FC80, $0200
	dw $0004, $0003
	dw $0000
	dw $021F

DATA_BAA32C:
	dw DATA_FF2424
	dw $0005, $FFD3
	dw $0050, $0100, $F980, $04B0
	dw $0003, $0003
	dw $0000
	dw $0221

DATA_BAA342:
	dw DATA_FF23D0
	dw $000A, $FFC5
	dw $00B0, $0460, $FC00, $04B0
	dw $000A, $0003
	dw $0000
	dw $021E

DATA_BAA358:
	dw DATA_FF23D0
	dw $0003, $FFC4
	dw $0200, $0300, $FC00, $04B0
	dw $0004, $0004
	dw $4000
	dw $021E

DATA_BAA36E:
	dw DATA_FF23D0
	dw $0000, $FFCC
	dw $FF00, $FD00, $FAB0, $0420
	dw $0004, $0004
	dw $0000
	dw $021E

DATA_BAA384:
	dw DATA_FF23EC
	dw $FFFF, $FFF2
	dw $FEC0, $FD80, $FA00, $04B0
	dw $0006, $0004
	dw $4000
	dw $021F

DATA_BAA39A:
	dw DATA_FF2424
	dw $0000, $FFF2
	dw $FE80, $FD00, $FD50, $0400
	dw $0004, $0003
	dw $4000
	dw $0221


;amount of k.rool duel roof pieces to spawn
DATA_BAA3B0:
	dw $0010


;k.rool duel roof pieces spawning data
DATA_BAA3B2:
	dw DATA_FF2440
	dw $FFFE, $FFF2
	dw $FF00, $FDB0, $FE50, $0A00
	dw $0004, $0003
	dw $0000
	dw $0223

DATA_BAA3C8:
	dw DATA_FF2440
	dw $0002, $FFF2
	dw $0100, $0140, $FE80, $0600
	dw $0004, $0003
	dw $4000
	dw $021D

DATA_BAA3DE:
	dw DATA_FF23EC
	dw $0000, $FFEA
	dw $0024, $0080, $FB80, $0A00
	dw $0004, $0003
	dw $0000
	dw $021F

DATA_BAA3F4:
	dw DATA_FF2408
	dw $0000, $FFE2
	dw $FFA0, $FFA0, $FB00, $0700
	dw $0002, $0003
	dw $4000
	dw $0220

DATA_BAA40A:
	dw DATA_FF2424
	dw $FFFC, $FFE6
	dw $FE80, $FD80, $FE00, $0600
	dw $0005, $0004
	dw $4000
	dw $0221

DATA_BAA420:
	dw DATA_FF2424
	dw $0004, $FFCC
	dw $0000, $0100, $FB80, $0780
	dw $0004, $0003
	dw $4000
	dw $0221

DATA_BAA436:
	dw DATA_FF2424
	dw $FFFC, $FFCE
	dw $FFF0, $FFB0, $F980, $0B00
	dw $0003, $0004
	dw $4000
	dw $0222

DATA_BAA44C:
	dw DATA_FF2408
	dw $0003, $FFCC
	dw $00D0, $0200, $FE60, $0600
	dw $0005, $0004
	dw $0000
	dw $0220

DATA_BAA462:
	dw DATA_FF2440
	dw $0000, $FFD3
	dw $FF00, $FDD0, $FD00, $0700
	dw $0004, $0004
	dw $0000
	dw $021D

DATA_BAA478:
	dw DATA_FF23EC
	dw $0000, $FFD9
	dw $0180, $0180, $FC80, $0600
	dw $0004, $0003
	dw $0000
	dw $021F

DATA_BAA48E:
	dw DATA_FF2424
	dw $0005, $FFD3
	dw $0050, $0100, $F980, $0800
	dw $0003, $0003
	dw $0000
	dw $0221

DATA_BAA4A4:
	dw DATA_FF23D0
	dw $000A, $FFC5
	dw $00B0, $0200, $FC00, $0A00
	dw $000A, $0003
	dw $0000
	dw $021E

DATA_BAA4BA:
	dw DATA_FF23D0
	dw $0003, $FFC4
	dw $0100, $0180, $FC00, $0700
	dw $0004, $0004
	dw $4000
	dw $021E

DATA_BAA4D0:
	dw DATA_FF23D0
	dw $0000, $FFCC
	dw $FF00, $FE00, $FAB0, $0620
	dw $0004, $0004
	dw $0000
	dw $021E

DATA_BAA4E6:
	dw DATA_FF23EC
	dw $FFFF, $FFF2
	dw $FEC0, $FE80, $FA00, $0680
	dw $0006, $0004
	dw $4000
	dw $021F

DATA_BAA4FC:
	dw DATA_FF2424
	dw $0000, $FFF2
	dw $FE80, $FE00, $FD50, $0780
	dw $0004, $0003
	dw $4000
	dw $0221


;donkey kong position offsets applied when being shot by krool
DATA_BAA512:
	db $FF, $00, $FE, $00, $FD, $00, $FC, $00
	db $FB, $00, $FA, $00, $F9, $00, $F8, $00
	db $F7, $00, $F6, $00, $F5, $00, $F5, $00
	db $F4, $00, $F4, $00, $F3, $00, $F3, $00
	db $F2, $00, $F2, $00, $F2, $00, $F2, $00
	db $F2, $00, $F2, $00, $F3, $00, $F3, $00
	db $F4, $00, $F4, $00, $F5, $00, $F5, $00
	db $F6, $00, $F6, $00, $F7, $00, $F8, $00
	db $F9, $00, $FA, $00, $FB, $00, $FC, $00
	db $FD, $00, $FE, $00, $FF, $00, $00, $00
	db $01, $00, $02, $00, $03, $00, $04, $00
	db $05, $00, $06, $00, $07, $00, $07, $00
	db $08, $00, $08, $00, $08, $00, $09, $00
	db $09, $00, $09, $00, $09, $00, $09, $00
	db $09, $00, $08, $00, $08, $00, $08, $00
	db $07, $00, $07, $00, $07, $00

DATA_BAA590:
	db $06, $00, $06, $00, $05, $00, $05, $00
	db $04, $00, $04, $00, $03, $00, $03, $00
	db $02, $00, $02, $00, $01, $00, $01, $00
	db $00, $00, $00, $00, $00, $00, $FF, $00
	db $FF, $00, $FF, $00, $FF, $00, $FF, $00
	db $FE, $00, $FE, $00, $FE, $00, $FE, $00
	db $FE, $00, $FE, $00, $FD, $00, $FD, $00
	db $FD, $00, $FD, $00, $FD, $00, $FD, $00
	db $FD, $00, $FD, $00, $FE, $00, $FE, $00
	db $FE, $00, $FE, $00, $FE, $00, $FE, $00
	db $FE, $00, $FF, $00, $FF, $00, $FF, $00
	db $FF, $00, $FF, $00, $FF, $00, $7F

DATA_BAA5EF:
	db $FE, $00, $FB, $00, $F8, $00, $F5, $00
	db $F2, $00, $EF, $00, $ED, $00, $EB, $00
	db $E9, $00, $E7, $00, $E5, $00, $E4, $00
	db $E3, $00, $E2, $00, $E1, $00, $E0, $00
	db $DF, $00, $DF, $00, $DE, $00, $DE, $00
	db $DE, $00, $DE, $00, $DD, $00, $DD, $00
	db $DD, $00, $DD, $00, $DD, $00, $DD, $00
	db $DD, $00, $DE, $00, $DE, $00, $DE, $00
	db $DE, $00, $DF, $00, $DF, $00, $E0, $00
	db $E1, $00, $E2, $00, $E3, $00, $E4, $00
	db $E5, $00, $E6, $00, $E7, $00, $E8, $00
	db $E9, $00, $EB, $00, $ED, $00, $EF, $00
	db $F1, $00, $F3, $00, $F5, $00, $F7, $00
	db $F9, $00, $FB, $00, $FD, $00, $FF, $00
	db $01, $00, $03, $00, $05, $00, $07, $00
	db $09, $00, $0A, $00, $0B, $00, $0C, $00
	db $0D, $00, $0D, $00, $0E, $00, $0E, $00
	db $0F, $00, $0F, $00, $0F, $00, $0F, $00
	db $10, $00, $10, $00, $10, $00, $10, $00
	db $10, $00, $0F, $00, $0F, $00, $0E, $00
	db $0E, $00, $0E, $00, $0E, $00, $0D, $00
	db $0D, $00, $0D, $00, $0C, $00, $0C, $00
	db $0C, $00, $0B, $00, $0B, $00, $0B, $00
	db $0A, $00, $0A, $00, $0A, $00, $09, $00
	db $09, $00, $08, $00, $08, $00, $07, $00
	db $07, $00, $7E
	
	dw DATA_BAA590


;kleever Y bob offsets
DATA_BAA6BC:
	db $01, $00, $01, $01, $01, $00, $01, $00
	db $00, $00, $FF, $00, $FF, $FF, $FF, $00
	db $FF, $00, $00, $00

;unclear, seems related to kleever swings in both phases
DATA_BAA6D0:
	dw DATA_BAA6F0
	dw DATA_BAA70A
	dw DATA_BAA724
	dw DATA_BAA73E
	dw DATA_BAA750
	dw DATA_BAA762
	dw DATA_BAA762
	dw DATA_BAA76C
	dw DATA_BAA776
	dw DATA_BAA788
	dw DATA_BAA79A
	dw DATA_BAA7AC
	dw DATA_BAA7BE
	dw DATA_BAA7D0
	dw DATA_BAA7DA
	dw DATA_BAA7DA

DATA_BAA6F0:
	dw $0003 
	db $ED, $FF, $F6, $FF, $21, $00, $1A, $00
	db $0A, $00, $E6, $FF, $13, $00, $11, $00 
	db $1C, $00, $D9, $FF, $19, $00, $0F, $00

DATA_BAA70A:
	db $03, $00, $F0, $FF, $F3, $FF, $1D, $00
	db $20, $00, $08, $00, $DF, $FF, $10, $00
	db $15, $00, $16, $00, $D4, $FF, $17, $00
	db $0D, $00

DATA_BAA724:
	db $03, $00, $F0, $FF, $F4, $FF, $1D, $00
	db $20, $00, $04, $00, $DE, $FF, $10, $00
	db $14, $00, $11, $00, $CA, $FF, $13, $00
	db $14, $00

DATA_BAA73E:
	db $02, $00, $F1, $FF, $F4, $FF, $1B, $00
	db $22, $00, $02, $00, $C8, $FF, $13, $00
	db $2B, $00

DATA_BAA750:
	db $02, $00, $F1, $FF, $F6, $FF, $1A, $00
	db $21, $00, $FE, $FF, $C3, $FF, $0F, $00
	db $31, $00

DATA_BAA762:
	db $01, $00, $F3, $FF, $C2, $FF, $17, $00
	db $56, $00

DATA_BAA76C:
	db $02, $00, $EC, $FF, $C4, $FF, $0F, $00
	db $31, $00

DATA_BAA776:
	db $02, $00, $E1, $FF, $C9, $FF, $0F, $00
	db $1B, $00, $F0, $FF, $EF, $FF, $1C, $00
	db $24, $00

DATA_BAA788:
	db $02, $00, $DB, $FF, $CF, $FF, $14, $00
	db $1B, $00, $EF, $FF, $EF, $FF, $1F, $00
	db $23, $00

DATA_BAA79A:
	db $02, $00, $EF, $FF, $F2, $FF, $22, $00
	db $1F, $00, $D6, $FF, $D4, $FF, $16, $00
	db $1F, $00

DATA_BAA7AC:
	db $02, $00, $D2, $FF, $D9, $FF, $13, $00
	db $1C, $00, $EE, $FF, $F1, $FF, $24, $00
	db $1F, $00

DATA_BAA7BE:
	db $02, $00, $CF, $FF, $E4, $FF, $20, $00
	db $18, $00, $F2, $FF, $F1, $FF, $23, $00
	db $1D, $00

DATA_BAA7D0:
	db $01, $00, $CE, $FF, $F0, $FF, $47, $00
	db $18, $00

DATA_BAA7DA:
	db $01, $00, $CD, $FF, $F2, $FF, $47, $00
	db $19, $00

;k rool projectiles

;straight spike balls
DATA_BAA7E4:
	dw $0200, $0000, $0200, $0000, $0000, $0000, $0078, $0000
	dw $0280, $0000, $0280, $0000, $0000, $0000, $0032, $0010
	dw $0280, $0000, $0280, $0000, $0000, $0000, $003C, $FFF0
	dw $0300, $0000, $0300, $0000, $0000, $0000, $0028, $0000
	dw $0300, $0000, $0300, $0000, $0000, $0000, $0032, $0000
	dw $0380, $0000, $0380, $0000, $0000, $0000, $002C, $0010
	dw $0380, $0000, $0380, $0000, $0000, $0000, $002C, $FFF0
	dw $0380, $0000, $0380, $0000, $0000, $0000, $002C, $0010
	dw $0380, $0000, $0380, $0000, $0000, $0000, $0032, $FFF0
	dw $0280, $0000, $0280, $0000, $0000, $0000, $003C, $0000

;bouncing spike balls
DATA_BAA884:
	dw $0200, $0000, $0200, $0400, $0000, $0005, $FC00, $0400, $0078
	dw $0200, $0000, $0200, $0400, $0000, $0004, $F880, $0780, $003C
	dw $0200, $0000, $0200, $0400, $0000, $0005, $FC00, $0400, $003C
	dw $0200, $0000, $0200, $0400, $0000, $0004, $F880, $0780, $003C
	dw $0200, $0000, $0200, $0400, $0000, $0003, $F500, $0A00, $003A
	dw $0200, $0000, $0200, $0400, $0000, $0004, $F880, $0780, $003A
	dw $0200, $0000, $0200, $0400, $0000, $0003, $F500, $0A00, $0032
	dw $0200, $0000, $0200, $0400, $0000, $0004, $F880, $0780, $0032
	dw $0200, $0000, $0200, $0400, $0000, $0003, $F500, $0A00, $004B
	dw $0200, $0000, $0200, $0400, $0000, $0004, $F880, $0780, $003C

;orbiting spike balls
DATA_BAA938:
	dw $0100, $0000, $0100, $0000, $0909, $FC00, $1500, $00B4, $FFF6
	dw $0100, $0000, $0100, $0000, $0909, $FCC0, $2250, $00B4, $FFE8
	dw $0100, $0000, $0100, $0000, $0909, $FD80, $3000, $00B4, $FFDA
	dw $0100, $0000, $0100, $0000, $0909, $FC00, $1500, $001C, $FFF6
	dw $0100, $0000, $0100, $0000, $0909, $FC00, $1500, $00B4, $FFF6
	dw $0100, $0000, $0100, $0000, $0909, $FCC0, $2250, $001A, $FFE8
	dw $0100, $0000, $0100, $0000, $0909, $FCC0, $2250, $00B4, $FFE8
	dw $0100, $0000, $0100, $0000, $0909, $FD80, $3000, $001E, $FFDA
	dw $0100, $0000, $0100, $0000, $0909, $FD80, $3000, $00F0, $FFDA
	dw $0100, $0000, $0100, $0000, $0909, $FC00, $1500, $00B4, $FFF6

;straight blue gas
DATA_BAA9EC:
	dw $0200, $0000, $0200, $0000, $0000, $0000, $0020, $0000
	dw $0200, $0000, $0200, $0000, $0000, $0000, $0020, $0000
	dw $0200, $0000, $0200, $0000, $0000, $0000, $0020, $0000

;bouncing red gas
	dw $0280, $0000, $0280, $0900, $0000, $0006, $FA00, $0800, $001C
	dw $0280, $0000, $0280, $0900, $0000, $0006, $FA00, $0800, $001C
	dw $0280, $0000, $0280, $0900, $0000, $0006, $FA00, $0800, $001C

;slow spike balls
DATA_BAAA52:
	dw $0200, $0000, $0200, $0000, $0000, $0000, $0039, $0000, $0014
	dw $0200, $0000, $0200, $0000, $0000, $0000, $0039, $0000, $0014
	dw $0200, $0000, $0200, $0000, $0000, $0000, $0039, $0000, $0014

;orbiting purple gas
DATA_BAAA88:
	dw $0100, $0000, $0100, $0000, $0909, $FC80, $1500, $004B, $FFF6
	dw $0100, $0000, $0100, $0000, $0909, $FC80, $1500, $004B, $FFF6
	dw $0100, $0000, $0100, $0000, $0909, $FC80, $1500, $004B, $FFF6
	
;kleever shake offset related
DATA_BAAABE:
	db $02, $01
	db $00, $01
	db $FF, $00
	db $FF, $01
	db $FE, $01
	db $02, $01
	db $01, $00
	db $00, $01
	db $00, $01
	db $FF, $00
	db $FF, $01
	db $FF, $02
	db $02, $01
	db $00, $02
	db $02, $01
	db $FF, $01
	db $02, $01
	db $FF, $00
	db $FE, $02
	db $01, $01
	db $01, $01

;kleever defeated related
DATA_BAAAE8:
	dw $0028, $FC00, $FC00, $0004, $0003
	dw $0020, $0140, $0400, $0005, $0005
	dw $0019, $04F0, $0440, $0006, $0006
	dw $002D, $0150, $FB00, $0006, $0006
	dw $0028, $FB80, $0400, $0006, $0005
	dw $0028, $0200, $0000, $0006, $0004
	dw $0021, $0300, $FB00, $0006, $0006
	dw $0028, $FC00, $0100, $0006, $0006
	dw $00C8, $0180, $0450, $0007, $0007

	dw $0063

;kleever shake offset related
DATA_BAAB44:
%offset(DATA_BAAB48, 4)
	dw $FFF6, $FFD0
	dw $FFF6, $FFD0
	dw $0000, $FFCE
	dw $0008, $FFD0
	dw $000F, $FFD3
	dw $0014, $FFDC
	dw $0014, $FFDC
	dw $0014, $FFDC
	dw $0014, $FFDC
	dw $0014, $FFDC
	dw $000F, $FFD3
	dw $0008, $FFD0
	dw $0000, $FFCE
	dw $FFF6, $FFD0
	dw $FFF0, $FFD3
	dw $FFED, $FFD5
	dw $FFE9, $FFD7
	dw $FFED, $FFD5
	dw $FFF0, $FFD3
	dw $FFF6, $FFD0
	dw $FFF6, $FFD1
	dw $FFFA, $FFD2
	dw $0000, $FFD4
	dw $FFFA, $FFD2
	dw $FFF6, $FFD1

;king zing attack pattern pointers
DATA_BAABA8:
	dw DATA_BAABBC
	dw DATA_BAABC8
	dw DATA_BAABD4
	dw DATA_BAABE0
if !version == 1
	dw DATA_BAABEC
endif
	dw DATA_BAABF8
	dw DATA_BAAC04
	dw DATA_BAAC10
if !version == 1
	dw DATA_BAAC1C
endif
	dw DATA_BAAC28
if !version == 0
	dw DATA_BAAC34_v0
	dw DATA_BAAC40
endif

;king zing attack patterns
DATA_BAABBC:
	dw $0000, $0000, $0500, $0000, $0000, !null_pointer

DATA_BAABC8:
	dw $0000, $0000, $01C0, $0000, $0000, !null_pointer

DATA_BAABD4:
	dw $0000, $0000, $0140, $0000, $0000, !null_pointer

DATA_BAABE0:
	dw $0000, $0000, $00C0, $0000, $0000, !null_pointer

DATA_BAABEC:
	dw $0064, $0001, $0000, $0000, $0000, !null_pointer

DATA_BAABF8:
if !version == 0
	dw $0064, $0001, $0000, $0000, $0000, !null_pointer
else
	dw $0064, $0001, $00C0, $012C, $005A, DATA_BAACA4
endif

DATA_BAAC04:
if !version == 0
	dw $0064, $0001, $00C0, $012C, $005A, DATA_BAACA4
else
	dw $0064, $0001, $0000, $0000, $0000, !null_pointer
endif

DATA_BAAC10:
if !version == 0
	dw $0064, $0001, $0000, $0000, $0000, !null_pointer
else
	dw $0064, $0001, $0080, $0186, $0078, DATA_BAAC34
endif

DATA_BAAC1C:
	dw $0064, $0001, $0000, $0000, $0000, !null_pointer

DATA_BAAC28:
if !version == 0
	dw $0064, $0001, $0080, $0186, $0078, DATA_BAAC34
else
	dw $0064, $0001, $0000, $0000, $0000, !null_pointer
endif

if !version == 0
DATA_BAAC34_v0:
	dw $0064, $0001, $0000, $0000, $0000, !null_pointer

DATA_BAAC40:
	dw $0064, $0001, $0000, $0000, $0000, !null_pointer

DATA_BAAC4C:
	dw $0064, $0001, $0000, $0000, $0000, !null_pointer
endif

;king zing spike attack 1 projectile velocities
DATA_BAAC34:
	dw $0000, $FD80, $0000, $FD80
	dw $0000, $0001, $0236, $01B0
	dw $FE50, $01B0, $FE50, $0001
	dw $0001, $0237, $0280, $0000
	dw $0280, $0000, $0001, $0000
	dw $0238, $01B0, $01B0, $01B0
	dw $01B0, $0001, $0001, $0239
	dw $0000, $0280, $0000, $0280
	dw $0000, $0001, $023A, $FE50
	dw $01B0, $FE50, $01B0, $0001
	dw $0001, $023B, $FD80, $0000
	dw $FD80, $0000, $0001, $0000
	dw $023C, $FE50, $FE50, $FE50
	dw $FE50, $0001, $0001, $023D

;king zing spike attack 2 projectile velocities
DATA_BAACA4:
	dw $0000, $FD00, $0000, $FD00
	dw $0000, $0001, $0236, $0200
	dw $FE00, $0200, $FE00, $0001
	dw $0001, $0237, $0300, $0000
	dw $0300, $0000, $0001, $0000
	dw $0238, $0200, $0200, $0200
	dw $0200, $0001, $0001, $0239
	dw $0000, $0300, $0000, $0300
	dw $0000, $0001, $023A, $FE00
	dw $0200, $FE00, $0200, $0001
	dw $0001, $023B, $FD00, $0000
	dw $FD00, $0000, $0001, $0000
	dw $023C, $FE00, $FE00, $FE00
	dw $FE00, $0001, $0001, $023D

;k rool number of projectiles for each attack phase
DATA_BAAD14:
	db $00
	db $03
	db $03
	db $03
	db $0A
	db $0A
	db $0A
	db $02
	db $01
	db $01

;k rool projectile set pointers
DATA_BAAD1E:
	dw !null_pointer
	dw DATA_BAAA88
	dw DATA_BAAA52
	dw DATA_BAA9EC
	dw DATA_BAA938
	dw DATA_BAA884
	dw DATA_BAA7E4
	dw !null_pointer


;number of entries in table below
DATA_BAAD2E:
	db $18, $00


;krow 1 phase 2 falling egg data?
DATA_BAAD30:
	dw DATA_BAAD60
	dw DATA_BAAD70
	dw DATA_BAAD80
	dw DATA_BAAD90
	dw DATA_BAADA0
	dw DATA_BAADB0
	dw DATA_BAADC0
	dw DATA_BAADD0
	dw DATA_BAADE0
	dw DATA_BAADF0
	dw DATA_BAAE00
	dw DATA_BAAE10
	dw DATA_BAAE20
	dw DATA_BAAE30
	dw DATA_BAAE40
	dw DATA_BAAE50
	dw DATA_BAAE60
	dw DATA_BAAE70
	dw DATA_BAAE80
	dw DATA_BAAE90
	dw DATA_BAAEA0
	dw DATA_BAAEB0
	dw DATA_BAAEC0
	dw DATA_BAAED0

DATA_BAAD60:
	db $00, $02, $00, $00, $05, $00, $03, $00
	db $00, $00, $C8, $00, $05, $00, $FC, $FF

DATA_BAAD70:
	db $00, $02, $00, $00, $0A, $00, $03, $00
	db $01, $00, $C8, $00, $09, $00, $FC, $FF

DATA_BAAD80:
	db $00, $02, $00, $00, $10, $00, $03, $00
	db $00, $00, $C8, $00, $0A, $00, $FC, $FF

DATA_BAAD90:
	db $00, $02, $00, $00, $10, $00, $03, $00
	db $00, $00, $C8, $00, $07, $00, $FC, $FF

DATA_BAADA0:
	db $00, $02, $00, $00, $10, $00, $02, $00
	db $03, $00, $C8, $00, $06, $00, $FC, $FF

DATA_BAADB0:
	db $00, $02, $00, $00, $0A, $00, $03, $00
	db $01, $00, $C8, $00, $09, $00, $FC, $FF

DATA_BAADC0:
	db $00, $02, $00, $00, $10, $00, $03, $00
	db $01, $00, $C8, $00, $08, $00, $FC, $FF

DATA_BAADD0:
	db $C0, $01, $01, $00, $05, $00, $03, $00
	db $01, $00, $C8, $00, $07, $00, $FC, $FF

DATA_BAADE0:
	db $C0, $01, $01, $00, $03, $00, $03, $00
	db $00, $00, $C8, $00, $05, $00, $FB, $FF

DATA_BAADF0:
	db $C0, $01, $01, $00, $06, $00, $03, $00
	db $00, $00, $C8, $00, $06, $00, $FC, $FF

DATA_BAAE00:
	db $C0, $01, $00, $00, $05, $00, $03, $00
	db $01, $00, $C8, $00, $09, $00, $FC, $FF

DATA_BAAE10:
	db $C0, $01, $00, $00, $05, $00, $03, $00
	db $02, $00, $C8, $00, $06, $00, $FA, $FF

DATA_BAAE20:
	db $80, $01, $00, $00, $05, $00, $03, $00
	db $00, $00, $C8, $00, $0A, $00, $FC, $FF

DATA_BAAE30:
	db $7B, $01, $00, $00, $0A, $00, $03, $00
	db $01, $00, $C8, $00, $09, $00, $FC, $FF

DATA_BAAE40:
	db $80, $01, $00, $00, $10, $00, $03, $00
	db $00, $00, $C8, $00, $0A, $00, $FC, $FF

DATA_BAAE50:
	db $80, $01, $00, $00, $10, $00, $03, $00
	db $00, $00, $C8, $00, $08, $00, $FC, $FF

DATA_BAAE60:
	db $80, $01, $00, $00, $10, $00, $03, $00
	db $01, $00, $C8, $00, $07, $00, $FC, $FF

DATA_BAAE70:
	db $80, $01, $00, $00, $0A, $00, $03, $00
	db $01, $00, $C8, $00, $0A, $00, $FC, $FF

DATA_BAAE80:
	db $80, $01, $00, $00, $10, $00, $03, $00
	db $01, $00, $C8, $00, $0A, $00, $FC, $FF

DATA_BAAE90:
	db $A9, $01, $01, $00, $05, $00, $03, $00
	db $01, $00, $C8, $00, $07, $00, $FC, $FF

DATA_BAAEA0:
	db $A0, $01, $01, $00, $03, $00, $03, $00
	db $00, $00, $C8, $00, $08, $00, $FB, $FF

DATA_BAAEB0:
	db $A5, $01, $01, $00, $04, $00, $03, $00
	db $00, $00, $C8, $00, $06, $00, $FC, $FF

DATA_BAAEC0:
	db $A0, $01, $00, $00, $05, $00, $03, $00
	db $01, $00, $C8, $00, $09, $00, $FC, $FF

DATA_BAAED0:
	db $A0, $01, $00, $00, $05, $00, $03, $00
	db $01, $00, $C8, $00, $05, $00, $FA, $FF

DATA_BAAEF0:
	db $02, $00, $00, $00, $04, $00, $00, $00
	db $04, $00, $02, $00, $04, $00, $04, $00
	db $02, $00, $02, $00, $00, $00, $00, $00
	db $00, $00, $02, $00, $00, $00, $04, $00
	db $02, $00, $04, $00, $04, $00, $04, $00
	db $02, $00, $02, $00, $00, $00, $00, $00


;krow 1 egg shell piece related
DATA_BAAF10:
	dw DATA_BAAF1C
	dw DATA_BAAF5A
	dw DATA_BAAF98
	dw DATA_BAAFD6
	dw DATA_BAB02C
	dw DATA_BAB052

DATA_BAAF1C:
	db $05, $00
	dw DATA_FF1BCE : db $F6, $FF, $F6, $FF, $00, $00, $00, $00, $80, $F9
	dw DATA_FF1BA0 : db $00, $00, $F6, $FF, $00, $01, $00, $01, $B0, $FA
	dw DATA_FF1BCE : db $0A, $00, $00, $00, $00, $FE, $80, $FF, $80, $FA
	dw DATA_FF1BCE : db $F1, $FF, $0A, $00, $00, $FE, $00, $FF, $B0, $FB
	dw DATA_FF1BA0 : db $00, $00, $0A, $00, $20, $01, $50, $00, $C0, $FB

DATA_BAAF5A:
	db $05, $00
	dw DATA_FF1BA0 : db $F6, $FF, $F6, $FF, $80, $FF, $90, $FF, $40, $FB
	dw DATA_FF1BA0 : db $00, $00, $F6, $FF, $00, $01, $30, $01, $60, $FA
	dw DATA_FF1BCE : db $0A, $00, $00, $00, $80, $02, $C0, $02, $70, $FB
	dw DATA_FF1BCE : db $F1, $FF, $0A, $00, $90, $02, $00, $03, $40, $FC
	dw DATA_FF1BA0 : db $00, $00, $0A, $00, $90, $03, $50, $04, $00, $FD

DATA_BAAF98:
	db $05, $00
	dw DATA_FF1B72 : db $F6, $FF, $F6, $FF, $80, $00, $40, $00, $B0, $FA
	dw DATA_FF1BA0 : db $00, $00, $EC, $FF, $90, $00, $B0, $01, $80, $FB
	dw DATA_FF1B72 : db $0A, $00, $F6, $FF, $00, $02, $00, $03, $00, $FC
	dw DATA_FF1B72 : db $F1, $FF, $00, $00, $45, $00, $90, $00, $00, $FE
	dw DATA_FF1BA0 : db $00, $00, $00, $00, $C0, $02, $00, $03, $00, $FD

DATA_BAAFD6:
	db $07, $00
	dw DATA_FF1B72 : db $00, $00, $0A, $00, $00, $00, $00, $00, $00, $FA
	dw DATA_FF1BCE : db $EC, $FF, $F6, $FF, $50, $FD, $70, $FF, $80, $FB
	dw DATA_FF1BCE : db $DD, $FF, $0A, $00, $00, $FE, $80, $FF, $00, $FC
	dw DATA_FF1B72 : db $F6, $FF, $00, $00, $50, $FD, $70, $FE, $00, $FE
	dw DATA_FF1BCE : db $0A, $00, $F6, $FF, $B0, $02, $90, $00, $80, $FB
	dw DATA_FF1B72 : db $00, $00, $0A, $00, $00, $02, $80, $00, $00, $FC
	dw DATA_FF1B72 : db $14, $00, $00, $00, $B0, $02, $90, $01, $00, $FE

DATA_BAB02C:
	db $03, $00
	dw DATA_FF1B72 : db $F6, $FF, $F6, $FF, $00, $00, $00, $00, $80, $F9
	dw DATA_FF1BA0 : db $00, $00, $F6, $FF, $00, $01, $00, $01, $B0, $FA
	dw DATA_FF1BA0 : db $0A, $00, $00, $00, $00, $FE, $80, $FF, $80, $FA

DATA_BAB052:
	db $03, $00
	dw DATA_FF1B72 : db $F6, $FF, $F6, $FF, $80, $FF, $90, $FF, $40, $FB
	dw DATA_FF1BA0 : db $00, $00, $F6, $FF, $00, $01, $30, $01, $60, $FA
	dw DATA_FF1BA0 : db $0A, $00, $00, $00, $80, $02, $C0, $02, $70, $FB

CODE_BAB078:
	TAX					;$BAB078  \
	PHK					;$BAB079   |
	PLB					;$BAB07A   |
	JMP (DATA_BAB07E,x)			;$BAB07B  /

DATA_BAB07E:
	dw krool_water_drips_sprite_code 	;00 krool_water_drips_main
	dw krool_fish_sprite_code		;02 krool_fish_main
	dw kore_sparkle_spawner_sprite_code	;04 unknown_sprite_0098_main
	dw scroll_and_float_barrel_sprite_code	;06 scroll_and_float_barrel_main
	dw kong_npc_sprite_code			;08 kong_npc_main
	dw sparkle_spawner_sprite_code		;0A sparkle_spawner_main
	dw sparkle_sprite_code			;0C sparkle_main
	dw kore_sparkle_sprite_code		;0E unknown_sprite_0050_main

kore_sparkle_spawner_sprite_code:
	PHK					;$BAB08E  \
	PLB					;$BAB08F   |
	LDX current_sprite			;$BAB090   |
	DEC $44,x				;$BAB092   |
	BNE CODE_BAB09E				;$BAB094   |
	JSL set_current_level_as_cleared	;$BAB096   |
	JSL CODE_B8A691				;$BAB09A   |
CODE_BAB09E:					;	   |
	LDX current_sprite			;$BAB09E   |
	INC $46,x				;$BAB0A0   |
	DEC $42,x				;$BAB0A2   |
	BNE CODE_BAB0B5				;$BAB0A4   |
	INC $46,x				;$BAB0A6   |
	INC $46,x				;$BAB0A8   |
	LDA #$0003				;$BAB0AA   |
	STA $42,x				;$BAB0AD   |
	LDA $46,x				;$BAB0AF   |
	JSL CODE_B5F0CD				;$BAB0B1   |
CODE_BAB0B5:					;	   |
	INC $48,x				;$BAB0B5   |
	DEC $4A,x				;$BAB0B7   |
	BEQ CODE_BAB0BE				;$BAB0B9   |
	BRL CODE_BAB129				;$BAB0BB  /

CODE_BAB0BE:
	INC $4C,x				;$BAB0BE  \
	INC $48,x				;$BAB0C0   |
	INC $48,x				;$BAB0C2   |
	LDA #$0004				;$BAB0C4   |
	STA $4A,x				;$BAB0C7   |
	LDA $48,x				;$BAB0C9   |
	JSL CODE_B5F0ED				;$BAB0CB   |
	LDA $4E,x				;$BAB0CF   |
	CLC					;$BAB0D1   |
	ADC $4C,x				;$BAB0D2   |
	STA $4E,x				;$BAB0D4   |
	CMP #$012C				;$BAB0D6   |
	BCC CODE_BAB129				;$BAB0D9   |
	SEC					;$BAB0DB   |
	SBC #$012C				;$BAB0DC   |
	STA $4E,x				;$BAB0DF   |
	LDY #$013E				;$BAB0E1   |
	JSL CODE_BB8412				;$BAB0E4   |
	JSL CODE_B4C175				;$BAB0E8   |
	LDY #$0020				;$BAB0EC   |
	JSL divide_a_by_y			;$BAB0EF   |
	LDY alternate_sprite			;$BAB0F3   |
	LDA #$01F0				;$BAB0F5   |
	CLC					;$BAB0F8   |
	ADC CPU.multiply_result			;$BAB0F9   |
	STA $0006,y				;$BAB0FC   |
	LDA #$0160				;$BAB0FF   |
	STA $000A,y				;$BAB102   |
	LDA #$FD80				;$BAB105   |
	STA $0024,y				;$BAB108   |
	LDA CPU.multiply_result			;$BAB10B   |
	SEC					;$BAB10E   |
	SBC #$0010				;$BAB10F   |
	BPL CODE_BAB11C				;$BAB112   |
	SEC					;$BAB114   |
	ROL A					;$BAB115   |
	SEC					;$BAB116   |
	ROL A					;$BAB117   |
	SEC					;$BAB118   |
	ROL A					;$BAB119   |
	BRA CODE_BAB11F				;$BAB11A  /

CODE_BAB11C:
	ASL A					;$BAB11C  \
	ASL A					;$BAB11D   |
	ASL A					;$BAB11E   |
CODE_BAB11F:					;	   |
	STA $0020,y				;$BAB11F   |
	LDA #$0768				;$BAB122   |
	JSL queue_sound_effect			;$BAB125   |
CODE_BAB129:					;	   |
	JML [$05A9]				;$BAB129  /

kore_sparkle_sprite_code:
	JSL apply_position_from_velocity_global	;$BAB12C  \
	JSL CODE_B9D100				;$BAB130   | process animation
	JSL CODE_BBBB8D				;$BAB134   | despawn sprite if offscreen
	JML [$05A9]				;$BAB138  / done processing sprite

sparkle_spawner_sprite_code:
	LDX current_sprite			;$BAB13B  \
	DEC $42,x				;$BAB13D   |
	BNE CODE_BAB18A				;$BAB13F   |
	LDA #$0008				;$BAB141   |
	STA $42,x				;$BAB144   |
	LDY #$0190				;$BAB146   |
	JSL CODE_BB8412				;$BAB149   |
	JSL CODE_B4C175				;$BAB14D   |
	LDY #$001E				;$BAB151   |
	JSL divide_a_by_y			;$BAB154   |
	LDX $0674				;$BAB158   |
	LDY alternate_sprite			;$BAB15B   |
	LDA $06,x				;$BAB15D   |
	STA $0042,y				;$BAB15F   |
	CLC					;$BAB162   |
	ADC #$000F				;$BAB163   |
	SEC					;$BAB166   |
	SBC CPU.multiply_result			;$BAB167   |
	STA $0006,y				;$BAB16A   |
	JSL CODE_B4C175				;$BAB16D   |
	LDY #$001E				;$BAB171   |
	JSL divide_a_by_y			;$BAB174   |
	LDY alternate_sprite			;$BAB178   |
	LDA $0A,x				;$BAB17A   |
	STA $0044,y				;$BAB17C   |
	CLC					;$BAB17F   |
	ADC #$0008				;$BAB180   |
	SEC					;$BAB183   |
	SBC CPU.multiply_result			;$BAB184   |
	STA $000A,y				;$BAB187   |
CODE_BAB18A:					;	   |
	JML [$05A9]				;$BAB18A  /

sparkle_sprite_code:
	LDX current_sprite			;$BAB18D  \
	LDY $0674				;$BAB18F   |
	LDA $0006,y				;$BAB192   |
	SEC					;$BAB195   |
	SBC $42,x				;$BAB196   |
	CLC					;$BAB198   |
	ADC $06,x				;$BAB199   |
	STA $06,x				;$BAB19B   |
	LDA $000A,y				;$BAB19D   |
	SEC					;$BAB1A0   |
	SBC $44,x				;$BAB1A1   |
	CLC					;$BAB1A3   |
	ADC $0A,x				;$BAB1A4   |
	STA $0A,x				;$BAB1A6   |
	LDA $0006,y				;$BAB1A8   |
	STA $42,x				;$BAB1AB   |
	LDA $000A,y				;$BAB1AD   |
	STA $44,x				;$BAB1B0   |
	JSL CODE_B9D100				;$BAB1B2   |
	JML [$05A9]				;$BAB1B6  /

CODE_BAB1B9:
	STZ CPU.enable_interrupts		;$BAB1B9  \
	PHK					;$BAB1BC   |
	PLB					;$BAB1BD   |
	STZ PPU.oam_address			;$BAB1BE   |
	LDA #$0080				;$BAB1C1   |
	STA PPU.screen				;$BAB1C4   |
	PHK					;$BAB1C7   |
	PHK					;$BAB1C8   |
	PLA					;$BAB1C9   |
	STA $CC					;$BAB1CA   |
	LDA.l $000650				;$BAB1CC   |
	ASL A					;$BAB1D0   |
	TAX					;$BAB1D1   |
	LDA DATA_BAB3FE,x			;$BAB1D2   |
	STA $000650				;$BAB1D5   |
	JSL disable_screen			;$BAB1D9   |
	JSL clear_VRAM_global			;$BAB1DD   |
	JSL CODE_BAC7C0				;$BAB1E1   |
	SEP #$20				;$BAB1E5   |
	STZ PPU.layer_2_scroll_x		;$BAB1E7   |
	STZ PPU.layer_2_scroll_x		;$BAB1EA   |
	LDA #$FF				;$BAB1ED   |
	STA PPU.layer_2_scroll_y		;$BAB1EF   |
	STA PPU.layer_2_scroll_y		;$BAB1F2   |
	STZ PPU.layer_1_scroll_x		;$BAB1F5   |
	STZ PPU.layer_1_scroll_x		;$BAB1F8   |
	LDA #$FF				;$BAB1FB   |
	STA PPU.layer_1_scroll_y		;$BAB1FD   |
	STA PPU.layer_1_scroll_y		;$BAB200   |
	REP #$20				;$BAB203   |
	LDY $0650				;$BAB205   |
	LDA $0004,y				;$BAB208   |
	JSL play_song				;$BAB20B   |
	LDX $0650				;$BAB20F   |
	LDA $0000,x				;$BAB212   |
	AND #$00FF				;$BAB215   |
	PHX					;$BAB218   |
	JSL VRAM_payload_handler_global		;$BAB219   |
	PLX					;$BAB21D   |
	LDA $0001,x				;$BAB21E   |
	AND #$00FF				;$BAB221   |
	PHX					;$BAB224   |
	JSL set_PPU_registers_global		;$BAB225   |
	LDA #$00AA				;$BAB229   |
	LDY #$00E0				;$BAB22C   |
	LDX #$0004				;$BAB22F   |
	JSL DMA_global_palette			;$BAB232   |
	LDA #DATA_FD3DAE			;$BAB236   |
	LDY #$0000				;$BAB239   |
	LDX #$0008				;$BAB23C   |
	JSL DMA_palette				;$BAB23F   |
	PLX					;$BAB243   |
	PHX					;$BAB244   |
	LDA $0002,x				;$BAB245   |
	LDY #$0020				;$BAB248   |
	LDX #$0018				;$BAB24B   |
	JSL DMA_palette				;$BAB24E   |
	PLA					;$BAB252   |
	ADC #$0006				;$BAB253   |
	TAX					;$BAB256   |
	LDA #$0000				;$BAB257   |
	STA $000654				;$BAB25A   |
	STA $000658				;$BAB25E   |
	LDA #$00B4				;$BAB262   |
	JSR CODE_BAB48B				;$BAB265   |
	LDA.l $00065B				;$BAB268   |
	AND #$00FF				;$BAB26C   |
	XBA					;$BAB26F   |
	LSR A					;$BAB270   |
	LSR A					;$BAB271   |
	LSR A					;$BAB272   |
	STA DMA[0].size				;$BAB273   |
	STZ PPU.vram_address			;$BAB276   |
	SEP #$20				;$BAB279   |
	LDA #$01				;$BAB27B   |
	STA DMA[0].settings			;$BAB27D   |
	LDA #$18				;$BAB280   |
	STA DMA[0].destination			;$BAB282   |
	LDX #$3E00				;$BAB285   |
	STX DMA[0].source			;$BAB288   |
	LDA #$7E				;$BAB28B   |
	STA DMA[0].source_bank			;$BAB28D   |
	STZ DMA[0].unused_1			;$BAB290   |
	LDA #$01				;$BAB293   |
	STA CPU.enable_dma			;$BAB295   |
	STZ $065A				;$BAB298   |
	REP #$20				;$BAB29B   |
	LDY #$0200				;$BAB29D   |
	LDX #$3A00				;$BAB2A0   |
	LDA.l $00065B				;$BAB2A3   |
	AND #$00FF				;$BAB2A7   |
	ASL A					;$BAB2AA   |
	ASL A					;$BAB2AB   |
	DEC A					;$BAB2AC   |
	PHB					;$BAB2AD   |
	MVN $00, $7E				;$BAB2AE   |
	PLB					;$BAB2B1   |
	LDA #CODE_BAB31E			;$BAB2B2   |
	STA $00067D				;$BAB2B5   |
	LDA #$0100				;$BAB2B9   |
	JSL set_fade_global			;$BAB2BC   |
	LDA.l $00065A				;$BAB2C0   |
	XBA					;$BAB2C4   |
	AND #$00FF				;$BAB2C5   |
	LSR A					;$BAB2C8   |
	LSR A					;$BAB2C9   |
	INC A					;$BAB2CA   |
	STA $000650				;$BAB2CB   |
	STA $00065A				;$BAB2CF   |
	LDX #$0200				;$BAB2D3   |
CODE_BAB2D6:					;	   |
	LDA $0000,x				;$BAB2D6   |
	CLC					;$BAB2D9   |
	ADC #$0100				;$BAB2DA   |
	STA $0000,x				;$BAB2DD   |
	ADC #$0800				;$BAB2E0   |
	STA $0004,x				;$BAB2E3   |
	LDA $0008,x				;$BAB2E6   |
	SEC					;$BAB2E9   |
	SBC #$0100				;$BAB2EA   |
	STA $0008,x				;$BAB2ED   |
	CLC					;$BAB2F0   |
	ADC #$0800				;$BAB2F1   |
	STA $000C,x				;$BAB2F4   |
	TXA					;$BAB2F7   |
	CLC					;$BAB2F8   |
	ADC #$0010				;$BAB2F9   |
	TAX					;$BAB2FC   |
	DEC $0650				;$BAB2FD   |
	BNE CODE_BAB2D6				;$BAB300   |
	LDA #$012C				;$BAB302   |
	STA $00065E				;$BAB305   |
	LDA #$000B				;$BAB309   |
	STA $000660				;$BAB30C   |
	STA $000656				;$BAB310   |
	LDA #$0081				;$BAB314   |
	STA CPU.enable_interrupts		;$BAB317   |
	RTL					;$BAB31A  /

CODE_BAB31B:
	JMP ($067D)				;$BAB31B  /

CODE_BAB31E:
	LDA #$0200				;$BAB31E  \
	STA DMA[0].source			;$BAB321   |
	STA DMA[0].unused_2			;$BAB324   |
	LDA #$0220				;$BAB327   |
	STA DMA[0].size				;$BAB32A   |
	LDA #$0400				;$BAB32D   |
	STA DMA[0].settings			;$BAB330   |
	SEP #$20				;$BAB333   |
	STZ DMA[0].source_bank			;$BAB335   |
	LDA #$01				;$BAB338   |
	STA CPU.enable_dma			;$BAB33A   |
	REP #$20				;$BAB33D   |
	JSL fade_screen_global			;$BAB33F   |
	SEP #$20				;$BAB343   |
	LDA screen_brightness			;$BAB345   |
	STA PPU.screen				;$BAB348   |
	REP #$20				;$BAB34B   |
	DEC $0660				;$BAB34D   |
	BNE CODE_BAB3D1				;$BAB350   |
	LDA.l $000656				;$BAB352   |
	STA $000660				;$BAB356   |
	LDX #$0200				;$BAB35A   |
	LDA.l $00065A				;$BAB35D   |
	STA $000650				;$BAB361   |
	LDA.l $0006A3				;$BAB365   |
	EOR #$2000				;$BAB369   |
	STA $0006A3				;$BAB36C   |
	BIT #$2000				;$BAB370   |
	BEQ CODE_BAB3A4				;$BAB373   |
CODE_BAB375:					;	   |
	LDA $0000,x				;$BAB375   |
	SEC					;$BAB378   |
	SBC #$0200				;$BAB379   |
	STA $0000,x				;$BAB37C   |
	CLC					;$BAB37F   |
	ADC #$0800				;$BAB380   |
	STA $0004,x				;$BAB383   |
	LDA $0008,x				;$BAB386   |
	CLC					;$BAB389   |
	ADC #$0200				;$BAB38A   |
	STA $0008,x				;$BAB38D   |
	CLC					;$BAB390   |
	ADC #$0800				;$BAB391   |
	STA $000C,x				;$BAB394   |
	TXA					;$BAB397   |
	CLC					;$BAB398   |
	ADC #$0010				;$BAB399   |
	TAX					;$BAB39C   |
	DEC $0650				;$BAB39D   |
	BNE CODE_BAB375				;$BAB3A0   |
	BRA CODE_BAB3D1				;$BAB3A2  /

CODE_BAB3A4:
	LDA $0000,x				;$BAB3A4  \
	CLC					;$BAB3A7   |
	ADC #$0200				;$BAB3A8   |
	STA $0000,x				;$BAB3AB   |
	CLC					;$BAB3AE   |
	ADC #$0800				;$BAB3AF   |
	STA $0004,x				;$BAB3B2   |
	LDA $0008,x				;$BAB3B5   |
	SEC					;$BAB3B8   |
	SBC #$0200				;$BAB3B9   |
	STA $0008,x				;$BAB3BC   |
	CLC					;$BAB3BF   |
	ADC #$0800				;$BAB3C0   |
	STA $000C,x				;$BAB3C3   |
	TXA					;$BAB3C6   |
	CLC					;$BAB3C7   |
	ADC #$0010				;$BAB3C8   |
	TAX					;$BAB3CB   |
	DEC $0650				;$BAB3CC   |
	BNE CODE_BAB3A4				;$BAB3CF   |
CODE_BAB3D1:					;	   |
	DEC $065E				;$BAB3D1   |
	BEQ CODE_BAB3F6				;$BAB3D4   |
	LDA screen_brightness			;$BAB3D6   |
	AND #$000F				;$BAB3D9   |
	BNE CODE_BAB3E5				;$BAB3DC   |
	LDA #CODE_8087E1			;$BAB3DE   |
	JML CODE_808C9E				;$BAB3E1  /

CODE_BAB3E5:
	CMP #$000F				;$BAB3E5  \
	BNE CODE_BAB3FD				;$BAB3E8   |
	JSL CODE_80897C				;$BAB3EA   |
	LDA player_active_pressed		;$BAB3EE   |
	BIT #$F0C0				;$BAB3F1   |
	BEQ CODE_BAB3FD				;$BAB3F4   |
CODE_BAB3F6:					;	   |
	LDA #$810F				;$BAB3F6   |
	JSL set_fade_global			;$BAB3F9   |
CODE_BAB3FD:					;	   |
	RTL					;$BAB3FD  /

DATA_BAB3FE:
	dw DATA_BAB404
	dw DATA_BAB432
	dw DATA_BAB461

DATA_BAB404:
	db $35, $36 : dw destroy_them_all_layer_1_palette : db $0F, $00
	db $11, ">DESTROY THEM ALL!", $13, ">D?TRUISEZ-LES TOUS!"

DATA_BAB432:
	db $36, $36 : dw collect_the_stars_layer_1_palette : db $0F, $00
	db $12, ">COLLECT THE STARS!", $13, ">% VOUS LES ?TOILES!"

DATA_BAB461:
	db $37, $36 : dw find_the_token_layer_1_palette : db $0F, $00
	db $0F, ">FIND THE TOKEN!", $11, ">TROUVEZ LE JETON!"

CODE_BAB48B:
	PHB					;$BAB48B  \
	PHK					;$BAB48C   |
	PLB					;$BAB48D   |
	XBA					;$BAB48E   |
	STA $00065C				;$BAB48F   |
	XBA					;$BAB493   |
	LDY language_select			;$BAB494   |
	BEQ CODE_BAB4AE				;$BAB497   |
	PHA					;$BAB499   |
	LDA $0000,x				;$BAB49A   |
	AND #$00FF				;$BAB49D   |
	STA $000650				;$BAB4A0   |
	TXA					;$BAB4A4   |
	CLC					;$BAB4A5   |
	ADC $000650				;$BAB4A6   |
	TAX					;$BAB4AA   |
	INX					;$BAB4AB   |
	INX					;$BAB4AC   |
	PLA					;$BAB4AD   |
CODE_BAB4AE:					;	   |
	STZ $0650				;$BAB4AE   |
	SEP #$20				;$BAB4B1   |
	LDA $0000,x				;$BAB4B3   |
	STA $000650				;$BAB4B6   |
	STA $00065B				;$BAB4BA   |
	ASL $065B				;$BAB4BE   |
	ASL A					;$BAB4C1   |
	ASL A					;$BAB4C2   |
	ASL A					;$BAB4C3   |
	STA $00065C				;$BAB4C4   |
	LDA #$FF				;$BAB4C8   |
	SEC					;$BAB4CA   |
	SBC $00065C				;$BAB4CB   |
	LSR A					;$BAB4CF   |
	STA $00065C				;$BAB4D0   |
	REP #$20				;$BAB4D4   |
	INX					;$BAB4D6   |
	INX					;$BAB4D7   |
	STX $CB					;$BAB4D8   |
	LDA #$3A00				;$BAB4DA   |
	STA $CE					;$BAB4DD   |
	LDY #$3E00				;$BAB4DF   |
	SEP #$20				;$BAB4E2   |
	LDA #$7E				;$BAB4E4   |
	STA $D0					;$BAB4E6   |
	REP #$20				;$BAB4E8   |
CODE_BAB4EA:					;	   |
	LDA [$CB]				;$BAB4EA   |
	AND #$00FF				;$BAB4EC   |
	SEC					;$BAB4EF   |
	SBC #$0021				;$BAB4F0   |
	BPL CODE_BAB50D				;$BAB4F3   |
	SEP #$20				;$BAB4F5   |
	DEC $065B				;$BAB4F7   |
	DEC $065B				;$BAB4FA   |
	REP #$20				;$BAB4FD   |
	LDA.l $00065C				;$BAB4FF   |
	CLC					;$BAB503   |
	ADC #$0008				;$BAB504   |
	STA $00065C				;$BAB507   |
	BRA CODE_BAB571				;$BAB50B  /

CODE_BAB50D:
	TAX					;$BAB50D  \
	%pea_mask_dbr(DATA_B4C4B3)		;$BAB50E   |
	PLB					;$BAB511   |
	PLB					;$BAB512   |
	LDA.w DATA_B4C4B3,x			;$BAB513   |
	PHK					;$BAB516   |
	PLB					;$BAB517   |
	AND #$00FF				;$BAB518   |
	XBA					;$BAB51B   |
	LSR A					;$BAB51C   |
	LSR A					;$BAB51D   |
	CLC					;$BAB51E   |
	ADC #$0660				;$BAB51F   |
	TAX					;$BAB522   |
	LDA #$003F				;$BAB523   |
	PHB					;$BAB526   |
	MVN $7E, $FC				;$BAB527   |
	PLB					;$BAB52A   |
	LDA.l $00065C				;$BAB52B   |
	STA [$CE]				;$BAB52F   |
	INC $CE					;$BAB531   |
	INC $CE					;$BAB533   |
	LDA #$003C				;$BAB535   |
	XBA					;$BAB538   |
	ORA $000654				;$BAB539   |
	STA [$CE]				;$BAB53D   |
	INC $CE					;$BAB53F   |
	INC $CE					;$BAB541   |
	INC $0654				;$BAB543   |
	LDA.l $00065C				;$BAB546   |
	CLC					;$BAB54A   |
	ADC #$0800				;$BAB54B   |
	STA [$CE]				;$BAB54E   |
	INC $CE					;$BAB550   |
	INC $CE					;$BAB552   |
	LDA #$003C				;$BAB554   |
	XBA					;$BAB557   |
	ORA $000654				;$BAB558   |
	STA [$CE]				;$BAB55C   |
	INC $CE					;$BAB55E   |
	INC $CE					;$BAB560   |
	INC $0654				;$BAB562   |
	LDA.l $00065C				;$BAB565   |
	CLC					;$BAB569   |
	ADC #$0008				;$BAB56A   |
	STA $00065C				;$BAB56D   |
CODE_BAB571:					;	   |
	INC $CB					;$BAB571   |
	DEC $0650				;$BAB573   |
	BEQ CODE_BAB57B				;$BAB576   |
	BRL CODE_BAB4EA				;$BAB578  /

CODE_BAB57B:
	INC $065A				;$BAB57B  \
	PLB					;$BAB57E   |
	RTS					;$BAB57F  /

CODE_BAB580:
	LDA #$0010				;$BAB580  \
	STA $00065E				;$BAB583   |
	JSR CODE_BAB60F				;$BAB587   |
	PHB					;$BAB58A   |
	%pea_mask_dbr(DATA_B4C4B3)		;$BAB58B   |
	PLB					;$BAB58E   |
	PLB					;$BAB58F   |
	JSR CODE_BAB5F5				;$BAB590   |
	LDA [$CE]				;$BAB593   |
	AND #$00FF				;$BAB595   |
	STA $000650				;$BAB598   |
	LDA #$0020				;$BAB59C   |
	SEC					;$BAB59F   |
	SBC $000650				;$BAB5A0   |
	BIT #$0001				;$BAB5A4   |
	BEQ CODE_BAB5AA				;$BAB5A7   |
	DEC A					;$BAB5A9   |
CODE_BAB5AA:					;	   |
	TAY					;$BAB5AA   |
	INC $CE					;$BAB5AB   |
	LDA [$CE]				;$BAB5AD   |
	AND #$00FF				;$BAB5AF   |
	XBA					;$BAB5B2   |
	INC $CE					;$BAB5B3   |
CODE_BAB5B5:					;	   |
	SEP #$20				;$BAB5B5   |
	LDA [$CE]				;$BAB5B7   |
	BEQ CODE_BAB5E5				;$BAB5B9   |
	SEC					;$BAB5BB   |
	SBC #$21				;$BAB5BC   |
	BMI CODE_BAB5EB				;$BAB5BE   |
	STA $00065C				;$BAB5C0   |
	LDX $065C				;$BAB5C4   |
	LDA.w DATA_B4C4B3,x			;$BAB5C7   |
	ASL A					;$BAB5CA   |
	REP #$20				;$BAB5CB   |
CODE_BAB5CD:					;	   |
	STA [$C8],y				;$BAB5CD   |
	PHY					;$BAB5CF   |
	PHA					;$BAB5D0   |
	TYA					;$BAB5D1   |
	CLC					;$BAB5D2   |
	ADC #$0040				;$BAB5D3   |
	TAY					;$BAB5D6   |
	PLA					;$BAB5D7   |
	INC A					;$BAB5D8   |
	STA [$C8],y				;$BAB5D9   |
	PLY					;$BAB5DB   |
	INY					;$BAB5DC   |
	INY					;$BAB5DD   |
	INC $CE					;$BAB5DE   |
	DEC $0654				;$BAB5E0   |
	BRA CODE_BAB5B5				;$BAB5E3  /

CODE_BAB5E5:
	REP #$20				;$BAB5E5  \
	INC $CE					;$BAB5E7   |
CODE_BAB5E9:					;	   |
	PLB					;$BAB5E9   |
	RTS					;$BAB5EA  /

CODE_BAB5EB:
	REP #$20				;$BAB5EB  \
	AND #$FE00				;$BAB5ED   |
	ORA #$00FE				;$BAB5F0   |
	BRA CODE_BAB5CD				;$BAB5F3  /

CODE_BAB5F5:
	LDA #$3E00				;$BAB5F5  \
	STA $C8					;$BAB5F8   |
	STZ $065C				;$BAB5FA   |
	LDA #$BA00				;$BAB5FD   |
	STA $CF					;$BAB600   |
	STX $CE					;$BAB602   |
	LDY #$0000				;$BAB604   |
	LDA #$0020				;$BAB607   |
	STA $000654				;$BAB60A   |
	RTS					;$BAB60E  /

CODE_BAB60F:
	PHB					;$BAB60F  \
	%pea_mask_dbr(DATA_B4C4B3)		;$BAB610   |
	PLB					;$BAB613   |
	PLB					;$BAB614   |
	JSR CODE_BAB5F5				;$BAB615   |
	LDA #$00FE				;$BAB618   |
CODE_BAB61B:					;	   |
	STA [$C8],y				;$BAB61B   |
	PHY					;$BAB61D   |
	PHA					;$BAB61E   |
	TYA					;$BAB61F   |
	CLC					;$BAB620   |
	ADC #$0040				;$BAB621   |
	TAY					;$BAB624   |
	PLA					;$BAB625   |
	STA [$C8],y				;$BAB626   |
	PLY					;$BAB628   |
	INY					;$BAB629   |
	INY					;$BAB62A   |
	DEC $0654				;$BAB62B   |
	BNE CODE_BAB61B				;$BAB62E   |
	BRL CODE_BAB5E9				;$BAB630  /

CODE_BAB633:
	STZ CPU.enable_interrupts		;$BAB633  \
	PHK					;$BAB636   |
	PLB					;$BAB637   |
	STZ PPU.oam_address			;$BAB638   |
	LDA #$0080				;$BAB63B   |
	STA PPU.screen				;$BAB63E   |
	STZ $06A5				;$BAB641   |
	PHK					;$BAB644   |
	PHK					;$BAB645   |
	PLA					;$BAB646   |
	STA $CC					;$BAB647   |
	JSL disable_screen			;$BAB649   |
	JSL clear_VRAM_global			;$BAB64D   |
	JSL CODE_BAC7C0				;$BAB651   |
	JSL clear_wram_tables			;$BAB655   |
	JSL init_sprite_render_order_global	;$BAB659   |
	JSL CODE_B4BE2F				;$BAB65D   |
	LDA #$0780				;$BAB661   |
	STA $000650				;$BAB664   |
	LDA #$3EFF				;$BAB668   |
	LDX #$7000				;$BAB66B   |
	STX PPU.vram_address			;$BAB66E   |
CODE_BAB671:					;	   |
	STA PPU.vram_write			;$BAB671   |
	DEC $0650				;$BAB674   |
	BNE CODE_BAB671				;$BAB677   |
	LDA #$0038				;$BAB679   |
	JSL VRAM_payload_handler_global		;$BAB67C   |
	LDA #$0037				;$BAB680   |
	JSL set_PPU_registers_global		;$BAB683   |
	LDA #DATA_BAB90B			;$BAB687   |
	STA $000662				;$BAB68A   |
	LDA #$0008				;$BAB68E   |
	STA $00065E				;$BAB691   |
	LDA #$0002				;$BAB695   |
	STA $000660				;$BAB698   |
	LDA #DATA_FD3DAE			;$BAB69C   |
	LDY #$0000				;$BAB69F   |
	LDX #$0008				;$BAB6A2   |
	JSL DMA_palette				;$BAB6A5   |
	LDA #credits_header_layer_1_palette	;$BAB6A9   |
	LDY #$0030				;$BAB6AC   |
	LDX #$0004				;$BAB6AF   |
	JSL DMA_palette				;$BAB6B2   |
	LDA #$00AA				;$BAB6B6   |
	LDY #$0020				;$BAB6B9   |
	LDX #$0004				;$BAB6BC   |
	JSL DMA_global_palette			;$BAB6BF   |
	LDA #credits_name_text_layer_1_palette	;$BAB6C3   |
	LDY #$0040				;$BAB6C6   |
	LDX #$0004				;$BAB6C9   |
	JSL DMA_palette				;$BAB6CC   |
	LDA #$73C0				;$BAB6D0   |
	STA $000652				;$BAB6D3   |
	LDA #$FF08				;$BAB6D7   |
	STA $000666				;$BAB6DA   |
	STZ $0664				;$BAB6DE   |
	LDA #CODE_BAB6F6			;$BAB6E1   |
	STA $00067D				;$BAB6E4   |
	LDA #$0100				;$BAB6E8   |
	JSL set_fade_global			;$BAB6EB   |
	LDA #$0081				;$BAB6EF   |
	STA CPU.enable_interrupts		;$BAB6F2   |
	RTL					;$BAB6F5  /

CODE_BAB6F6:
	LDA.l $0006A5				;$BAB6F6  \
	BIT #$0002				;$BAB6FA   |
	BEQ CODE_BAB768				;$BAB6FD   |
	AND #$FFFD				;$BAB6FF   |
	STA $0006A5				;$BAB702   |
	LDA #$0660				;$BAB706   |
	STA DMA[0].size				;$BAB709   |
	LDA #$5800				;$BAB70C   |
	STA PPU.vram_address			;$BAB70F   |
	SEP #$20				;$BAB712   |
	LDA #$01				;$BAB714   |
	STA DMA[0].settings			;$BAB716   |
	LDA #$18				;$BAB719   |
	STA DMA[0].destination			;$BAB71B   |
	LDX #DATA_FC0000			;$BAB71E   |
	STX DMA[0].source			;$BAB721   |
	LDA #DATA_FC0000>>16			;$BAB724   |
	STA DMA[0].source_bank			;$BAB726   |
	STZ DMA[0].unused_1			;$BAB729   |
	LDA #$01				;$BAB72C   |
	STA CPU.enable_dma			;$BAB72E   |
	REP #$20				;$BAB731   |
	LDA #$0240				;$BAB733   |
	STA DMA[0].size				;$BAB736   |
	LDA.l $000652				;$BAB739   |
	STA PPU.vram_address			;$BAB73D   |
	SEP #$20				;$BAB740   |
	LDA #$01				;$BAB742   |
	STA DMA[0].settings			;$BAB744   |
	LDA #$18				;$BAB747   |
	STA DMA[0].destination			;$BAB749   |
	LDX #DATA_F57D13			;$BAB74C   |
	STX DMA[0].source			;$BAB74F   |
	LDA #DATA_F57D13>>16			;$BAB752   |
	STA DMA[0].source_bank			;$BAB754   |
	STZ DMA[0].unused_1			;$BAB757   |
	LDA #$01				;$BAB75A   |
	STA CPU.enable_dma			;$BAB75C   |
	REP #$20				;$BAB75F   |
	LDA #$FF08				;$BAB761   |
	STA $000666				;$BAB764   |
CODE_BAB768:					;	   |
	LDA.l $0006A5				;$BAB768   |
	BIT #$0040				;$BAB76C   |
	BEQ CODE_BAB7A6				;$BAB76F   |
	AND #$FFBF				;$BAB771   |
	STA $0006A5				;$BAB774   |
	LDA #$0080				;$BAB778   |
	STA DMA[0].size				;$BAB77B   |
	LDA.l $000652				;$BAB77E   |
	STA PPU.vram_address			;$BAB782   |
	SEP #$20				;$BAB785   |
	LDA #$01				;$BAB787   |
	STA DMA[0].settings			;$BAB789   |
	LDA #$18				;$BAB78C   |
	STA DMA[0].destination			;$BAB78E   |
	LDX #$3E00				;$BAB791   |
	STX DMA[0].source			;$BAB794   |
	LDA #$7E				;$BAB797   |
	STA DMA[0].source_bank			;$BAB799   |
	STZ DMA[0].unused_1			;$BAB79C   |
	LDA #$01				;$BAB79F   |
	STA CPU.enable_dma			;$BAB7A1   |
	REP #$20				;$BAB7A4   |
CODE_BAB7A6:					;	   |
	JSL fade_screen_global			;$BAB7A6   |
	SEP #$20				;$BAB7AA   |
	LDA screen_brightness			;$BAB7AC   |
	STA PPU.screen				;$BAB7AF   |
	REP #$20				;$BAB7B2   |
	LDA screen_brightness			;$BAB7B4   |
	BNE CODE_BAB7BC				;$BAB7B7   |
	JMP ($067F)				;$BAB7B9  /

CODE_BAB7BC:
	DEC $0660				;$BAB7BC  \
	BEQ CODE_BAB7C4				;$BAB7BF   |
	BRL CODE_BAB8CD				;$BAB7C1  /

CODE_BAB7C4:
	LDA #$0002				;$BAB7C4  \
	STA $000660				;$BAB7C7   |
	DEC $065E				;$BAB7CB   |
	BEQ CODE_BAB7D3				;$BAB7CE   |
	BRL CODE_BAB8B2				;$BAB7D0  /

CODE_BAB7D3:
	LDA #$0010				;$BAB7D3  \
	STA $00065E				;$BAB7D6   |
	LDA.l $0006A5				;$BAB7DA   |
	BIT #$0004				;$BAB7DE   |
	BNE CODE_BAB7F7				;$BAB7E1   |
	LDA.l $000652				;$BAB7E3   |
	CLC					;$BAB7E7   |
	ADC #$0040				;$BAB7E8   |
	CMP #$7800				;$BAB7EB   |
	BCC CODE_BAB7F3				;$BAB7EE   |
	LDA #$7000				;$BAB7F0   |
CODE_BAB7F3:					;	   |
	STA $000652				;$BAB7F3   |
CODE_BAB7F7:					;	   |
	LDX $0662				;$BAB7F7   |
	LDA $0000,x				;$BAB7FA   |
	AND #$00FF				;$BAB7FD   |
	BNE CODE_BAB812				;$BAB800   |
	LDA #$0010				;$BAB802   |
	STA $00065E				;$BAB805   |
	JSR CODE_BAB60F				;$BAB809   |
	INC $0662				;$BAB80C   |
	BRL CODE_BAB8A7				;$BAB80F  /

CODE_BAB812:
	CMP #$0061				;$BAB812  \
	BNE CODE_BAB828				;$BAB815   |
	LDA.l $0006A5				;$BAB817   |
	ORA #$0004				;$BAB81B   |
	STA $0006A5				;$BAB81E   |
	INC $0662				;$BAB822   |
	BRL CODE_BAB8B2				;$BAB825  /

CODE_BAB828:
	CMP #$0062				;$BAB828  \
	BNE CODE_BAB83E				;$BAB82B   |
	LDA.l $0006A5				;$BAB82D   |
	ORA #$0002				;$BAB831   |
	STA $0006A5				;$BAB834   |
	INC $0662				;$BAB838   |
	BRL CODE_BAB8B2				;$BAB83B  /

CODE_BAB83E:
	CMP #$0063				;$BAB83E  \
	BNE CODE_BAB858				;$BAB841   |
	STA $00065E				;$BAB843   |
	LDA #$810F				;$BAB847   |
	JSL set_fade_global			;$BAB84A   |
	LDA #CODE_BAB8FD			;$BAB84E   |
	STA $00067F				;$BAB851   |
	BRL CODE_BAB8B2				;$BAB855  /

CODE_BAB858:
	CMP #$0060				;$BAB858  \
	BNE CODE_BAB862				;$BAB85B   |
	INC $0662				;$BAB85D   |
	BRA CODE_BAB8B2				;$BAB860  /

CODE_BAB862:
	LDA $0001,x				;$BAB862  \
	AND #$0008				;$BAB865   |
	BEQ CODE_BAB89E				;$BAB868   |
	LDA language_select			;$BAB86A   |
	BEQ CODE_BAB883				;$BAB86D   |
	LDA $0000,x				;$BAB86F   |
	AND #$00FF				;$BAB872   |
	INC A					;$BAB875   |
	INC A					;$BAB876   |
	SEC					;$BAB877   |
	ADC $000662				;$BAB878   |
	STA $000662				;$BAB87C   |
	TAX					;$BAB880   |
	BRA CODE_BAB89E				;$BAB881  /

CODE_BAB883:
	JSR CODE_BAB580				;$BAB883  \
	LDX $CE					;$BAB886   |
	STX $0662				;$BAB888   |
	LDA $0000,x				;$BAB88B   |
	AND #$00FF				;$BAB88E   |
	INC A					;$BAB891   |
	INC A					;$BAB892   |
	SEC					;$BAB893   |
	ADC $000662				;$BAB894   |
	STA $000662				;$BAB898   |
	BRA CODE_BAB8A7				;$BAB89C  /

CODE_BAB89E:
	JSR CODE_BAB580				;$BAB89E  \
	LDA $CE					;$BAB8A1   |
	STA $000662				;$BAB8A3   |
CODE_BAB8A7:					;	   |
	LDA.l $0006A5				;$BAB8A7   |
	ORA #$0040				;$BAB8AB   |
	STA $0006A5				;$BAB8AE   |
CODE_BAB8B2:					;	   |
	LDA.l $0006A5				;$BAB8B2   |
	BIT #$0004				;$BAB8B6   |
	BNE CODE_BAB8D6				;$BAB8B9   |
	INC $0664				;$BAB8BB   |
	LDA.l $000664				;$BAB8BE   |
	SEP #$20				;$BAB8C2   |
	STA PPU.layer_1_scroll_y		;$BAB8C4   |
	XBA					;$BAB8C7   |
	STA PPU.layer_1_scroll_y		;$BAB8C8   |
	REP #$20				;$BAB8CB   |
CODE_BAB8CD:					;	   |
	LDA.l $0006A5				;$BAB8CD   |
	BIT #$0004				;$BAB8D1   |
	BEQ CODE_BAB8F8				;$BAB8D4   |
CODE_BAB8D6:					;	   |
	LDA screen_brightness			;$BAB8D6   |
	CMP #$000F				;$BAB8D9   |
	BNE CODE_BAB8F8				;$BAB8DC   |
	JSL CODE_80897C				;$BAB8DE   |
	LDA player_active_held			;$BAB8E2   |
	BIT #$D0C0				;$BAB8E5   |
	BEQ CODE_BAB8F8				;$BAB8E8   |
	LDA #CODE_BAB8F9			;$BAB8EA   |
	STA $00067F				;$BAB8ED   |
	LDA #$810F				;$BAB8F1   |
	JSL set_fade_global			;$BAB8F4   |
CODE_BAB8F8:					;	   |
	RTL					;$BAB8F8  /

CODE_BAB8F9:
	JML restart_rareware_logo		;$BAB8F9  |

CODE_BAB8FD:
	LDA #CODE_808CD9			;$BAB8FD  \
	STA NMI_pointer				;$BAB900   |
	LDA #CODE_B490D9			;$BAB902   |
	STA $00067D				;$BAB905   |
	BRA CODE_BAB8F8				;$BAB909  /

DATA_BAB90B:
	db "````", $00, $00, $00
	db $0F, $08, "HEAD PROGRAMMER", $00
	db $13, $08, "PROGRAMMEUR EN CHEF", $00, $00
	db $0D, $10, "C. SUTHERLAND", $00, $00, $00, $00, $00, $00
	db $19, $08, "ASSISTANT HEAD PROGRAMMER", $00
	db $1B, $08, "PROGRAMMEUR EN CHEF ADJOINT", $00, $00
	db $09, $10, "M. WILSON", $00, $00, $00, $00, $00, $00
	db $14, $08, "TECHNICAL PROGRAMMER", $00
	db $15, $08, "PROGRAMMEUR TECHNIQUE", $00, $00
	db $07, $10, "B. GUNN", $00, $00, $00, $00, $00
	db $0A, $08, "PROGRAMMER", $00
	db $0B, $08, "PROGRAMMEUR", $00, $00
	db $0A, $10, "T. ATTWOOD", $00, $00, $00, $00, $00
	db $16, $08, "CHARACTERS / ANIMATION", $00
	db $17, $08, "PERSONNAGES / ANIMATION", $00, $00
	db $09, $10, "S. MAYLES", $00, $00, $00, $00, $00
	db $16, $08, "OBJECTS AND ADDITIONAL", $00
	db $1C, $08, "PERSONNAGES SUP. ET OBJETS /", $00
	db $18, $08, "CHARACTERS / BACKGROUNDS", $00
	db $06, $08, "D?CORS", $00, $00
	db $0C, $10, "M. STEVENSON", $00, $00, $00, $00, $00
	db $0B, $08, "BACKGROUNDS", $00
	db $06, $08, "D?CORS", $00, $00
	db $07, $10, "C. GAGE", $00, $00
	db $07, $10, "J. NASH", $00, $00
	db $08, $10, "A. SMITH", $00, $00, $00, $00, $00
	db $15, $08, "GRAPHICS MANIPULATION", $00
	db $1B, $08, "MANIPULATION DES GRAPHIQUES", $00, $00
	db $07, $10, "C. PEIL", $00, $00, $00, $00, $00
	db $13, $08, "ADDITIONAL GRAPHICS", $00
	db $1B, $08, "MANIPULATION DES GRAPHIQUES", $00
	db $0C, $08, "MANIPULATION", $00
	db $0F, $08, "SUPPL?MENTAIRES", $00, $00
	db $08, $10, "S. HURST", $00, $00, $00, $00, $00
	db $15, $08, "MUSIC / SOUND EFFECTS", $00
	db $18, $08, "MUSIQUE / EFFETS SONORES", $00, $00
	db $07, $10, "D. WISE", $00, $00, $00, $00, $00
	db $10, $08, "AUDIO PROGRAMMER", $00
	db $12, $08, "PROGRAMMEUR DU SON", $00, $00
	db $09, $10, "P. WATTIS", $00, $00, $00, $00, $00
	db $0C, $08, "GAME TESTING", $00
	db $0F, $08, "TESTEURS DU JEU", $00, $00
	db $07, $10, "H. WARD", $00, $00
	db $0B, $10, "G. RICHARDS", $00, $00
	db $09, $10, "P. WEAVER", $00, $00
	db $09, $10, "J. HASTIE", $00, $00
	db $0F, $10, "J. CHARLESWORTH", $00, $00
	db $07, $10, "G. HOOD", $00, $00, $00, $00, $00
	db $18, $08, "NINTENDO PRODUCT TESTING", $00
	db $1C, $08, "TESTEURS DU PRODUIT NINTENDO", $00, $00
	db $0B, $10, "M. KELBAUGH", $00, $00
	db $0D, $10, "R. RICHARDSON", $00, $00
	db $0B, $10, "A. WILLIAMS", $00, $00
	db $0C, $10, "T. BECHTEL", $00, $00
	db $07, $10, "E. WAAS", $00, $00
	db $0A, $10, "R. JOHNSON", $00, $00
	db $0A, $10, "C. NEEDHAM", $00, $00, $00, $00, $00
	db $06, $08, "MANUAL", $00
	db $10, $08, "MANUEL AMERICAIN", $00, $00
	db $08, $10, "D. OWSEN", $00, $00
	db $0E, $10, "NINTENDO POWER", $00, $00, $00, $00, $00
	db $05, $08, "STORY", $00
	db $08, $08, "HISTOIRE", $00, $00
	db $0A, $10, "L. LOVEDAY", $00, $00, $00, $00, $00
	db $0E, $08, "SPECIAL THANKS", $00
	db $16, $08, "REMERCIEMENTS SP?CIAUX", $00, $00
	db $0C, $10, "MR. YAMAUCHI", $00, $00
	db $0B, $10, "MR. ARAKAWA", $00, $00
	db $09, $10, "M. FUKUDA", $00, $00
	db $0B, $10, "MR. LINCOLN", $00, $00
	db $0A, $10, "S. STAMPER", $00, $00
	db $09, $10, "S. FARMER", $00, $00
	db $0B, $10, "J. HOCHBERG", $00, $00
	db $0C, $10, "S. YAMASHIRO", $00, $00
	db $09, $10, "H. YAMADA", $00, $00
	db $09, $10, "K. TANABE", $00, $00
	db $0D, $10, "M. HATAKEYAMA", $00, $00
	db $09, $10, "L. ASHLEY", $00, $00
	db $08, $10, "C. MOYSE", $00, $00
	db $0A, $10, "V. CHANTEL", $00, $00, $00, $00, $00
	db $10, $08, "SOFTWARE SYSTEMS", $00
	db $16, $08, "SYST&MES DES SOFTWARES", $00, $00
	db $15, $10, "RARE / NINTENDO ACM 2", $00, $00
	db $10, $10, "SILICON GRAPHICS", $00, $00, $00, $00, $00
	db $08, $08, "HARDWARE", $00
	db $08, $08, "HARDWARE", $00, $00
	db $0C, $10, "RARE SYSTEMS", $00, $00
	db $10, $10, "SILICON GRAPHICS", $00, $00, $00, $00, $00
	db $1C, $08, "ORIGINAL DONKEY KONG CREATOR", $00
	db $18, $08, "CR?ATEUR D'ORIGINE DE DK", $00, $00
	db $0B, $10, "S. MIYAMOTO", $00, $00, $00, $00, $00
	db $17, $08, "ASSISTANT GAME DESIGNER", $00
	db $19, $08, "CONCEPTEUR ADJOINT DU JEU", $00, $00
	db $0A, $10, "A. COLLARD", $00, $00, $00, $00, $00
	db $16, $08, "GAME DESIGN / PRODUCER", $00
	db $14, $08, "CONCEPT / PRODUCTION", $00, $00
	db $09, $10, "G. MAYLES", $00, $00, $00, $00, $00
	db $12, $08, "EXECUTIVE DIRECTOR", $00
	db $12, $08, "DIRECTEUR EX?CUTIF", $00, $00
	db $0A, $10, "T. STAMPER", $00, $00, $00, $00, $00
	db $0C, $08, " PRODUCED BY", $00
	db $0C, $08, " PRODUIT PAR", $00, $00
	db $04, $10, "RARE", $00, $00, $00, $00, $00
	db $0C, $08, "PRESENTED BY", $00
	db $0C, $08, "PR?SENT? PAR", $00, $00
	db $08, $10, "NINTENDO", $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $62, "````", $00, $00, $00, $00, $00
	db $61, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $63

krool_water_drips_sprite_code:
	LDA.l $0006A3				;$BAC0D2  \
	BIT #$4000				;$BAC0D6   |
	BEQ .state_handler			;$BAC0D9   | 
	JSL delete_sprite_handle_deallocation	;$BAC0DB   | 
	JML [$05A9]				;$BAC0DF  /

.state_handler:
	LDX current_sprite			;$BAC0E2  \
	LDA $2E,x				;$BAC0E4   |
	ASL A					;$BAC0E6   |
	TAX					;$BAC0E7   |
	PHK					;$BAC0E8   |
	PLB					;$BAC0E9   |
	JMP (.state_table,x)			;$BAC0EA  /

.state_table:
	dw .dummy_animated_state
	dw .state_1
	dw .state_2


.dummy_animated_state:
	JSL CODE_B9D100				;$BAC0F3  \ process animations
	JML [$05A9]				;$BAC0F7  / done processing sprite

.state_1:
	LDY #$0162				;$BAC0FA  \
	JSL CODE_BB8412				;$BAC0FD   | spawn another water drop
	LDX current_sprite			;$BAC101   |
	INC $2E,x				;$BAC103   |
	LDA $42,x				;$BAC105   |
	LDY alternate_sprite			;$BAC107   |
	STA $0042,y				;$BAC109   |
	JSL CODE_B9D09B				;$BAC10C   |
	JML [$05A9]				;$BAC110  /

.state_2:
	LDX current_sprite			;$BAC113  \
	LDA $24,x				;$BAC115   |
	CLC					;$BAC117   |
	ADC #$0020				;$BAC118   |
	STA $24,x				;$BAC11B   |
	JSL apply_position_from_velocity_global	;$BAC11D   |
	LDX current_sprite			;$BAC121   |
	LDA $0A,x				;$BAC123   |
	CMP #$01C0				;$BAC125   |
	BCC .return				;$BAC128   |
	STZ $2E,x				;$BAC12A   |
	JSL CODE_B9D100				;$BAC12C   | process animations
.return:					;	   |
	JML [$05A9]				;$BAC130  / done processing sprite

krool_fish_sprite_code:
	LDX current_sprite			;$BAC133  \
	LDA $2E,x				;$BAC135   |
	ASL A					;$BAC137   |
	TAX					;$BAC138   |
	PHK					;$BAC139   |
	PLB					;$BAC13A   |
	JMP (.state_table,x)			;$BAC13B  /

.state_table:
	dw .bounce_state
	dw .fall_state


.bounce_state:
	JSR .interpolate_fish_velocities	;$BAC142  \
	LDA $0A,x				;$BAC145   | get fish Y position
	CMP #$01C5				;$BAC147   | check if it reached 01C5
	BCC .handle_timer			;$BAC14A   | if not, handle state transition timer
	LDA #$01C5				;$BAC14C   | else cap it to 01C5
	STA $0A,x				;$BAC14F   | 
	LDA $46,x				;$BAC151   | get timer value
	BNE .continue_bounce_state		;$BAC153   | if timer hasn't finished yet, don't transition state
	INC $2E,x				;$BAC155   | else set fall state
	LDA #$FB00				;$BAC157   |
	STA $24,x				;$BAC15A   | set current Y velocity
	LDA #$0700				;$BAC15C   |
	STA $2A,x				;$BAC15F   | set target Y velocity
	LDA #$0003				;$BAC161   |
	STA $44,x				;$BAC164   | set preset to use for Y interpolation
	LDA #$055B				;$BAC166   |
	JSL queue_sound_effect			;$BAC169   | play krool water splash 1 sound
	LDA #$065C				;$BAC16D   |
	JSL queue_sound_effect			;$BAC170   | play krool water splash 2 sound
	BRL .return				;$BAC174  / done processing sprite

.continue_bounce_state:
	JSL CODE_B4C175				;$BAC177  \ get RNG (A)
	LDY #$00FF				;$BAC17B   |
	JSL divide_a_by_y			;$BAC17E   |
	LDA CPU.multiply_result			;$BAC182   |
	STA $000650				;$BAC185   | store result
	LDA #$FE80				;$BAC189   | load base Y velocity
	SEC					;$BAC18C   |
	SBC $000650				;$BAC18D   | subtract it by division result to get new Y velocity
	LDX current_sprite			;$BAC191   | get fish sprite
	STA $24,x				;$BAC193   | set current Y velocity
	LDA #$055B				;$BAC195   |
	JSL queue_sound_effect			;$BAC198   | play krool water splash 1 sound
	LDA #$065C				;$BAC19C   |
	JSL queue_sound_effect			;$BAC19F   | play krool water splash 2 sound
	LDX current_sprite			;$BAC1A3   | 
	INC $42,x				;$BAC1A5   | increase bounce count
.handle_timer:					;	   |
	LDA $46,x				;$BAC1A7   | get timer value
	BEQ .return				;$BAC1A9   | if timer finished, return
	DEC $46,x				;$BAC1AB   | else count it down
.return:					;	   |
	JSL CODE_B9D100				;$BAC1AD   | process animation
	JML [$05A9]				;$BAC1B1  / done processing sprite

.fall_state:
	JSR .interpolate_fish_velocities	;$BAC1B4  \
	JSL CODE_B9D100				;$BAC1B7   | process animation
	JSL CODE_BBBB8D				;$BAC1BB   | kill sprite if offscreen
	JML [$05A9]				;$BAC1BF  / done processing sprite

.interpolate_fish_velocities:
	LDX current_sprite			;$BAC1C2  \ get fish sprite
	LDA $42,x				;$BAC1C4   | get bounce count
	JSL interpolate_x_velocity_global	;$BAC1C6   | and use it as X interpolation preset
	LDX current_sprite			;$BAC1CA   |
	LDA $44,x				;$BAC1CC   | get Y interpolation preset
	JSL interpolate_y_velocity_global	;$BAC1CE   | 
	JSL apply_position_from_velocity_global	;$BAC1D2   |
	LDX current_sprite			;$BAC1D6   | 
	RTS					;$BAC1D8  /

kong_npc_sprite_code:
	PHB					;$BAC1D9  \
	PHK					;$BAC1DA   |
	PLB					;$BAC1DB   |
	LDX current_sprite			;$BAC1DC   |
	LDA $42,x				;$BAC1DE   |
	BNE CODE_BAC1FF				;$BAC1E0   |
	INC $42,x				;$BAC1E2   |
	LDY $44,x				;$BAC1E4   |
	LDA $0000,y				;$BAC1E6   |
	CMP #$0063				;$BAC1E9   |
	BNE CODE_BAC1F7				;$BAC1EC   |
	LDA $0002,y				;$BAC1EE   |
	STA $44,x				;$BAC1F1   |
	TAY					;$BAC1F3   |
	LDA $0000,y				;$BAC1F4   |
CODE_BAC1F7:					;	   |
	INY					;$BAC1F7   |
	INY					;$BAC1F8   |
	STY $44,x				;$BAC1F9   |
	JSL set_sprite_animation		;$BAC1FB   |
CODE_BAC1FF:					;	   |
	LDA.l $0006A5				;$BAC1FF   |
	BIT #$0800				;$BAC203   |
	BEQ CODE_BAC24E				;$BAC206   |
	LDA #$0003				;$BAC208   |
	CMP $000652				;$BAC20B   |
	BNE CODE_BAC24E				;$BAC20F   |
	LDA.l $0006A5				;$BAC211   |
	BIT #$0008				;$BAC215   |
	BNE CODE_BAC234				;$BAC218   |
	LDX active_kong_sprite			;$BAC21A   |
	LDA $0A,x				;$BAC21D   |
	SEC					;$BAC21F   |
	SBC #$0003				;$BAC220   |
	STA $0A,x				;$BAC223   |
	LDX inactive_kong_sprite		;$BAC225   |
	STA $0A,x				;$BAC228   |
	LDX current_sprite			;$BAC22A   |
	LDA $0A,x				;$BAC22C   |
	SEC					;$BAC22E   |
	SBC #$0003				;$BAC22F   |
	BRA CODE_BAC24C				;$BAC232  /

CODE_BAC234:
	LDX active_kong_sprite			;$BAC234  \
	LDA $0A,x				;$BAC237   |
	CLC					;$BAC239   |
	ADC #$0003				;$BAC23A   |
	STA $0A,x				;$BAC23D   |
	LDX inactive_kong_sprite		;$BAC23F   |
	STA $0A,x				;$BAC242   |
	LDX current_sprite			;$BAC244   |
	LDA $0A,x				;$BAC246   |
	CLC					;$BAC248   |
	ADC #$0003				;$BAC249   |
CODE_BAC24C:					;	   |
	STA $0A,x				;$BAC24C   |
CODE_BAC24E:					;	   |
	JSL CODE_B9D100				;$BAC24E   |
	PLB					;$BAC252   |
	JML [$05A9]				;$BAC253  /

CODE_BAC256:
	STZ $42,x				;$BAC256  \
	RTL					;$BAC258  /

;cranky animation sequence (animation ids that play in sequence once the previous one finishes playing)
DATA_BAC259:
	dw $01C7
	dw $01C7
	dw $01C7
	dw $01C7
	dw $01C9
	dw $01C7
	dw $01C7
	dw $01C7
	dw $01C8
	dw $0063, DATA_BAC259

;funky animation sequence (animation ids that play in sequence once the previous one finishes playing)
DATA_BAC26F:
	dw $01CC
	dw $01CC
	dw $01CC
	dw $01CC
	dw $01CC
	dw $01CD
	dw $01CA
	dw $01CA
	dw $01CA
	dw $01CA
	dw $01CA
	dw $01CA
	dw $01CE
	dw $0063, DATA_BAC26F

;funky board animation sequence (animation ids that play in sequence once the previous one finishes playing)
DATA_BAC28D:
	dw $01CF
	dw $01CF
	dw $01CF
	dw $01CF
	dw $01CF
	dw $01D0
	dw $01CB
	dw $01CB
	dw $01CB
	dw $01CB
	dw $01CB
	dw $01CB
	dw $01D1
	dw $0063, DATA_BAC28D

;swanky animation sequence (animation ids that play in sequence once the previous one finishes playing)
DATA_BAC2AB:
	dw $01D6
DATA_BAC2AD:
	dw $01D3
	dw $01D2
	dw $01D4
	dw $01D4
	dw $01D4
	dw $01D5
	dw $0063, DATA_BAC2AD

DATA_BAC2BD:
	dw $01D7
	dw $0063, DATA_BAC2BD

;wrinkly animation sequence (animation ids that play in sequence once the previous one finishes playing)
DATA_BAC2C3:
	dw $01D9
DATA_BAC2C5:
	dw $01DA
	dw $01DA
	dw $01DA
	dw $01DA
	dw $01DB
	dw $01DC
	dw $01DA
	dw $01DA
	dw $01DA
	dw $01DB
	dw $01DD
	dw $01DF
	dw $01DF
	dw $0063, DATA_BAC2C5

DATA_BAC2E3:
	dw $01E0
DATA_BAC2E5:
	dw $01E1
	dw $01E1
	dw $01E1
	dw $01E1
	dw $01E2
	dw $01E3
	dw $01E1
	dw $01E1
	dw $01E1
	dw $01E2
	dw $01E4
	dw $01E6
	dw $01E6
	dw $0063, DATA_BAC2E5


scroll_and_float_barrel_sprite_code:
	LDX current_sprite			;$BAC303  \
	STX $0674				;$BAC305   |
	DEC $46,x				;$BAC308   |
	BNE CODE_BAC318				;$BAC30A   |
	LDA $4A,x				;$BAC30C   |
	STA $46,x				;$BAC30E   |
	LDA $26,x				;$BAC310   |
	EOR #$FFFF				;$BAC312   |
	INC A					;$BAC315   |
	STA $26,x				;$BAC316   |
CODE_BAC318:					;	   |
	DEC $48,x				;$BAC318   |
	BNE CODE_BAC328				;$BAC31A   |
	LDA $4C,x				;$BAC31C   |
	STA $48,x				;$BAC31E   |
	LDA $2A,x				;$BAC320   |
	EOR #$FFFF				;$BAC322   |
	INC A					;$BAC325   |
	STA $2A,x				;$BAC326   |
CODE_BAC328:					;	   |
	LDA $44,x				;$BAC328   |
	PHA					;$BAC32A   |
	JSL interpolate_x_velocity_global	;$BAC32B   |
	PLA					;$BAC32F   |
	JSL interpolate_y_velocity_global	;$BAC330   |
	JSL apply_position_from_velocity_global	;$BAC334   |
	JSL CODE_B9D100				;$BAC338   |
	LDA level_number			;$BAC33C   |
	CMP #!level_pirate_panic_k_rools_cabin	;$BAC33E   |
	BEQ CODE_BAC346				;$BAC341   |
	JML [$05A9]				;$BAC343  /

CODE_BAC346:
	LDY current_sprite			;$BAC346  \
	LDA $002E,y				;$BAC348   |
	ASL A					;$BAC34B   |
	TAX					;$BAC34C   |
	JMP (DATA_BAC350,x)			;$BAC34D  /

DATA_BAC350:
	dw CODE_BAC356
	dw CODE_BAC386
	dw CODE_BAC397


CODE_BAC356:
	JSL CODE_BCFB58				;$BAC356  \
	LDA #$0008				;$BAC35A   |
	JSL CODE_BCFCB5				;$BAC35D   |
	BCS CODE_BAC36A				;$BAC361   |
	JSL CODE_BBBB99				;$BAC363   |
	JML [$05A9]				;$BAC367  /

CODE_BAC36A:
	SEP #$20				;$BAC36A  \
	LDA #$17				;$BAC36C   |
	STA PPU.screens				;$BAC36E   |
	REP #$20				;$BAC371   |
	LDX current_sprite			;$BAC373   |
	INC $2E,x				;$BAC375   |
	LDA #$0258				;$BAC377   |
	STA $4E,x				;$BAC37A   |
	LDA #$062E				;$BAC37C   |
	JSL queue_sound_effect			;$BAC37F   |
	JML [$05A9]				;$BAC383  /

CODE_BAC386:
	LDX current_sprite			;$BAC386  \
	DEC $4E,x				;$BAC388   |
	BPL CODE_BAC397				;$BAC38A   |
	SEP #$20				;$BAC38C   |
	LDA #$13				;$BAC38E   |
	STA PPU.screens				;$BAC390   |
	REP #$20				;$BAC393   |
	INC $2E,x				;$BAC395   |
CODE_BAC397:					;	   |
	JML [$05A9]				;$BAC397  /

;likely a k rool projectile (seems to be unused)
DATA_BAC39A:
	dw CODE_B695ED, $04B0, $0000, $04B0, $0000, $0000, $0000, $0046, $0000

;k rool krocodile kore projectiles
DATA_BAC3AC:
	dw CODE_B699A8, $0200, $0000, $0200, $0000, $0000, $0000, $0078, $0000
	dw CODE_B695ED, $0280, $0000, $0280, $0000, $0000, $0000, $0046, $0000
	dw CODE_B695ED, $0280, $0000, $0280, $0000, $0000, $0000, $0041, $0000
	dw CODE_B695ED, $02C0, $0000, $02C0, $0000, $0000, $0000, $003C, $0010
	dw CODE_B695ED, $02C0, $0000, $02C0, $0000, $0000, $0000, $0037, $FFF0
	dw CODE_B695ED, $0300, $0000, $0300, $0000, $0000, $0000, $0032, $0010
	dw CODE_B695ED, $0300, $0000, $0300, $0000, $0000, $0000, $002D, $FFF0
	dw CODE_B695ED, $0340, $0000, $0340, $0000, $0000, $0000, $0096, $0000
	dw CODE_B699A8, $0280, $0000, $0280, $0000, $0000, $0000, $0032, $000C
	dw CODE_B699A8, $0280, $0000, $0280, $0000, $0000, $0000, $0078, $FFF0
	dw CODE_B695ED, $0300, $0000, $0300, $0000, $0000, $0000, $002D, $0010
	dw CODE_B695ED, $0300, $0000, $0300, $0000, $0000, $0000, $0028, $FFF0
	dw CODE_B695ED, $0300, $0000, $0300, $0000, $0000, $0000, $0028, $0010
	dw CODE_B695ED, $0300, $0000, $0300, $0000, $0000, $0000, $0023, $FFF0
	dw CODE_B695ED, $0300, $0000, $0300, $0000, $0000, $0000, $0023, $0010
	dw CODE_B695ED, $0300, $0000, $0300, $0000, $0000, $0000, $001E, $FFF0
	dw CODE_B695ED, $0300, $0000, $0300, $0000, $0000, $0000, $001B, $0010
	dw CODE_B695ED, $0300, $0000, $0300, $0000, $0000, $0000, $0096, $FFF0
	dw CODE_B699A8, $0280, $0000, $0280, $0000, $0000, $0000, $002D, $0000
	dw CODE_B699A8, $0280, $0000, $0280, $0000, $0000, $0000, $002D, $0000
	dw CODE_B699A8, $0280, $0000, $0280, $0000, $0000, $0000, $0078, $0000
	dw CODE_B695ED, $0280, $0000, $0280, $0000, $0000, $0000, $0032, $0000
	dw CODE_B695ED, $0280, $0000, $0280, $0000, $0000, $0000, $0028, $0000
	dw CODE_B695ED, $0280, $0000, $0280, $0000, $0000, $0000, $0028, $0000
	dw CODE_B695ED, $0280, $0000, $0280, $0000, $0000, $0000, $0023, $0000
	dw CODE_B695ED, $0280, $0000, $0280, $0000, $0000, $0000, $0023, $0000
	dw CODE_B695ED, $0280, $0000, $0280, $0000, $0000, $0000, $001E, $0000
	dw CODE_B695ED, $0280, $0000, $0280, $0000, $0000, $0000, $001E, $0000
	dw CODE_B695ED, $0280, $0000, $0280, $0000, $0000, $0000, $00D2, $0000
	dw CODE_B699A8, $0180, $0000, $0180, $0000, $0000, $0000, $003C, $0000
	dw CODE_B699A8, $0380, $0000, $0380, $0000, $0000, $0000, $005A, $0000
	dw CODE_B695ED, $01C0, $0000, $01C0, $0000, $0000, $0000, $002D, $0000
	dw CODE_B695ED, $0480, $0000, $0480, $0000, $0000, $0000, $00A0, $0000
	dw CODE_B695ED, $01A0, $0000, $01A0, $0000, $0000, $0000, $001E, $0000
	dw CODE_B695ED, $0480, $0000, $0480, $0000, $0000, $0000, $002D, $0000
	dw CODE_B695ED, $0480, $0000, $0480, $0000, $0000, $0000, $00A0, $0000
	dw CODE_B695ED, $0180, $0000, $0180, $0000, $0000, $0000, $001E, $0000
	dw CODE_B695ED, $0480, $0000, $0480, $0000, $0000, $0000, $002D, $0000
	dw CODE_B695ED, $0480, $0000, $0480, $0000, $0000, $0000, $002D, $0000
	dw CODE_B695ED, $0480, $0000, $0480, $0000, $0000, $0000, $00B4, $0000
	dw CODE_B699A8, $0280, $0000, $0280, $0000, $0000, $0000, $000F, $0010
	dw CODE_B699A8, $0280, $0000, $0280, $0000, $0000, $0000, $000F, $0000
	dw CODE_B699A8, $0280, $0000, $0280, $0000, $0000, $0000, $0078, $FFF0
	dw CODE_B695ED, $0280, $0000, $0280, $0000, $0000, $0000, $0014, $0010
	dw CODE_B695ED, $0280, $0000, $0280, $0000, $0000, $0000, $0014, $0000
	dw CODE_B695ED, $0280, $0000, $0280, $0000, $0000, $0000, $0069, $FFF0
	dw CODE_B695ED, $0280, $0000, $0280, $0000, $0000, $0000, $0014, $FFF0
	dw CODE_B695ED, $0280, $0000, $0280, $0000, $0000, $0000, $0014, $0000
	dw CODE_B695ED, $0280, $0000, $0280, $0000, $0000, $0000, $0069, $0010
	dw CODE_B695ED, $0280, $0000, $0280, $0000, $0000, $0000, $0012, $0010
	dw CODE_B695ED, $0280, $0000, $0280, $0000, $0000, $0000, $0012, $0008
	dw CODE_B695ED, $0280, $0000, $0280, $0000, $0000, $0000, $0024, $0000
	dw CODE_B695ED, $0280, $0000, $0280, $0000, $0000, $0000, $0069, $FFF0
	dw CODE_B695ED, $0280, $0000, $0280, $0000, $0000, $0000, $0012, $FFF0
	dw CODE_B695ED, $0280, $0000, $0280, $0000, $0000, $0000, $0012, $FFF8
	dw CODE_B695ED, $0280, $0000, $0280, $0000, $0000, $0000, $0024, $0000
	dw CODE_B695ED, $0280, $0000, $0280, $0000, $0000, $0000, $0096, $0010
	dw CODE_B695ED, $01C0, $0000, $01C0, $0000, $0000, $0000, $0258, $0000

CODE_BAC7C0:
	JSR CODE_BAC7C4				;$BAC7C0  \
	RTL					;$BAC7C3  /

CODE_BAC7C4:
	REP #$20				;$BAC7C4  \
	STZ oam_attribute[$00].size		;$BAC7C6   |
	STZ oam_attribute[$02].size		;$BAC7C9   |
	STZ oam_attribute[$04].size		;$BAC7CC   |
	STZ oam_attribute[$06].size		;$BAC7CF   |
	STZ oam_attribute[$08].size		;$BAC7D2   |
	STZ oam_attribute[$0A].size		;$BAC7D5   |
	STZ oam_attribute[$0C].size		;$BAC7D8   |
	STZ oam_attribute[$0E].size		;$BAC7DB   |
	STZ oam_attribute[$10].size		;$BAC7DE   |
	STZ oam_attribute[$12].size		;$BAC7E1   |
	STZ oam_attribute[$14].size		;$BAC7E4   |
	STZ oam_attribute[$16].size		;$BAC7E7   |
	STZ oam_attribute[$18].size		;$BAC7EA   |
	STZ oam_attribute[$1A].size		;$BAC7ED   |
	STZ oam_attribute[$1C].size		;$BAC7F0   |
	STZ oam_attribute[$1E].size		;$BAC7F3   |
	LDX #$0004				;$BAC7F6   |
	LDY #$0000				;$BAC7F9   |
	CLC					;$BAC7FC   |
CODE_BAC7FD:					;	   |
	LDA #$F000				;$BAC7FD   |
	STA oam[$00].x,y			;$BAC800   |
	STA oam[$01].x,y			;$BAC803   |
	STA oam[$02].x,y			;$BAC806   |
	STA oam[$03].x,y			;$BAC809   |
	STA oam[$04].x,y			;$BAC80C   |
	STA oam[$05].x,y			;$BAC80F   |
	STA oam[$06].x,y			;$BAC812   |
	STA oam[$07].x,y			;$BAC815   |
	STA oam[$08].x,y			;$BAC818   |
	STA oam[$09].x,y			;$BAC81B   |
	STA oam[$0A].x,y			;$BAC81E   |
	STA oam[$0B].x,y			;$BAC821   |
	STA oam[$0C].x,y			;$BAC824   |
	STA oam[$0D].x,y			;$BAC827   |
	STA oam[$0E].x,y			;$BAC82A   |
	STA oam[$0F].x,y			;$BAC82D   |
	STA oam[$10].x,y			;$BAC830   |
	STA oam[$11].x,y			;$BAC833   |
	STA oam[$12].x,y			;$BAC836   |
	STA oam[$13].x,y			;$BAC839   |
	STA oam[$14].x,y			;$BAC83C   |
	STA oam[$15].x,y			;$BAC83F   |
	STA oam[$16].x,y			;$BAC842   |
	STA oam[$17].x,y			;$BAC845   |
	STA oam[$18].x,y			;$BAC848   |
	STA oam[$19].x,y			;$BAC84B   |
	STA oam[$1A].x,y			;$BAC84E   |
	STA oam[$1B].x,y			;$BAC851   |
	STA oam[$1C].x,y			;$BAC854   |
	STA oam[$1D].x,y			;$BAC857   |
	STA oam[$1E].x,y			;$BAC85A   |
	STA oam[$1F].x,y			;$BAC85D   |
	TYA					;$BAC860   |
	ADC #$0080				;$BAC861   |
	TAY					;$BAC864   |
	DEX					;$BAC865   |
	BNE CODE_BAC7FD				;$BAC866   |
	RTS					;$BAC868  /

;used by boss_command_code_49 (shoot fish)
DATA_BAC869:
	db $04, $00

DATA_BAC86B:
	db $00, $FD, $00, $00, $05, $00, $00, $00
	db $00, $05, $02, $00, $20, $01, $00, $00
	db $00, $FE, $00, $00, $05, $00, $00, $FE
	db $00, $05, $03, $00, $80, $01, $00, $00
	db $80, $FD, $00, $00, $05, $00, $00, $FD
	db $00, $05, $03, $00, $00, $02, $00, $40
	db $80, $FE, $00, $00, $05, $00, $00, $FB
	db $00, $06, $03, $00, $00, $02, $00, $40


;kreepy krow sparkle velocities
DATA_BAC8AB:
	dw $FE00

DATA_BAC8AD:
	dw $FF00

DATA_BAC8AF:
	dw $FE50

DATA_BAC8B1:
	dw $0080

;unknown, stored into their $42,x and $44,x respectively
DATA_BAC8B3:
	db $04

DATA_BAC8B4:
	db $06

;values to subtract from their frame display time?
DATA_BAC8B5:
	db $00, $01, $50, $00, $40, $01, $80, $FE
	db $40, $00, $04, $06, $80, $00, $00, $FF
	db $DC, $FF, $80, $FB, $A0, $00, $04, $05
	db $A0, $00, $E0, $FD, $50, $FF, $00, $FB
	db $60, $00, $02, $05, $C0, $00, $B0, $FD
	db $40, $FF, $00, $FE, $60, $00, $05, $06
	db $10, $00, $00, $01, $00, $00, $80, $FB
	db $90, $00, $04, $06, $60, $00, $90, $FF
	db $B0, $FF, $80, $F9, $80, $00, $03, $06
	db $D0, $00, $80, $FF, $C0, $FF, $60, $FE
	db $60, $00, $02, $04, $70, $00, $D0, $FD
	db $70, $FF, $00, $FD, $90, $00, $04, $04
	db $20, $00, $80, $01, $00, $01, $80, $FC
	db $60, $00, $04, $03, $10, $00, $00, $FE
	db $20, $FF, $80, $FA, $80, $00, $04, $03
	db $B0, $00, $00, $02, $B0, $00, $00, $FD
	db $00, $01, $0A, $05, $D0, $00, $80, $01
	db $00, $01, $00, $FE, $D0, $00, $04, $06
	db $90, $00, $01, $00

if !version == 0
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
else
CODE_BAC949:
	INC $0769				;$BAC949  \
	LDA.l $000769				;$BAC94C   |
	CMP #$0005				;$BAC950   |
	BNE CODE_BAC958				;$BAC953   |
	STZ $0769				;$BAC955   |
CODE_BAC958:					;	   |
	RTL					;$BAC958  /
endif


warnpc $BAD000 : padbyte $00 : pad $BAD000

DATA_BAD000:
	db $0E, $00
	db "     Pirate Panic     - FREE", $00, $00
	db "     Lockjaw's Locker - FREE", $00, $00
	db "     Mainbrace Mayhem - FREE", $00, $00
	db "     Pirate Panic     - 1 COIN", $00, $00
	db "     Gangplank Galley - 2 COINS", $00, $00
	db "     Topsail Trouble  - 3 COINS", $00, $00
	db "     Leave Museum", $00, $00

DATA_BAD0D1:
	db $0E, $00
	db "     Lava Lagoon     - FREE", $00, $00
	db "     Hot-Head Hop    - FREE", $00, $00
	db "     Red-Hot Ride    - FREE", $00, $00
	db "     Hot-Head Hop    - 1 COIN", $00, $00
	db "     Kannon's Klaim  - 2 COINS", $00, $00
	db "     Squawks's Shaft - 3 COINS", $00, $00
	db "     Leave Museum", $00, $00

DATA_BAD19C:
	db $0E, $00
	db "     Barrel Bayou  - FREE", $00, $00
	db "     Bramble Blast - FREE", $00, $00
	db "     Slime Climb   - FREE", $00, $00
	db "     Glimmer's     - 1 COIN", $00
	db "      Galleon", $00
	db "     Rattle Battle - 2 COINS", $00, $00
	db "     Bramble Blast - 3 COINS", $00, $00
	db "     Leave Museum", $00, $00

DATA_BAD268:
	db $0E, $00
	db "     Hornet Hole      - FREE", $00, $00
	db "     Rambi Rumble     - FREE", $00, $00
	db "     Bramble Scramble - FREE", $00, $00
	db "     Target Terror    - 1 COIN", $00, $00
	db "     Rambi Rumble     - 2 COINS", $00, $00
	db "     Hornet Hole      - 3 COINS", $00, $00
	db "     Leave Museum", $00, $00

DATA_BAD339:
	db $0E, $00
	db "     Ghostly Grove - FREE", $00, $00
	db "     Parrot Chute  - FREE", $00
	db "      Panic", $00
	db "     Web Woods     - FREE", $00, $00
	db "     Haunted Hall  - 1 COIN", $00, $00
	db "     Parrot Chute  - 2 COINS", $00
	db "      Panic", $00
	db "     Ghostly Grove - 3 COINS", $00, $00
	db "     Leave Museum", $00, $00

DATA_BAD40E:
	db $0E, $00
	db "     Arctic Abyss - FREE", $00, $00
	db "     Chain Link   - FREE", $00
	db "      Chamber", $00
	db "     Toxic Tower  - FREE", $00, $00
	db "     Clapper's    - 1 COIN", $00
	db "      Cavern", $00
	db "     Castle Crush - 2 COINS", $00, $00
	db "     Chain Link   - 3 COINS", $00
	db "      Chamber", $00
	db "     Leave Museum", $00, $00

DATA_BAD4ED:
	db $0C, $00
	db "     Jungle Jinx      - 2 COINS", $00, $00
	db "     Black Ice Battle - 2 COINS", $00, $00
	db "     Klobber Karnage  - 2 COINS ", $00, $00
	db "     Fiery Furnace    - 2 COINS ", $00, $00
	db "     Animal Antics    - 2 COINS ", $00, $00
	db "     Leave Museum", $00, $00

DATA_BAD5AA:
	db $04, $00
	db "     Hire Plane - 2 COINS", $00, $00
	db "     Leave Airport", $00, $00, $00, $00

DATA_BAD5DD:
	db $10, $00
	db "     Save Game     - FREE", $00, $00
	db "     Kong Family   - FREE", $00
	db "      Coins", $00
	db "     Swimming      - FREE", $00, $00
	db "     End of Level  - FREE", $00
	db "      Target", $00
	db "     Rambi's       - 1 COIN", $00
	db "      Supercharge", $00
	db "     Character     - 1 COIN", $00
	db "      Team-up", $00
	db "     Area Guardian - 2 COINS", $00, $00
	db "     Leave Kollege", $00, $00

DATA_BAD6EC:
	db $10, $00
	db "     Save Game        - FREE", $00, $00
	db "     Rattly the Snake - FREE", $00, $00
	db "     Rope Climbing    - FREE", $00, $00
	db "     KONG Letters     - FREE", $00, $00
	db "     Squitter's Web   - 1 COIN", $00
	db "      Platform", $00
	db "     Kremkoins        - 1 COIN", $00, $00
	db "     Area Guardian    - 2 COINS", $00, $00
	db "     Leave Kollege", $00, $00

DATA_BAD7E9:
	db $10, $00
	db "     Save Game         - FREE", $00, $00
	db "     Animal Barrels    - FREE", $00, $00
	db "     Jumping on        - FREE", $00
	db "      Enemies", $00
	db "     Extra Lives       - FREE", $00
	db "      Balloons", $00
	db "     Rattly's          - 1 COIN", $00
	db "      Superjump", $00
	db "     Cranky's 'Video   - 1 COIN", $00
	db "      Game Hero' Coins", $00
	db "     Area Guardian     - 2 COINS", $00, $00
	db "     Leave Kollege", $00, $00

DATA_BAD91F:
	db $0A, $00
	db "     Save Game     - FREE", $00, $00
	db "     Secret Doors  - FREE", $00, $00
	db "     Roll Jump     - 1 COIN", $00, $00
	db "     Area Guardian - 2 COINS", $00, $00
	db "     Leave Kollege", $00, $00

DATA_BAD9A6:
	db $0A, $00
	db "     Save Game       - FREE", $00, $00
	db "     Secret Passages - FREE", $00, $00
	db "     Bonus Levels    - 1 COIN", $00, $00
	db "     Area Guardian   - 2 COINS", $00, $00
	db "     Leave Kollege", $00, $00

DATA_BADA35:
	db $08, $00
	db "     Save Game       - FREE", $00, $00
	db "     Invisible Items - FREE", $00, $00
	db "     Enguarde's      - 1 COIN", $00
	db "      SuperStab", $00
	db "     Leave Kollege", $00, $00

DATA_BADAB3:
	db $08, $00
	db "     Save Game      - 1 COIN!", $00, $00
	db "     Wrinkly Kong   - FREE", $00, $00
	db "     Kaptain K.Rool - 3 COINS", $00, $00
	db "     Leave Kollege", $00, $00

DATA_BADB23:
	db $08, $00
	db "     Swanky's Swag   - FREE", $00, $00
	db "     Pirate Puzzler  - 1 COIN", $00, $00
	db "     Chimp Challenge - 2 COINS", $00, $00
	db "     Leave Studio", $00, $00

DATA_BADB94:
	db $08, $00
	db "     Cranky Challenge - 1 COIN", $00, $00
	db "     Lucky Lava       - 2 COINS", $00, $00
	db "     Gorilla Game     - 3 COINS", $00, $00
	db "     Leave Studio", $00, $00

DATA_BADC0B:
	db $08, $00
	db "     Funky's Fun     - 1 COIN", $00, $00
	db "     Swampy Swag     - 2 COINS", $00, $00
	db "     Primate Prize   - 3 COINS", $00, $00
	db "     Leave Studio", $00, $00

DATA_BADC7F:
	db $08, $00
	db "     Wrinkly's Winner - 1 COIN", $00, $00
	db "     Krazy Kwiz       - 2 COINS", $00, $00
	db "     Baboon Booty     - 3 COINS", $00, $00
	db "     Leave Studio", $00, $00

DATA_BADCF6:
	db $08, $00
	db "     Lockjaw's Loot  - 1 COIN", $00, $00
	db "     Haunted Haul    - 2 COINS", $00, $00
	db "     Gibbon Game     - 3 COINS", $00, $00
	db "     Leave Studio", $00, $00

DATA_BADD6A:
	db $08, $00
	db "     K. Rool's Kwiz   - 1 COIN", $00, $00
	db "     Castle Challenge - 2 COINS", $00, $00
	db "     Big Ape Bounty   - 3 COINS", $00, $00
	db "     Leave Studio", $00, $00

DATA_BADDE1:
	db $06, $00
	db "     Pay Up - 15 Kremkoins", $00, $00
	db "     Fight Him!", $00, $00
	db "     Run Away", $00, $00

DATA_BADE1F:
	db $08, $00
	db "     Tr~sor de      - GRATUIT", $00
	db "      Swanky", $00
	db "     Puzzle des     - 1 PIECE", $00
	db "      Pirates", $00
	db "     Challenge des  - 2 PIECES", $00
	db "      Chimpanz~s", $00
	db "     Quitter le Studio", $00, $00

DATA_BADEC0:
	db $08, $00
	db "     Challenge de   - 1 PIECE", $00
	db "      Cranky", $00
	db "     Lave Lumineuse - 2 PIECES", $00, $00
	db "     Jeu de         - 3 PIECES", $00
	db "      Gorilles", $00
	db "     Quitter le Studio", $00, $00

DATA_BADF53:
	db $08, $00
	db "     Farce de       - 1 PIECE", $00
	db "      Funky", $00
	db "     Mar~cage       - 2 PIECES", $00
	db "      Marrant", $00
	db "     Prix des       - 3 PIECES", $00
	db "      Primates", $00
	db "    Quitter le Studio", $00, $00

DATA_BADFF1:
	db $08, $00
	db "     Vernis avec    - 1 PIECE", $00
	db "      Wrinkly", $00
	db "     Kwiz Kwagnant  - 2 PIECES", $00, $00
	db "     Butin de       - 3 PIECES", $00
	db "      Babouins", $00
	db "     Quitter le Studio", $00, $00

DATA_BAE085:
	db $08, $00
	db "     Magot de       - 1 PIECE", $00
	db "      Lockjaw", $00
	db "     Prise Surprise - 2 PIECES", $00, $00
	db "     Carton du      - 3 PIECES", $00
	db "      Gibbon", $00
	db "     Quitter le Studio", $00, $00

DATA_BAE117:
	db $08, $00
	db "     Kwiz de        - 1 PIECE", $00
	db "      K. Rool", $00
	db "     Challenge du   - 2 PIECES", $00
	db "      Ch{teau", $00
	db "     Tr~sor du      - 3 PIECES", $00
	db "      Grand Singe", $00
	db "     Quitter le Studio", $00, $00

DATA_BAE1BB:
	db $0E, $00
	db "     Panique | bord - GRATUIT", $00, $00
	db "     Casier de      - GRATUIT", $00
	db "      Lockjaw", $00
	db "     M~li-m~lo dans - GRATUIT", $00
	db "      les m{ts", $00
	db "     Panique |      - 1 PIECE", $00
	db "      bord", $00
	db "     Passerelle de  - 2 PIECES", $00
	db "      la gal}re", $00
	db "     Micmac dans la - 3 PIECES", $00
	db "      m{ture", $00
	db "     Sortir du Mus~e", $00, $00

DATA_BAE2CF:
	db $0E, $00
	db "     Lagon de lave  - GRATUIT", $00, $00
	db "     Parcours des   - GRATUIT", $00
	db "      t", $7F, "tes br", $83, "l~es", $00
	db "     Travers~e      - GRATUIT", $00
	db "      embras~e", $00
	db "     Parcours des   - 1 PIECE", $00
	db "      t", $7F, "tes br", $83, "l~es", $00
	db "     Complainte de  - 2 PIECES", $00
	db "      Kannon", $00
	db "     Perchoir de    - 3 PIECES", $00
	db "      Squawk", $00
	db "     Sortir du Mus~e", $00, $00

DATA_BAE3EF:
	db $0E, $00
	db "     Bayou du baril - GRATUIT", $00, $00
	db "     Chardon Ardent - GRATUIT", $00, $00
	db "     Ascension      - GRATUIT", $00
	db "      visqueuse", $00
	db "     Galion de      - 1 PIECE", $00
	db "      Glimmer", $00
	db "     Bataille       - 2 PIECES", $00
	db "      canaille", $00
	db "     Chardon Ardent - 3 PIECES", $00, $00
	db "     Sortir du Mus~e", $00, $00

DATA_BAE4ED:
	db $0E, $00
	db "     Frelons        - GRATUIT", $00
	db "      fr~missants", $00
	db "     Rambi          - GRATUIT", $00
	db "      chambarde", $00
	db "     Embrouillamini - GRATUIT", $00
	db "      joli", $00
	db "     Objectif       - 1 PIECE", $00
	db "      ~pouvante", $00
	db "     Rambi          - 2 PIECES", $00
	db "      chambarde", $00
	db "     Frelons        - 3 PIECES", $00
	db "      fr~missants", $00
	db "     Sortir du Mus~e", $00, $00

DATA_BAE61A:
	db $0E, $00
	db "     Funeste futaie - GRATUIT", $00, $00
	db "     Perroquet      - GRATUIT", $00
	db "      paniqu~", $00
	db "     Toile des bois - GRATUIT", $00, $00
	db "     Antre hant~    - 1 PIECE", $00, $00
	db "     Perroquet      - 2 PIECES", $00
	db "      paniqu~", $00
	db "     Funeste futaie - 3 PIECES", $00, $00
	db "     Sortir du Mus~e", $00, $00

DATA_BAE708:
	db $0E, $00
	db "     Abysses        - GRATUIT", $00
	db "      arctiques", $00
	db "     Salon du       - GRATUIT", $00
	db "      maillon", $00
	db "     Tour toxique   - GRATUIT", $00, $00
	db "     Caverne de     - 1 PIECE", $00
	db "      Clapper", $00
	db "     Bastion        - 2 PIECES", $00
	db "      broyeur", $00
	db "     Salon du       - 3 PIECES", $00
	db "      maillon", $00
	db "     Sortir du Mus~e", $00, $00

DATA_BAE81F:
	db $0C, $00
	db "     Jungle          - 2 PIECES", $00
	db "      ensorcel~e", $00
	db "     Bataille de la  - 2 PIECES", $00
	db "      glace noire", $00
	db "     Ch{taignes et   - 2 PIECES", $00
	db "      marrons", $00
	db "     Fournaise       - 2 PIECES", $00
	db "      furieuse", $00
	db "     Fac~ties        - 2 PIECES", $00
	db "      animali}res", $00
	db "     Sortir du Mus~e", $00, $00

DATA_BAE929:
	db $10, $00
	db "     Sauvegarde     - GRATUIT", $00, $00
	db "     Jeton DK       - GRATUIT", $00, $00
	db "     Natation       - GRATUIT", $00, $00
	db "     Cible de Fin   - GRATUIT", $00
	db "      de Niveau", $00
	db "     Super Charge   - 1 PIECE", $00
	db "      de Rambi", $00
	db "     En Equipe      - 1 PIECE", $00, $00
	db "     Boss du Niveau - 2 PIECES", $00, $00
	db "     Quitter le Koll}ge", $00, $00

DATA_BAEA3B:
	db $10, $00
	db "     Sauvegarde     - GRATUIT", $00, $00
	db "     Rattly le      - GRATUIT", $00
	db "      Cobra.", $00
	db "     Monter aux     - GRATUIT", $00
	db "      lianes", $00
	db "     Lettres KONG   - GRATUIT", $00, $00
	db "     Plateau de la  - 1 PIECE", $00
	db "      Toile de Squitter", $00
	db "     Pi}ces Krem    - 1 PIECE", $00, $00
	db "     Boss du Niveau - 2 PIECES", $00, $00
	db "     Quitter le Koll}ge", $00, $00

DATA_BAEB5F:
	db $10, $00
	db "     Sauvegarde     - GRATUIT", $00, $00
	db "     Barils         - GRATUIT", $00
	db "      d'Animaux", $00
	db "     Sauter sur les - GRATUIT", $00
	db "      ennemis.", $00
	db "     Ballons Vie    - GRATUIT", $00
	db "      Sup.", $00
	db "     Super Saut     - 1 PIECE", $00
	db "      de Rattly", $00
	db "     Jetons H~ros   - 1 PIECE", $00
	db "      de Jeu Vid~o", $00
	db "     Boss du Niveau - 2 PIECES", $00, $00
	db "     Quitter le Koll}ge", $00, $00

DATA_BAEC9C:
	db $0A, $00
	db "     Sauvegarde     - GRATUIT", $00, $00
	db "     Portes         - GRATUIT", $00
	db "      Secr}tes", $00
	db "     Saut Roul~     - 1 PIECE", $00, $00
	db "     Boss du Niveau - 2 PIECES", $00, $00
	db "     Quitter le Koll}ge", $00, $00

DATA_BAED42:
	db $0A, $00
	db "     Sauvegarde     - GRATUIT", $00, $00
	db "     Passages       - GRATUIT", $00
	db "      Secrets", $00
	db "     Niveaux de     - 1 PIECE", $00
	db "      Bonus", $00
	db "     Boss du Niveau - 2 PIECES", $00, $00
	db "     Quitter le Koll}ge", $00, $00

DATA_BAEDF2:
	db $08, $00
	db "     Sauvegarde     - GRATUIT", $00, $00
	db "     Objets         - GRATUIT", $00
	db "      invisibles", $00
	db "     Super Attaque  - 1 PIECE", $00
	db "      d'Enguarde", $00
	db "     Quitter le Koll}ge", $00, $00

DATA_BAEE8A:
	db $08, $00
	db "     Sauvegarde     - 1 PIECE!", $00, $00
	db "     Wrinkly Kong   - GRATUIT", $00, $00
	db "     Kaptain K.Rool - 3 PIECES", $00, $00
	db "     Quitter le Koll}ge", $00, $00

DATA_BAEF04:
	db $04, $00
	db "     Avion | louer  - 2 PIECES", $00, $00
	db "     Quitter l'A~roport", $00, $00, $00, $00

DATA_BAEF41:
	db $06, $00
	db "     Payez - 15 Pi}ces Krem", $00, $00
	db "     Affrontez-le!", $00, $00
	db "     Enfuyez-vous", $00, $00, $00, $00
