hirom
!version = 1
!override_pirate_panic = 0
!pirate_panic_replacement = $0D


org $008000			;dummy org so functions work
	incsrc macros.asm
	incsrc constants.asm
	incsrc structs.asm

org $C00000
	incsrc bank_C0.asm
org $808000
	incsrc bank_80.asm
org $C10000
	incsrc bank_C1.asm
org $C20000
	incsrc bank_C2.asm
org $C30000
	incsrc bank_C3.asm
org $C40000
	incsrc bank_C4.asm
org $C50000
	incsrc bank_C5.asm
org $C60000
	incsrc bank_C6.asm
org $C70000
	incsrc bank_C7.asm
org $C80000
	incsrc bank_C8.asm
org $C90000
	incsrc bank_C9.asm
org $CA0000
	incsrc bank_CA.asm
org $CB0000
	incsrc bank_CB.asm
org $CC0000
	incsrc bank_CC.asm
org $CD0000
	incsrc bank_CD.asm
org $CE0000
	incsrc bank_CE.asm
org $CF0000
	incsrc bank_CF.asm
org $D00000
	incsrc bank_D0.asm
org $D10000
	incsrc bank_D1.asm
org $D20000
	incsrc bank_D2.asm
org $D30000
	incsrc bank_D3.asm
org $D40000
	incsrc bank_D4.asm
org $D50000
	incsrc bank_D5.asm
org $D60000
	incsrc bank_D6.asm
org $D70000
	incsrc bank_D7.asm
org $D80000
	incsrc bank_D8.asm
org $D90000
	incsrc bank_D9.asm
org $DA0000
	incsrc bank_DA.asm
org $DB0000
	incsrc bank_DB.asm
org $DC0000
	incsrc bank_DC.asm
org $DD0000
	incsrc bank_DD.asm
org $DE0000
	incsrc bank_DE.asm
org $DF0000
	incsrc bank_DF.asm
org $E00000
	incsrc bank_E0.asm
org $E10000
	incsrc bank_E1.asm
org $E20000
	incsrc bank_E2.asm
org $E30000
	incsrc bank_E3.asm
org $E40000
	incsrc bank_E4.asm
org $E50000
	incsrc bank_E5.asm
org $E60000
	incsrc bank_E6.asm
org $E70000
	incsrc bank_E7.asm
org $E80000
	incsrc bank_E8.asm
org $E90000
	incsrc bank_E9.asm
org $EA0000
	incsrc bank_EA.asm
org $EB0000
	incsrc bank_EB.asm
org $EC0000
	incsrc bank_EC.asm
org $ED0000
	incsrc bank_ED.asm
org $EE0000
	incsrc bank_EE.asm
org $EF0000
	incsrc bank_EF.asm
org $F00000
	incsrc bank_F0.asm
org $F10000
	incsrc bank_F1.asm
org $F20000
	incsrc bank_F2.asm
org $F30000
	incsrc bank_F3.asm
org $B38000
	incsrc bank_B3.asm
org $F40000
	incsrc bank_F4.asm
org $B48000
	incsrc bank_B4.asm
org $F50000
	incsrc bank_F5.asm
org $B58000
	incsrc bank_B5.asm
org $F60000
	incsrc bank_F6.asm
org $B68000
	incsrc bank_B6.asm
org $F70000
	incsrc bank_F7.asm
org $F80000
	incsrc bank_F8.asm
org $B88000
	incsrc bank_B8.asm
org $F90000
	incsrc bank_F9.asm
org $B9D000
	incsrc bank_B9.asm
org $FA0000
	incsrc bank_FA.asm
org $BA8000
	incsrc bank_BA.asm
org $FB0000
	incsrc bank_FB.asm
org $BB8000
	incsrc bank_BB.asm
org $FC0000
	incsrc bank_FC.asm
org $BC8000
	incsrc bank_BC.asm
org $FD0000
	incsrc bank_FD.asm
org $FE0000
	incsrc bank_FE.asm
org $BEB800
	incsrc bank_BE.asm
org $FF0000
	incsrc bank_FF.asm
org $FFFFFF
	db $00
