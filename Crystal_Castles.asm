; Disassembly of ~\LaunchBox\Games\Atari 2600\Crystal Castles (USA).a26
; Disassembled 05/17/24 00:36:25
; Using Stella 6.7.1
;
; ROM properties name : Crystal Castles (1984) (Atari)
; ROM properties MD5  : 1c6eb740d3c485766cade566abab8208
; Bankswitch type     : F6SC* (16K) 
;
; Legend: *  = CODE not yet run (tentative code)
;         D  = DATA directive (referenced in some way)
;         G  = GFX directive, shown as '#' (stored in player, missile, ball)
;         P  = PGFX directive, shown as '*' (stored in playfield)
;         C  = COL directive, shown as color constants (stored in player color)
;         CP = PCOL directive, shown as color constants (stored in playfield color)
;         CB = BCOL directive, shown as color constants (stored in background color)
;         A  = AUD directive (stored in audio registers)
;         i  = indexed accessed only
;         c  = used by code executed in RAM
;         s  = used by stack
;         !  = page crossed, 1 cycle penalty

    processor 6502


;-----------------------------------------------------------
;      Color constants
;-----------------------------------------------------------

BLACK            = $00
YELLOW           = $10
BROWN            = $20
ORANGE           = $30
RED              = $40
MAUVE            = $50
VIOLET           = $60
PURPLE           = $70
BLUE             = $80
BLUE_CYAN        = $90
CYAN             = $a0
CYAN_GREEN       = $b0
GREEN            = $c0
GREEN_YELLOW     = $d0
GREEN_BEIGE      = $e0
BEIGE            = $f0


;-----------------------------------------------------------
;      TIA and IO constants accessed
;-----------------------------------------------------------

INPT4           = $0c  ; (R)

VSYNC           = $00  ; (W)
VBLANK          = $01  ; (W)
WSYNC           = $02  ; (W)
NUSIZ0          = $04  ; (W)
NUSIZ1          = $05  ; (W)
COLUP0          = $06  ; (W)
COLUP1          = $07  ; (W)
COLUPF          = $08  ; (W)
COLUBK          = $09  ; (W)
CTRLPF          = $0a  ; (W)
REFP0           = $0b  ; (W)
REFP1           = $0c  ; (W)
PF1             = $0e  ; (W)
PF2             = $0f  ; (W)
RESP0           = $10  ; (W)
RESP1           = $11  ; (W)
;RESBL          = $14  ; (Wi)
AUDC0           = $15  ; (W)
;AUDC1          = $16  ; (Wi)
AUDF0           = $17  ; (W)
;AUDF1          = $18  ; (Wi)
AUDV0           = $19  ; (W)
;AUDV1          = $1a  ; (Wi)
GRP0            = $1b  ; (W)
GRP1            = $1c  ; (W)
ENABL           = $1f  ; (W)
HMP0            = $20  ; (W)
HMP1            = $21  ; (W)
;HMBL           = $24  ; (Wi)
VDELP0          = $25  ; (W)
VDELP1          = $26  ; (W)
HMOVE           = $2a  ; (W)
HMCLR           = $2b  ; (W)
CXCLR           = $2c  ; (W)

SWCHA           = $0280
SWACNT          = $0281
SWCHB           = $0282
INTIM           = $0284
TIM64T          = $0296


;-----------------------------------------------------------
;      RIOT RAM (zero-page) labels
;-----------------------------------------------------------

game_mode          = $80
button_register          = $81
ram_82          = $82
ram_83          = $83
maincounter          = $84
maincounter_overflow          = $85
score_XX0000          = $86
score_00XX00          = $87
score_0000XX          = $88
gems_remaining          = $89
gems_collected          = $8a
ram_8B          = $8b
ram_8C          = $8c
ram_8D          = $8d
map_scene          = $8e
castle_level          = $8f
game_state          = $90
ram_91          = $91
ram_92          = $92
ram_93          = $93
enemy_speed          = $94
player_lives          = $95
ram_96          = $96
ram_97          = $97
ram_98          = $98

ram_9A          = $9a
ram_9B          = $9b
ram_9C          = $9c
ram_9D          = $9d
ram_9E          = $9e
;                 $9f  (i)
ram_A0          = $a0
sound_effect          = $a1
ram_A2          = $a2
;                 $a3  (i)
ram_A4          = $a4
ram_A5          = $a5
ram_A6          = $a6
ram_A7          = $a7
ram_A8          = $a8
ram_A9          = $a9
ram_AA          = $aa
ram_AB          = $ab
player_X_pos          = $ac
obj_6_x_pos          = $ad
obj_5_x_pos          = $ae
obj_4_x_pos          = $af
obj_3_x_pos          = $b0
obj_2_x_pos          = $b1
obj_1_x_pos          = $b2
obj_0_x_pos          = $b3
player_Y_pos          = $b4
obj_6_y_pos          = $b5
obj_5_y_pos          = $b6
obj_4_y_pos          = $b7
obj_3_y_pos          = $b8
obj_2_y_pos          = $b9
obj_1_y_pos          = $ba
obj_0_y_pos          = $bb
ram_BC          = $bc
obj_6_id          = $bd
obj_5_id          = $be
obj_4_id          = $bf
obj_3_id          = $c0
obj_2_id          = $c1
obj_1_id          = $c2
obj_0_id          = $c3
ram_C4          = $c4
ram_C5          = $c5
ram_C6          = $c6
ram_C7          = $c7
ram_C8          = $c8
ram_C9          = $c9
ram_CA          = $ca
ram_CB          = $cb
ram_CC          = $cc
ram_CD          = $cd
ram_CE          = $ce
ram_CF          = $cf
ram_D0          = $d0
ram_D1          = $d1
ram_D2          = $d2
ram_D3          = $d3
ram_D4          = $d4
ram_D5          = $d5
ram_D6          = $d6
ram_D7          = $d7
ram_D8          = $d8
elevator_x_pos          = $d9
elevator_y_pos          = $da
elevator_selector_id          = $db
ram_DC          = $dc
ram_DD          = $dd
ram_DE          = $de
ram_DF          = $df
ram_E0          = $e0
ram_E1          = $e1
ram_E2          = $e2
ram_E3          = $e3
ram_E4          = $e4
ram_E5          = $e5
ram_E6          = $e6
ram_E7          = $e7
ram_E8          = $e8
ram_E9          = $e9
ram_EA          = $ea
ram_EB          = $eb
ram_EC          = $ec
ram_ED          = $ed
ram_EE          = $ee
ram_EF          = $ef
ram_F0          = $f0
ram_F1          = $f1
ram_F2          = $f2
ram_F3          = $f3
ram_F4          = $f4
ram_F5          = $f5
ram_F6          = $f6

;                 $fe  (s)
;                 $ff  (s)


;-----------------------------------------------------------
;      User Defined Labels
;-----------------------------------------------------------

Break           = $ffde


;***********************************************************
;      Bank 0 / 0..3
;***********************************************************

    SEG     CODE
    ORG     $0000
    RORG    $9000

    .byte   $6d,$e1,$9f,$63,$3b,$96,$a5,$07 ; $9000 (*)
    .byte   $d8,$af,$21,$85,$03,$7a,$44,$45 ; $9008 (*)
    .byte   $97,$25,$ba,$73,$5a,$12,$e6,$f0 ; $9010 (*)
    .byte   $10,$13,$25,$7d,$cf,$ad,$a7,$ac ; $9018 (*)
    .byte   $19,$f1,$60,$a8,$18,$96,$e8,$c3 ; $9020 (*)
    .byte   $2c,$c1,$65,$67,$68,$cd,$5a,$7b ; $9028 (*)
    .byte   $08,$65,$1d,$1a,$51,$c0,$8e,$cf ; $9030 (*)
    .byte   $f6,$bb,$42,$d8,$7d,$a1,$ae,$62 ; $9038 (*)
    .byte   $bc,$b9,$b5,$dd,$78,$ab,$99,$c4 ; $9040 (*)
    .byte   $7f,$9a,$fd,$54,$e4,$ec,$9c,$65 ; $9048 (*)
    .byte   $7c,$4c,$74,$73,$7d,$8a,$8e,$b1 ; $9050 (*)
    .byte   $98,$d7,$52,$23,$98,$19,$26,$66 ; $9058 (*)
    .byte   $df,$dc,$b1,$04,$a2,$54,$b4,$13 ; $9060 (*)
    .byte   $03,$77,$5e,$b2,$76,$9c,$da,$0b ; $9068 (*)
    .byte   $4f,$cf,$40,$44,$16,$c2,$d1,$47 ; $9070 (*)
    .byte   $26,$32,$3a,$16,$64,$75,$33,$93 ; $9078 (*)
    .byte   $ff,$3f,$e0                     ; $9080 (*)
L9083
    .byte   $5e                             ; $9083 (*)
    
L9084
    .byte   %00000000 ; |        |            $9084 (P)
    .byte   %00000000 ; |        |            $9085 (P)
    .byte   %00000000 ; |        |            $9086 (P)
    .byte   %00000000 ; |        |            $9087 (P)
    .byte   %00000000 ; |        |            $9088 (P)
    .byte   %00000000 ; |        |            $9089 (P)
    .byte   %00000000 ; |        |            $908a (P)
    .byte   %00000000 ; |        |            $908b (P)
    .byte   %00000000 ; |        |            $908c (P)
    .byte   %00000000 ; |        |            $908d (P)
    .byte   %00000001 ; |       *|            $908e (P)
    .byte   %00000000 ; |        |            $908f (P)
    .byte   %00000000 ; |        |            $9090 (P)
    .byte   %00000000 ; |        |            $9091 (P)
    .byte   %00000000 ; |        |            $9092 (P)
    .byte   %00000000 ; |        |            $9093 (P)
    .byte   %00000000 ; |        |            $9094 (P)
    .byte   %00000000 ; |        |            $9095 (P)
    .byte   %00000010 ; |      * |            $9096 (P)
    .byte   %00000000 ; |        |            $9097 (P)
    .byte   %00000000 ; |        |            $9098 (P)
    .byte   %00000000 ; |        |            $9099 (P)
    .byte   %00000000 ; |        |            $909a (P)
    .byte   %00000000 ; |        |            $909b (P)
    .byte   %00000000 ; |        |            $909c (P)
    .byte   %00000000 ; |        |            $909d (P)
    .byte   %00000000 ; |        |            $909e (P)
    .byte   %00000000 ; |        |            $909f (P)
    .byte   %00000000 ; |        |            $90a0 (P)
    .byte   %00000000 ; |        |            $90a1 (P)
    .byte   %00000000 ; |        |            $90a2 (P)
    .byte   %00000000 ; |        |            $90a3 (P)
    .byte   %00000000 ; |        |            $90a4 (P)
    .byte   %00000000 ; |        |            $90a5 (P)
    .byte   %00000000 ; |        |            $90a6 (P)
    .byte   %00000000 ; |        |            $90a7 (P)
    .byte   %00000000 ; |        |            $90a8 (P)
    .byte   %00000000 ; |        |            $90a9 (P)
    .byte   %00000000 ; |        |            $90aa (P)
    .byte   %00000000 ; |        |            $90ab (P)
    .byte   %00000000 ; |        |            $90ac (P)
    .byte   %00000000 ; |        |            $90ad (P)
    .byte   %00000000 ; |        |            $90ae (P)
    .byte   %00000000 ; |        |            $90af (P)
    .byte   %00000000 ; |        |            $90b0 (P)
    .byte   %00000000 ; |        |            $90b1 (P)
    .byte   %00000000 ; |        |            $90b2 (P)
    .byte   %00000000 ; |        |            $90b3 (P)
    .byte   %00000000 ; |        |            $90b4 (P)
    .byte   %00000000 ; |        |            $90b5 (P)
    .byte   %00000000 ; |        |            $90b6 (P)
    .byte   %00000000 ; |        |            $90b7 (P)
    .byte   %00000000 ; |        |            $90b8 (P)
    .byte   %00000000 ; |        |            $90b9 (P)
    .byte   %00000000 ; |        |            $90ba (P)
    .byte   %00000000 ; |        |            $90bb (P)
    .byte   %00000000 ; |        |            $90bc (P)
    .byte   %00000000 ; |        |            $90bd (P)
    .byte   %00000000 ; |        |            $90be (P)
    .byte   %00000000 ; |        |            $90bf (P)
    .byte   %00000000 ; |        |            $90c0 (P)
L90c1
    .byte   %00000000 ; |        |            $90c1 (P)
L90c2
    .byte   %00000000 ; |        |            $90c2 (P)
    .byte   %00000000 ; |        |            $90c3 (P)
    .byte   %00000000 ; |        |            $90c4 (P)
    .byte   %00000000 ; |        |            $90c5 (P)
    .byte   %00000000 ; |        |            $90c6 (P)
    .byte   %00000000 ; |        |            $90c7 (P)
    .byte   %00000000 ; |        |            $90c8 (P)
    .byte   %00000000 ; |        |            $90c9 (P)
    .byte   %00000010 ; |      * |            $90ca (P)
    .byte   %00000000 ; |        |            $90cb (P)
    .byte   %00000100 ; |     *  |            $90cc (P)
    .byte   %00000100 ; |     *  |            $90cd (P)
    .byte   %00001000 ; |    *   |            $90ce (P)
    .byte   %00001000 ; |    *   |            $90cf (P)
    .byte   %00100000 ; |  *     |            $90d0 (P)
    .byte   %00000000 ; |        |            $90d1 (P)
    .byte   %00000000 ; |        |            $90d2 (P)
    .byte   %00000000 ; |        |            $90d3 (P)
    .byte   %01000000 ; | *      |            $90d4 (P)
    .byte   %01000000 ; | *      |            $90d5 (P)
    .byte   %00000001 ; |       *|            $90d6 (P)
    .byte   %00100000 ; |  *     |            $90d7 (P)
    .byte   %00000000 ; |        |            $90d8 (P)
    .byte   %01010000 ; | * *    |            $90d9 (P)
    .byte   %00000000 ; |        |            $90da (P)
    .byte   %00100000 ; |  *     |            $90db (P)
    .byte   %00000000 ; |        |            $90dc (P)
    .byte   %00000000 ; |        |            $90dd (P)
    .byte   %00000000 ; |        |            $90de (P)
    .byte   %00000000 ; |        |            $90df (P)
    .byte   %00000000 ; |        |            $90e0 (P)
    .byte   %00000000 ; |        |            $90e1 (P)
    .byte   %00000000 ; |        |            $90e2 (P)
    .byte   %00000000 ; |        |            $90e3 (P)
    .byte   %00000000 ; |        |            $90e4 (P)
    .byte   %00000000 ; |        |            $90e5 (P)
    .byte   %00000000 ; |        |            $90e6 (P)
    .byte   %00000000 ; |        |            $90e7 (P)
    .byte   %00000000 ; |        |            $90e8 (P)
    .byte   %00000000 ; |        |            $90e9 (P)
    .byte   %00000000 ; |        |            $90ea (P)
    .byte   %00000000 ; |        |            $90eb (P)
    .byte   %00000000 ; |        |            $90ec (P)
    .byte   %00000000 ; |        |            $90ed (P)
    .byte   %00000000 ; |        |            $90ee (P)
    .byte   %00000000 ; |        |            $90ef (P)
    .byte   %00000000 ; |        |            $90f0 (P)
    .byte   %00000000 ; |        |            $90f1 (P)
    .byte   %00000000 ; |        |            $90f2 (P)
    .byte   %00000000 ; |        |            $90f3 (P)
    .byte   %00000000 ; |        |            $90f4 (P)
    .byte   %00000000 ; |        |            $90f5 (P)
    .byte   %00000000 ; |        |            $90f6 (P)
    .byte   %00000000 ; |        |            $90f7 (P)
    .byte   %00000000 ; |        |            $90f8 (P)
    .byte   %00000000 ; |        |            $90f9 (P)
    .byte   %00000000 ; |        |            $90fa (P)
    .byte   %00000000 ; |        |            $90fb (P)
    .byte   %00000000 ; |        |            $90fc (P)
    .byte   %00000000 ; |        |            $90fd (P)
    .byte   %00000000 ; |        |            $90fe (P)
    .byte   %00000000 ; |        |            $90ff (P)
    
L9100
    ldy     ram_DE                  ;3        
    bne     L9122                   ;2/3      
    sty     GRP1                    ;3        
    sty     ram_E4                  ;3        
    ldx     ram_DF                  ;3        
    ldy     ram_A4,x                ;4        
    sty     ram_DF                  ;3        
    ldx     player_X_pos,y                ;4        
    lda     L9f00,x                 ;4        
    sta     ram_E0                  ;3        
    and     #$0f                    ;2        
    tax                             ;2        
    lda     L94a7,x                 ;4        
    sta     ram_F3                  ;3        
    ldy     ram_DC                  ;3        
    jmp     L9322                   ;3   =  49
    
L9122
    bne     L912b                   ;2/3      
    ldy.w   ram_DE                  ;4        
    cpy     ram_E0                  ;3        
    bne     L9142                   ;2/3 =  11
L912b
    lda     (ram_EF),y              ;5        
    sta     ram_E4                  ;3        
    lda     (ram_ED),y              ;5        
    sta     GRP1                    ;3        
    lda     (ram_F1),y              ;5        
    dec     ram_DE                  ;5        
    ldy     #$64                    ;2        
    sty     ram_F3                  ;3        
    ldy     ram_DC                  ;3        
    sta     COLUP1                  ;3        
    jmp     L9322                   ;3   =  40
    
L9142
    jmp     L91e7                   ;3   =   3
    
    .byte   $85,$11,$a2,$c5,$4c,$f2,$91     ; $9145 (*)
    
L914c
    jmp     L91ee                   ;3   =   3
    
    jmp     L91f9                   ;3   =   3
    
    jmp     L9208                   ;3   =   3
    
    jmp     L9216                   ;3   =   3
    
    jmp     L9229                   ;3   =   3
    
    jmp     L923c                   ;3   =   3
    
    jmp     L9257                   ;3   =   3
    
    jmp     L91c8                   ;3   =   3
    
    ldy     ram_DE                  ;3        
    bne     L9186                   ;2/3      
    sty     GRP1                    ;3        
    sty     ram_E4                  ;3        
    ldx     ram_DF                  ;3        
    ldy     ram_A4,x                ;4        
    sty     ram_DF                  ;3        
    ldx     player_X_pos,y                ;4        
    lda     L9f00,x                 ;4        
    sta     ram_E0                  ;3        
    and     #$0f                    ;2        
    tax                             ;2        
    lda     L94b7,x                 ;4        
    sta     ram_F3                  ;3        
    ldy     ram_DC                  ;3        
    jmp.ind (ram_F5)                ;5   =  51
L9186
    bne     L918f                   ;2/3      
    ldy.w   ram_DE                  ;4        
    cpy     ram_E0                  ;3        
    bne     L91a6                   ;2/3 =  11
L918f
    lda     (ram_EF),y              ;5        
    sta     ram_E4                  ;3        
    lda     (ram_ED),y              ;5        
    sta     GRP1                    ;3        
    lda     (ram_F1),y              ;5        
    dec     ram_DE                  ;5        
    ldy     #$00                    ;2        
    sty     ram_F3                  ;3        
    ldy     ram_DC                  ;3        
    sta     COLUP1                  ;3        
    jmp.ind (ram_F5)                ;5   =  42
L91a6
    jmp     L9293                   ;3   =   3
    
    .byte   $85,$11,$a2,$61,$4c,$9e,$92     ; $91a9 (*)
    
L91b0
    jmp     L929a                   ;3   =   3
    
    jmp     L92a5                   ;3   =   3
    
    jmp     L92b4                   ;3   =   3
    
    jmp     L92c2                   ;3   =   3
    
    jmp     L92d6                   ;3   =   3
    
    jmp     L92ea                   ;3   =   3
    
    .byte   $4c,$05,$93                     ; $91c2 (*)
    
L91c5
    jmp     L9274                   ;3   =   3
    
L91c8
    sta     HMCLR                   ;3        
    ldx     ram_DF                  ;3        
    ldy     ram_BC,x                ;4        
    lda     L9800,y                 ;4        
    sta     ram_DE                  ;3        
    lda     L9825,y                 ;4   =  21
L91d6
    sta     ram_EF                  ;3        
    sta     ram_ED                  ;3        
    sta     ram_F1                  ;3        
    lda     #$88                    ;2        
    dec     ram_E0                  ;5        
    sta     ram_F3                  ;3        
    ldy     ram_DC                  ;3        
    jmp     L9322                   ;3   =  25
    
L91e7
    inc     ram_F3                  ;5        
    lda     ram_EF                  ;3        
    jmp     L91d6                   ;3   =  11
    
L91ee
    ldx     #$c5                    ;2        
    sta     RESP1                   ;3        
    ldy     ram_E0                  ;3        
    stx     ram_F3                  ;3        
    jmp     L9203                   ;3   =  14
    
L91f9
    ldy     ram_E0                  ;3        
    ldx     #$c5                    ;2        
    sec                             ;2        
    sta     RESP1                   ;3        
    stx.w   ram_F3                  ;4   =  14
L9203
    sty     HMP1                    ;3        
    jmp     L9223                   ;3   =   6
    
L9208
    ldx     #$c5                    ;2        
    stx     ram_F3                  ;3        
    ldy     ram_E0                  ;3        
    sty.w   HMP1                    ;4        
    sta     RESP1                   ;3        
    sec                             ;2        
    bcs     L9223                   ;2/3 =  19
L9216
    ldx     #$c5                    ;2        
    stx     ram_F3                  ;3        
    ldy     ram_E0                  ;3        
    sty.w   HMP1                    ;4        
    inc     ram_83                  ;5        
    sta     RESP1                   ;3   =  20
L9223
    lda     ram_DC                  ;3        
    tay                             ;2        
    sec                             ;2        
    bcs     L924e                   ;2/3 =   9
L9229
    ldx     #$c5                    ;2        
    stx     ram_F3                  ;3        
    ldy     ram_E0                  ;3        
    sty     HMP1                    ;3        
    lda     ram_DC                  ;3        
    tay                             ;2        
    nop                             ;2        
    nop                             ;2        
    nop                             ;2        
    sta     RESP1                   ;3        
    sec                             ;2        
    bcs     L924e                   ;2/3 =  29
L923c
    ldx     #$c5                    ;2        
    stx     ram_F3                  ;3        
    ldy     ram_E0                  ;3        
    sty     HMP1                    ;3        
    lda     ram_DC                  ;3        
    tay                             ;2        
    sec                             ;2        
    nop                             ;2        
    nop                             ;2        
    inc     ram_83                  ;5        
    sta     RESP1                   ;3   =  30
L924e
    ldx     ram_DF                  ;3        
    sbc     player_Y_pos,x                ;4        
    sta     ram_E0                  ;3        
    jmp     L9271                   ;3   =  13
    
L9257
    ldx     #$c5                    ;2        
    stx     ram_F3                  ;3        
    ldy     ram_E0                  ;3        
    sty     HMP1                    ;3        
    lda     ram_DC                  ;3        
    tay                             ;2        
    sec                             ;2        
    ldx.w   ram_DF                  ;4        
    inc     ram_83                  ;5        
    inc     ram_83                  ;5        
    sta     RESP1                   ;3        
    sbc     player_Y_pos,x                ;4        
    sta.w   ram_E0                  ;4   =  43
L9271
    jmp     L9322                   ;3   =   3
    
L9274
    sta     HMCLR                   ;3        
    ldx     ram_DF                  ;3        
    ldy     ram_BC,x                ;4        
    lda     L9800,y                 ;4        
    sta     ram_DE                  ;3        
    lda     L9825,y                 ;4   =  21
L9282
    sta     ram_EF                  ;3        
    sta     ram_ED                  ;3        
    sta     ram_F1                  ;3        
    lda     #$24                    ;2        
    dec     ram_E0                  ;5        
    sta     ram_F3                  ;3        
    ldy     ram_DC                  ;3        
    jmp.ind (ram_F5)                ;5   =  27
L9293
    inc     ram_F3                  ;5        
    lda     ram_EF                  ;3        
    jmp     L9282                   ;3   =  11
    
L929a
    ldx     #$61                    ;2        
    sta     RESP1                   ;3        
    ldy     ram_E0                  ;3        
    stx     ram_F3                  ;3        
    jmp     L92af                   ;3   =  14
    
L92a5
    ldy     ram_E0                  ;3        
    ldx     #$61                    ;2        
    sec                             ;2        
    sta     RESP1                   ;3        
    stx.w   ram_F3                  ;4   =  14
L92af
    sty     HMP1                    ;3        
    jmp     L92cf                   ;3   =   6
    
L92b4
    ldx     #$61                    ;2        
    stx     ram_F3                  ;3        
    ldy     ram_E0                  ;3        
    sty.w   HMP1                    ;4        
    sta     RESP1                   ;3        
    sec                             ;2        
    bcs     L92cf                   ;2/3 =  19
L92c2
    ldx     #$61                    ;2        
    stx     ram_F3                  ;3        
    ldy     ram_E0                  ;3        
    sty.w   HMP1                    ;4        
    inc     ram_83                  ;5        
    sta     RESP1                   ;3   =  20
L92cf
    lda     ram_DC                  ;3        
    tay                             ;2        
    sec                             ;2        
    jmp     L92fc                   ;3   =  10
    
L92d6
    ldx     #$61                    ;2        
    stx     ram_F3                  ;3        
    ldy     ram_E0                  ;3        
    sty     HMP1                    ;3        
    lda     ram_DC                  ;3        
    tay                             ;2        
    nop                             ;2        
    nop                             ;2        
    nop                             ;2        
    sta     RESP1                   ;3        
    sec                             ;2        
    jmp     L92fc                   ;3   =  30
    
L92ea
    ldx     #$61                    ;2        
    stx     ram_F3                  ;3        
    ldy     ram_E0                  ;3        
    sty     HMP1                    ;3        
    lda     ram_DC                  ;3        
    tay                             ;2        
    sec                             ;2        
    nop                             ;2        
    nop                             ;2        
    inc     ram_83                  ;5        
    sta     RESP1                   ;3   =  30
L92fc
    ldx     ram_DF                  ;3        
    sbc     player_Y_pos,x                ;4        
    sta     ram_E0                  ;3        
    jmp     L931f                   ;3   =  13
    
    .byte   $a2,$61,$86,$f3,$a4,$e0,$84,$21 ; $9305 (*)
    .byte   $a5,$dc,$a8,$38,$ae,$df,$00,$e6 ; $930d (*)
    .byte   $83,$e6,$83,$85,$11,$f5,$b4,$8d ; $9315 (*)
    .byte   $e0,$00                         ; $931d (*)
    
L931f
    jmp.ind (ram_F5)                ;5   =   5
L9322
    ldx     ram_E3                  ;3        
    stx     GRP0                    ;3        
    lda     (ram_D4),y              ;5        
    sta     ram_E3                  ;3        
    ora     L9083,y                 ;4        
    sta     PF1                     ;3        
    lda     (ram_D6),y              ;5        
    tax                             ;2        
    ora     L90c1,y                 ;4        
    sta     PF2                     ;3        
    dec     ram_DC                  ;5        
    txa                             ;2        
    ora     L90c2,y                 ;4        
    sta     PF2                     ;3        
    lda     ram_E3                  ;3        
    ora     L9084,y                 ;4        
    sta     PF1                     ;3        
    stx     PF2                     ;3        
    ldx     ram_E3                  ;3        
    lda     ram_E4                  ;3        
    stx     PF1                     ;3        
    ldx     ram_E2                  ;3        
    sta     GRP1                    ;3        
    sta     HMOVE                   ;3        
    stx     GRP0                    ;3        
    cpy     elevator_selector_id                  ;3        
    beq     L93a0                   ;2/3      
    cpy     elevator_y_pos                  ;3        
    bne     L93a4                   ;2/3      
    lda     #$02                    ;2        
    sta     ENABL                   ;3        
    jmp.ind (ram_F3)                ;5        
    lda     ram_E1                  ;3        
    sta     GRP0                    ;3        
    lda     (ram_D4),y              ;5        
    sta     PF1                     ;3        
    lda     (ram_D6),y              ;5        
    sta     PF2                     ;3        
    ldy     ram_DD                  ;3        
    bmi     L93d5                   ;2/3      
    lda     (ram_E5),y              ;5        
    sta     ram_E1                  ;3        
    lda     (ram_E7),y              ;5        
    sta     ram_E2                  ;3        
    lda     (ram_E9),y              ;5        
    sta     ram_E3                  ;3        
    lda     (ram_EB),y              ;5        
    dec     ram_DD                  ;5        
    ldy     ram_DC                  ;3   = 167
L9387
    dec     ram_DC                  ;5        
    ldx     ram_E4                  ;3        
    stx     GRP1                    ;3        
    sta     HMOVE                   ;3        
    sta     GRP0                    ;3        
    cpy     elevator_selector_id                  ;3        
    beq     L93a0                   ;2/3      
    cpy     elevator_y_pos                  ;3        
    bne     L93a4                   ;2/3      
    lda     #$02                    ;2        
    sta     ENABL                   ;3        
    jmp.ind (ram_F3)                ;5   =  37
L93a0
    lda     #$00                    ;2        
    sta     ENABL                   ;3   =   5
L93a4
    nop                             ;2        
    nop                             ;2        
    jmp.ind (ram_F3)                ;5        
    lda     ram_E1                  ;3        
    sta     GRP0                    ;3        
    lda     (ram_D4),y              ;5        
    sta     PF1                     ;3        
    lda     (ram_D6),y              ;5        
    sta.w   PF2                     ;4        
    ldy     ram_DC                  ;3        
    cpy     ram_DD                  ;3        
    bne     L93d7                   ;2/3      
    ldx     #$65                    ;2        
    lda     #$04                    ;2        
    sta.w   ram_DD                  ;4   =  48
L93c3
    lda     #$00                    ;2        
    sta     ram_E3                  ;3        
    sta     ram_E2                  ;3        
    sta     ram_E1                  ;3        
    ldy     ram_DC                  ;3        
    cpy     ram_D8                  ;3        
    beq     L93dc                   ;2/3      
    stx     ram_F5                  ;3        
    bne     L9387                   ;2/3 =  24
L93d5
    nop                             ;2        
    nop                             ;2   =   4
L93d7
    ldx     #$a9                    ;2        
    nop                             ;2        
    bne     L93c3                   ;2/3 =   6
L93dc
    sta     WSYNC                   ;3   =   3
;---------------------------------------
    lda     #$00                    ;2        
    sta     GRP0                    ;3        
    sta     GRP1                    ;3        
    sta     GRP0                    ;3        
    sta     ENABL                   ;3        
    sta     REFP0                   ;3        
    ldx     #$04                    ;2        
    stx     ram_E1                  ;3        
    ldx     #$d4                    ;2        
    stx     ram_E2                  ;3        
    ldx     #$10                    ;2        
    stx     HMP1                    ;3        
    ldx     #$03                    ;2        
    stx     NUSIZ0                  ;3        
    sta     RESP0                   ;3        
    sta     RESP1                   ;3        
    stx     NUSIZ1                  ;3        
    stx     VDELP1                  ;3        
    stx     VDELP0                  ;3        
    jmp     L9fea                   ;3   =  55
    
    ldx     #$00                    ;2        
    sta     WSYNC                   ;3   =   5
;---------------------------------------
    sta     HMOVE                   ;3        
    stx     VBLANK                  ;3        
    stx     ram_E1                  ;3        
    stx     ram_E2                  ;3        
    lda     #$4f                    ;2        
    sta     ram_DC                  ;3   =  17
L9417
    ldy     ram_DE                  ;3        
    beq     L9435                   ;2/3      
    cpy     ram_E0                  ;3        
    bne     L9435                   ;2/3      
    lda     (ram_EF),y              ;5        
    sta     ram_E4                  ;3        
    lda     (ram_ED),y              ;5        
    sta     GRP1                    ;3        
    lda     (ram_F1),y              ;5        
    dec     ram_DE                  ;5        
    ldy     #$64                    ;2        
    sty     ram_F3                  ;3        
    sta     WSYNC                   ;3   =  44
;---------------------------------------
    sta     COLUP1                  ;3        
    bne     L943d                   ;2/3 =   5
L9435
    ldy     #$00                    ;2        
    sty     GRP1                    ;3        
    sty     ram_E4                  ;3        
    sta     WSYNC                   ;3   =  11
;---------------------------------------
L943d
    dec     ram_E0                  ;5        
    lda     ram_DC                  ;3        
    and     #$01                    ;2        
    bne     L9488                   ;2/3      
    lda     ram_E1                  ;3        
    sta     GRP0                    ;3        
    lda     #$65                    ;2        
    cmp     ram_F5                  ;3        
    bne     L9472                   ;2/3      
    ldy     ram_DD                  ;3        
    bmi     L947e                   ;2/3      
    lda     (ram_E5),y              ;5        
    sta     ram_E1                  ;3        
    lda     (ram_E7),y              ;5        
    sta     ram_E2                  ;3        
    lda     (ram_E9),y              ;5        
    sta     ram_E3                  ;3        
    lda     (ram_EB),y              ;5        
    dec     ram_DD                  ;5   =  64
L9463
    sta     WSYNC                   ;3   =   3
;---------------------------------------
    sta     HMOVE                   ;3        
    dec     ram_DC                  ;5        
    ldx     ram_E4                  ;3        
    stx     GRP1                    ;3        
    sta     GRP0                    ;3        
    jmp     L9417                   ;3   =  20
    
L9472
    ldy     ram_DD                  ;3        
    cpy     ram_DC                  ;3        
    bne     L947e                   ;2/3      
    sta     ram_F5                  ;3        
    lda     #$04                    ;2        
    sta     ram_DD                  ;3   =  16
L947e
    lda     #$00                    ;2        
    sta     ram_E3                  ;3        
    sta     ram_E2                  ;3        
    sta     ram_E1                  ;3        
    beq     L9463                   ;2/3 =  13
L9488
    lda     ram_E3                  ;3        
    sta     GRP0                    ;3        
    lda     ram_E4                  ;3        
    sta     GRP1                    ;3        
    ldx     ram_E2                  ;3        
    sta     WSYNC                   ;3   =  18
;---------------------------------------
    sta     HMOVE                   ;3        
    stx     GRP0                    ;3        
    dec     ram_DC                  ;5        
    ldy     ram_DC                  ;3        
    cpy     #$3e                    ;2        
    beq     L94a3                   ;2/3      
    jmp     L9417                   ;3   =  21
    
L94a3
    nop                             ;2        
    jmp.ind (ram_F3)                ;5   =   7
L94a7
    dey                             ;2         *
    dey                             ;2         *
    lda     #$b0                    ;2         *
    
    .byte   $b3,$b6,$b9,$bc,$bf             ; $94ab (D)
    .byte   $c2,$88,$88,$88,$88,$88,$88     ; $94b0 (*)
L94b7
    .byte   $24,$24,$45                     ; $94b7 (*)
    .byte   $4c,$4f,$52,$55,$58,$5b,$5e     ; $94ba (D)
    .byte   $24,$24,$24,$24,$24,$24         ; $94c1 (*)
    
L94c7
    ldx     ram_DF                  ;3        
    ldy     ram_BC,x                ;4        
    lda     L9800,y                 ;4        
    sta     ram_DE                  ;3        
    lda     L9825,y                 ;4        
    sta     ram_EF                  ;3        
    sta     ram_ED                  ;3        
    sta     ram_F1                  ;3        
    ldy     player_X_pos,x                ;4        
    ldx     #$01                    ;2        
    jsr     L9f94                   ;6        
    ldx     #$00                    ;2        
    ldy     player_X_pos                  ;3        
    jsr     L9f94                   ;6        
    ldx     #$04                    ;2        
    ldy     elevator_x_pos                  ;3        
    jsr     L9f94                   ;6        
    sta     WSYNC                   ;3   =  70
;---------------------------------------
    sta     HMOVE                   ;3        
    lda     #$bb                    ;2        
    sta     ram_E1                  ;3        
    lda     #$b6                    ;2        
    sta     ram_E2                  ;3        
    jmp     L9ff0                   ;3   =  16
    
    .byte   $00,$00,$00,$00,$7c,$7c,$38,$7c ; $94fd (*)
    .byte   $38,$7c,$38,$92,$c6,$ee,$c6,$1e ; $9505 (*)
    .byte   $3c,$3e,$1c,$3e,$ee,$86,$7c,$d0 ; $950d (*)
    .byte   $63,$78,$3c,$7c,$38,$7c,$77,$61 ; $9515 (*)
    .byte   $3e,$0b,$7c,$7c,$38,$7c,$38,$7c ; $951d (*)
    .byte   $38,$fe,$fe,$ee,$7c,$7c,$38,$7c ; $9525 (*)
    .byte   $38,$7c,$38,$c6,$fe,$ee,$7c,$7c ; $952d (*)
    .byte   $38,$7c,$38,$7c,$38,$92,$ee,$ee ; $9535 (*)
    .byte   $7c,$7c,$38,$7c,$38,$7c,$38,$92 ; $953d (*)
    .byte   $ee,$ee                         ; $9545 (*)
    
    .byte   %00000000 ; |        |            $9547 (G)
    .byte   %00110000 ; |  ##    |            $9548 (G)
    .byte   %11100000 ; |###     |            $9549 (G)
    .byte   %11110010 ; |####  # |            $954a (G)
    .byte   %01111010 ; | #### # |            $954b (G)
    .byte   %00010100 ; |   # #  |            $954c (G)
    .byte   %00110110 ; |  ## ## |            $954d (G)
    .byte   %01101101 ; | ## ## #|            $954e (G)
    .byte   %01001011 ; | #  # ##|            $954f (G)
    .byte   %11001011 ; |##  # ##|            $9550 (G)
    .byte   %00100000 ; |  #     |            $9551 (G)
    .byte   %00010000 ; |   #    |            $9552 (G)
    .byte   %00100010 ; |  #   # |            $9553 (G)
    .byte   %00011001 ; |   ##  #|            $9554 (G)
    .byte   %00000001 ; |       #|            $9555 (G)
    .byte   %10111110 ; |# ##### |            $9556 (G)
    .byte   %01101110 ; | ## ### |            $9557 (G)
    .byte   %00000000 ; |        |            $9558 (G)
    
    .byte   $58,$b7,$fc,$03,$0d,$0e,$00,$1a ; $9559 (*)
    .byte   $ed,$3f,$c0,$b0,$70,$00,$1d,$be ; $9561 (*)
    .byte   $3f,$63,$50,$e0,$10,$b8,$7d,$fc ; $9569 (*)
    .byte   $c6,$0a,$07,$08,$0c,$1c,$3f,$f6 ; $9571 (*)
    .byte   $2a,$1c,$30,$38,$fc,$6f,$54,$38 ; $9579 (*)
    
    .byte   %01101110 ; | ## ### |            $9581 (G)
    .byte   %01101110 ; | ## ### |            $9582 (G)
    .byte   %00111100 ; |  ####  |            $9583 (G)
    .byte   %01100010 ; | ##   # |            $9584 (G)
    .byte   %01101010 ; | ## # # |            $9585 (G)
    .byte   %00111100 ; |  ####  |            $9586 (G)
    .byte   %01110010 ; | ###  # |            $9587 (G)
    .byte   %01110110 ; | ### ## |            $9588 (G)
    .byte   %00111100 ; |  ####  |            $9589 (G)
    .byte   %01111110 ; | ###### |            $958a (G)
    .byte   %01111110 ; | ###### |            $958b (G)
    .byte   %00111100 ; |  ####  |            $958c (G)
    
    .byte   $3c,$1c,$38                     ; $958d (*)
    
    .byte   %01101010 ; | ## # # |            $9590 (G)
    .byte   %11100011 ; |###   ##|            $9591 (G)
    .byte   %01101010 ; | ## # # |            $9592 (G)
    .byte   %01111110 ; | ###### |            $9593 (G)
    .byte   %00011000 ; |   ##   |            $9594 (G)
    .byte   %01110110 ; | ### ## |            $9595 (G)
    .byte   %00011000 ; |   ##   |            $9596 (G)
    .byte   %01010110 ; | # # ## |            $9597 (G)
    .byte   %11111101 ; |###### #|            $9598 (G)
    .byte   %01111101 ; | ##### #|            $9599 (G)
    .byte   %01111100 ; | #####  |            $959a (G)
    .byte   %00000000 ; |        |            $959b (G)
    .byte   %00011000 ; |   ##   |            $959c (G)
    .byte   %00110000 ; |  ##    |            $959d (G)
    .byte   %01011010 ; | # ## # |            $959e (G)
    .byte   %01101100 ; | ## ##  |            $959f (G)
    .byte   %10101010 ; |# # # # |            $95a0 (G)
    .byte   %11011101 ; |## ### #|            $95a1 (G)
    .byte   %01111110 ; | ###### |            $95a2 (G)
    .byte   %00111000 ; |  ###   |            $95a3 (G)
    .byte   %00011000 ; |   ##   |            $95a4 (G)
    .byte   %00101100 ; |  # ##  |            $95a5 (G)
    .byte   %10110110 ; |# ## ## |            $95a6 (G)
    .byte   %01111110 ; | ###### |            $95a7 (G)
    .byte   %00111000 ; |  ###   |            $95a8 (G)
    
    .byte   $6a,$eb,$eb,$3c,$00,$14,$eb,$eb ; $95a9 (*)
    .byte   $3c,$00,$12,$12,$34,$35,$36,$30 ; $95b1 (*)
    .byte   $2c,$3c,$00,$14,$14,$55,$35,$36 ; $95b9 (*)
    .byte   $1c,$36,$3e,$00,$24,$24,$16,$56 ; $95c1 (*)
    .byte   $36,$06,$1a,$1e,$00,$14,$1c,$1c ; $95c9 (*)
    .byte   $14,$00,$14,$1c,$1c,$14,$00,$14 ; $95d1 (*)
    .byte   $00,$14,$00,$08,$08,$00,$14,$00 ; $95d9 (*)
    .byte   $14,$00,$14,$00,$14,$14,$00,$00 ; $95e1 (*)
    .byte   $00,$00,$00,$00,$00,$00,$00,$00 ; $95e9 (*)
    .byte   $00,$00,$00,$00,$00,$00,$00,$00 ; $95f1 (*)
    .byte   $00,$00,$00,$00,$00,$00,$00,$00 ; $95f9 (*)
    .byte   $c6,$38,$7c,$38,$7c,$38,$7c,$ee ; $9601 (*)
    .byte   $92,$7c,$03,$7c,$3e,$1c,$3e,$1c ; $9609 (*)
    .byte   $3c,$b2,$ce,$28,$c0,$3e,$7c,$38 ; $9611 (*)
    .byte   $7c,$38,$3c,$4d,$73,$14,$c6,$38 ; $9619 (*)
    .byte   $7c,$38,$7c,$38,$7c,$ee,$fe,$7c ; $9621 (*)
    .byte   $c6,$38,$7c,$38,$7c,$38,$7c,$ee ; $9629 (*)
    .byte   $ee,$7c,$c6,$38,$7c,$38,$7c,$38 ; $9631 (*)
    .byte   $7c,$ee,$c6,$7c,$c6,$38,$7c,$38 ; $9639 (*)
    .byte   $7c,$38,$7c,$ee,$c6,$7c         ; $9641 (*)
    .byte   $0c,$58,$5c,$e9,$f5,$3e,$1c,$5e ; $9647 (D)
    .byte   $d6,$86,$80,$4a,$10,$00,$83,$33 ; $964f (D)
    .byte   $7b,$14                         ; $9657 (D)
    .byte   $30,$78,$7d,$6c,$1a,$06,$1d,$0c ; $9659 (*)
    .byte   $1e,$be,$36,$58,$60,$b8,$0e,$2e ; $9661 (*)
    .byte   $ff,$56,$e8,$30,$30,$70,$74,$ff ; $9669 (*)
    .byte   $6a,$17,$0c,$0c,$18,$0c,$1c,$77 ; $9671 (*)
    .byte   $be,$2a,$18,$30,$38,$fe,$7d,$54 ; $9679 (*)
    .byte   $3c,$3e,$2e,$3c,$7e,$6a,$3c,$7c ; $9681 (D)
    .byte   $74,$3c,$7e,$7e                 ; $9689 (D)
    .byte   $7e,$3c,$5c                     ; $968d (*)
    .byte   $3c,$eb,$eb,$3c,$3c,$18,$1c,$2c ; $9690 (D)
    .byte   $b2,$bf,$7e,$30,$2c,$18,$7e,$08 ; $9698 (D)
    .byte   $56,$bd,$7b,$7c,$3c,$18,$7c,$fa ; $96a0 (D)
    .byte   $3c                             ; $96a8 (D)
    .byte   $1c,$7e,$f7,$7e,$7e,$2e,$7e,$f7 ; $96a9 (*)
    .byte   $7e,$7e,$20,$14,$3e,$2d,$2a,$08 ; $96b1 (*)
    .byte   $18,$1c,$18,$22,$14,$5c,$29,$2a ; $96b9 (*)
    .byte   $08,$1c,$2a,$1c,$02,$14,$3c,$5a ; $96c1 (*)
    .byte   $2a,$08,$0c,$1c,$0c,$1c,$14,$00 ; $96c9 (*)
    .byte   $14,$1c,$1c,$04,$10,$1c,$1c,$1c ; $96d1 (*)
    .byte   $1c,$1c,$1c,$1c,$08,$18,$1c,$1c ; $96d9 (*)
    .byte   $1c,$1c,$1c,$1c,$1c,$0c,$1c,$00 ; $96e1 (*)
    .byte   $00,$00,$00,$00,$00,$00,$00,$00 ; $96e9 (*)
    .byte   $00,$00,$00,$00,$00,$00,$00,$00 ; $96f1 (*)
    .byte   $00,$00,$00,$00,$00,$00,$00,$00 ; $96f9 (*)
    .byte   $c6,$c6,$c6,$c6,$c6,$c6,$c6,$c6 ; $9701 (*)
    .byte   $c6,$24,$c6,$c6,$c6,$c6,$c6,$c6 ; $9709 (*)
    .byte   $c6,$c6,$c6,$24,$c6,$c6,$c6,$c6 ; $9711 (*)
    .byte   $c6,$c6,$c6,$c6,$c6,$24,$24,$c6 ; $9719 (*)
    .byte   $c6,$c6,$c6,$c6,$c6,$c6,$c6,$24 ; $9721 (*)
    .byte   $c6,$24,$24,$c6,$c6,$c6,$c6,$c6 ; $9729 (*)
    .byte   $c6,$24,$c6,$c6,$c6,$24,$24,$c6 ; $9731 (*)
    .byte   $c6,$c6,$c6,$24,$c6,$c6,$c6,$c6 ; $9739 (*)
    .byte   $c6,$24,$24,$c6,$c6,$24         ; $9741 (*)
    
    .byte   BROWN|$a                        ; $9747 (C)
    .byte   BROWN|$c                        ; $9748 (C)
    .byte   BROWN|$8                        ; $9749 (C)
    .byte   BROWN|$a                        ; $974a (C)
    .byte   BROWN|$c                        ; $974b (C)
    .byte   BROWN|$8                        ; $974c (C)
    .byte   BROWN|$c                        ; $974d (C)
    .byte   BROWN|$8                        ; $974e (C)
    .byte   BROWN|$a                        ; $974f (C)
    .byte   BROWN|$c                        ; $9750 (C)
    .byte   BROWN|$8                        ; $9751 (C)
    .byte   BROWN|$a                        ; $9752 (C)
    .byte   BROWN|$8                        ; $9753 (C)
    .byte   BROWN|$a                        ; $9754 (C)
    .byte   BROWN|$c                        ; $9755 (C)
    .byte   BROWN|$8                        ; $9756 (C)
    .byte   BROWN|$a                        ; $9757 (C)
    .byte   BROWN|$c                        ; $9758 (C)
    
    .byte   $ba,$ba,$ba,$ba,$ba,$ba,$ba,$ba ; $9759 (*)
    .byte   $ba,$ba,$ba,$ba,$ba,$ba,$ba,$ba ; $9761 (*)
    .byte   $ba,$ba,$ba,$ba,$ba,$ba,$ba,$ba ; $9769 (*)
    .byte   $ba,$ba,$ba,$ba,$fc,$fc,$fc,$fc ; $9771 (*)
    .byte   $fc,$fc,$fc,$fc,$fc,$fc,$fc,$fc ; $9779 (*)
    
    .byte   BLACK|$a                        ; $9781 (C)
    .byte   BLACK|$a                        ; $9782 (C)
    .byte   BLACK|$a                        ; $9783 (C)
    .byte   BLACK|$a                        ; $9784 (C)
    .byte   BLACK|$a                        ; $9785 (C)
    .byte   BLACK|$a                        ; $9786 (C)
    .byte   BLACK|$a                        ; $9787 (C)
    .byte   BLACK|$a                        ; $9788 (C)
    .byte   BLACK|$a                        ; $9789 (C)
    .byte   BLACK|$a                        ; $978a (C)
    .byte   BLACK|$a                        ; $978b (C)
    .byte   BLACK|$a                        ; $978c (C)
    
    .byte   $24,$26,$48                     ; $978d (*)
    
    .byte   BEIGE|$a                        ; $9790 (C)
    .byte   BEIGE|$a                        ; $9791 (C)
    .byte   BEIGE|$a                        ; $9792 (C)
    .byte   BEIGE|$a                        ; $9793 (C)
    .byte   BEIGE|$6                        ; $9794 (C)
    .byte   BEIGE|$6                        ; $9795 (C)
    .byte   BEIGE|$6                        ; $9796 (C)
    .byte   GREEN|$6                        ; $9797 (C)
    .byte   GREEN|$8                        ; $9798 (C)
    .byte   GREEN|$8                        ; $9799 (C)
    .byte   GREEN|$8                        ; $979a (C)
    .byte   GREEN|$8                        ; $979b (C)
    .byte   BEIGE|$6                        ; $979c (C)
    .byte   BEIGE|$6                        ; $979d (C)
    .byte   BEIGE|$6                        ; $979e (C)
    .byte   GREEN|$6                        ; $979f (C)
    .byte   GREEN|$8                        ; $97a0 (C)
    .byte   GREEN|$8                        ; $97a1 (C)
    .byte   GREEN|$8                        ; $97a2 (C)
    .byte   GREEN|$8                        ; $97a3 (C)
    .byte   BEIGE|$6                        ; $97a4 (C)
    .byte   BEIGE|$6                        ; $97a5 (C)
    .byte   GREEN|$6                        ; $97a6 (C)
    .byte   GREEN|$8                        ; $97a7 (C)
    .byte   GREEN|$8                        ; $97a8 (C)
    
    .byte   $14,$48,$48,$48,$48,$26,$48,$48 ; $97a9 (*)
    .byte   $48,$48,$5c,$5c,$5c,$5c,$5c,$5c ; $97b1 (*)
    .byte   $5c,$5c,$5c,$5c,$5c,$5c,$5c,$5c ; $97b9 (*)
    .byte   $5c,$5c,$5c,$5c,$5c,$5c,$5c,$5c ; $97c1 (*)
    .byte   $5c,$5c,$5c,$5c,$5c,$5a,$5a,$5a ; $97c9 (*)
    .byte   $5a,$5a,$5a,$5a,$5a,$5a,$5a,$5a ; $97d1 (*)
    .byte   $5a,$5a,$5a,$5a,$5a,$5a,$5a,$5a ; $97d9 (*)
    .byte   $5a,$5a,$5a,$5a,$5a,$5a,$5a,$00 ; $97e1 (*)
    .byte   $00,$00,$00,$00,$00,$00,$00,$00 ; $97e9 (*)
    .byte   $00,$00,$00,$00,$00,$00,$00,$00 ; $97f1 (*)
    .byte   $00,$00,$00,$00,$00,$00,$00     ; $97f9 (*)
L9800
    .byte   $0a                             ; $9800 (D)
    .byte   $0a,$0a,$0a,$0a,$0a,$0a,$0a,$0a ; $9801 (*)
    .byte   $06,$06,$06                     ; $9809 (D)
    .byte   $07,$07,$07,$07,$06,$06         ; $980c (*)
    .byte   $03,$03,$03,$03                 ; $9812 (D)
    .byte   $03,$03                         ; $9816 (*)
    .byte   $04,$08,$08,$05                 ; $9818 (D)
    .byte   $05,$05,$09,$09,$09,$09,$08,$09 ; $981c (*)
    .byte   $09                             ; $9824 (*)
L9825
    .byte   $00                             ; $9825 (D)
    .byte   $0a,$00,$14,$00,$1e,$28,$32,$3c ; $9826 (*)
    .byte   $46,$4c,$52                     ; $982e (D)
    .byte   $58,$5f,$66,$6d,$74,$7a         ; $9831 (*)
    .byte   $80,$83,$86,$89                 ; $9837 (D)
    .byte   $8c,$8c                         ; $983b (*)
    .byte   $8f,$93,$9b,$a3                 ; $983d (D)
    .byte   $a8,$ad,$b2,$bb,$c4,$bb,$cd,$d5 ; $9841 (*)
    .byte   $de,$00                         ; $9849 (*)
    
    .byte   %00110000 ; |  ##    |            $984b (G)
    .byte   %00111000 ; |  ###   |            $984c (G)
    .byte   %01111100 ; | #####  |            $984d (G)
    .byte   %01110110 ; | ### ## |            $984e (G)
    .byte   %00000000 ; |        |            $984f (G)
    .byte   %00111100 ; |  ####  |            $9850 (G)
    .byte   %00101100 ; |  # ##  |            $9851 (G)
    .byte   %01111100 ; | #####  |            $9852 (G)
    .byte   %01110110 ; | ### ## |            $9853 (G)
    .byte   %00000000 ; |        |            $9854 (G)
    .byte   %00110000 ; |  ##    |            $9855 (G)
    .byte   %00011100 ; |   ###  |            $9856 (G)
    .byte   %01111100 ; | #####  |            $9857 (G)
    .byte   %01110110 ; | ### ## |            $9858 (G)
    .byte   %00000000 ; |        |            $9859 (G)
    .byte   %01110000 ; | ###    |            $985a (G)
    .byte   %00110000 ; |  ##    |            $985b (G)
    .byte   %01111000 ; | ####   |            $985c (G)
    .byte   %01111110 ; | ###### |            $985d (G)
    .byte   %00000000 ; |        |            $985e (G)
    .byte   %00111100 ; |  ####  |            $985f (G)
    .byte   %00110110 ; |  ## ## |            $9860 (G)
    .byte   %01111000 ; | ####   |            $9861 (G)
    .byte   %01111110 ; | ###### |            $9862 (G)
    .byte   %00000000 ; |        |            $9863 (G)
    .byte   %00110000 ; |  ##    |            $9864 (G)
    .byte   %00101100 ; |  # ##  |            $9865 (G)
    .byte   %01111000 ; | ####   |            $9866 (G)
    .byte   %01111110 ; | ###### |            $9867 (G)
    .byte   %00000000 ; |        |            $9868 (G)
    .byte   %11101110 ; |### ### |            $9869 (G)
    .byte   %11111110 ; |####### |            $986a (G)
    .byte   %01111100 ; | #####  |            $986b (G)
    .byte   %00000000 ; |        |            $986c (G)
    .byte   %00000000 ; |        |            $986d (G)
    .byte   %01101100 ; | ## ##  |            $986e (G)
    .byte   %11011100 ; |## ###  |            $986f (G)
    .byte   %01111000 ; | ####   |            $9870 (G)
    .byte   %01111100 ; | #####  |            $9871 (G)
    .byte   %00000000 ; |        |            $9872 (G)
    .byte   %00111000 ; |  ###   |            $9873 (G)
    .byte   %01110110 ; | ### ## |            $9874 (G)
    .byte   %00111000 ; |  ###   |            $9875 (G)
    .byte   %01111100 ; | #####  |            $9876 (G)
    .byte   %00000000 ; |        |            $9877 (G)
    .byte   %01100110 ; | ##  ## |            $9878 (G)
    .byte   %00101100 ; |  # ##  |            $9879 (G)
    .byte   %00111000 ; |  ###   |            $987a (G)
    .byte   %01111100 ; | #####  |            $987b (G)
    .byte   %00000000 ; |        |            $987c (G)
    .byte   %01100000 ; | ##     |            $987d (G)
    .byte   %11110111 ; |#### ###|            $987e (G)
    .byte   %01111000 ; | ####   |            $987f (G)
    .byte   %01111100 ; | #####  |            $9880 (G)
    .byte   %00000000 ; |        |            $9881 (G)
    .byte   %00110000 ; |  ##    |            $9882 (G)
    .byte   %00101110 ; |  # ### |            $9883 (G)
    .byte   %00111000 ; |  ###   |            $9884 (G)
    .byte   %01111100 ; | #####  |            $9885 (G)
    .byte   %00000000 ; |        |            $9886 (G)
    .byte   %01100110 ; | ##  ## |            $9887 (G)
    .byte   %00101100 ; |  # ##  |            $9888 (G)
    .byte   %00111000 ; |  ###   |            $9889 (G)
    .byte   %01111100 ; | #####  |            $988a (G)
    .byte   %00000000 ; |        |            $988b (G)
    .byte   %01111100 ; | #####  |            $988c (G)
    .byte   %01111100 ; | #####  |            $988d (G)
    .byte   %01010100 ; | # # #  |            $988e (G)
    .byte   %00000000 ; |        |            $988f (G)
    .byte   %00000000 ; |        |            $9890 (G)
    .byte   %01011110 ; | # #### |            $9891 (G)
    .byte   %11101110 ; |### ### |            $9892 (G)
    .byte   %00111100 ; |  ####  |            $9893 (G)
    .byte   %01101100 ; | ## ##  |            $9894 (G)
    .byte   %00000000 ; |        |            $9895 (G)
    .byte   %00011000 ; |   ##   |            $9896 (G)
    .byte   %01101110 ; | ## ### |            $9897 (G)
    .byte   %00111100 ; |  ####  |            $9898 (G)
    .byte   %01101100 ; | ## ##  |            $9899 (G)
    .byte   %00000000 ; |        |            $989a (G)
    .byte   %01111110 ; | ###### |            $989b (G)
    .byte   %01110100 ; | ### #  |            $989c (G)
    .byte   %00111100 ; |  ####  |            $989d (G)
    .byte   %01101100 ; | ## ##  |            $989e (G)
    .byte   %00000000 ; |        |            $989f (G)
    .byte   %01110110 ; | ### ## |            $98a0 (G)
    .byte   %11111111 ; |########|            $98a1 (G)
    .byte   %00111100 ; |  ####  |            $98a2 (G)
    .byte   %01101100 ; | ## ##  |            $98a3 (G)
    .byte   %00000000 ; |        |            $98a4 (G)
    .byte   %00011100 ; |   ###  |            $98a5 (G)
    .byte   %01101100 ; | ## ##  |            $98a6 (G)
    .byte   %00111100 ; |  ####  |            $98a7 (G)
    .byte   %01101100 ; | ## ##  |            $98a8 (G)
    .byte   %00000000 ; |        |            $98a9 (G)
    .byte   %01111110 ; | ###### |            $98aa (G)
    .byte   %00101100 ; |  # ##  |            $98ab (G)
    .byte   %00111100 ; |  ####  |            $98ac (G)
    .byte   %01101100 ; | ## ##  |            $98ad (G)
    .byte   %00000000 ; |        |            $98ae (G)
    .byte   %01101100 ; | ## ##  |            $98af (G)
    .byte   %00111000 ; |  ###   |            $98b0 (G)
    .byte   %11111110 ; |####### |            $98b1 (G)
    .byte   %00000000 ; |        |            $98b2 (G)
    .byte   %00000000 ; |        |            $98b3 (G)
    .byte   %00111010 ; |  ### # |            $98b4 (G)
    .byte   %11101110 ; |### ### |            $98b5 (G)
    .byte   %00111110 ; |  ##### |            $98b6 (G)
    .byte   %00000000 ; |        |            $98b7 (G)
    .byte   %00000000 ; |        |            $98b8 (G)
    .byte   %00011100 ; |   ###  |            $98b9 (G)
    .byte   %01101100 ; | ## ##  |            $98ba (G)
    .byte   %00111110 ; |  ##### |            $98bb (G)
    .byte   %00000000 ; |        |            $98bc (G)
    .byte   %00000000 ; |        |            $98bd (G)
    .byte   %00111010 ; |  ### # |            $98be (G)
    .byte   %01101100 ; | ## ##  |            $98bf (G)
    .byte   %00111110 ; |  ##### |            $98c0 (G)
    .byte   %00000000 ; |        |            $98c1 (G)
    .byte   %00000000 ; |        |            $98c2 (G)
    .byte   %00111010 ; |  ### # |            $98c3 (G)
    .byte   %11111100 ; |######  |            $98c4 (G)
    .byte   %00111110 ; |  ##### |            $98c5 (G)
    .byte   %00000000 ; |        |            $98c6 (G)
    .byte   %00000000 ; |        |            $98c7 (G)
    .byte   %00111000 ; |  ###   |            $98c8 (G)
    .byte   %01111100 ; | #####  |            $98c9 (G)
    .byte   %00111110 ; |  ##### |            $98ca (G)
    .byte   %00000000 ; |        |            $98cb (G)
    .byte   %00000000 ; |        |            $98cc (G)
    .byte   %00110010 ; |  ##  # |            $98cd (G)
    .byte   %01101100 ; | ## ##  |            $98ce (G)
    .byte   %00111110 ; |  ##### |            $98cf (G)
    .byte   %00000000 ; |        |            $98d0 (G)
    .byte   %00000000 ; |        |            $98d1 (G)
    
    .byte   $c6,$6c,$c6,$00                 ; $98d2 (D)
    .byte   $00,$00,$00,$00,$00,$00,$00,$00 ; $98d6 (*)
    .byte   $00,$00,$00,$00,$00,$00,$00,$00 ; $98de (*)
    .byte   $00,$00,$00,$00,$00,$00,$00,$00 ; $98e6 (*)
    .byte   $00,$00,$00,$00,$00,$00,$00,$00 ; $98ee (*)
    .byte   $00,$00,$00,$00,$00,$00,$00,$00 ; $98f6 (*)
    .byte   $00,$00,$00,$00,$00,$00,$00,$01 ; $98fe (*)
    .byte   $03,$07,$0f,$1e,$3c,$78,$f0,$e0 ; $9906 (*)
    .byte   $c0,$80,$40,$20,$10,$08,$04,$02 ; $990e (*)
    .byte   $01,$00,$01,$03,$07,$0f,$0f,$0f ; $9916 (*)
    .byte   $0f,$0f,$0f,$0e,$0c,$08,$04,$06 ; $991e (*)
    .byte   $07,$07,$07,$06,$04,$04,$02,$01 ; $9926 (*)
    .byte   $00,$00,$00,$00,$00,$00,$00,$00 ; $992e (*)
    .byte   $00,$00,$00,$00,$00,$00,$00,$00 ; $9936 (*)
    .byte   $00,$00,$00,$00,$00,$0f,$1f,$3f ; $993e (*)
    .byte   $7f,$ff,$f0,$e0,$c0,$80,$80,$40 ; $9946 (*)
    .byte   $20,$20,$10,$10,$38,$78,$7c,$7c ; $994e (*)
    .byte   $7e,$7e,$7f,$7f,$7f,$7f,$7f,$7f ; $9956 (*)
    .byte   $7f,$7f,$7e,$7c,$78,$70,$60,$40 ; $995e (*)
    .byte   $41,$20,$10,$08,$04,$02,$01,$00 ; $9966 (*)
    .byte   $00,$00,$00,$00,$00,$00,$00,$00 ; $996e (*)
    .byte   $00,$00,$00,$00,$00,$00,$00,$00 ; $9976 (*)
    .byte   $00,$00,$00,$00,$00,$00,$01,$03 ; $997e (*)
    .byte   $07,$0e,$1c,$38,$70,$e0,$c0,$80 ; $9986 (*)
    .byte   $80,$42,$43,$23,$21,$61,$71,$71 ; $998e (*)
    .byte   $70,$78,$78,$78,$7c,$74,$7c,$74 ; $9996 (*)
    .byte   $7e,$76,$7e,$76,$7f,$77,$7f,$77 ; $999e (*)
    .byte   $7f,$77,$7f,$77,$7f,$77,$7f,$77 ; $99a6 (*)
    .byte   $63,$41,$40,$20,$10,$08,$04,$02 ; $99ae (*)
    .byte   $01,$00,$00,$00,$00,$00,$00,$00 ; $99b6 (*)
    .byte   $00,$00,$00,$01,$03,$07,$0f,$1f ; $99be (*)
    .byte   $3e,$7c,$f8,$f0,$e0,$c0,$80,$80 ; $99c6 (*)
    .byte   $40,$20,$10,$08,$04,$0e,$1e,$3e ; $99ce (*)
    .byte   $7c,$f8,$f0,$e0,$c0,$88,$d4,$7e ; $99d6 (*)
    .byte   $77,$7f,$77,$7f,$77,$7f,$77,$7f ; $99de (*)
    .byte   $77,$7f,$77,$7f,$77,$7f,$77,$7f ; $99e6 (*)
    .byte   $77,$7f,$77,$63,$41,$41,$22,$14 ; $99ee (*)
    .byte   $08,$00,$00,$00,$00,$00,$00,$00 ; $99f6 (*)
    .byte   $00,$00                         ; $99fe (*)
    
    .byte   %00000000 ; |        |            $9a00 (P)
    
    .byte   $00                             ; $9a01 (D)
    
    .byte   %00000000 ; |        |            $9a02 (P)
    
    .byte   $00                             ; $9a03 (D)
    
    .byte   %00000001 ; |       *|            $9a04 (P)
    
    .byte   $03                             ; $9a05 (D)
    
    .byte   %00000111 ; |     ***|            $9a06 (P)
    
    .byte   $0f                             ; $9a07 (D)
    
    .byte   %00011111 ; |   *****|            $9a08 (P)
    
    .byte   $3e                             ; $9a09 (D)
    
    .byte   %01111100 ; | *****  |            $9a0a (P)
    
    .byte   $f8                             ; $9a0b (D)
    
    .byte   %11110000 ; |****    |            $9a0c (P)
    
    .byte   $e0                             ; $9a0d (D)
    
    .byte   %11000001 ; |**     *|            $9a0e (P)
    
    .byte   $82                             ; $9a0f (D)
    
    .byte   %10000011 ; |*     **|            $9a10 (P)
    
    .byte   $41                             ; $9a11 (D)
    
    .byte   %00100000 ; |  *     |            $9a12 (P)
    
    .byte   $10                             ; $9a13 (D)
    
    .byte   %00001000 ; |    *   |            $9a14 (P)
    
    .byte   $04                             ; $9a15 (D)
    
    .byte   %00001110 ; |    *** |            $9a16 (P)
    
    .byte   $1f                             ; $9a17 (D)
    
    .byte   %00111110 ; |  ***** |            $9a18 (P)
    
    .byte   $7c                             ; $9a19 (D)
    
    .byte   %01111000 ; | ****   |            $9a1a (P)
    
    .byte   $70                             ; $9a1b (D)
    
    .byte   %01100000 ; | **     |            $9a1c (P)
    
    .byte   $41                             ; $9a1d (D)
    
    .byte   %01000001 ; | *     *|            $9a1e (P)
    
    .byte   $41                             ; $9a1f (D)
    
    .byte   %01000000 ; | *      |            $9a20 (P)
    
    .byte   $60                             ; $9a21 (D)
    
    .byte   %01010000 ; | * *    |            $9a22 (P)
    
    .byte   $78                             ; $9a23 (D)
    
    .byte   %01011100 ; | * ***  |            $9a24 (P)
    
    .byte   $7e                             ; $9a25 (D)
    
    .byte   %01011111 ; | * *****|            $9a26 (P)
    
    .byte   $7f                             ; $9a27 (D)
    
    .byte   %01011111 ; | * *****|            $9a28 (P)
    
    .byte   $7f                             ; $9a29 (D)
    
    .byte   %01011111 ; | * *****|            $9a2a (P)
    
    .byte   $7f                             ; $9a2b (D)
    
    .byte   %01011111 ; | * *****|            $9a2c (P)
    
    .byte   $7f                             ; $9a2d (D)
    
    .byte   %01011111 ; | * *****|            $9a2e (P)
    
    .byte   $4f                             ; $9a2f (D)
    
    .byte   %00100111 ; |  *  ***|            $9a30 (P)
    
    .byte   $13                             ; $9a31 (D)
    
    .byte   %00001001 ; |    *  *|            $9a32 (P)
    
    .byte   $04                             ; $9a33 (D)
    
    .byte   %00000010 ; |      * |            $9a34 (P)
    
    .byte   $01                             ; $9a35 (D)
    
    .byte   %00000000 ; |        |            $9a36 (P)
    
    .byte   $00                             ; $9a37 (D)
    
    .byte   %00000000 ; |        |            $9a38 (P)
    
    .byte   $00                             ; $9a39 (D)
    
    .byte   %00000000 ; |        |            $9a3a (P)
    
    .byte   $00                             ; $9a3b (D)
    
    .byte   %00000000 ; |        |            $9a3c (P)
    
    .byte   $00                             ; $9a3d (D)
    
    .byte   %00000000 ; |        |            $9a3e (P)
    .byte   %00000000 ; |        |            $9a3f (P)
    
    .byte   $00                             ; $9a40 (D)
    
    .byte   %00000000 ; |        |            $9a41 (P)
    
    .byte   $00                             ; $9a42 (D)
    
    .byte   %00000000 ; |        |            $9a43 (P)
    
    .byte   $00                             ; $9a44 (D)
    
    .byte   %00000000 ; |        |            $9a45 (P)
    
    .byte   $01                             ; $9a46 (D)
    
    .byte   %00000011 ; |      **|            $9a47 (P)
    
    .byte   $07                             ; $9a48 (D)
    
    .byte   %00001111 ; |    ****|            $9a49 (P)
    
    .byte   $1e                             ; $9a4a (D)
    
    .byte   %00111110 ; |  ***** |            $9a4b (P)
    
    .byte   $7c                             ; $9a4c (D)
    
    .byte   %11111000 ; |*****   |            $9a4d (P)
    
    .byte   $f0                             ; $9a4e (D)
    
    .byte   %11110000 ; |****    |            $9a4f (P)
    
    .byte   $e0                             ; $9a50 (D)
    
    .byte   %11000001 ; |**     *|            $9a51 (P)
    
    .byte   $82                             ; $9a52 (D)
    
    .byte   %10000100 ; |*    *  |            $9a53 (P)
    
    .byte   $8e                             ; $9a54 (D)
    
    .byte   %10001111 ; |*   ****|            $9a55 (P)
    
    .byte   $8f                             ; $9a56 (D)
    
    .byte   %10001111 ; |*   ****|            $9a57 (P)
    
    .byte   $87                             ; $9a58 (D)
    
    .byte   %10000011 ; |*     **|            $9a59 (P)
    
    .byte   $81                             ; $9a5a (D)
    
    .byte   %01000000 ; | *      |            $9a5b (P)
    
    .byte   $20                             ; $9a5c (D)
    
    .byte   %00010000 ; |   *    |            $9a5d (P)
    
    .byte   $08                             ; $9a5e (D)
    
    .byte   %00000100 ; |     *  |            $9a5f (P)
    
    .byte   $0e                             ; $9a60 (D)
    
    .byte   %00011111 ; |   *****|            $9a61 (P)
    
    .byte   $3f                             ; $9a62 (D)
    
    .byte   %01111111 ; | *******|            $9a63 (P)
    
    .byte   $7f                             ; $9a64 (D)
    
    .byte   %01111111 ; | *******|            $9a65 (P)
    
    .byte   $7f                             ; $9a66 (D)
    
    .byte   %01111111 ; | *******|            $9a67 (P)
    
    .byte   $7e                             ; $9a68 (D)
    
    .byte   %01111110 ; | ****** |            $9a69 (P)
    
    .byte   $7c                             ; $9a6a (D)
    
    .byte   %01111000 ; | ****   |            $9a6b (P)
    
    .byte   $78                             ; $9a6c (D)
    
    .byte   %01110000 ; | ***    |            $9a6d (P)
    
    .byte   $60                             ; $9a6e (D)
    
    .byte   %01000000 ; | *      |            $9a6f (P)
    
    .byte   $20                             ; $9a70 (D)
    
    .byte   %00010000 ; |   *    |            $9a71 (P)
    
    .byte   $08                             ; $9a72 (D)
    
    .byte   %00000100 ; |     *  |            $9a73 (P)
    
    .byte   $02                             ; $9a74 (D)
    
    .byte   %00000001 ; |       *|            $9a75 (P)
    
    .byte   $00                             ; $9a76 (D)
    
    .byte   %00000000 ; |        |            $9a77 (P)
    
    .byte   $00                             ; $9a78 (D)
    
    .byte   %00000000 ; |        |            $9a79 (P)
    
    .byte   $00                             ; $9a7a (D)
    
    .byte   %00000000 ; |        |            $9a7b (P)
    
    .byte   $00                             ; $9a7c (D)
    
    .byte   %00000000 ; |        |            $9a7d (P)
    
    .byte   $00,$00,$00,$00,$00,$00,$00,$01 ; $9a7e (*)
    .byte   $03,$07,$0f,$1e,$3e,$7c,$f8,$f0 ; $9a86 (*)
    .byte   $f0,$e0,$c1,$82,$84,$8c,$8e,$8f ; $9a8e (*)
    .byte   $8f,$87,$83,$81,$40,$20,$10,$08 ; $9a96 (*)
    .byte   $04,$02,$07,$0f,$1f,$3f,$3f,$3f ; $9a9e (*)
    .byte   $3f,$3f,$3e,$3c,$38,$30,$20,$10 ; $9aa6 (*)
    .byte   $08,$04,$02,$01,$00,$00,$00,$00 ; $9aae (*)
    .byte   $00,$00,$00,$00,$00,$00,$00,$00 ; $9ab6 (*)
    .byte   $00,$00,$00,$01,$03,$07,$0f,$1f ; $9abe (*)
    .byte   $3e,$7c,$f8,$f0,$e0,$c0,$81,$81 ; $9ac6 (*)
    .byte   $40,$20,$10,$08,$04,$0e,$1e,$3e ; $9ace (*)
    .byte   $7c,$f8,$f0,$e0,$c0,$80,$80,$88 ; $9ad6 (*)
    .byte   $d4,$7e,$77,$7f,$77,$7f,$77,$7f ; $9ade (*)
    .byte   $77,$7f,$77,$7f,$77,$7f,$77,$7f ; $9ae6 (*)
    .byte   $77,$7f,$77,$7f,$77,$63,$41,$41 ; $9aee (*)
    .byte   $22,$14,$08,$00,$00,$00,$00,$00 ; $9af6 (*)
    .byte   $00,$00,$00,$00,$00,$00,$01,$03 ; $9afe (*)
    .byte   $07,$0f,$1f,$3e,$7c,$f8,$f0,$e0 ; $9b06 (*)
    .byte   $c0,$80,$80,$40,$20,$10,$08,$04 ; $9b0e (*)
    .byte   $0e,$1e,$3e,$7c,$f8,$f0,$e0,$c0 ; $9b16 (*)
    .byte   $80,$80,$88,$d4,$7e,$77,$7f,$77 ; $9b1e (*)
    .byte   $7f,$77,$7f,$77,$7f,$77,$7f,$77 ; $9b26 (*)
    .byte   $63,$41,$40,$20,$10,$08,$04,$02 ; $9b2e (*)
    .byte   $01,$00,$00,$00,$00,$00,$00,$00 ; $9b36 (*)
    .byte   $00,$3f,$7d,$f8,$f0,$e0,$c0,$80 ; $9b3e (*)
    .byte   $80,$40,$22,$15,$3f,$7d,$ff,$fd ; $9b46 (*)
    .byte   $ff,$fd,$ff,$fd,$ff,$fd,$ff,$fd ; $9b4e (*)
    .byte   $ff,$fd,$ff,$fd,$f8,$f0,$e0,$c0 ; $9b56 (*)
    .byte   $80,$80,$40,$60,$70,$78,$7c,$7e ; $9b5e (*)
    .byte   $7f,$7f,$7f,$7e,$7c,$78,$70,$60 ; $9b66 (*)
    .byte   $40,$40,$20,$10,$08,$04,$02,$01 ; $9b6e (*)
    .byte   $00,$00,$00,$00,$00,$00,$00,$00 ; $9b76 (*)
    .byte   $00,$00,$00,$00,$00,$00,$01,$03 ; $9b7e (*)
    .byte   $07,$0e,$1c,$38,$70,$e0,$c0,$83 ; $9b86 (*)
    .byte   $83,$41,$41,$20,$10,$10,$08,$04 ; $9b8e (*)
    .byte   $02,$06,$0f,$1f,$3f,$7e,$7c,$78 ; $9b96 (*)
    .byte   $70,$78,$74,$7e,$77,$7f,$77,$7f ; $9b9e (*)
    .byte   $77,$7f,$77,$7f,$77,$63,$41,$40 ; $9ba6 (*)
    .byte   $20,$10,$08,$04,$02,$01,$00,$00 ; $9bae (*)
    .byte   $00,$00,$00,$00,$00,$00,$00,$00 ; $9bb6 (*)
    .byte   $00,$00,$00,$01,$03,$07,$0f,$1f ; $9bbe (*)
    .byte   $3e,$7c,$f8,$f0,$e0,$c0,$80,$80 ; $9bc6 (*)
    .byte   $41,$23,$15,$3f,$7d,$7f,$7d,$78 ; $9bce (*)
    .byte   $70,$70,$78,$74,$7e,$77,$7f,$77 ; $9bd6 (*)
    .byte   $7f,$77,$7f,$77,$7f,$77,$7f,$77 ; $9bde (*)
    .byte   $63,$41,$40,$20,$10,$08,$04,$02 ; $9be6 (*)
    .byte   $01,$00,$00,$00,$00,$00,$00,$00 ; $9bee (*)
    .byte   $00,$00,$00,$00,$00,$00,$00,$00 ; $9bf6 (*)
    .byte   $00,$00,$f0,$78,$3c,$1e,$0f,$07 ; $9bfe (*)
    .byte   $03,$01,$00,$00,$00,$00,$00,$00 ; $9c06 (*)
    .byte   $00,$01,$03,$06,$04,$00,$00,$00 ; $9c0e (*)
    .byte   $00,$11,$2b,$7f,$ef,$ff,$ef,$e7 ; $9c16 (*)
    .byte   $c3,$81,$00,$00,$00,$00,$00,$01 ; $9c1e (*)
    .byte   $03,$07,$0e,$1c,$38,$70,$e0,$40 ; $9c26 (*)
    .byte   $e1,$72,$ec,$7c,$ec,$7c,$ec,$7c ; $9c2e (*)
    .byte   $2c,$1c,$0c,$04,$08,$10,$20,$40 ; $9c36 (*)
    .byte   $80,$7f,$ef,$47,$83,$01,$01,$03 ; $9c3e (*)
    .byte   $07,$0f,$00,$00,$00,$00,$00,$00 ; $9c46 (*)
    .byte   $00,$00,$0c,$1c,$38,$78,$f8,$70 ; $9c4e (*)
    .byte   $f0,$70,$e0,$60,$e1,$41,$c3,$83 ; $9c56 (*)
    .byte   $87,$06,$0c,$08,$10,$00,$00,$01 ; $9c5e (*)
    .byte   $03,$01,$00,$00,$80,$40,$20,$11 ; $9c66 (*)
    .byte   $0a,$04,$00,$00,$00,$00,$00,$00 ; $9c6e (*)
    .byte   $00,$00,$00,$00,$00,$00,$00,$00 ; $9c76 (*)
    .byte   $e0,$70,$38,$1c,$0e,$07,$03,$01 ; $9c7e (*)
    .byte   $00,$00,$00,$80,$40,$e0,$70,$f8 ; $9c86 (*)
    .byte   $7c,$fe,$7f,$3e,$1f,$0e,$07,$02 ; $9c8e (*)
    .byte   $01,$00,$00,$80,$c0,$e0,$c0,$80 ; $9c96 (*)
    .byte   $00,$00,$00,$00,$08,$18,$30,$71 ; $9c9e (*)
    .byte   $f1,$71,$e1,$63,$e3,$63,$c3,$47 ; $9ca6 (*)
    .byte   $87,$87,$87,$0e,$0c,$08,$00,$00 ; $9cae (*)
    .byte   $00,$01,$02,$04,$88,$50,$20,$f8 ; $9cb6 (*)
    .byte   $7c,$3e,$1f,$0f,$07,$03,$01,$00 ; $9cbe (*)
    .byte   $00,$00,$00,$00,$00,$00,$00,$00 ; $9cc6 (*)
    .byte   $00,$00,$00,$00,$00,$00,$00,$00 ; $9cce (*)
    .byte   $00,$00,$00,$00,$00,$00,$00,$00 ; $9cd6 (*)
    .byte   $00,$10,$28,$7c,$ee,$ff,$6e,$fe ; $9cde (*)
    .byte   $6e,$fe,$6e,$fe,$6e,$fe,$6e,$fe ; $9ce6 (*)
    .byte   $6e,$fe,$6e,$fe,$6e,$fe,$6e,$c6 ; $9cee (*)
    .byte   $82,$82,$44,$28,$10,$00,$00,$00 ; $9cf6 (*)
    .byte   $00,$00                         ; $9cfe (*)
    
    .byte   %11111000 ; |*****   |            $9d00 (P)
    .byte   %01111100 ; | *****  |            $9d01 (P)
    .byte   %00111110 ; |  ***** |            $9d02 (P)
    .byte   %00011111 ; |   *****|            $9d03 (P)
    .byte   %00001111 ; |    ****|            $9d04 (P)
    .byte   %00000111 ; |     ***|            $9d05 (P)
    .byte   %10000011 ; |*     **|            $9d06 (P)
    .byte   %01000001 ; | *     *|            $9d07 (P)
    .byte   %00100000 ; |  *     |            $9d08 (P)
    .byte   %00010000 ; |   *    |            $9d09 (P)
    .byte   %00010000 ; |   *    |            $9d0a (P)
    .byte   %00110000 ; |  **    |            $9d0b (P)
    .byte   %01100000 ; | **     |            $9d0c (P)
    .byte   %11000001 ; |**     *|            $9d0d (P)
    .byte   %10000010 ; |*     * |            $9d0e (P)
    .byte   %00000100 ; |     *  |            $9d0f (P)
    .byte   %00001000 ; |    *   |            $9d10 (P)
    .byte   %00010001 ; |   *   *|            $9d11 (P)
    .byte   %00010011 ; |   *  **|            $9d12 (P)
    .byte   %00011110 ; |   **** |            $9d13 (P)
    .byte   %00001100 ; |    **  |            $9d14 (P)
    .byte   %00000000 ; |        |            $9d15 (P)
    .byte   %00000000 ; |        |            $9d16 (P)
    .byte   %00000000 ; |        |            $9d17 (P)
    .byte   %00000000 ; |        |            $9d18 (P)
    .byte   %00000000 ; |        |            $9d19 (P)
    .byte   %00000100 ; |     *  |            $9d1a (P)
    .byte   %00001010 ; |    * * |            $9d1b (P)
    .byte   %00010001 ; |   *   *|            $9d1c (P)
    .byte   %00100000 ; |  *     |            $9d1d (P)
    .byte   %01000000 ; | *      |            $9d1e (P)
    .byte   %01000001 ; | *     *|            $9d1f (P)
    .byte   %01000011 ; | *    **|            $9d20 (P)
    .byte   %01100110 ; | **  ** |            $9d21 (P)
    .byte   %00111100 ; |  ****  |            $9d22 (P)
    .byte   %00011000 ; |   **   |            $9d23 (P)
    .byte   %00000000 ; |        |            $9d24 (P)
    .byte   %00000000 ; |        |            $9d25 (P)
    .byte   %10000000 ; |*       |            $9d26 (P)
    .byte   %01000001 ; | *     *|            $9d27 (P)
    .byte   %10100011 ; |* *   **|            $9d28 (P)
    .byte   %01010111 ; | * * ***|            $9d29 (P)
    .byte   %10101111 ; |* * ****|            $9d2a (P)
    .byte   %01010111 ; | * * ***|            $9d2b (P)
    .byte   %00101111 ; |  * ****|            $9d2c (P)
    .byte   %00010111 ; |   * ***|            $9d2d (P)
    .byte   %00001111 ; |    ****|            $9d2e (P)
    .byte   %00011111 ; |   *****|            $9d2f (P)
    .byte   %00111111 ; |  ******|            $9d30 (P)
    .byte   %01111111 ; | *******|            $9d31 (P)
    .byte   %11111111 ; |********|            $9d32 (P)
    .byte   %01111111 ; | *******|            $9d33 (P)
    .byte   %11111110 ; |******* |            $9d34 (P)
    .byte   %01111100 ; | *****  |            $9d35 (P)
    .byte   %11111001 ; |*****  *|            $9d36 (P)
    .byte   %01110010 ; | ***  * |            $9d37 (P)
    .byte   %11100100 ; |***  *  |            $9d38 (P)
    .byte   %01001000 ; | *  *   |            $9d39 (P)
    .byte   %10010000 ; |*  *    |            $9d3a (P)
    .byte   %00100000 ; |  *     |            $9d3b (P)
    .byte   %01000000 ; | *      |            $9d3c (P)
    .byte   %10000000 ; |*       |            $9d3d (P)
    .byte   %00000000 ; |        |            $9d3e (P)
    .byte   %11000000 ; |**      |            $9d3f (P)
    .byte   %01100000 ; | **     |            $9d40 (P)
    .byte   %00110000 ; |  **    |            $9d41 (P)
    .byte   %00011000 ; |   **   |            $9d42 (P)
    .byte   %00011100 ; |   ***  |            $9d43 (P)
    .byte   %00001110 ; |    *** |            $9d44 (P)
    .byte   %00000111 ; |     ***|            $9d45 (P)
    .byte   %00000011 ; |      **|            $9d46 (P)
    .byte   %00000011 ; |      **|            $9d47 (P)
    .byte   %00000001 ; |       *|            $9d48 (P)
    .byte   %00100000 ; |  *     |            $9d49 (P)
    .byte   %00010000 ; |   *    |            $9d4a (P)
    .byte   %00010000 ; |   *    |            $9d4b (P)
    .byte   %00001000 ; |    *   |            $9d4c (P)
    .byte   %00000100 ; |     *  |            $9d4d (P)
    .byte   %00000010 ; |      * |            $9d4e (P)
    .byte   %00000010 ; |      * |            $9d4f (P)
    .byte   %00000001 ; |       *|            $9d50 (P)
    .byte   %00000000 ; |        |            $9d51 (P)
    .byte   %00000000 ; |        |            $9d52 (P)
    .byte   %00000000 ; |        |            $9d53 (P)
    .byte   %00000000 ; |        |            $9d54 (P)
    .byte   %00000000 ; |        |            $9d55 (P)
    .byte   %00000001 ; |       *|            $9d56 (P)
    .byte   %00000011 ; |      **|            $9d57 (P)
    .byte   %00000111 ; |     ***|            $9d58 (P)
    .byte   %00001111 ; |    ****|            $9d59 (P)
    .byte   %00011111 ; |   *****|            $9d5a (P)
    .byte   %00111111 ; |  ******|            $9d5b (P)
    .byte   %01111110 ; | ****** |            $9d5c (P)
    .byte   %11111100 ; |******  |            $9d5d (P)
    .byte   %01111000 ; | ****   |            $9d5e (P)
    .byte   %11110000 ; |****    |            $9d5f (P)
    .byte   %01100000 ; | **     |            $9d60 (P)
    .byte   %11000000 ; |**      |            $9d61 (P)
    .byte   %01000001 ; | *     *|            $9d62 (P)
    .byte   %00000011 ; |      **|            $9d63 (P)
    .byte   %00000011 ; |      **|            $9d64 (P)
    .byte   %00000001 ; |       *|            $9d65 (P)
    .byte   %00000001 ; |       *|            $9d66 (P)
    .byte   %00000000 ; |        |            $9d67 (P)
    .byte   %00000000 ; |        |            $9d68 (P)
    .byte   %00000000 ; |        |            $9d69 (P)
    .byte   %00000000 ; |        |            $9d6a (P)
    .byte   %00000000 ; |        |            $9d6b (P)
    .byte   %00000000 ; |        |            $9d6c (P)
    .byte   %00000000 ; |        |            $9d6d (P)
    .byte   %00000000 ; |        |            $9d6e (P)
    .byte   %00000000 ; |        |            $9d6f (P)
    .byte   %00000000 ; |        |            $9d70 (P)
    .byte   %00000000 ; |        |            $9d71 (P)
    .byte   %00000000 ; |        |            $9d72 (P)
    .byte   %00000000 ; |        |            $9d73 (P)
    .byte   %00000000 ; |        |            $9d74 (P)
    .byte   %00000000 ; |        |            $9d75 (P)
    .byte   %00000001 ; |       *|            $9d76 (P)
    .byte   %00000010 ; |      * |            $9d77 (P)
    .byte   %00000100 ; |     *  |            $9d78 (P)
    .byte   %00001000 ; |    *   |            $9d79 (P)
    .byte   %00010000 ; |   *    |            $9d7a (P)
    .byte   %00100000 ; |  *     |            $9d7b (P)
    .byte   %01000000 ; | *      |            $9d7c (P)
    .byte   %10000000 ; |*       |            $9d7d (P)
    
    .byte   $c0,$60,$30,$18,$1c,$0e,$07,$03 ; $9d7e (*)
    .byte   $03,$01,$20,$10,$10,$08,$04,$02 ; $9d86 (*)
    .byte   $02,$01,$00,$00,$00,$00,$00,$00 ; $9d8e (*)
    .byte   $01,$03,$07,$0f,$1f,$3e,$7c,$f8 ; $9d96 (*)
    .byte   $70,$e0,$40,$01,$03,$07,$07,$03 ; $9d9e (*)
    .byte   $01,$00,$00,$00,$00,$00,$00,$40 ; $9da6 (*)
    .byte   $c0,$60,$f0,$78,$3d,$1e,$0e,$06 ; $9dae (*)
    .byte   $02,$04,$08,$10,$20,$40,$80,$f8 ; $9db6 (*)
    .byte   $7c,$3e,$1f,$0f,$07,$03,$01,$00 ; $9dbe (*)
    .byte   $00,$00,$00,$04,$0a,$11,$20,$31 ; $9dc6 (*)
    .byte   $1b,$0e,$04,$00,$00,$00,$00,$00 ; $9dce (*)
    .byte   $00,$00,$00,$40,$e0,$70,$f8,$7c ; $9dd6 (*)
    .byte   $3e,$1f,$0f,$07,$03,$01,$00,$00 ; $9dde (*)
    .byte   $01,$02,$04,$08,$11,$23,$46,$8c ; $9de6 (*)
    .byte   $18,$30,$60,$c0,$80,$00,$00,$00 ; $9dee (*)
    .byte   $00,$00,$00,$00,$00,$00,$00,$00 ; $9df6 (*)
    .byte   $00,$00,$f8,$7c,$3e,$1f,$0f,$07 ; $9dfe (*)
    .byte   $03,$01,$00,$00,$00,$00,$00,$00 ; $9e06 (*)
    .byte   $00,$00,$00,$00,$00,$00,$00,$00 ; $9e0e (*)
    .byte   $00,$00,$00,$00,$00,$40,$c0,$60 ; $9e16 (*)
    .byte   $f0,$78,$3c,$1e,$0f,$07,$03,$81 ; $9e1e (*)
    .byte   $40,$a0,$51,$ab,$57,$2f,$17,$0f ; $9e26 (*)
    .byte   $1f,$3f,$7f,$fe,$7c,$f8,$70,$e0 ; $9e2e (*)
    .byte   $40,$01,$02,$04,$08,$10,$20,$40 ; $9e36 (*)
    .byte   $80,$07,$0f,$1f,$3e,$7c,$f8,$f0 ; $9e3e (*)
    .byte   $e0,$c0,$80,$00,$01,$03,$07,$0f ; $9e46 (*)
    .byte   $1f,$3f,$7f,$ff,$7f,$ff,$7f,$ff ; $9e4e (*)
    .byte   $7f,$ff,$7f,$ff,$7f,$fe,$7c,$f8 ; $9e56 (*)
    .byte   $70,$e0,$40,$00,$00,$00,$00,$00 ; $9e5e (*)
    .byte   $00,$01,$00,$00,$00,$00,$00,$00 ; $9e66 (*)
    .byte   $00,$80,$40,$20,$10,$08,$04,$02 ; $9e6e (*)
    .byte   $01,$00,$00,$00,$00,$00,$00,$00 ; $9e76 (*)
    .byte   $e0,$70,$38,$1c,$0e,$07,$03,$01 ; $9e7e (*)
    .byte   $00,$00,$00,$00,$00,$00,$00,$00 ; $9e86 (*)
    .byte   $01,$03,$87,$4f,$fe,$7e,$fc,$78 ; $9e8e (*)
    .byte   $30,$10,$00,$00,$00,$00,$00,$00 ; $9e96 (*)
    .byte   $00,$00,$00,$00,$00,$01,$03,$07 ; $9e9e (*)
    .byte   $0f,$1f,$3f,$7f,$ff,$7f,$ff,$7f ; $9ea6 (*)
    .byte   $fe,$7c,$f8,$70,$e0,$40,$01,$02 ; $9eae (*)
    .byte   $04,$08,$10,$20,$40,$80,$00,$f8 ; $9eb6 (*)
    .byte   $7c,$3e,$1f,$0f,$07,$03,$01,$00 ; $9ebe (*)
    .byte   $40,$c0,$60,$f0,$78,$fc,$7e,$3f ; $9ec6 (*)
    .byte   $1f,$0f,$07,$03,$01,$00,$00,$01 ; $9ece (*)
    .byte   $02,$04,$08,$10,$20,$40,$81,$03 ; $9ed6 (*)
    .byte   $07,$0f,$1f,$3f,$7f,$ff,$7f,$ff ; $9ede (*)
    .byte   $7f,$ff,$7f,$fe,$7c,$f8,$70,$e0 ; $9ee6 (*)
    .byte   $40,$01,$02,$04,$08,$10,$20,$40 ; $9eee (*)
    .byte   $80,$00,$00,$00,$00,$00,$00,$00 ; $9ef6 (*)
    .byte   $00,$00                         ; $9efe (*)
L9f00
    .byte   $e1                             ; $9f00 (D)
    .byte   $d1,$c1,$b1,$72,$62             ; $9f01 (*)
    .byte   $52,$42,$32,$22,$12,$02,$f2,$e2 ; $9f06 (D)
    .byte   $d2,$c2,$b2,$a2,$92,$73,$63,$53 ; $9f0e (D)
    .byte   $43,$33,$23,$13,$03,$f3,$e3,$d3 ; $9f16 (D)
    .byte   $c3,$b3,$a3,$93,$74,$64,$54,$44 ; $9f1e (D)
    .byte   $34,$24,$14,$04,$f4,$e4,$d4,$c4 ; $9f26 (D)
    .byte   $b4,$a4,$94,$75,$65,$55,$45,$35 ; $9f2e (D)
    .byte   $25,$15,$05,$f5,$e5,$d5,$c5,$b5 ; $9f36 (D)
    .byte   $a5,$95,$76,$66,$56,$46,$36,$26 ; $9f3e (D)
    .byte   $16,$06,$f6,$e6,$d6,$c6,$b6,$a6 ; $9f46 (D)
    .byte   $96,$77,$67,$57,$47,$37,$27,$17 ; $9f4e (D)
    .byte   $07,$f7,$e7,$d7,$c7,$b7,$a7,$97 ; $9f56 (D)
    .byte   $78,$68,$58,$48,$38,$28,$18,$08 ; $9f5e (D)
    .byte   $f8,$e8,$d8,$c8,$b8,$a8,$98,$79 ; $9f66 (D)
    .byte   $69,$59,$49,$39,$29,$19,$09,$f9 ; $9f6e (D)
    .byte   $e9,$d9,$c9                     ; $9f76 (D)
    .byte   $b9,$a9,$99                     ; $9f79 (*)
    .byte   $7a                             ; $9f7c (D)
    .byte   $6a,$5a,$4a,$3a,$2a,$1a,$0a,$fa ; $9f7d (*)
    .byte   $ea,$da,$ca,$ba,$aa,$9a,$7b,$6b ; $9f85 (*)
    .byte   $5b,$4b,$3b,$2b,$1b,$0b,$fb     ; $9f8d (*)
    
L9f94
    sta     WSYNC                   ;3   =   3
;---------------------------------------
    sta     HMOVE                   ;3        
    lda     L9f00,y                 ;4        
    sta     ram_DC                  ;3        
    and     #$0f                    ;2        
    tay                             ;2        
    nop                             ;2   =  16
L9fa1
    dey                             ;2        
    bne     L9fa1                   ;2/3      
    sta     RESP0,x                 ;4        
    lda     ram_DC                  ;3        
    sta     HMCLR                   ;3        
    sta     HMP0,x                  ;4        
    rts                             ;6   =  24
    
    .byte   $00,$00,$00,$00,$00,$00,$00,$00 ; $9fad (*)
    .byte   $00,$00,$00,$00,$00,$00,$00,$00 ; $9fb5 (*)
    .byte   $00,$00,$00,$00,$00,$00,$00,$00 ; $9fbd (*)
    .byte   $00,$00,$00,$ad,$f6,$9f         ; $9fc5 (*)
    
L9fcb
    lda     (ram_D4),y              ;5        
    cmp     $fff9                   ;4        
    jmp.ind (ram_E3)                ;5         *
    lda     L9ff6                   ;4         *
    lda     (ram_D6),y              ;5        
    cmp     $fff9                   ;4        
    jmp.ind (ram_E3)                ;5         *
    lda     $dff8                   ;4        
    jmp     $d100                   ;3   =  39 *
    
    .byte   $ad,$f9,$ff,$6c,$e1,$00         ; $9fe4 (*)
    
L9fea
    lda     $dff8                   ;4        
    jmp.ind (ram_E1)                ;5   =   9 *
L9ff0
    lda     $bff7                   ;4        
    jmp.ind (ram_E1)                ;5   =   9
L9ff6
    brk                             ;7   =   7 *
    
L9ff7
    .byte   $00                             ; $9ff7 (D)
L9ff8
    .byte   $00                             ; $9ff8 (D)
L9ff9
    .byte   $00                             ; $9ff9 (D)
    .byte   $de,$ff                         ; $9ffa (*)
    .byte   $de,$ff,$de                     ; $9ffc (D)
    .byte   $ff                             ; $9fff (*)


;***********************************************************
;      Bank 1 / 0..3
;***********************************************************

    SEG     CODE
    ORG     $1000
    RORG    $b000

    .byte   $6d,$e1,$9f                     ; $b000 (*)
Lb003
    .byte   $63                             ; $b003 (*)
Lb004
    .byte   $3b                             ; $b004 (*)
Lb005
    .byte   $96,$a5,$07,$d8,$af,$21,$85,$03 ; $b005 (*)
    .byte   $7a,$44,$45,$97,$25,$ba,$73,$5a ; $b00d (*)
    .byte   $12,$e6,$f0,$10,$13,$25,$7d,$cf ; $b015 (*)
    .byte   $ad,$a7,$ac,$19,$f1,$60,$a8,$18 ; $b01d (*)
    .byte   $96,$e8,$c3,$2c,$c1,$65,$67,$68 ; $b025 (*)
    .byte   $cd,$5a,$7b,$08,$65,$1d,$1a,$51 ; $b02d (*)
    .byte   $c0,$8e,$cf,$f6,$bb,$42,$d8,$7d ; $b035 (*)
    .byte   $a1,$ae,$62,$bc,$b9             ; $b03d (*)
Lb042
    .byte   $b5                             ; $b042 (*)
Lb043
    .byte   $dd,$78,$ab,$99,$c4,$7f,$9a,$fd ; $b043 (*)
    .byte   $54,$e4,$ec,$9c,$65,$7c,$4c,$74 ; $b04b (*)
    .byte   $73,$7d,$8a,$8e,$b1,$98,$d7,$52 ; $b053 (*)
    .byte   $23,$98,$19,$26,$66,$df,$dc,$b1 ; $b05b (*)
    .byte   $04,$a2,$54,$b4,$13,$03,$77,$5e ; $b063 (*)
    .byte   $b2,$76,$9c,$da,$0b,$4f,$cf,$40 ; $b06b (*)
    .byte   $44,$16,$c2,$d1,$47,$26,$32,$3a ; $b073 (*)
    .byte   $16,$64,$75,$33,$93,$ff,$3f,$e0 ; $b07b (*)
    .byte   $5e                             ; $b083 (*)
    
    .byte   %00000000 ; |        |            $b084 (P)
    .byte   %00000000 ; |        |            $b085 (P)
    .byte   %00000000 ; |        |            $b086 (P)
    .byte   %00000000 ; |        |            $b087 (P)
    .byte   %00000000 ; |        |            $b088 (P)
    .byte   %00000000 ; |        |            $b089 (P)
    .byte   %00000000 ; |        |            $b08a (P)
    .byte   %00000000 ; |        |            $b08b (P)
    .byte   %00000000 ; |        |            $b08c (P)
    .byte   %00000000 ; |        |            $b08d (P)
    .byte   %00000001 ; |       *|            $b08e (P)
    .byte   %00000000 ; |        |            $b08f (P)
    .byte   %00000000 ; |        |            $b090 (P)
    .byte   %00000000 ; |        |            $b091 (P)
    .byte   %00000000 ; |        |            $b092 (P)
    .byte   %00000000 ; |        |            $b093 (P)
    .byte   %00000000 ; |        |            $b094 (P)
    .byte   %00000000 ; |        |            $b095 (P)
    .byte   %00000010 ; |      * |            $b096 (P)
    .byte   %00000000 ; |        |            $b097 (P)
    .byte   %00000000 ; |        |            $b098 (P)
    .byte   %00000000 ; |        |            $b099 (P)
    .byte   %00000000 ; |        |            $b09a (P)
    .byte   %00000000 ; |        |            $b09b (P)
    .byte   %00000000 ; |        |            $b09c (P)
    .byte   %00000000 ; |        |            $b09d (P)
    .byte   %00000000 ; |        |            $b09e (P)
    .byte   %00000000 ; |        |            $b09f (P)
    .byte   %00000000 ; |        |            $b0a0 (P)
    .byte   %00000000 ; |        |            $b0a1 (P)
    .byte   %00000000 ; |        |            $b0a2 (P)
    .byte   %00000000 ; |        |            $b0a3 (P)
    .byte   %00000000 ; |        |            $b0a4 (P)
    .byte   %00000000 ; |        |            $b0a5 (P)
    .byte   %00000000 ; |        |            $b0a6 (P)
    .byte   %00000000 ; |        |            $b0a7 (P)
    .byte   %00000000 ; |        |            $b0a8 (P)
    .byte   %00000000 ; |        |            $b0a9 (P)
    .byte   %00000000 ; |        |            $b0aa (P)
    .byte   %00000000 ; |        |            $b0ab (P)
    .byte   %00000000 ; |        |            $b0ac (P)
    .byte   %00000000 ; |        |            $b0ad (P)
    .byte   %00000000 ; |        |            $b0ae (P)
    .byte   %00000000 ; |        |            $b0af (P)
    .byte   %00000000 ; |        |            $b0b0 (P)
    .byte   %00000000 ; |        |            $b0b1 (P)
    .byte   %00000000 ; |        |            $b0b2 (P)
    .byte   %00000000 ; |        |            $b0b3 (P)
    .byte   %00000000 ; |        |            $b0b4 (P)
    .byte   %00000000 ; |        |            $b0b5 (P)
    .byte   %00000000 ; |        |            $b0b6 (P)
    .byte   %00000000 ; |        |            $b0b7 (P)
    .byte   %00000000 ; |        |            $b0b8 (P)
    .byte   %00000000 ; |        |            $b0b9 (P)
    .byte   %00000000 ; |        |            $b0ba (P)
    .byte   %00000000 ; |        |            $b0bb (P)
    .byte   %00000000 ; |        |            $b0bc (P)
    .byte   %00000000 ; |        |            $b0bd (P)
    .byte   %00000000 ; |        |            $b0be (P)
    .byte   %00000000 ; |        |            $b0bf (P)
    .byte   %00000000 ; |        |            $b0c0 (P)
    .byte   %00000000 ; |        |            $b0c1 (P)
    .byte   %00000000 ; |        |            $b0c2 (P)
    .byte   %00000000 ; |        |            $b0c3 (P)
    .byte   %00000000 ; |        |            $b0c4 (P)
    .byte   %00000000 ; |        |            $b0c5 (P)
    .byte   %00000000 ; |        |            $b0c6 (P)
    .byte   %00000000 ; |        |            $b0c7 (P)
    .byte   %00000000 ; |        |            $b0c8 (P)
    .byte   %00000000 ; |        |            $b0c9 (P)
    .byte   %00000010 ; |      * |            $b0ca (P)
    .byte   %00000000 ; |        |            $b0cb (P)
    .byte   %00000100 ; |     *  |            $b0cc (P)
    .byte   %00000100 ; |     *  |            $b0cd (P)
    .byte   %00001000 ; |    *   |            $b0ce (P)
    .byte   %00001000 ; |    *   |            $b0cf (P)
    .byte   %00100000 ; |  *     |            $b0d0 (P)
    .byte   %00000000 ; |        |            $b0d1 (P)
    .byte   %00000000 ; |        |            $b0d2 (P)
    .byte   %00000000 ; |        |            $b0d3 (P)
    .byte   %01000000 ; | *      |            $b0d4 (P)
    .byte   %01000000 ; | *      |            $b0d5 (P)
    .byte   %00000001 ; |       *|            $b0d6 (P)
    .byte   %00100000 ; |  *     |            $b0d7 (P)
    .byte   %00000000 ; |        |            $b0d8 (P)
    .byte   %01010000 ; | * *    |            $b0d9 (P)
    .byte   %00000000 ; |        |            $b0da (P)
    .byte   %00100000 ; |  *     |            $b0db (P)
    .byte   %00000000 ; |        |            $b0dc (P)
    .byte   %00000000 ; |        |            $b0dd (P)
    .byte   %00000000 ; |        |            $b0de (P)
    .byte   %00000000 ; |        |            $b0df (P)
    .byte   %00000000 ; |        |            $b0e0 (P)
    .byte   %00000000 ; |        |            $b0e1 (P)
    .byte   %00000000 ; |        |            $b0e2 (P)
    .byte   %00000000 ; |        |            $b0e3 (P)
    .byte   %00000000 ; |        |            $b0e4 (P)
    .byte   %00000000 ; |        |            $b0e5 (P)
    .byte   %00000000 ; |        |            $b0e6 (P)
    .byte   %00000000 ; |        |            $b0e7 (P)
    .byte   %00000000 ; |        |            $b0e8 (P)
    .byte   %00000000 ; |        |            $b0e9 (P)
    .byte   %00000000 ; |        |            $b0ea (P)
    .byte   %00000000 ; |        |            $b0eb (P)
    .byte   %00000000 ; |        |            $b0ec (P)
    .byte   %00000000 ; |        |            $b0ed (P)
    .byte   %00000000 ; |        |            $b0ee (P)
    .byte   %00000000 ; |        |            $b0ef (P)
    .byte   %00000000 ; |        |            $b0f0 (P)
    .byte   %00000000 ; |        |            $b0f1 (P)
    .byte   %00000000 ; |        |            $b0f2 (P)
    .byte   %00000000 ; |        |            $b0f3 (P)
    .byte   %00000000 ; |        |            $b0f4 (P)
    .byte   %00000000 ; |        |            $b0f5 (P)
    .byte   %00000000 ; |        |            $b0f6 (P)
    .byte   %00000000 ; |        |            $b0f7 (P)
    .byte   %00000000 ; |        |            $b0f8 (P)
    .byte   %00000000 ; |        |            $b0f9 (P)
    .byte   %00000000 ; |        |            $b0fa (P)
    .byte   %00000000 ; |        |            $b0fb (P)
    .byte   %00000000 ; |        |            $b0fc (P)
    .byte   %00000000 ; |        |            $b0fd (P)
    .byte   %00000000 ; |        |            $b0fe (P)
    .byte   %00000000 ; |        |            $b0ff (P)
    
Lb100
    lda     game_mode                  ;3        
    bpl     Lb12f                   ;2/3      
    and     #$20                    ;2        
    beq     Lb112                   ;2/3      
    lda     ram_A0                  ;3        
    bne     Lb12f                   ;2/3      
    lda     game_mode                  ;3        
    and     #$df                    ;2        
    sta     game_mode                  ;3   =  22
Lb112
    bit     INPT4|$30               ;3        
    bmi     Lb119                   ;2/3      
    jmp     Lb_game_initialization                   ;3   =   8
    
Lb119
    lda     maincounter                  ;3        
    bne     Lb12f                   ;2/3      
    lda     maincounter_overflow                  ;3        
    and     #$07                    ;2        
    bne     Lb12f                   ;2/3      
    jsr     Lb6e7                   ;6         *
    lda     game_mode                  ;3         *
    eor     #$10                    ;2         *
    sta     game_mode                  ;3         *
    jsr     Lb750                   ;6   =  32 *
Lb12f
    lda     SWCHB                   ;4        
    and     #$01                    ;2        game reset is pressed
    bne     Lb145                   ;2/3      
    lda     button_register                  ;3         *
    and     #$20                    ;2         *
    bne     Lb14b                   ;2/3       *
    lda     button_register                  ;3         *
    ora     #$20                    ;2         *
    sta     button_register                  ;3         *
    jmp     Lb_game_initialization                   ;3   =  26 *
    
Lb145
    lda     button_register                  ;3        
    and     #$df                    ;2        
    sta     button_register                  ;3   =   8
Lb14b
    jmp     Lb17c                   ;3   =   3
    
Lb_game_initialization                               ; game initialization
    lda     #$00                    ;2        
    sta     maincounter_overflow                  ;3        ; set all these values to 0
    sta     score_XX0000                  ;3        
    sta     score_00XX00                  ;3        
    sta     score_0000XX                  ;3        
    sta     ram_96                  ;3        
    sta     ram_A0                  ;3        
    sta     sound_effect                  ;3        
    jsr     Lb6e7                   ;6        
    lda     game_mode                  ;3        
    and     #$07                    ;2   apply a bitmask of 00000111  (get the level select number and drop off upper parts)   
    sta     game_mode                  ;3   this is whats responsible for changing d7 -> 07      
    lda     #$05                    ;2   set player lives to 5     
    sta     player_lives                  ;3        
    jsr     Lb750                   ;6        
    ldy     #$04                    ;2        
    ldx     #$00                    ;2        
    jsr     Lb85f                   ;6        
    ldy     #$05                    ;2        
    ldx     #$01                    ;2        
    jsr     Lb85f                   ;6   =  68
Lb17c
    lda     SWCHB                   ;4        
    and     #$02                    ;2        ; select is pressed
    beq     Lb18c                   ;2/3      
    lda     button_register                  ;3        
    and     #$ef                    ;2        
    sta     button_register                  ;3        
    jmp     Lb1d5                   ;3   =  19
    
Lb18c
    lda     maincounter                  ;3         *
    and     #$0f                    ;2         *
    sta     ram_DC                  ;3         *
    lda     button_register                  ;3         *
    and     #$10                    ;2         *
    beq     Lb1a2                   ;2/3       *
    lda     button_register                  ;3         *
    and     #$0f                    ;2         *
    cmp     ram_DC                  ;3         *
    bne     Lb1d5                   ;2/3       *
    beq     Lb1ac                   ;2/3 =  27 *
Lb1a2
    lda     button_register                  ;3         *
    and     #$f0                    ;2         *
    ora     #$10                    ;2         *
    ora     ram_DC                  ;3         *
    sta     button_register                  ;3   =  13 *
Lb1ac
    lda     game_mode                  ;3         *
    bit     game_mode                  ;3         *
    bvc     Lb1c1                   ;2/3       *
    lda     #$00                    ;2         *
    sta     score_XX0000                  ;3         *
    sta     score_00XX00                  ;3         *
    sta     score_0000XX                  ;3         *
    lda     game_mode                  ;3         *
    clc                             ;2         *
    adc     #$01                    ;2         *
    and     #$07                    ;2   =  28 *
Lb1c1
    and     #$c7                    ;2         *
    ora     #$d0                    ;2         *
    sta     game_mode                  ;3         *
    jsr     Lb6e7                   ;6         *
    jsr     Lb750                   ;6         *
    lda     #$00                    ;2         *
    sta     maincounter_overflow                  ;3         *
    sta     ram_A0                  ;3         *
    sta     sound_effect                  ;3   =  30 *
Lb1d5
    lda     game_mode                  ;3        
    and     #$10                    ;2        
    beq     Lb1de                   ;2/3      
    jmp     Lb692                   ;3   =  10
    
Lb1de
    ldx     map_scene                  ;3        
    lda     Lb8c1,x                 ;4        
    sta     ram_D4                  ;3        
    lda     Lb8cd,x                 ;4        
    sta     ram_D5                  ;3        
    lda     Lb8d9,x                 ;4        
    sta     ram_D6                  ;3        
    lda     Lb8e5,x                 ;4        
    sta     ram_D7                  ;3        
    lda     #$00                    ;2        
    sta     COLUBK                  ;3        
    lda     castle_level                  ;3        
    and     #$1f                    ;2        
    tay                             ;2        
    lda     Lb8f1,y                 ;4        
    sta     COLUPF                  ;3        
    lda     #$21                    ;2        
    sta     CTRLPF                  ;3        
    sta     VDELP1                  ;3        
    lda     #$02                    ;2        
    dec     ram_9B                  ;5        
    bpl     Lb210                   ;2/3      
    sta     ram_9B                  ;3   =  70
Lb210
    lda     #$04                    ;2        
    dec     ram_9C                  ;5        
    bpl     Lb218                   ;2/3      
    sta     ram_9C                  ;3   =  12
Lb218
    lda     #$06                    ;2        
    dec     ram_9D                  ;5        
    bpl     Lb220                   ;2/3      
    sta     ram_9D                  ;3   =  12
Lb220
    lda     game_state                  ;3        
    cmp     #$07                    ;2        
    bcc     Lb291                   ;2/3      
    cmp     #$09                    ;2        
    bcs     Lb291                   ;2/3      
    ldx     #$07                    ;2        
    stx     ram_DC                  ;3   =  16
Lb22e
    lda     ram_A4,x                ;4        
    beq     Lb251                   ;2/3      
    lda     ram_BC,x                ;4        
    cmp     #$17                    ;2        
    beq     Lb251                   ;2/3      
    lda     maincounter                  ;3        
    lsr                             ;2        
    lda     #$01                    ;2        
    adc     player_Y_pos,x                ;4        
    sta     player_Y_pos,x                ;4        
    ldy     ram_BC,x                ;4        
    lda     #$50                    ;2        
    sec                             ;2        
    sbc     Lbb39,y                 ;4        
    cmp     player_Y_pos,x                ;4        
    bcs     Lb253                   ;2/3      
    lda     #$00                    ;2        
    sta     ram_A4,x                ;4   =  53
Lb251
    dec     ram_DC                  ;5   =   5
Lb253
    dex                             ;2        
    bne     Lb22e                   ;2/3      
    lda     ram_DC                  ;3        
    bne     Lb291                   ;2/3      
    lda     ram_9E                  ;3        
    cmp     #$10                    ;2        
    bcs     Lb291                   ;2/3      
    lda     #$00                    ;2        
    sta     ram_AA                  ;3        
    lda     #$e0                    ;2        
    sta     obj_1_y_pos                  ;3        
    lda     game_state                  ;3        
    cmp     #$07                    ;2        
    beq     Lb27f                   ;2/3      
    ldy     #$08                    ;2         *
    ldx     #$00                    ;2         *
    jsr     Lb85f                   ;6         *
    ldy     #$09                    ;2         *
    ldx     #$01                    ;2         *
    jsr     Lb85f                   ;6         *
    jmp     Lb28d                   ;3   =  56 *
    
Lb27f
    ldy     #$06                    ;2        
    ldx     #$00                    ;2        
    jsr     Lb85f                   ;6        
    ldy     #$07                    ;2        
    ldx     #$01                    ;2        
    jsr     Lb85f                   ;6   =  20
Lb28d                               ; set level ending state to ram
    lda     #$09                    ;2        
    sta     game_state                  ;3   =   5
Lb291                               ; level complete routine
    lda     game_state                  ;3        
    cmp     #$09                    ;2        
    bne     Lb2e2                   ;2/3      
    lda     ram_A0                  ;3        
    bne     Lb2e2                   ;2/3      
    sta     sound_effect                  ;3        
    inc     castle_level                  ;5        
    lda     castle_level                  ;3        
    and     #$3f                    ;2        
    sta     castle_level                  ;3        
    tay                             ;2        
    ldx     Lb710,y                 ;4        
    stx     map_scene                  ;3        
    and     #$01                    ;2        
    bne     Lb2ba                   ;2/3      
    lda     enemy_speed                  ;3         *
    and     #$1f                    ;2         *
    beq     Lb2ba                   ;2/3       *
    sec                             ;2         *
    sbc     #$01                    ;2         *
    sta     enemy_speed                  ;3   =  55 *
Lb2ba
    jsr     Lb750                   ;6        
    lda     castle_level                  ;3        
    and     #$03                    ;2        
    bne     Lb2d4                   ;2/3      
    ldy     #$0a                    ;2         *
    ldx     #$00                    ;2         *
    jsr     Lb85f                   ;6         *
    ldy     #$0b                    ;2         *
    ldx     #$01                    ;2         *
    jsr     Lb85f                   ;6         *
    jmp     Lb2e2                   ;3   =  36 *
    
Lb2d4
    ldy     #$0c                    ;2        
    ldx     #$00                    ;2        
    jsr     Lb85f                   ;6        
    ldy     #$0d                    ;2        
    ldx     #$01                    ;2        
    jsr     Lb85f                   ;6   =  20
Lb2e2
    lda     game_state                  ;3        
    bne     Lb31f                   ;2/3!     
    lda     maincounter                  ;3        
    and     #$01                    ;2        
    bne     Lb30c                   ;2/3!     
    ldy     ram_D8                  ;3        
    beq     Lb2f7                   ;2/3      
    dec     ram_D8                  ;5        
    dec     ram_D8                  ;5        
    jmp     Lb30c                   ;3   =  30
    
Lb2f7                               ; set the number of gems and reset gathered gems function
    dec     ram_91                  ;5         decrement ram_91 multipurpose counter
    bne     Lb31c                   ;2/3!      branch if result of decrement is not zero 
    ldx     #$3d                    ;2         load 3d into X register
    stx     ram_91                  ;3         store 3d in ram_91
    inc     game_state                  ;5         increment game state
    ldx     map_scene                  ;3         load maze map identifier into X register
    lda     Lbbe6,x                 ;4         retrieve maze map static config from Lbbe6 
    sta     gems_remaining                  ;3         put the static config of the appropriate index into number of gems remaining
    lda     #$00                    ;2         load 00 into A register 
    sta     gems_collected                  ;3   =  32 reset number of gems collected per level
Lb30c
    ldy     ram_D8                  ;3        
    lda     #$00                    ;2        
    sta     $9004,y                 ;5        
    sta     $9005,y                 ;5        
    sta     $9042,y                 ;5        
    sta     $9043,y                 ;5   =  25
Lb31c
    jmp     Lb58a                   ;3   =   3
    
Lb31f
    lda     game_state                  ;3        
    cmp     #$01                    ;2        
    bne     Lb367                   ;2/3      
    ldx     map_scene                  ;3        
    lda     Lbbfe,x                 ;4        
    sta     ram_DD                  ;3        
    lda     Lbbf2,x                 ;4        
    sta     ram_DC                  ;3        
    lda     Lbc0a,x                 ;4        
    sta     ram_DE                  ;3        
    lda     Lbc16,x                 ;4        
    sta     ram_DF                  ;3        
    lda     ram_91                  ;3        
    tax                             ;2        
    lsr                             ;2        
    tay                             ;2        
    bcc     Lb34d                   ;2/3      
    lda     (ram_DC),y              ;5        
    sta     $9003,x                 ;5        
    sta     $9004,x                 ;5        
    jmp     Lb355                   ;3   =  67
    
Lb34d
    lda     (ram_DE),y              ;5        
    sta     $9042,x                 ;5        
    sta     $9043,x                 ;5   =  15
Lb355
    dec     ram_91                  ;5        
    bmi     Lb35c                   ;2/3      
    jmp     Lb541                   ;3   =  10
    
Lb35c
    jsr     Lb788                   ;6        
    lda     #$02                    ;2        
    sta     game_state                  ;3        
    lda     #$40                    ;2        
    sta     ram_91                  ;3   =  16
Lb367
    lda     game_state                  ;3        
    cmp     #$05                    ;2        
    bne     Lb37f                   ;2/3      
    lda     player_Y_pos                  ;3        
    adc     #$03                    ;2        
    sta     player_Y_pos                  ;3        
    cmp     #$8c                    ;2        
    bcc     Lb37f                   ;2/3      
    lda     #$06                    ;2        
    sta     game_state                  ;3        
    lda     #$50                    ;2        
    sta     ram_91                  ;3   =  29
Lb37f
    lda     game_state                  ;3        
    cmp     #$06                    ;2        
    bne     Lb3d7                   ;2/3      
    dec     ram_91                  ;5        
    bne     Lb3d7                   ;2/3      
    lda     player_lives                  ;3        
    beq     Lb3b0                   ;2/3      
    dec     player_lives                  ;5        
    bne     Lb3b0                   ;2/3      
    ldy     #$01                    ;2        
    ldx     #$00                    ;2        
    jsr     Lb85f                   ;6        
    ldy     #$02                    ;2        
    ldx     #$01                    ;2        
    jsr     Lb85f                   ;6        
    lda     game_mode                  ;3        
    and     #$07                    ;2        
    ora     #$b0                    ;2        
    sta     game_mode                  ;3        
    lda     #$00                    ;2        
    sta     maincounter                  ;3        
    sta     maincounter_overflow                  ;3        
    jmp     Lb692                   ;3   =  67
    
Lb3b0
    ldx     #$06                    ;2   =   2
Lb3b2
    ldy     #$e0                    ;2        
    lda     ram_A4,x                ;4        
    beq     Lb3c0                   ;2/3      
    lda     ram_BC,x                ;4        
    cmp     #$22                    ;2        
    bcs     Lb3c0                   ;2/3      
    ldy     #$70                    ;2   =  18
Lb3c0
    sty     player_Y_pos,x                ;4        
    lda     #$00                    ;2        
    sta     ram_A4,x                ;4        
    dex                             ;2        
    bne     Lb3b2                   ;2/3      
    jsr     Lb767                   ;6        
    jsr     Lb788                   ;6        
    lda     #$02                    ;2        
    sta     game_state                  ;3        
    lda     #$40                    ;2        
    sta     ram_91                  ;3   =  36
Lb3d7
    lda     game_state                  ;3        
    cmp     #$02                    ;2        
    bne     Lb428                   ;2/3!     
    ldy     #$ff                    ;2        
    dec     ram_91                  ;5        
    beq     Lb3ea                   ;2/3      
    lda     ram_9B                  ;3        
    bne     Lb3ea                   ;2/3      
    dec     ram_91                  ;5        
    dey                             ;2   =  28
Lb3ea
    sty     ram_DC                  ;3        
    ldx     #$06                    ;2   =   5
Lb3ee
    lda     #$00                    ;2        
    ldy     player_Y_pos,x                ;4        
    bmi     Lb40d                   ;2/3!     
    lda     player_Y_pos,x                ;4        
    clc                             ;2        
    adc     ram_DC                  ;3        
    sta     player_Y_pos,x                ;4        
    lda     ram_A4,x                ;4        
    bne     Lb40f                   ;2/3!     
    ldy     ram_BC,x                ;4        
    lda     #$50                    ;2        
    sec                             ;2        
    sbc     Lbb39,y                 ;4        
    cmp     player_Y_pos,x                ;4        
    bcc     Lb40f                   ;2/3      
    lda     #$80                    ;2   =  47
Lb40d
    sta     ram_A4,x                ;4   =   4
Lb40f
    dex                             ;2        
    bne     Lb3ee                   ;2/3!     
    stx     ram_AB                  ;3        
    stx     ram_D3                  ;3        
    stx     ram_92                  ;3        
    ldx     #$fb                    ;2        seen hat counter, decrements from fb
    stx     ram_93                  ;3        
    ldx     #$e0                    ;2        
    stx     obj_0_y_pos                  ;3        
    lda     ram_91                  ;3        
    bne     Lb428                   ;2/3      
    lda     #$03                    ;2        
    sta     game_state                  ;3   =  33
	
Lb428
    lda     game_state                  ;3        load game state into accumulator
    cmp     #$03                    ;2        compare with normal playing state
    bcc     Lb445                   ;2/3      if its less than 3 jump to Lb445  
    cmp     #$06                    ;2        
    bcs     Lb445                   ;2/3      
    ldx     #$07                    ;2   =  13
Lb434
    ldy     ram_BC,x                ;4        starting at  player_sprite+7, pointing to obj_0_x_pos
    lda     Lbb5e,y                 ;4        
    and     maincounter                  ;3        
    bne     Lb442                   ;2/3      
    lda     Lbb83,y                 ;4        
    sta     ram_BC,x                ;4   =  21
Lb442
    dex                             ;2        decrement x
    bne     Lb434                   ;2/3 =   4
Lb445
    lda     game_state                  ;3        
    cmp     #$07                    ;2        
    beq     Lb453                   ;2/3      
    cmp     #$08                    ;2        
    beq     Lb453                   ;2/3      
    cmp     #$03                    ;2        
    bne     Lb497                   ;2/3 =  15
Lb453
    lda     ram_C4                  ;3        
    lsr                             ;2        
    bcc     Lb472                   ;2/3      
    lda     player_X_pos                  ;3         *
    sta     obj_1_x_pos                  ;3         *
    lda     player_Y_pos                  ;3         *
    clc                             ;2         *
    ldx     ram_96                  ;3         *
    adc     Lbba8,x                 ;4         *
    cmp     #$8c                    ;2         *
    bcc     Lb46a                   ;2/3       *
    lda     #$8b                    ;2   =  31 *
Lb46a
    adc     #$0e                    ;2         *
    lsr                             ;2         *
    sta     obj_1_y_pos                  ;3         *
    jmp     Lb497                   ;3   =  10 *
    
Lb472
    lda     game_state                  ;3        
    cmp     #$03                    ;2        if not playing jump to Lb497
    bne     Lb497                   ;2/3      
    lda     enemy_speed                  ;3    otherwise set A to enemy_speed    
    and     #$1f                    ;2        
    cmp     #$1a                    ;2        
    bcs     Lb497                   ;2/3       if speed > 0x1a go to Lb497
    lda     obj_1_id                  ;3       otherwise load obj_1_id and see if its a hat
    cmp     #$16                    ;2         *
    bne     Lb497                   ;2/3       if its not a hat jump to Lb497
    dec     ram_93                  ;5         if it is a hat, decrement ram_93
    lda     ram_93                  ;3         *
    and     #$1f                    ;2         *
    tax                             ;2         load the value from ram_93 into A register, and turn it into a value 0-31 for index to Lbbc6
    lda     Lbbc6,x                 ;4         *
    sta     ram_CA                  ;3         store the retrieved Lbbc6 value in ram_CA
    clc                             ;2         *
    adc     obj_1_y_pos                  ;3         add the obj_1_y_pos to the retreived value from Lbbc6
    sta     obj_1_y_pos                  ;3   =  save the ojb_1_y_pos back
Lb497                               ;initialize values
    lda     #$00                    ;2        
    sta     ram_E3                  ;3        
    sta     ram_E4                  ;3        
    sta     ram_E5                  ;3        
    sta     ram_E6                  ;3        
    sta     ram_E7                  ;3        
    sta     ram_E8                  ;3        
    sta     ram_E9                  ;3        
    sta     ram_EA                  ;3        
    ldx     #$07                    ;2        
    lda     ram_AB                  ;3        
    cmp     ram_AA                  ;3        
    bcs     Lb4b5                   ;2/3      
    ldx     #$06                    ;2         *
    lda     ram_AA                  ;3   =  41 *
Lb4b5
    cmp     ram_A9                  ;3        
    bcs     Lb4bd                   ;2/3      
    ldx     #$05                    ;2        
    lda     ram_A9                  ;3   =  10
Lb4bd
    cmp     ram_A8                  ;3        
    bcs     Lb4c5                   ;2/3      
    ldx     #$04                    ;2        
    lda     ram_A8                  ;3   =  10
Lb4c5
    cmp     ram_A7                  ;3        
    bcs     Lb4cd                   ;2/3      
    ldx     #$03                    ;2        
    lda     ram_A7                  ;3   =  10
Lb4cd
    cmp     ram_A6                  ;3        
    bcs     Lb4d5                   ;2/3      
    ldx     #$02                    ;2        
    lda     ram_A6                  ;3   =  10
Lb4d5
    cmp     ram_A5                  ;3        
    bcs     Lb4dd                   ;2/3      
    ldx     #$01                    ;2        
    lda     ram_A5                  ;3   =  10
Lb4dd
    tay                             ;2        
    beq     Lb541                   ;2/3!     
    stx     ram_E3                  ;3        
    txa                             ;2        
    sta     ram_E3,x                ;4        
    ldy     ram_BC,x                ;4        
    clc                             ;2        
    lda     player_Y_pos,x                ;4        
    adc     Lbb39,y                 ;4        
    adc     #$02                    ;2        
    cmp     #$3f                    ;2        
    bcc     Lb4f4                   ;2/3      
    asl                             ;2   =  35
Lb4f4
    sta     ram_EB,x                ;4        
    lda     #$00                    ;2        
    sta     ram_A4,x                ;4        
    ldx     #$07                    ;2        
    stx     ram_DE                  ;3   =  15
Lb4fe
    ldx     ram_DE                  ;3        
    lda     ram_A4,x                ;4        
    bpl     Lb50c                   ;2/3      
    jsr     Lb63f                   ;6        
    lda     #$00                    ;2        
    sta.wy  ram_A4,y                ;5   =  22
Lb50c
    dec     ram_DE                  ;5        
    bne     Lb4fe                   ;2/3!     
    ldx     #$07                    ;2        
    stx     ram_DE                  ;3   =  12
Lb514
    ldx     ram_DE                  ;3        
    lda     ram_A4,x                ;4        
    beq     Lb51d                   ;2/3      
    jsr     Lb63f                   ;6   =  15
Lb51d
    dec     ram_DE                  ;5        
    bne     Lb514                   ;2/3      
    ldx     ram_E3                  ;3        
    stx     ram_A4                  ;3        
    ldx     ram_E4                  ;3        
    stx     ram_A5                  ;3        
    ldx     ram_E5                  ;3        
    stx     ram_A6                  ;3        
    ldx     ram_E6                  ;3        
    stx     ram_A7                  ;3        
    ldx     ram_E7                  ;3        
    stx     ram_A8                  ;3        
    ldx     ram_E8                  ;3        
    stx     ram_A9                  ;3        
    ldx     ram_E9                  ;3        
    stx     ram_AA                  ;3        
    ldx     ram_EA                  ;3        
    stx     ram_AB                  ;3   =  55
Lb541
    lda     game_state                  ;3        load game_state into accumulator
    cmp     #$01                    ;2        compare accumulator to x01
    bcc     Lb58a                   ;2/3      branch to Lb58a if accumulator < x01
    cmp     #$04                    ;2        compare accumulator to x04
    bcs     Lb58a                   ;2/3      branch to Lb58a if accumulator >= 4
    lda     ram_CC                  ;3        load contents of ram_CC into accumulator
    beq     Lb55b                   ;2/3      branch to Lb55b if value in ram_CC is 0
    and     #$08                    ;2        
    sta     ram_DC                  ;3        
    lda     ram_C4                  ;3        
    and     #$f7                    ;2        
    ora     ram_DC                  ;3        
    sta     ram_C4                  ;3   =  32
Lb55b
    lda     ram_C4                  ;3        
    sta     REFP0                   ;3        
    lda     ram_CC                  ;3        
    beq     Lb58a                   ;2/3      
    and     #$04                    ;2        
    sta     ram_DC                  ;3        
    lda     ram_BC                  ;3        
    and     #$fb                    ;2        
    ora     ram_DC                  ;3        
    sta     ram_BC                  ;3        
    lda     maincounter                  ;3        
    and     #$01                    ;2        
    bne     Lb58a                   ;2/3      
    lda     ram_9B                  ;3        
    bne     Lb58a                   ;2/3      
    lda     ram_C4                  ;3        
    and     #$ef                    ;2        
    cmp     ram_C4                  ;3        
    sta     ram_C4                  ;3        
    beq     Lb58a                   ;2/3      
    ldx     ram_BC                  ;3        
    lda     Lb8b8,x                 ;4        
    sta     ram_BC                  ;3   =  62
Lb58a
    lda     #$20                    ;2        
    sta     NUSIZ0                  ;3        
    lda     #$26                    ;2        
    sta     COLUP0                  ;3        
    lda     #$01                    ;2        
    ldx     game_state                  ;3        
    cpx     #$01                    ;2        
    bcc     Lb5d5                   ;2/3      
    cpx     #$06                    ;2        
    beq     Lb5d5                   ;2/3      
    lda     player_Y_pos                  ;3        
    clc                             ;2        
    ldx     ram_96                  ;3        
    adc     Lbba8,x                 ;4        
    sec                             ;2        
    sbc     #$01                    ;2        
    cmp     #$8b                    ;2        
    bcc     Lb5af                   ;2/3      
    lda     #$8b                    ;2   =  45 *
Lb5af
    sta     ram_DE                  ;3        
    and     #$03                    ;2        
    sta     ram_DD                  ;3        
    ldx     #$06                    ;2   =  10
Lb5b7
    txa                             ;2        
    asl                             ;2        
    adc     ram_DD                  ;3        
    tay                             ;2        
    lda     #$98                    ;2        
    sta     ram_E6,x                ;4        
    lda     Lb62f,y                 ;4        
    ldy     ram_BC                  ;3        
    adc     Lb8af,y                 ;4        
    sta     ram_E5,x                ;4        
    dex                             ;2        
    dex                             ;2        
    bpl     Lb5b7                   ;2/3      
    lda     ram_DE                  ;3        
    lsr                             ;2        
    lsr                             ;2        
    asl                             ;2        
    adc     #$0c                    ;2   =  47
Lb5d5
    sta     ram_DD                  ;3        
    ldx     #$a9                    ;2        
    lda     #$50                    ;2        
    cmp     ram_DD                  ;3        
    bne     Lb5e5                   ;2/3      
    ldx     #$65                    ;2        
    lda     #$04                    ;2        
    sta     ram_DD                  ;3   =  19
Lb5e5
    stx     ram_F5                  ;3        
    ldx     ram_A4                  ;3        
    bne     Lb5ec                   ;2/3      
    inx                             ;2   =  10
Lb5ec
    stx     ram_DF                  ;3        
    lda     #$50                    ;2        
    sec                             ;2        
    sbc     player_Y_pos,x                ;4        
    sta     ram_E0                  ;3        
    ldx     #$00                    ;2        
    stx     ram_E3                  ;3        
    stx     ram_E4                  ;3        
    ldx     #$95                    ;2        
    stx     ram_EE                  ;3        
    inx                             ;2        
    stx     ram_F0                  ;3        
    inx                             ;2        
    stx     ram_F2                  ;3        
    lda     #$00                    ;2        
    sta     NUSIZ1                  ;3        
    sta     VDELP0                  ;3        
    lda     #$93                    ;2        
    sta     ram_F6                  ;3        
    lda     #$88                    ;2        
    sta     ram_F3                  ;3        
    lda     #$91                    ;2        
    sta     ram_F4                  ;3        
    lda     enemy_speed                  ;3        
    and     #$1f                    ;2        
    bit     SWCHB                   ;4        
    bvc     Lb622                   ;2/3      
    ora     #$20                    ;2   =  73
Lb622
    sta     enemy_speed                  ;3        
    ldx     #$c7                    ;2        
    stx     ram_E1                  ;3        
    ldx     #$94                    ;2        
    stx     ram_E2                  ;3        
    jmp     Lbff0                   ;3   =  16
    
Lb62f
    .byte   $01,$69,$46,$23,$24,$01,$69,$46 ; $b62f (D)
    .byte   $47,$24,$01,$69,$6a,$47,$24,$01 ; $b637 (D)
    
Lb63f
    ldy     ram_BC,x                ;4        
    clc                             ;2        
    lda     player_Y_pos,x                ;4        
    sta     ram_DD                  ;3        
    adc     Lbb39,y                 ;4        
    adc     #$02                    ;2        
    cmp     #$3f                    ;2        
    bcc     Lb650                   ;2/3      
    asl                             ;2   =  25
Lb650
    stx     ram_DE                  ;3        
    sta     ram_EB,x                ;4        
    ldy     #$00                    ;2        
    ldx     ram_E3                  ;3        
    cmp     player_Y_pos,x                ;4        
    bcs     Lb66a                   ;2/3 =  18
Lb65c
    stx     ram_DC                  ;3        
    ldy     ram_DC                  ;3        
    ldx     ram_E3,y                ;4        
    cpx     ram_DC                  ;3        
    beq     Lb679                   ;2/3      
    cmp     player_Y_pos,x                ;4        
    bcc     Lb65c                   ;2/3 =  21
Lb66a
    lda     ram_EB,x                ;4        
    cmp     ram_DD                  ;3        
    bcs     Lb683                   ;2/3      
    lda     ram_DE                  ;3        
    sta.wy  ram_E3,y                ;5        
    tay                             ;2        
    stx     ram_E3,y                ;4        
    rts                             ;6   =  29
    
Lb679
    lda     ram_DE                  ;3        
    sta.wy  ram_E3,y                ;5        
    tay                             ;2        
    sta.wy  ram_E3,y                ;5        
    rts                             ;6   =  21
    
Lb683
    ldy     ram_DE                  ;3        
    ldx     ram_A4,y                ;4        
    bpl     Lb68d                   ;2/3      
    inx                             ;2        
    stx     ram_E3,y                ;4        
    rts                             ;6   =  21
    
Lb68d
    ldx     #$80                    ;2        
    stx     ram_E3,y                ;4        
    rts                             ;6   =  12
    
Lb692
    sta     WSYNC                   ;3   =   3
;---------------------------------------
    ldx     #$03                    ;2        
    stx     NUSIZ0                  ;3        
    stx     NUSIZ1                  ;3        
    stx     VDELP0                  ;3        
    stx     VDELP1                  ;3        
    stx     REFP0                   ;3        
    stx     REFP1                   ;3        
    ldx     #$10                    ;2        
    stx     HMP1                    ;3        
    ldx     #$bb                    ;2        
    stx     ram_E1                  ;3        
    ldx     #$b6                    ;2        
    stx     ram_E2                  ;3        
    nop                             ;2        
    sta     RESP0                   ;3        
    sta     RESP1                   ;3        
    sta     WSYNC                   ;3   =  46
;---------------------------------------
    sta     HMOVE                   ;3        
    sta     WSYNC                   ;3   =   6
;---------------------------------------
    sta     HMCLR                   ;3   =   3
Lb6bb
    lda     INTIM                   ;4        
    bne     Lb6bb                   ;2/3      
    sta     CXCLR                   ;3        
    sta     HMCLR                   ;3        
    lda     game_mode                  ;3        
    lsr                             ;2        
    lsr                             ;2        
    lsr                             ;2        
    lsr                             ;2        
    and     #$01                    ;2        
    tax                             ;2        
    lda     Lb6e3,x                 ;4        
    sta     ram_E1                  ;3        
    lda     Lb6e5,x                 ;4        
    sta     ram_E2                  ;3        
    and     #$f0                    ;2        
    cmp     #$d0                    ;2        
    bne     Lb6e0                   ;2/3      
    jmp     Lbfea                   ;3   =  50
    
Lb6e0
    jmp     Lbff0                   ;3   =   3
    
Lb6e3
    .byte   $07,$64                         ; $b6e3 (D)
Lb6e5
    .byte   $94,$d5                         ; $b6e5 (D)
    
Lb6e7
    lda     game_mode                  ;3       read the game mode
    and     #$07                    ;2       get only the level select setting
    tax                             ;2       place level select setting into X
    lda     Lb700,x                 ;4       load into A register the value of Lb700[x]
    sta     enemy_speed                  ;3       set the speed  
    ldy     Lb708,x                 ;4       load into Y register the value of Lb708[x] 
    sty     castle_level                  ;3       set the starting level 
    lda     Lb710,y                 ;4        load into A register the value of Lb710[y]
    sta     map_scene                  ;3      store that value as the map scene  
    lda     #$00                    ;2        
    sta     player_lives                  ;3   set player lives to 0     
    rts                             ;6   =  39
    
Lb700                               ; speed data, using the level select as the index
    .byte   $1f                             ; $b700 (D)
    .byte   $1d,$1b,$19,$17,$15,$13,$11     ; $b701 (*)
Lb708                               ; starting floor data using level select as the index
    .byte   $00                             ; $b708 (D)
    .byte   $04,$08,$0c,$10,$14,$18,$1c     ; $b709 (*)
Lb710                               ; level sequence configuration data, values are the level map
    .byte   $04,$05                         ; $b710 (D)
    .byte   $09,$01,$0a,$06,$02,$04,$09,$0a ; $b712 (*)
    .byte   $07,$05,$02,$04,$01,$00,$06,$0a ; $b71a (*)
    .byte   $0b,$07,$01,$04,$09,$02,$07,$05 ; $b722 (*)
    .byte   $00,$08,$0b,$07,$09,$03,$08,$01 ; $b72a (*)
    .byte   $0a,$00,$02,$0b,$03,$09,$00,$07 ; $b732 (*)
    .byte   $06,$0b,$08,$04,$01,$06,$0b,$05 ; $b73a (*)
    .byte   $00,$03,$0a,$02,$04,$07,$03,$06 ; $b742 (*)
    .byte   $01,$08,$00,$08,$03,$0b         ; $b74a (*)
    
Lb750
    lda     #$3e                    ;2        
    sta     ram_D8                  ;3        
    ldy     #$00                    ;2        
    sty     game_state                  ;3        
    lda     #$05                    ;2        
    sta     ram_91                  ;3        
    lda     #$70                    ;2        
    ldx     #$07                    ;2   =  19
Lb760
    sta     player_Y_pos,x                ;4        
    sty     ram_A4,x                ;4        
    dex                             ;2        
    bne     Lb760                   ;2/3 =  12
Lb767
    ldx     map_scene                  ;3        
    lda     Lb_player_starting_X_pos,x                 ;4        
    sta     player_X_pos                  ;3        
    lda     LB_player_starting_Y_pos,x                 ;4        
    sta     player_Y_pos                  ;3        
    lda     #$00                    ;2        
    sta     ram_BC                  ;3        player sprite
    sta     ram_CC                  ;3        player direction
    sta     ram_8C                  ;3        
    sta     ram_8D                  ;3        
    lda     #$04                    ;2        
    sta     ram_8B                  ;3        
    lda     ram_C4                  ;3        
    and     #$c0                    ;2        
    sta     ram_C4                  ;3        
    rts                             ;6   =  50
    
Lb788
    ldx     map_scene                  ;3        
    ldy     castle_level                  ;3        
    lda     obj_6_y_pos                  ;3        
    bmi     Lb797                   ;2/3      
    lda     Lb9b9,y                 ;4        
    bpl     Lb79d                   ;2/3      
    sta     obj_6_y_pos                  ;3   =  20
Lb797
    lda     #$00                    ;2        
    sta     ram_A5                  ;3        
    beq     Lb7a9                   ;2/3 =   7
Lb79d                               ; obj6 starting positions from configs
    sta     obj_6_id                  ;3        
    lda     Lb929,x                 ;4        
    sta     obj_6_y_pos                  ;3        
    lda     Lb935,x                 ;4        
    sta     obj_6_x_pos                  ;3   =  17
Lb7a9
    lda     obj_5_y_pos                  ;3        
    bmi     Lb7b4                   ;2/3      
    lda     Lb9f9,y                 ;4        
    bpl     Lb7ba                   ;2/3      
    sta     obj_5_y_pos                  ;3   =  14
Lb7b4
    lda     #$00                    ;2        
    sta     ram_A6                  ;3        
    beq     Lb7c6                   ;2/3 =   7
Lb7ba
    sta     obj_5_id                  ;3        
    lda     Lb941,x                 ;4        
    sta     obj_5_y_pos                  ;3        
    lda     Lb94d,x                 ;4        
    sta     obj_5_x_pos                  ;3   =  17
Lb7c6
    lda     obj_4_y_pos                  ;3        
    bmi     Lb7d1                   ;2/3      
    lda     Lba39,y                 ;4        
    bpl     Lb7d7                   ;2/3      
    sta     obj_4_y_pos                  ;3   =  14 *
Lb7d1
    lda     #$00                    ;2         *
    sta     ram_A7                  ;3         *
    beq     Lb7e3                   ;2/3 =   7 *
Lb7d7
    sta     obj_4_id                  ;3        
    lda     Lb959,x                 ;4        
    sta     obj_4_y_pos                  ;3        
    lda     Lb965,x                 ;4        
    sta     obj_4_x_pos                  ;3   =  17
Lb7e3
    lda     obj_3_y_pos                  ;3        
    bmi     Lb7ee                   ;2/3      
    lda     Lba79,y                 ;4        
    bpl     Lb7f4                   ;2/3      
    sta     obj_3_y_pos                  ;3   =  14 *
Lb7ee
    lda     #$00                    ;2         *
    sta     ram_A8                  ;3         *
    beq     Lb800                   ;2/3!=   7 *
Lb7f4
    sta     obj_3_id                  ;3        
    lda     Lb971,x                 ;4        
    sta     obj_3_y_pos                  ;3        
    lda     Lb97d,x                 ;4        
    sta     obj_3_x_pos                  ;3   =  17
Lb800
    lda     obj_2_y_pos                  ;3        
    bmi     Lb80b                   ;2/3      
    lda     Lbab9,y                 ;4        
    bpl     Lb811                   ;2/3      
    sta     obj_2_y_pos                  ;3   =  14 *
Lb80b
    lda     #$00                    ;2         *
    sta     ram_A9                  ;3         *
    beq     Lb81d                   ;2/3 =   7 *
Lb811
    sta     obj_2_id                  ;3        
    lda     Lb989,x                 ;4        
    sta     obj_2_y_pos                  ;3        
    lda     Lb995,x                 ;4        
    sta     obj_2_x_pos                  ;3   =  17
Lb81d
    lda     obj_1_y_pos                  ;3        
    bmi     Lb828                   ;2/3      
    lda     Lbaf9,y                 ;4        
    bpl     Lb82e                   ;2/3      
    sta     obj_1_y_pos                  ;3   =  14
Lb828
    lda     #$00                    ;2        
    sta     ram_AA                  ;3        
    beq     Lb844                   ;2/3 =   7
Lb82e
    cmp     #$16                    ;2         *
    bne     Lb838                   ;2/3       *
    ldy     game_state                  ;3         *
    cpy     #$01                    ;2         *
    bne     Lb83a                   ;2/3 =  11 *
Lb838
    sta     obj_1_id                  ;3   =   3 *
Lb83a
    lda     Lb9a1,x                 ;4         *
    sta     obj_1_y_pos                  ;3         *
    lda     Lb9ad,x                 ;4         *
    sta     obj_1_x_pos                  ;3   =  14 *
Lb844
    lda     #$00                    ;2        
    sta     ram_C5                  ;3        
    sta     ram_CD                  ;3        
    sta     ram_C6                  ;3        
    sta     ram_CE                  ;3        
    sta     ram_C7                  ;3        
    sta     ram_CF                  ;3        
    sta     ram_C8                  ;3        
    sta     ram_D0                  ;3        
    sta     ram_C9                  ;3        
    sta     ram_D1                  ;3        
    sta     ram_CA                  ;3        
    sta     ram_D2                  ;3        
    rts                             ;6   =  44
    
Lb85f
    lda     game_mode                  ;3        
    bmi     Lb879                   ;2/3      
    lda     ram_A0,x                ;4        
    beq     Lb86c                   ;2/3      
    tya                             ;2         *
    cmp     ram_A0,x                ;4         *
    bcs     Lb879                   ;2/3 =  19 *
Lb86c
    sty     ram_A0,x                ;4        
    lda     Lb87a,y                 ;4        
    sta     ram_9E,x                ;4        
    lda     #$e0                    ;2        
    sta     AUDV0,x                 ;4        
    sta     ram_A2,x                ;4   =  22
Lb879
    rts                             ;6   =   6
    
Lb87a
    .byte   $00                             ; $b87a (*)
    .byte   $1c,$1c                         ; $b87b (D)
    .byte   $20                             ; $b87d (*)
    .byte   $30,$30,$2a,$15                 ; $b87e (D)
    .byte   $2a,$2a,$3e,$7c                 ; $b882 (*)
    .byte   $14,$14                         ; $b886 (D)
    .byte   $30,$30,$30,$30,$30,$1d,$19,$01 ; $b888 (*)
    .byte   $01,$01,$01,$01,$01,$01,$01,$01 ; $b890 (*)
    .byte   $01,$01,$01,$01,$01,$01,$01,$08 ; $b898 (*)
    .byte   $08,$08,$08,$08,$08,$08,$08,$00 ; $b8a0 (*)
    .byte   $00,$00,$00,$00,$00,$00,$00     ; $b8a8 (*)
Lb8af
    .byte   $4a,$4f,$54,$4f,$59,$5e,$63,$5e ; $b8af (D)
    .byte   $68                             ; $b8b7 (D)
Lb8b8
    .byte   $01,$02,$03,$00,$05,$06,$07,$04 ; $b8b8 (D)
    .byte   $08                             ; $b8c0 (*)
Lb8c1
    .byte   $00,$3f,$7e,$bd                 ; $b8c1 (*)
    .byte   $00,$3f                         ; $b8c5 (D)
    .byte   $7e,$bd,$00,$3f,$7e,$bd         ; $b8c7 (*)
Lb8cd
    .byte   $99,$99,$99,$99                 ; $b8cd (*)
    .byte   $9a,$9a                         ; $b8d1 (D)
    .byte   $9a,$9a,$9b,$9b,$9b,$9b         ; $b8d3 (*)
Lb8d9
    .byte   $00,$3f,$7e,$bd                 ; $b8d9 (*)
    .byte   $00,$3f                         ; $b8dd (D)
    .byte   $7e,$bd,$00,$3f,$7e,$bd         ; $b8df (*)
Lb8e5
    .byte   $9c,$9c,$9c,$9c                 ; $b8e5 (*)
    .byte   $9d,$9d                         ; $b8e9 (D)
    .byte   $9d,$9d,$9e,$9e,$9e,$9e         ; $b8eb (*)
    
Lb8f1
    .byte   PURPLE|$2                       ; $b8f1 (CP)
    .byte   BLACK|$4                        ; $b8f2 (CP)
    
    .byte   $82,$a2,$92,$82,$a2,$04,$a2,$72 ; $b8f3 (*)
    .byte   $04,$82,$04,$92,$82,$72,$92,$04 ; $b8fb (*)
    .byte   $a2,$72,$a2,$82,$92,$04,$82,$04 ; $b903 (*)
    .byte   $92,$a2,$04,$a2,$82,$92         ; $b90b (*)
Lb_player_starting_X_pos                                       ; indexed with the map_scene
    .byte   $42,$44,$44,$44                 ; $b911 (*)
    .byte   $44,$4c                         ; $b915 (D)
    .byte   $4c,$28,$30,$40,$44,$44         ; $b917 (*)
LB_player_starting_Y_pos                                       ; indexed with map scene id
    .byte   $4c,$40,$40,$42                 ; $b91d (*)
    .byte   $46,$4a                         ; $b921 (D)
    .byte   $4a,$38,$30,$44,$54,$40         ; $b923 (*)
Lb929                                       ; obj_6_y_starting_pos_data[map_scene_id]
    .byte   $77,$6e,$78,$7b,$68             ; $b929 (*)
    .byte   $7b                             ; $b92e (D)
    .byte   $7c,$79,$7c,$75,$7a,$77         ; $b92f (*)
Lb935                                       ; obj_6_x_starting_pos_data[map_scene_id]
    .byte   $44,$5a,$36,$34,$2e             ; $b935 (*)
    .byte   $38                             ; $b93a (D)
    .byte   $40,$12,$38,$22,$38,$3e         ; $b93b (*)
Lb941                                       ; obj_5_y_starting_pos_data[map_scene_id]
    .byte   $6f,$62,$6f,$5b,$58             ; $b941 (*)
    .byte   $6f                             ; $b946 (D)
    .byte   $71,$60,$6f,$69,$73,$69         ; $b947 (*)
Lb94d                                       ; obj_5_x_starting_pos_data[map_scene_id]
    .byte   $54,$22,$50,$66,$54             ; $b94d (*)
    .byte   $54                             ; $b952 (D)
    .byte   $20,$40,$46,$58,$54,$68         ; $b953 (*)
Lb959                                       ; obj_4_y_starting_pos_data[map_scene_id]
    .byte   $5e,$54,$59,$4f                 ; $b959 (*)
    .byte   $4f,$58                         ; $b95d (D)
    .byte   $5b,$56,$59,$5c,$5e,$60         ; $b95f (*)
Lb965                                       ; obj_4_x_starting_pos_data[map_scene_id]
    .byte   $30,$64,$44,$18                 ; $b965 (*)
    .byte   $74,$30                         ; $b969 (D)
    .byte   $32,$20,$1e,$20,$20,$2a         ; $b96b (*)
Lb971                                       ; obj_3_y_starting_pos_data[map_scene_id]
    .byte   $4a,$4f,$4b,$46                 ; $b971 (*)
    .byte   $48,$4f                         ; $b975 (D)
    .byte   $4f,$47,$4f,$4f,$4b,$4f         ; $b977 (*)
Lb97d                                       ; obj_3_x_starting_pos_data[map_scene_id]
    .byte   $28,$40,$1c,$54                 ; $b97d (*)
    .byte   $5a,$44                         ; $b981 (D)
    .byte   $50,$58,$68,$38,$54,$40         ; $b983 (*)
Lb989                                       ; obj_2_y_starting_pos_data[map_scene_id]
    .byte   $41,$42,$41,$41                 ; $b989 (*)
    .byte   $41,$41                         ; $b98d (D)
    .byte   $41,$41,$41,$44,$41,$41         ; $b98f (*)
Lb995                                       ; obj_2_x_starting_pos_data[map_scene_id]
    .byte   $40,$4f,$40,$40                 ; $b995 (*)
    .byte   $40,$40                         ; $b999 (D)
    .byte   $40,$40,$40,$60,$40,$40         ; $b99b (*)
Lb9a1                                       ; obj_1_y_starting_pos_data[map_scene_id]
    .byte   $68,$66,$64,$61,$58,$66,$64,$5b ; $b9a1 (*)
    .byte   $52,$66,$68,$5a                 ; $b9a9 (*)
Lb9ad                                       ; obj_1_x_starting_pos_data[map_scene_id]
    .byte   $40,$4c,$40,$3a,$40,$42,$40,$30 ; $b9ad (*)
    .byte   $28,$38,$40,$68                 ; $b9b5 (*)
Lb9b9                                       ; obj_6_id_data indexed by castle floor
    .byte   $e0,$1b                         ; $b9b9 (D)
    .byte   $1e,$18,$18,$00,$18,$18,$00,$00 ; $b9bb (*)
    .byte   $10,$18,$00,$00,$19,$0c,$00,$18 ; $b9c3 (*)
    .byte   $00,$00,$19,$19,$19,$18,$00,$19 ; $b9cb (*)
    .byte   $1c,$00,$10,$18,$19,$19,$12,$19 ; $b9d3 (*)
    .byte   $12,$12,$00,$00,$1e,$18,$18,$00 ; $b9db (*)
    .byte   $00,$12,$10,$12,$00,$00,$00,$18 ; $b9e3 (*)
    .byte   $00,$12,$18,$12,$12,$00,$18,$00 ; $b9eb (*)
    .byte   $1e,$19,$12,$1e,$00,$12         ; $b9f3 (*)
Lb9f9                                       ; obj_5_id_data indexed by castle floor
    .byte   $e0,$1b                         ; $b9f9 (D)
    .byte   $00,$0c,$00,$00,$00,$0c,$00,$18 ; $b9fb (*)
    .byte   $18,$00,$18,$00,$19,$10,$00,$00 ; $ba03 (*)
    .byte   $19,$00,$00,$19,$19,$00,$12,$00 ; $ba0b (*)
    .byte   $18,$18,$00,$00,$00,$18,$18,$00 ; $ba13 (*)
    .byte   $1c,$00,$12,$00,$00,$0c,$00,$00 ; $ba1b (*)
    .byte   $1e,$19,$00,$00,$19,$0c,$18,$19 ; $ba23 (*)
    .byte   $12,$00,$00,$00,$00,$00,$00,$00 ; $ba2b (*)
    .byte   $00,$18,$00,$10,$00,$18         ; $ba33 (*)
Lba39                                       ; obj_4_id_data indexed by castle floor
    .byte   $12,$18                         ; $ba39 (D)
    .byte   $00,$00,$19,$00,$00,$12,$00,$19 ; $ba3b (*)
    .byte   $00,$00,$19,$19,$00,$00,$00,$19 ; $ba43 (*)
    .byte   $00,$00,$00,$19,$19,$0c,$00,$18 ; $ba4b (*)
    .byte   $12,$0c,$00,$19,$18,$0c,$00,$18 ; $ba53 (*)
    .byte   $00,$0c,$1e,$19,$00,$00,$00,$1c ; $ba5b (*)
    .byte   $19,$00,$00,$19,$00,$18,$1c,$00 ; $ba63 (*)
    .byte   $13,$18,$00,$19,$00,$18,$00,$10 ; $ba6b (*)
    .byte   $12,$00,$00,$1e,$00,$0c         ; $ba73 (*)
Lba79                                       ; obj_3_id_data indexed by castle floor
    .byte   $13,$1b                         ; $ba79 (D)
    .byte   $e0,$e0,$00,$00,$00,$00,$00,$00 ; $ba7b (*)
    .byte   $12,$0c,$00,$00,$18,$18,$00,$00 ; $ba83 (*)
    .byte   $18,$0c,$00,$19,$18,$10,$00,$00 ; $ba8b (*)
    .byte   $00,$12,$00,$00,$19,$12,$00,$00 ; $ba93 (*)
    .byte   $10,$18,$19,$00,$18,$19,$00,$00 ; $ba9b (*)
    .byte   $18,$0c,$12,$00,$00,$00,$19,$00 ; $baa3 (*)
    .byte   $18,$00,$19,$00,$18,$0c,$00,$10 ; $baab (*)
    .byte   $00,$0c,$13,$10,$00,$19         ; $bab3 (*)
Lbab9                                       ; obj_2_id_data indexed by castle floor
    .byte   $14,$1b                         ; $bab9 (D)
    .byte   $00,$00,$00,$00,$00,$13,$19,$00 ; $babb (*)
    .byte   $00,$00,$00,$00,$00,$00,$00,$00 ; $bac3 (*)
    .byte   $00,$00,$00,$18,$19,$19,$00,$00 ; $bacb (*)
    .byte   $00,$00,$00,$00,$00,$00,$19,$00 ; $bad3 (*)
    .byte   $00,$00,$18,$00,$12,$00,$19,$10 ; $badb (*)
    .byte   $12,$00,$18,$1e,$00,$00,$12,$00 ; $bae3 (*)
    .byte   $14,$0c,$00,$1e,$13,$00,$00,$12 ; $baeb (*)
    .byte   $13,$00,$00,$1e,$00,$13         ; $baf3 (*)
Lbaf9                                       ; obj_1_id_data  indexed by castle floor
    .byte   $e0,$e0                         ; $baf9 (D)
    .byte   $e0,$16,$16,$16,$16,$16,$16,$16 ; $bafb (*)
    .byte   $16,$16,$16,$18,$16,$16,$16,$16 ; $bb03 (*)
    .byte   $16,$16,$18,$19,$19,$16,$16,$16 ; $bb0b (*)
    .byte   $16,$16,$16,$16,$16,$16,$16,$16 ; $bb13 (*)
    .byte   $16,$16,$1c,$16,$16,$16,$16,$16 ; $bb1b (*)
    .byte   $16,$16,$00,$16,$16,$16,$16,$16 ; $bb23 (*)
    .byte   $00,$16,$10,$16,$16,$16,$00,$18 ; $bb2b (*)
    .byte   $18,$16,$16,$10,$00,$16         ; $bb33 (*)
Lbb39                                       
    .byte   $0a,$0a,$0a,$0a,$0a,$0a,$0a,$0a ; $bb39 (*)
    .byte   $0a                             ; $bb41 (*)
    .byte   $06,$06,$06                     ; $bb42 (D)
    .byte   $07,$07,$07,$07,$06,$06         ; $bb45 (*)
    .byte   $03,$03,$03,$03                 ; $bb4b (D)
    .byte   $03,$03                         ; $bb4f (*)
    .byte   $04,$08,$08,$05                 ; $bb51 (D)
    .byte   $05,$05,$09,$09,$09,$09,$08,$09 ; $bb55 (*)
    .byte   $09                             ; $bb5d (*)
Lbb5e
    .byte   $0f,$0f,$0f,$0f                 ; $bb5e (D)
    .byte   $00,$00,$00,$00,$00             ; $bb62 (*)
    .byte   $03,$03,$03                     ; $bb67 (D)
    .byte   $0f,$0f,$0f,$0f,$0f,$0f         ; $bb6a (*)
    .byte   $0f,$0f,$0f,$0f                 ; $bb70 (D)
    .byte   $00,$00                         ; $bb74 (*)
    .byte   $00,$0f,$0f,$0f                 ; $bb76 (D)
    .byte   $07,$07,$0f,$0f,$0f,$0f,$00,$00 ; $bb7a (*)
    .byte   $00                             ; $bb82 (*)
Lbb83
    .byte   $01,$02,$03,$00                 ; $bb83 (D)
    .byte   $04,$05,$06,$07,$08             ; $bb87 (*)
    .byte   $0a,$0b,$09                     ; $bb8c (D)
    .byte   $0c,$0d,$0e,$0f,$11,$10         ; $bb8f (*)
    .byte   $13,$14,$15,$12                 ; $bb95 (D)
    .byte   $16,$17                         ; $bb99 (*)
    .byte   $18,$1a,$19,$1b                 ; $bb9b (D)
    .byte   $1d,$1c,$1f,$20,$21,$1e,$22,$23 ; $bb9f (*)
    .byte   $24                             ; $bba7 (*)
Lbba8
    .byte   $00,$02,$04,$06,$07,$09,$0a,$0b ; $bba8 (D)
    .byte   $0c,$0d,$0e,$0f,$0f,$10,$10,$10 ; $bbb0 (D)
    .byte   $10,$10,$0f,$0f,$0e,$0d,$0c,$0b ; $bbb8 (D)
    .byte   $0a,$09,$07,$06,$04,$02         ; $bbc0 (D)
Lbbc6                                       ; value to add to y height of jumping hat   counter is decrementing and bitmasked against 1F so read in reverse
    .byte   $01,$02,$03,$03,$04,$05,$05,$06 ; $bbc6 (*)
    .byte   $06,$06,$07,$07,$07,$07,$07,$07 ; $bbce (*)
    .byte   $07,$07,$06,$06,$06,$05,$05,$04 ; $bbd6 (*)
    .byte   $03,$03,$02,$01,$00,$00,$00,$00 ; $bbde (*)
Lbbe6  ; static configuration for the number of gems based on the map level
    .byte   $3a,$3c,$3e,$44                 ; $bbe6 (*)
    .byte   $3a,$60                         ; $bbea (D)
    .byte   $54,$40,$5a,$44,$46,$2c         ; $bbec (*)
Lbbf2
    .byte   $22,$60,$9e,$dc                 ; $bbf2 (*)
    .byte   $1a,$58                         ; $bbf6 (D)
    .byte   $96,$d4,$12,$50,$8e,$cc         ; $bbf8 (*)
Lbbfe
    .byte   $bc,$bc,$bc,$bc                 ; $bbfe (*)
    .byte   $bd,$bd                         ; $bc02 (D)
    .byte   $bd,$bd,$be,$be,$be,$be         ; $bc04 (*)
Lbc0a
    .byte   $41,$7f,$bd,$fb                 ; $bc0a (*)
    .byte   $39,$77                         ; $bc0e (D)
    .byte   $b5,$f3,$31,$6f,$ad,$eb         ; $bc10 (*)
Lbc16
    .byte   $bc,$bc,$bc,$bc                 ; $bc16 (*)
    .byte   $bd,$bd                         ; $bc1a (D)
    .byte   $bd,$bd,$be,$be,$be,$be,$00,$00 ; $bc1c (*)
    .byte   $00,$00,$00,$00,$02,$08,$02,$00 ; $bc24 (*)
    .byte   $00,$00,$00,$00,$00,$00,$00,$00 ; $bc2c (*)
    .byte   $00,$00,$00,$00,$00,$00,$00,$00 ; $bc34 (*)
    .byte   $00,$00,$00,$00,$00,$00,$00,$40 ; $bc3c (*)
    .byte   $10,$44,$11,$44,$10,$40,$11,$44 ; $bc44 (*)
    .byte   $00,$00,$00,$00,$04,$11,$44,$10 ; $bc4c (*)
    .byte   $40,$00,$02,$08,$00,$00,$00,$00 ; $bc54 (*)
    .byte   $40,$20,$40,$00,$00,$00,$00,$00 ; $bc5c (*)
    .byte   $00,$04,$10,$04,$02,$01,$00,$00 ; $bc64 (*)
    .byte   $00,$00,$00,$00,$00,$00,$02,$08 ; $bc6c (*)
    .byte   $02,$00,$00,$00,$00,$00,$00,$00 ; $bc74 (*)
    .byte   $00,$00,$00,$00,$00,$10,$40,$00 ; $bc7c (*)
    .byte   $41,$08,$40,$00,$00,$01,$02,$04 ; $bc84 (*)
    .byte   $08,$10,$20,$40,$01,$44,$10,$44 ; $bc8c (*)
    .byte   $11,$04,$00,$00,$00,$00,$00,$00 ; $bc94 (*)
    .byte   $00,$00,$00,$00,$00,$00,$00,$00 ; $bc9c (*)
    .byte   $02,$00,$08,$00,$04,$00,$02,$00 ; $bca4 (*)
    .byte   $01,$00,$00,$00,$00,$00,$00,$00 ; $bcac (*)
    .byte   $00,$00,$08,$02,$00,$00,$00,$00 ; $bcb4 (*)
    .byte   $00,$00,$00,$40,$10,$44,$11,$04 ; $bcbc (*)
    .byte   $01,$00,$00,$00,$40,$10,$04,$00 ; $bcc4 (*)
    .byte   $04,$11,$40,$02,$00,$04,$00,$08 ; $bccc (*)
    .byte   $00,$10,$00,$21,$44,$10,$00,$00 ; $bcd4 (*)
    .byte   $00,$00,$00,$00,$00,$00,$02,$08 ; $bcdc (*)
    .byte   $02,$00,$00,$00,$00,$00,$02,$00 ; $bce4 (*)
    .byte   $00,$00,$00,$00,$00,$00,$00,$00 ; $bcec (*)
    .byte   $00,$00,$08,$00,$00,$00,$00,$00 ; $bcf4 (*)
    .byte   $00,$40,$10,$44,$11,$44,$11,$44 ; $bcfc (*)
    .byte   $11,$44,$11,$44,$11,$44,$11,$44 ; $bd04 (*)
    .byte   $00,$00,$00,$00,$00,$00,$00,$00 ; $bd0c (*)
    .byte   $00,$00,$00,$10,$00,$00         ; $bd14 (*)
    .byte   $00,$00,$00,$00,$00,$01,$04,$10 ; $bd1a (D)
    .byte   $08,$02,$00,$00,$00,$02,$08,$08 ; $bd22 (D)
    .byte   $02,$00,$00,$00,$00,$00,$00,$00 ; $bd2a (D)
    .byte   $00,$00,$00,$00,$00,$00,$00,$00 ; $bd32 (D)
    .byte   $00,$20,$08,$02,$04,$08,$20,$40 ; $bd3a (D)
    .byte   $40,$21,$54,$21,$40,$00,$00,$00 ; $bd42 (D)
    .byte   $01,$24,$08,$00,$00,$00,$00,$00 ; $bd4a (D)
    .byte   $00,$00,$00,$00,$00,$00,$00,$00 ; $bd52 (D)
    .byte   $00,$00,$00,$00,$00,$01,$04,$10 ; $bd5a (D)
    .byte   $20,$20,$20,$08,$02,$00,$00,$00 ; $bd62 (D)
    .byte   $00,$00,$00,$00,$02,$08,$02,$00 ; $bd6a (D)
    .byte   $00,$00,$00,$00,$00,$00,$00,$40 ; $bd72 (D)
    .byte   $20,$08,$04,$41,$10,$44,$11,$44 ; $bd7a (D)
    .byte   $10,$40,$00,$00,$01,$04,$10,$48 ; $bd82 (D)
    .byte   $10,$44,$11,$44,$11,$44,$11,$44 ; $bd8a (D)
    .byte   $10,$40,$00,$00                 ; $bd92 (D)
    .byte   $00,$00,$00,$00,$00,$00,$00,$02 ; $bd96 (*)
    .byte   $08,$10,$20,$20,$20,$08,$02,$00 ; $bd9e (*)
    .byte   $00,$00,$00,$00,$00,$01,$04,$01 ; $bda6 (*)
    .byte   $00,$00,$00,$00,$00,$00,$00,$00 ; $bdae (*)
    .byte   $00,$00,$20,$08,$02,$41,$00,$10 ; $bdb6 (*)
    .byte   $44,$11,$44,$10,$40,$00,$01,$04 ; $bdbe (*)
    .byte   $10,$40,$08,$22,$48,$22,$08,$02 ; $bdc6 (*)
    .byte   $00,$40,$50,$40,$00,$00,$00,$00 ; $bdce (*)
    .byte   $00,$00,$00,$01,$04,$10,$04,$01 ; $bdd6 (*)
    .byte   $00,$00,$00,$02,$08,$22,$00,$00 ; $bdde (*)
    .byte   $00,$00,$00,$00,$00,$00,$00,$00 ; $bde6 (*)
    .byte   $00,$08,$00,$00,$00,$00,$00,$40 ; $bdee (*)
    .byte   $10,$4a,$10,$40,$00,$00,$40,$12 ; $bdf6 (*)
    .byte   $44,$11,$04,$01,$00,$00,$40,$10 ; $bdfe (*)
    .byte   $44,$10,$40,$00,$00,$00,$00,$00 ; $be06 (*)
    .byte   $00,$00,$00,$00,$00,$00,$00,$00 ; $be0e (*)
    .byte   $00,$00,$02,$08,$02,$00,$00,$00 ; $be16 (*)
    .byte   $00,$02,$09,$22,$00,$00,$00,$00 ; $be1e (*)
    .byte   $00,$00,$00,$08,$02,$00,$00,$00 ; $be26 (*)
    .byte   $00,$00,$00,$00,$00,$40,$10,$44 ; $be2e (*)
    .byte   $11,$44,$11,$44,$11,$44,$11,$44 ; $be36 (*)
    .byte   $11,$04,$01,$40,$50,$14,$04,$00 ; $be3e (*)
    .byte   $00,$40,$00,$00,$01,$04,$10,$40 ; $be46 (*)
    .byte   $00,$00,$00,$02,$04,$09,$00,$00 ; $be4e (*)
    .byte   $00,$00,$00,$00,$00,$00,$00,$00 ; $be56 (*)
    .byte   $02,$08,$02,$00,$00,$00,$00,$00 ; $be5e (*)
    .byte   $02,$08,$02,$00,$00,$00,$00,$00 ; $be66 (*)
    .byte   $00,$00,$00,$01,$04,$12,$48,$20 ; $be6e (*)
    .byte   $00,$00,$00,$00,$00,$00,$00,$00 ; $be76 (*)
    .byte   $01,$04,$11,$44,$10,$44,$11,$44 ; $be7e (*)
    .byte   $11,$04,$01,$00,$00,$00,$00,$00 ; $be86 (*)
    .byte   $00,$00,$00,$00,$00,$02,$04,$08 ; $be8e (*)
    .byte   $10,$04,$01,$00,$00,$00,$00,$01 ; $be96 (*)
    .byte   $00,$00,$00,$00,$00,$00,$00,$04 ; $be9e (*)
    .byte   $01,$00,$00,$00,$00,$00,$00,$00 ; $bea6 (*)
    .byte   $00,$40,$10,$44,$11,$44,$10,$00 ; $beae (*)
    .byte   $00,$00,$01,$02,$48,$12,$44,$11 ; $beb6 (*)
    .byte   $44,$10,$40,$00,$00,$00,$00,$00 ; $bebe (*)
    .byte   $02,$08,$20,$00,$00,$00,$00,$00 ; $bec6 (*)
    .byte   $00,$00,$00,$00,$02,$08,$00,$00 ; $bece (*)
    .byte   $00,$00,$02,$00,$00,$00,$00,$00 ; $bed6 (*)
    .byte   $00,$00,$00,$04,$01,$00,$00,$00 ; $bede (*)
    .byte   $00,$00,$00,$00,$00,$00,$00,$40 ; $bee6 (*)
    .byte   $10,$04,$01,$00,$00,$00,$40,$10 ; $beee (*)
    .byte   $44,$10,$41,$04,$10,$40,$00,$00 ; $bef6 (*)
    .byte   $00,$00,$00,$00,$02,$08,$20,$00 ; $befe (*)
    .byte   $00,$00,$00,$00,$00,$00,$00,$00 ; $bf06 (*)
    .byte   $00,$00,$00,$00,$00,$00,$00,$00 ; $bf0e (*)
    .byte   $00,$00,$00,$00,$00,$00,$00,$00 ; $bf16 (*)
    .byte   $00,$00,$00,$00,$00,$00,$00,$00 ; $bf1e (*)
    .byte   $00,$00,$00,$00,$00,$00,$00,$00 ; $bf26 (*)
    .byte   $00,$00,$00,$00,$00,$00,$00,$00 ; $bf2e (*)
    .byte   $00,$00,$00,$00,$00,$00,$00,$00 ; $bf36 (*)
    .byte   $00,$00,$00,$00,$00,$00,$00,$00 ; $bf3e (*)
    .byte   $00,$00,$00,$00,$00,$00,$00,$00 ; $bf46 (*)
    .byte   $00,$00,$00,$00,$00,$00,$00,$00 ; $bf4e (*)
    .byte   $00,$00,$00,$00,$00,$00,$00,$00 ; $bf56 (*)
    .byte   $00,$00,$00,$00,$00,$00,$00,$00 ; $bf5e (*)
    .byte   $00,$00,$00,$00,$00,$00,$00,$00 ; $bf66 (*)
    .byte   $00,$00,$00,$00,$00,$00,$00,$00 ; $bf6e (*)
    .byte   $00,$00,$00,$00,$00,$00,$00,$00 ; $bf76 (*)
    .byte   $00,$00,$00,$00,$00,$00,$00,$00 ; $bf7e (*)
    .byte   $00,$00,$00,$00,$00,$00,$00,$00 ; $bf86 (*)
    .byte   $00,$00,$00,$00,$00,$00,$00,$00 ; $bf8e (*)
    .byte   $00,$00,$00,$00,$00,$00,$00,$00 ; $bf96 (*)
    .byte   $00,$00,$00,$00,$00,$00,$00,$00 ; $bf9e (*)
    .byte   $00,$00,$00,$00,$00,$00,$00,$00 ; $bfa6 (*)
    .byte   $00,$00,$00,$00,$00,$00,$00,$00 ; $bfae (*)
    .byte   $00,$00,$00,$00,$00,$00,$00,$00 ; $bfb6 (*)
    .byte   $00,$00,$00,$00,$00,$00,$00,$00 ; $bfbe (*)
    .byte   $00,$00,$00,$00,$00,$00,$00,$00 ; $bfc6 (*)
    .byte   $00,$00,$00,$00,$00,$00,$00,$00 ; $bfce (*)
    .byte   $00,$00,$00,$00,$00,$00,$00,$00 ; $bfd6 (*)
    .byte   $ad,$f8,$df,$4c,$00,$d1,$ad,$f9 ; $bfde (*)
    .byte   $ff,$6c,$e1,$00                 ; $bfe6 (*)
    
Lbfea
    lda     $dff8                   ;4        
    jmp.ind (ram_E1)                ;5   =   9
Lbff0
    lda     $9ff6                   ;4        
    jmp.ind (ram_E1)                ;5   =   9
    
Lbff6
    .byte   $00                             ; $bff6 (D)
    .byte   $00                             ; $bff7 (*)
Lbff8
    .byte   $00                             ; $bff8 (D)
    .byte   $00,$de,$ff,$de,$ff,$de         ; $bff9 (*)
    .byte   $ff                             ; $bfff (*)


;***********************************************************
;      Bank 2 / 0..3
;***********************************************************

    SEG     CODE
    ORG     $2000
    RORG    $d000

    .byte   $6d,$e1,$9f                     ; $d000 (*)
Ld003
    .byte   $63,$3b,$96,$a5,$07,$d8,$af,$21 ; $d003 (*)
    .byte   $85,$03,$7a,$44,$45,$97,$25,$ba ; $d00b (*)
    .byte   $73,$5a,$12,$e6,$f0,$10,$13,$25 ; $d013 (*)
    .byte   $7d,$cf,$ad,$a7,$ac,$19,$f1,$60 ; $d01b (*)
    .byte   $a8,$18,$96,$e8,$c3,$2c,$c1,$65 ; $d023 (*)
    .byte   $67,$68,$cd,$5a,$7b,$08,$65,$1d ; $d02b (*)
    .byte   $1a,$51,$c0,$8e,$cf,$f6,$bb,$42 ; $d033 (*)
    .byte   $d8,$7d,$a1,$ae,$62,$bc,$b9,$b5 ; $d03b (*)
    .byte   $dd,$78,$ab,$99,$c4,$7f,$9a,$fd ; $d043 (*)
    .byte   $54,$e4,$ec,$9c,$65,$7c,$4c,$74 ; $d04b (*)
    .byte   $73,$7d,$8a,$8e,$b1,$98,$d7,$52 ; $d053 (*)
    .byte   $23,$98,$19,$26,$66,$df,$dc,$b1 ; $d05b (*)
    .byte   $04,$a2,$54,$b4,$13,$03,$77,$5e ; $d063 (*)
    .byte   $b2,$76,$9c,$da,$0b,$4f,$cf,$40 ; $d06b (*)
    .byte   $44,$16,$c2,$d1,$47,$26,$32,$3a ; $d073 (*)
    .byte   $16,$64,$75,$33,$93,$ff,$3f,$e0 ; $d07b (*)
Ld083
    .byte   $5e                             ; $d083 (*)
    
    .byte   %00000000 ; |        |            $d084 (P)
    .byte   %00000000 ; |        |            $d085 (P)
    .byte   %00000000 ; |        |            $d086 (P)
    .byte   %00000000 ; |        |            $d087 (P)
    .byte   %00000000 ; |        |            $d088 (P)
    .byte   %00000000 ; |        |            $d089 (P)
    .byte   %00000000 ; |        |            $d08a (P)
    .byte   %00000000 ; |        |            $d08b (P)
    .byte   %00000000 ; |        |            $d08c (P)
    .byte   %00000000 ; |        |            $d08d (P)
    .byte   %00000001 ; |       *|            $d08e (P)
    .byte   %00000000 ; |        |            $d08f (P)
    .byte   %00000000 ; |        |            $d090 (P)
    .byte   %00000000 ; |        |            $d091 (P)
    .byte   %00000000 ; |        |            $d092 (P)
    .byte   %00000000 ; |        |            $d093 (P)
    .byte   %00000000 ; |        |            $d094 (P)
    .byte   %00000000 ; |        |            $d095 (P)
    .byte   %00000010 ; |      * |            $d096 (P)
    .byte   %00000000 ; |        |            $d097 (P)
    .byte   %00000000 ; |        |            $d098 (P)
    .byte   %00000000 ; |        |            $d099 (P)
    .byte   %00000000 ; |        |            $d09a (P)
    .byte   %00000000 ; |        |            $d09b (P)
    .byte   %00000000 ; |        |            $d09c (P)
    .byte   %00000000 ; |        |            $d09d (P)
    .byte   %00000000 ; |        |            $d09e (P)
    .byte   %00000000 ; |        |            $d09f (P)
    .byte   %00000000 ; |        |            $d0a0 (P)
    .byte   %00000000 ; |        |            $d0a1 (P)
    .byte   %00000000 ; |        |            $d0a2 (P)
    .byte   %00000000 ; |        |            $d0a3 (P)
    .byte   %00000000 ; |        |            $d0a4 (P)
    .byte   %00000000 ; |        |            $d0a5 (P)
    .byte   %00000000 ; |        |            $d0a6 (P)
    .byte   %00000000 ; |        |            $d0a7 (P)
    .byte   %00000000 ; |        |            $d0a8 (P)
    .byte   %00000000 ; |        |            $d0a9 (P)
    .byte   %00000000 ; |        |            $d0aa (P)
    .byte   %00000000 ; |        |            $d0ab (P)
    .byte   %00000000 ; |        |            $d0ac (P)
    .byte   %00000000 ; |        |            $d0ad (P)
    .byte   %00000000 ; |        |            $d0ae (P)
    .byte   %00000000 ; |        |            $d0af (P)
    .byte   %00000000 ; |        |            $d0b0 (P)
    .byte   %00000000 ; |        |            $d0b1 (P)
    .byte   %00000000 ; |        |            $d0b2 (P)
    .byte   %00000000 ; |        |            $d0b3 (P)
    .byte   %00000000 ; |        |            $d0b4 (P)
    .byte   %00000000 ; |        |            $d0b5 (P)
    .byte   %00000000 ; |        |            $d0b6 (P)
    .byte   %00000000 ; |        |            $d0b7 (P)
    .byte   %00000000 ; |        |            $d0b8 (P)
    .byte   %00000000 ; |        |            $d0b9 (P)
    .byte   %00000000 ; |        |            $d0ba (P)
    .byte   %00000000 ; |        |            $d0bb (P)
    .byte   %00000000 ; |        |            $d0bc (P)
    .byte   %00000000 ; |        |            $d0bd (P)
    .byte   %00000000 ; |        |            $d0be (P)
    .byte   %00000000 ; |        |            $d0bf (P)
    .byte   %00000000 ; |        |            $d0c0 (P)
    .byte   %00000000 ; |        |            $d0c1 (P)
    .byte   %00000000 ; |        |            $d0c2 (P)
    .byte   %00000000 ; |        |            $d0c3 (P)
    .byte   %00000000 ; |        |            $d0c4 (P)
    .byte   %00000000 ; |        |            $d0c5 (P)
    .byte   %00000000 ; |        |            $d0c6 (P)
    .byte   %00000000 ; |        |            $d0c7 (P)
    .byte   %00000000 ; |        |            $d0c8 (P)
    .byte   %00000000 ; |        |            $d0c9 (P)
    .byte   %00000010 ; |      * |            $d0ca (P)
    .byte   %00000000 ; |        |            $d0cb (P)
    .byte   %00000100 ; |     *  |            $d0cc (P)
    .byte   %00000100 ; |     *  |            $d0cd (P)
    .byte   %00001000 ; |    *   |            $d0ce (P)
    .byte   %00001000 ; |    *   |            $d0cf (P)
    .byte   %00100000 ; |  *     |            $d0d0 (P)
    .byte   %00000000 ; |        |            $d0d1 (P)
    .byte   %00000000 ; |        |            $d0d2 (P)
    .byte   %00000000 ; |        |            $d0d3 (P)
    .byte   %01000000 ; | *      |            $d0d4 (P)
    .byte   %01000000 ; | *      |            $d0d5 (P)
    .byte   %00000001 ; |       *|            $d0d6 (P)
    .byte   %00100000 ; |  *     |            $d0d7 (P)
    .byte   %00000000 ; |        |            $d0d8 (P)
    .byte   %01010000 ; | * *    |            $d0d9 (P)
    .byte   %00000000 ; |        |            $d0da (P)
    .byte   %00100000 ; |  *     |            $d0db (P)
    .byte   %00000000 ; |        |            $d0dc (P)
    .byte   %00000000 ; |        |            $d0dd (P)
    .byte   %00000000 ; |        |            $d0de (P)
    .byte   %00000000 ; |        |            $d0df (P)
    .byte   %00000000 ; |        |            $d0e0 (P)
    .byte   %00000000 ; |        |            $d0e1 (P)
    .byte   %00000000 ; |        |            $d0e2 (P)
    .byte   %00000000 ; |        |            $d0e3 (P)
    .byte   %00000000 ; |        |            $d0e4 (P)
    .byte   %00000000 ; |        |            $d0e5 (P)
    .byte   %00000000 ; |        |            $d0e6 (P)
    .byte   %00000000 ; |        |            $d0e7 (P)
    .byte   %00000000 ; |        |            $d0e8 (P)
    .byte   %00000000 ; |        |            $d0e9 (P)
    .byte   %00000000 ; |        |            $d0ea (P)
    .byte   %00000000 ; |        |            $d0eb (P)
    .byte   %00000000 ; |        |            $d0ec (P)
    .byte   %00000000 ; |        |            $d0ed (P)
    .byte   %00000000 ; |        |            $d0ee (P)
    .byte   %00000000 ; |        |            $d0ef (P)
    .byte   %00000000 ; |        |            $d0f0 (P)
    .byte   %00000000 ; |        |            $d0f1 (P)
    .byte   %00000000 ; |        |            $d0f2 (P)
    .byte   %00000000 ; |        |            $d0f3 (P)
    .byte   %00000000 ; |        |            $d0f4 (P)
    .byte   %00000000 ; |        |            $d0f5 (P)
    .byte   %00000000 ; |        |            $d0f6 (P)
    .byte   %00000000 ; |        |            $d0f7 (P)
    .byte   %00000000 ; |        |            $d0f8 (P)
    .byte   %00000000 ; |        |            $d0f9 (P)
    .byte   %00000000 ; |        |            $d0fa (P)
    .byte   %00000000 ; |        |            $d0fb (P)
    .byte   %00000000 ; |        |            $d0fc (P)
    .byte   %00000000 ; |        |            $d0fd (P)
    .byte   %00000000 ; |        |            $d0fe (P)
    .byte   %00000000 ; |        |            $d0ff (P)
    
Ld100
    cld                             ;2        
    sei                             ;2        
    ldx     #$ff                    ;2        
    txs                             ;2        
    inx                             ;2        
    txa                             ;2   =  12
Ld107
    sta     VSYNC,x                 ;4        
    inx                             ;2        
    bne     Ld107                   ;2/3      
    stx     SWACNT                  ;4        
    ldx     #$d0                    ;2        
    stx     game_mode                  ;3        
    jmp     Ld11b                   ;3   =  20
    
Ld116
    lda     INTIM                   ;4        
    bne     Ld116                   ;2/3 =   6
Ld11b
    lda     #$02                    ;2        
    sta     WSYNC                   ;3   =   5
;---------------------------------------
    sta     VBLANK                  ;3        
    sta     VSYNC                   ;3        
    ldx     #$01                    ;2   =   8
Ld125
    lda     ram_A0,x                ;4        
    beq     Ld165                   ;2/3      
    tay                             ;2        
    lda     Ldbbb,y                 ;4        
    clc                             ;2        
    adc     ram_A2,x                ;4        
    sta     ram_A2,x                ;4        
    bcc     Ld176                   ;2/3      
    lda     Ldb2c,y                 ;4        
    sta     ram_DC                  ;3        
    lda     Ldaff,y                 ;4        
    sta     ram_DD                  ;3        
    lda     Ldb8e,y                 ;4        
    sta     AUDC0,x                 ;4        
    and     #$f0                    ;2        
    sta     ram_DE                  ;3        
    lda     ram_9E,x                ;4        
    beq     Ld169                   ;2/3      
    dec     ram_9E,x                ;6        
    tay                             ;2        
    dey                             ;2        
    lda     (ram_DC),y              ;5        
    beq     Ld15d                   ;2/3      
    sta     AUDF0,x                 ;4        
    lsr                             ;2        
    clc                             ;2        
    adc     ram_DE                  ;3        
    lsr                             ;2        
    lsr                             ;2        
    lsr                             ;2        
    lsr                             ;2   =  93
Ld15d
    sta     AUDV0,x                 ;4   =   4
Ld15f
    dex                             ;2        
    bpl     Ld125                   ;2/3      
    jmp     Ld17d                   ;3   =   7
    
Ld165
    ldy     #$0e                    ;2        
    bne     Ld16b                   ;2/3 =   4
Ld169
    ldy     #$04                    ;2   =   2
Ld16b
    dey                             ;2        
    bne     Ld16b                   ;2/3      
    lda     #$00                    ;2        
    sta     ram_A0,x                ;4        
    sta     ram_9E,x                ;4        
    beq     Ld15d                   ;2/3 =  16
Ld176
    ldy     #$0d                    ;2   =   2
Ld178
    dey                             ;2        
    bne     Ld178                   ;2/3      
    beq     Ld15f                   ;2/3 =   6
Ld17d
    sta     WSYNC                   ;3   =   3
;---------------------------------------
    lda     #$00                    ;2        
    sta     VSYNC                   ;3        
    lda     #$2a                    ;2        
    sta     TIM64T                  ;4        
    inc     maincounter                  ;5        
    bne     Ld18e                   ;2/3      
    inc     maincounter_overflow                  ;5   =  23
Ld18e
    ldx     #$00                    ;2        
    stx     ram_E1                  ;3        
    ldx     #$b1                    ;2        
    stx     ram_E2                  ;3        
    jmp     Ldfea                   ;3   =  13
    
Ld199
    lda     game_state                  ;3        
    cmp     #$02                    ;2        
    bcc     Ld1ae                   ;2/3      
    cmp     #$04                    ;2        
    bcc     Ld1b8                   ;2/3      
    cmp     #$07                    ;2        
    bcc     Ld1ab                   ;2/3      
    cmp     #$09                    ;2        
    bcc     Ld1b8                   ;2/3 =  19
Ld1ab
    jmp     Ld246                   ;3   =   3
    
Ld1ae
    lda     #$04                    ;2        
    sta     ram_8B                  ;3        
    lda     #$00                    ;2        
    sta     ram_8D                  ;3        
    beq     Ld1be                   ;2/3 =  12
Ld1b8
    lda     maincounter                  ;3        
    and     #$03                    ;2        
    bne     Ld22c                   ;2/3!=   7
Ld1be
    dec     ram_8D                  ;5        
    bpl     Ld22f                   ;2/3!     
    lda     ram_8B                  ;3        
    and     #$0f                    ;2        
    tax                             ;2        
    lda     ram_8B                  ;3        
    and     #$f0                    ;2        
    ora     Ld78f,x                 ;4        
    sta     ram_8B                  ;3        
    and     #$70                    ;2        
    lsr                             ;2        
    lsr                             ;2        
    lsr                             ;2        
    lsr                             ;2        
    sta     ram_DC                  ;3        
    lda     map_scene                  ;3        
    asl                             ;2        
    asl                             ;2        
    asl                             ;2        
    ora     ram_DC                  ;3        
    tax                             ;2        
    lda     ram_8B                  ;3        
    and     #$0f                    ;2        
    bne     Ld210                   ;2/3!     
    ora     Ld639,x                 ;4        
    sta     ram_8B                  ;3        
    and     #$70                    ;2        
    lsr                             ;2        
    lsr                             ;2        
    lsr                             ;2        
    lsr                             ;2        
    sta     ram_DC                  ;3        
    lda     map_scene                  ;3        
    asl                             ;2        
    asl                             ;2        
    asl                             ;2        
    ora     ram_DC                  ;3        
    tax                             ;2        
    ldy     Ld699,x                 ;4        
    lda     Ld72b,y                 ;4        
    sta     elevator_x_pos                  ;3        
    lda     Ld6f9,y                 ;4        
    sta     elevator_selector_id                  ;3        
    sta     elevator_y_pos                  ;3        
    lda     #$00                    ;2        
    sta     ram_8C                  ;3        
    beq     Ld22a                   ;2/3 = 122
Ld210
    ldy     Ld699,x                 ;4        
    cmp     #$01                    ;2        
    bne     Ld220                   ;2/3      
    lda     elevator_selector_id                  ;3        
    adc     #$00                    ;2        
    sta     elevator_y_pos                  ;3        
    jmp     Ld228                   ;3   =  19
    
Ld220
    lsr                             ;2        
    bcs     Ld228                   ;2/3      
    lda     Ld75d,y                 ;4        
    bcc     Ld22a                   ;2/3 =  10
Ld228
    lda     #$06                    ;2   =   2
Ld22a
    sta     ram_8D                  ;3   =   3
Ld22c
    jmp     Ld246                   ;3   =   3
    
Ld22f
    lda     ram_8B                  ;3        
    and     #$0f                    ;2        
    beq     Ld246                   ;2/3      
    lsr                             ;2        
    bcs     Ld246                   ;2/3      
    lsr                             ;2        
    lda     elevator_y_pos                  ;3        
    bcc     Ld242                   ;2/3      
    adc     #$00                    ;2        
    jmp     Ld244                   ;3   =  23
    
Ld242
    sbc     #$00                    ;2   =   2
Ld244
    sta     elevator_y_pos                  ;3   =   3
Ld246
    lda     game_state                  ;3        
    cmp     #$04                    ;2        
    bne     Ld24f                   ;2/3      
    jmp     Ld3a5                   ;3   =  10
    
Ld24f
    bcs     Ld258                   ;2/3      
    cmp     #$01                    ;2        
    bcs     Ld266                   ;2/3      
    jmp     Ld116                   ;3   =   9
    
Ld258
    cmp     #$07                    ;2        
    bcc     Ld263                   ;2/3      
    cmp     #$09                    ;2        
    bcs     Ld263                   ;2/3      
    jmp     Ld38e                   ;3   =  11
    
Ld263
    jmp     Ld116                   ;3   =   3
    
Ld266
    lda     ram_96                  ;3        
    bne     Ld29e                   ;2/3      
    lda     player_Y_pos                  ;3        
    lsr                             ;2        
    sta     ram_DC                  ;3        
    lsr                             ;2        
    bcc     Ld29e                   ;2/3      
    lda     player_X_pos                  ;3        
    sbc     #$01                    ;2        
    lsr                             ;2        
    lsr                             ;2        
    tax                             ;2        
    lda     Ld7f9,x                 ;4        
    clc                             ;2        
    adc     ram_DC                  ;3        
    tay                             ;2        
    lda     Ld819,x                 ;4        
    and     $9083,y                 ;4        
    bne     Ld2a1                   ;2/3      
    lda     player_X_pos                  ;3        
    adc     #$02                    ;2        
    lsr                             ;2        
    lsr                             ;2        
    tax                             ;2        
    lda     Ld7f9,x                 ;4        
    clc                             ;2        
    adc     ram_DC                  ;3        
    tay                             ;2        
    lda     Ld819,x                 ;4        
    and     $9083,y                 ;4        
    bne     Ld2a1                   ;2/3 =  81
Ld29e
    jmp     Ld2fd                   ;3   =   3
    
Ld2a1
    eor     #$ff                    ;2        
    and     $9083,y                 ;4        
    sta     $9003,y                 ;5        
    lda     gems_collected                  ;3        
    sed                             ;2        
    clc                             ;2        
    adc     #$01                    ;2        
    cld                             ;2        
    sta     gems_collected                  ;3        
    cmp     #$99                    ;2        
    bcc     Ld2b8                   ;2/3      
    
    .byte   $a9,$99                         ; $d2b6 (*)    if gems > 99 reset to 99
    
Ld2b8
    jsr     Ld3b0                   ;6       jump to scoring routine 
    lda     game_mode                  ;3        
    bmi     Ld2e5                   ;2/3      this checks if an integer is negative, which means upper 4bits is >=9  tricky way to detect gameover state, if it is 9 it will go to the scoring routines
    lda     ram_A0                  ;3        
    beq     Ld2c7                   ;2/3      
    cmp     #$2d                    ;2        
    bcc     Ld2e5                   ;2/3 =  49
Ld2c7
    lda     #$0d                    ;2        
    sta     AUDC0                   ;3        
    sta     ram_A2                  ;3        
    lda     #$00                    ;2        
    sta     ram_9E                  ;3        
    lda     ram_DC                  ;3        
    lsr                             ;2        
    and     #$1f                    ;2        
    tax                             ;2        
    ldy     Ldf6e,x                 ;4        
    sty     AUDF0                   ;3        
    clc                             ;2        
    adc     #$35                    ;2        
    sta     ram_A0                  ;3        
    lda     #$09                    ;2        
    sta     AUDV0                   ;3   =  41
Ld2e5
    dec     gems_remaining                  ;5        
    bne     Ld2fd                   ;2/3      
    lda     #$07                    ;2        
    sta     game_state                  ;3        
    ldx     castle_level                  ;3        
    lda     Ld7b9,x                 ;4        
    clc                             ;2        
    jsr     Ld3bc                   ;6        
    lda     #$00                    ;2        
    sta     ram_CC                  ;3        
    jmp     Ld38e                   ;3   =  35
    
Ld2fd
    lda     game_state                  ;3        
    cmp     #$03                    ;2        
    beq     Ld306                   ;2/3      
    jmp     Ld38e                   ;3   =  10
    
Ld306
    lda     maincounter                  ;3        
    and     #$03                    ;2        
    tay                             ;2        
    ldx     Ld399,y                 ;4   =  11
Ld30e
    stx     ram_DC                  ;3        
    ldy     ram_BC,x                ;4        
    lda     Ld794,y                 ;4        
    and     #$01                    ;2        
    beq     Ld379                   ;2/3      
    lda     player_Y_pos,x                ;4        
    bmi     Ld379                   ;2/3      
    sta     ram_DD                  ;3        
    lsr                             ;2        
    bcc     Ld379                   ;2/3      
    lda     player_X_pos,x                ;4        
    lsr                             ;2        
    lsr                             ;2        
    tax                             ;2        
    lda     Ld7f9,x                 ;4        
    clc                             ;2        
    adc     ram_DD                  ;3        
    tay                             ;2        
    lda     Ld819,x                 ;4        
    and     $9083,y                 ;4        
    beq     Ld379                   ;2/3      
    eor     #$ff                    ;2        
    and     $9083,y                 ;4        
    sta     $9003,y                 ;5        
    dec     gems_remaining                  ;5        
    ldx     ram_DC                  ;3        
    lda     ram_BC,x                ;4        
    cmp     #$04                    ;2        
    bcs     Ld350                   ;2/3      
    
    .byte   $a9,$05,$95,$bc,$a9,$00,$95,$cc ; $d348 (*)
    
Ld350
    lda     game_mode                  ;3        
    bmi     Ld379                   ;2/3      
    lda     ram_A0                  ;3        
    beq     Ld35c                   ;2/3      
    cmp     #$2d                    ;2        
    bcc     Ld379                   ;2/3 = 100
Ld35c
    lda     #$0d                    ;2        
    sta     AUDC0                   ;3        
    sta     ram_A2                  ;3        
    lda     #$00                    ;2        
    sta     ram_9E                  ;3        
    lda     gems_remaining                  ;3        
    and     #$07                    ;2        
    tax                             ;2        
    clc                             ;2        
    adc     #$2d                    ;2        
    sta     ram_A0                  ;3        
    lda     Ldf5e,x                 ;4        
    sta     AUDF0                   ;3        
    lda     #$05                    ;2        
    sta     AUDV0                   ;3   =  39
Ld379
    ldy     ram_DC                  ;3        
    ldx     Ld39d,y                 ;4        
    bne     Ld30e                   ;2/3      
    lda     gems_remaining                  ;3        
    bne     Ld38e                   ;2/3      
    
    .byte   $a9,$08,$85,$90,$a5,$96,$d0,$02 ; $d384 (*)
    .byte   $85,$cc                         ; $d38c (*)
    
Ld38e
    ldx     #$00                    ;2        
    stx     ram_E1                  ;3        
    ldx     #$f1                    ;2        
    stx     ram_E2                  ;3        
    jmp     Ldfe4                   ;3   =  27
    
Ld399
    .byte   $04,$01,$02,$06                 ; $d399 (D)
Ld39d
    .byte   $00                             ; $d39d (*)
    .byte   $00,$01,$00,$03,$00,$05         ; $d39e (D)
    .byte   $00                             ; $d3a4 (*)
    
Ld3a5
    dec     ram_91                  ;5        
    bne     Ld3ad                   ;2/3      
    lda     #$05                    ;2        
    sta     game_state                  ;3   =  12
Ld3ad
    jmp     Ld116                   ;3   =   3
    
Ld3b0
    ldy     game_mode                  ;3        
    bmi     Ld3e7                   ;2/3      
    sed                             ;2        
    clc                             ;2        
    adc     score_0000XX                  ;3        
    sta     score_0000XX                  ;3        
    lda     #$00                    ;2   =  17
Ld3bc
    sed                             ;2        
    ldy     game_mode                  ;3        
    bmi     Ld3e7                   ;2/3      
    adc     score_00XX00                  ;3        
    sta     score_00XX00                  ;3        
    bcc     Ld3e7                   ;2/3      
    
    .byte   $a5,$86,$4a,$90,$14,$e6,$95,$10 ; $d3c7 (*)
    .byte   $02,$c6,$95,$a0,$0e,$a2,$00,$20 ; $d3cf (*)
    .byte   $e9,$d3,$a0,$0f,$a2,$01,$20,$e9 ; $d3d7 (*)
    .byte   $d3,$18,$a9,$01,$65,$86,$85,$86 ; $d3df (*)
    
Ld3e7
    cld                             ;2        
    rts                             ;6   =  23
    
    .byte   $a5,$80,$30,$16,$b5,$a0,$f0,$05 ; $d3e9 (*)
    .byte   $98,$d5,$a0,$b0,$0d,$94,$a0,$b9 ; $d3f1 (*)
    .byte   $59,$db,$95,$9e,$a9,$c0,$95,$19 ; $d3f9 (*)
    .byte   $95,$a2,$60                     ; $d401 (*)
    
Ld404
    tya                             ;2        
    sta     WSYNC                   ;3   =   5
;---------------------------------------
    sta     HMOVE                   ;3        
    beq     Ld418                   ;2/3      
    lda     #$00                    ;2        
    sta     PF1                     ;3        
    sta     PF2                     ;3   =  13
Ld411
    sta     WSYNC                   ;3   =   3
;---------------------------------------
    sta     WSYNC                   ;3   =   3
;---------------------------------------
    dey                             ;2        
    bne     Ld411                   ;2/3 =   4
Ld418
    ldx     map_scene                  ;3        
    ldy     #$04                    ;2        
    lda     game_state                  ;3        
    bne     Ld42c                   ;2/3      
    cpy     ram_91                  ;3        
    bcs     Ld42c                   ;2/3      
    lda     #$00                    ;2        
    sta     PF1                     ;3        
    sta     PF2                     ;3        
    beq     Ld436                   ;2/3 =  25
Ld42c
    lda     Ld839,x                 ;4        
    sta     PF1                     ;3        
    lda     Ld845,x                 ;4        
    sta     PF2                     ;3   =  14
Ld436
    ldy     #$02                    ;2        
    ldx     #$0a                    ;2        
    jsr     Ld61a                   ;6        
    sta     WSYNC                   ;3   =  13
;---------------------------------------
    ldx     map_scene                  ;3        
    ldy     #$03                    ;2        
    lda     game_state                  ;3        
    bne     Ld453                   ;2/3      
    cpy     ram_91                  ;3        
    bcs     Ld453                   ;2/3      
    lda     #$00                    ;2        
    sta     PF1                     ;3        
    sta     PF2                     ;3        
    beq     Ld45d                   ;2/3 =  25
Ld453
    lda     Ld851,x                 ;4        
    sta     PF1                     ;3        
    lda     Ld85d,x                 ;4        
    sta     PF2                     ;3   =  14
Ld45d
    ldy     #$01                    ;2        
    ldx     #$06                    ;2        
    jsr     Ld61a                   ;6        
    sta     WSYNC                   ;3   =  13
;---------------------------------------
    ldx     map_scene                  ;3        
    ldy     #$02                    ;2        
    lda     game_state                  ;3        
    bne     Ld47a                   ;2/3      
    cpy     ram_91                  ;3        
    bcs     Ld47a                   ;2/3      
    lda     #$00                    ;2        
    sta     PF1                     ;3        
    sta     PF2                     ;3        
    beq     Ld484                   ;2/3 =  25
Ld47a
    lda     Ld869,x                 ;4        
    sta     PF1                     ;3        
    lda     Ld875,x                 ;4        
    sta     PF2                     ;3   =  14
Ld484
    ldy     #$00                    ;2        
    ldx     #$02                    ;2        
    jsr     Ld61a                   ;6        
    sta     WSYNC                   ;3   =  13
;---------------------------------------
    ldx     map_scene                  ;3        
    ldy     #$00                    ;2        
    lda     game_state                  ;3        
    bne     Ld4a1                   ;2/3      
    cpy     ram_91                  ;3        
    bcs     Ld4a1                   ;2/3      
    lda     #$00                    ;2        
    sta     PF1                     ;3        
    sta     PF2                     ;3        
    beq     Ld4ab                   ;2/3 =  25
Ld4a1
    lda     Ld881,x                 ;4        
    sta     PF1                     ;3        
    lda     Ld88d,x                 ;4        
    sta     PF2                     ;3   =  14
Ld4ab
    lda     #$d9                    ;2        
    sta     ram_E6                  ;3        
    sta     ram_E8                  ;3        
    sta     ram_EA                  ;3        
    sta     ram_EC                  ;3        
    sta     ram_EE                  ;3        
    sta     ram_F0                  ;3        
    lda     #$0c                    ;2        
    ldy     #$3f                    ;2        
    sta     WSYNC                   ;3   =  27
;---------------------------------------
    cmp     ram_E5                  ;3        
    bne     Ld4dd                   ;2/3      
    sty     ram_E5                  ;3        
    cmp     ram_E7                  ;3        
    bne     Ld4dd                   ;2/3      
    sty     ram_E7                  ;3        
    cmp     ram_E9                  ;3        
    bne     Ld4dd                   ;2/3      
    sty     ram_E9                  ;3        
    cmp     ram_EB                  ;3        
    bne     Ld4dd                   ;2/3      
    sty     ram_EB                  ;3        
    cmp     ram_ED                  ;3        
    bne     Ld4dd                   ;2/3      
    sty     ram_ED                  ;3   =  40
Ld4dd
    lda     game_mode                  ;3        
    bmi     Ld4f3                   ;2/3      
    lda     button_register                  ;3        
    and     #$3f                    ;2        
    bit     button_register                  ;3        
    bpl     Ld4eb                   ;2/3      
    ora     #$40                    ;2   =  17
Ld4eb
    bit     INPT4|$30               ;3        
    bmi     Ld4f1                   ;2/3      
    ora     #$80                    ;2   =   7
Ld4f1
    sta     button_register                  ;3   =   3
Ld4f3
    sta     WSYNC                   ;3   =   3
;---------------------------------------
    lda     #$00                    ;2        
    sta     PF1                     ;3        
    sta     PF2                     ;3        
    lda     game_state                  ;3        
    cmp     #$03                    ;2        
    bne     Ld50d                   ;2/3      
    lda     obj_1_id                  ;3        
    cmp     #$16                    ;2        
    bne     Ld50d                   ;2/3      
    
    .byte   $a5,$ba,$e5,$ca,$85,$ba         ; $d507 (*)
    
Ld50d
    ldy     #$06                    ;2        
    lda     #$4a                    ;2        
    jsr     Ld5e3                   ;6        
    lda     #$47                    ;2        
    ldy     #$3f                    ;2        
    ldx     player_lives                  ;3        
    sty     ram_E5                  ;3        
    cpx     #$02                    ;2        
    bcc     Ld522                   ;2/3      
    sta     ram_E5                  ;3   =  49
Ld522
    sty     ram_E7                  ;3        
    cpx     #$03                    ;2        
    bcc     Ld52a                   ;2/3      
    sta     ram_E7                  ;3   =  10
Ld52a
    sty     ram_E9                  ;3        
    cpx     #$04                    ;2        
    bcc     Ld532                   ;2/3      
    sta     ram_E9                  ;3   =  10
Ld532
    sta     WSYNC                   ;3   =   3
;---------------------------------------
    sty     ram_EB                  ;3        
    cpx     #$05                    ;2        
    bcc     Ld53c                   ;2/3      
    sta     ram_EB                  ;3   =  10
Ld53c
    sty     ram_ED                  ;3        
    cpx     #$06                    ;2        
    bcc     Ld544                   ;2/3      
    
    .byte   $85,$ed                         ; $d542 (*)
    
Ld544
    sty     ram_EF                  ;3        
    cpx     #$07                    ;2        
    bcc     Ld54c                   ;2/3      
    
    .byte   $85,$ef                         ; $d54a (*)
    
Ld54c
    lda     #$26                    ;2        
    ldy     #$04                    ;2        
    jsr     Ld5e3                   ;6        
    lda     #$2e                    ;2        
    sta     TIM64T                  ;4        
    lda     game_mode                  ;3        
    and     #$10                    ;2        
    bne     Ld561                   ;2/3      
    jmp     Ld199                   ;3   =  40
    
Ld561
    jmp     Ld116                   ;3   =   3
    
    lda     #$82                    ;2        
    sta     COLUBK                  ;3        
    ldx     #$00                    ;2        
    stx     WSYNC                   ;3   =  10
;---------------------------------------
    stx     VBLANK                  ;3        
    ldx     #$0b                    ;2   =   5
Ld570
    lda     Ld94c,x                 ;4        
    sta     ram_E5,x                ;4        
    dex                             ;2        
    bpl     Ld570                   ;2/3      
    ldx     #$26                    ;2        
    jsr     Ld5dd                   ;6        
    lda     #$5e                    ;2        
    ldy     #$32                    ;2        
    jsr     Ld5e3                   ;6        
    ldx     #$0b                    ;2   =  32
Ld586
    lda     Ld958,x                 ;4        
    sta     ram_E5,x                ;4        
    dex                             ;2        
    bpl     Ld586                   ;2/3      
    ldx     #$26                    ;2        
    jsr     Ld5dd                   ;6        
    lda     #$de                    ;2        
    ldy     #$06                    ;2        
    jsr     Ld5e3                   ;6        
    ldx     #$0b                    ;2   =  32
Ld59c
    lda     Ld964,x                 ;4        
    sta     ram_E5,x                ;4        
    dex                             ;2        
    bpl     Ld59c                   ;2/3      
    lda     game_mode                  ;3        
    and     #$07                    ;2        
    tax                             ;2        
    lda     Ld971,x                 ;4        
    sta     ram_EF                  ;3        
    ldx     #$09                    ;2        
    jsr     Ld5dd                   ;6        
    lda     #$7e                    ;2        
    ldy     #$06                    ;2        
    jsr     Ld5e3                   ;6        
    ldx     #$04                    ;2        
    jsr     Ld5dd                   ;6        
    ldy     #$02                    ;2        
    ldx     #$0a                    ;2        
    jsr     Ld61a                   ;6        
    sta     WSYNC                   ;3   =  65
;---------------------------------------
    ldy     #$01                    ;2        
    ldx     #$06                    ;2        
    jsr     Ld61a                   ;6        
    sta     WSYNC                   ;3   =  13
;---------------------------------------
    ldy     #$00                    ;2        
    ldx     #$02                    ;2        
    jsr     Ld61a                   ;6        
    sta     WSYNC                   ;3   =  13
;---------------------------------------
    jmp     Ld4ab                   ;3   =   3
    
Ld5dd
    sta     WSYNC                   ;3   =   3
;---------------------------------------
    dex                             ;2        
    bne     Ld5dd                   ;2/3      
    rts                             ;6   =  10
    
Ld5e3
    sta     COLUP0                  ;3        
    sta     COLUP1                  ;3        
    sty     ram_DC                  ;3   =   9
Ld5e9
    ldy     ram_DC                  ;3        
    lda     (ram_E5),y              ;5        
    sta     GRP0                    ;3        
    sta     WSYNC                   ;3   =  14
;---------------------------------------
    lda     (ram_E7),y              ;5        
    sta     GRP1                    ;3        
    lda     (ram_E9),y              ;5        
    sta     GRP0                    ;3        
    lda     (ram_EB),y              ;5        
    sta     ram_DD                  ;3        
    lda     (ram_ED),y              ;5        
    tax                             ;2        
    lda     (ram_EF),y              ;5        
    tay                             ;2        
    lda     ram_DD                  ;3        
    sta     GRP1                    ;3        
    stx     GRP0                    ;3        
    sty     GRP1                    ;3        
    sta     GRP0                    ;3        
    dec     ram_DC                  ;5        
    bpl     Ld5e9                   ;2/3!     
    ldy     #$00                    ;2        
    sty     GRP0                    ;3        
    sty     GRP1                    ;3        
    sty     GRP0                    ;3        
    rts                             ;6   =  77
    
Ld61a
    sty     ram_DC                  ;3        
    lda.wy  score_XX0000,y                ;4        
    and     #$0f                    ;2        
    tay                             ;2        
    lda     Ld970,y                 ;4        
    sta     ram_E5,x                ;4        
    dex                             ;2        
    dex                             ;2        
    ldy     ram_DC                  ;3        
    lda.wy  score_XX0000,y                ;4        
    lsr                             ;2        
    lsr                             ;2        
    lsr                             ;2        
    lsr                             ;2        
    tay                             ;2        
    lda     Ld970,y                 ;4        
    sta     ram_E5,x                ;4        
    rts                             ;6   =  54
    
Ld639
    .byte   $10,$20,$30,$40,$50,$60,$70,$00 ; $d639 (*)
    .byte   $00,$00,$00,$00,$00,$00,$00,$00 ; $d641 (*)
    .byte   $00,$00,$00,$00,$00,$00,$00,$00 ; $d649 (*)
    .byte   $10,$20,$30,$00,$00,$00,$00,$00 ; $d651 (*)
    .byte   $00                             ; $d659 (D)
    .byte   $00,$00,$00,$00,$00,$00,$00     ; $d65a (*)
    .byte   $00                             ; $d661 (D)
    .byte   $00,$00,$00,$00,$00,$00,$00,$10 ; $d662 (*)
    .byte   $00,$00,$00,$00,$00,$00,$00,$10 ; $d66a (*)
    .byte   $20,$30,$00,$00,$00,$00,$00,$10 ; $d672 (*)
    .byte   $20,$30,$00,$00,$00,$00,$00,$10 ; $d67a (*)
    .byte   $20,$00,$00,$00,$00,$00,$00,$10 ; $d682 (*)
    .byte   $00,$00,$00,$00,$00,$00,$00,$10 ; $d68a (*)
    .byte   $20,$30,$40,$50,$00,$00,$00     ; $d692 (*)
Ld699
    .byte   $02,$00,$03,$04,$03,$02,$00,$01 ; $d699 (*)
    .byte   $10,$00,$00,$00,$00,$00,$00,$00 ; $d6a1 (*)
    .byte   $05,$00,$00,$00,$00,$00,$00,$00 ; $d6a9 (*)
    .byte   $11,$12,$14,$13,$00,$00,$00,$00 ; $d6b1 (*)
    .byte   $10                             ; $d6b9 (D)
    .byte   $00,$00,$00,$00,$00,$00,$00     ; $d6ba (*)
    .byte   $06                             ; $d6c1 (D)
    .byte   $00,$00,$00,$00,$00,$00,$00,$07 ; $d6c2 (*)
    .byte   $08,$00,$00,$00,$00,$00,$00,$09 ; $d6ca (*)
    .byte   $0a,$09,$0b,$00,$00,$00,$00,$0f ; $d6d2 (*)
    .byte   $0e,$0c,$0d,$00,$00,$00,$00,$15 ; $d6da (*)
    .byte   $16,$17,$00,$00,$00,$00,$00,$18 ; $d6e2 (*)
    .byte   $00,$00,$00,$00,$00,$00,$00,$1b ; $d6ea (*)
    .byte   $1d,$1c,$1b,$19,$1a,$00,$00     ; $d6f2 (*)
Ld6f9
    .byte   $2a,$15,$2d,$2d,$15,$09         ; $d6f9 (*)
    .byte   $1c                             ; $d6ff (D)
    .byte   $2e,$1d,$1b,$1e,$1e,$2f,$1a,$1e ; $d700 (*)
    .byte   $1e                             ; $d708 (*)
    .byte   $1c                             ; $d709 (D)
    .byte   $1c,$20,$20,$1c,$07,$10,$07,$10 ; $d70a (*)
    .byte   $10,$19,$08,$19,$10,$2a,$15,$2d ; $d712 (*)
    .byte   $2d,$15,$2a,$15,$2d,$2d,$15,$2a ; $d71a (*)
    .byte   $15,$2d,$2d,$15,$2a,$15,$2d,$2d ; $d722 (*)
    .byte   $15                             ; $d72a (*)
Ld72b
    .byte   $42,$34,$34,$50,$50,$42         ; $d72b (*)
    .byte   $42                             ; $d731 (D)
    .byte   $42,$42,$42,$14,$70,$42,$42,$14 ; $d732 (*)
    .byte   $70                             ; $d73a (*)
    .byte   $7c                             ; $d73b (D)
    .byte   $14,$34,$50,$70,$1c,$42,$68,$42 ; $d73c (*)
    .byte   $1c,$14,$42,$70,$68,$42,$34,$34 ; $d744 (*)
    .byte   $50,$50,$42,$34,$34,$50,$50,$42 ; $d74c (*)
    .byte   $34,$34,$50,$50,$42,$34,$34,$50 ; $d754 (*)
    .byte   $50                             ; $d75c (*)
Ld75d
    .byte   $0a,$06,$0a,$0a,$06,$08         ; $d75d (*)
    .byte   $06                             ; $d763 (D)
    .byte   $04,$04,$04,$16,$16,$06,$04,$0e ; $d764 (*)
    .byte   $0e                             ; $d76c (*)
    .byte   $01                             ; $d76d (D)
    .byte   $16,$16,$16,$16,$12,$10,$12,$06 ; $d76e (*)
    .byte   $06,$0e,$06,$0e,$06,$0a,$06,$0a ; $d776 (*)
    .byte   $0a,$06,$0a,$06,$0a,$0a,$06,$0a ; $d77e (*)
    .byte   $06,$0a,$0a,$06,$0a,$06,$0a,$0a ; $d786 (*)
    .byte   $06                             ; $d78e (*)
Ld78f
    .byte   $01,$02,$03,$04,$00             ; $d78f (D)
Ld794
    .byte   $13,$13,$13,$13                 ; $d794 (D)
    .byte   $12,$20,$20,$20,$20,$02,$02,$02 ; $d798 (*)
    .byte   $0a,$0a,$0a,$0a,$02,$02         ; $d7a0 (*)
    .byte   $03,$03,$03,$03                 ; $d7a6 (D)
    .byte   $04,$00                         ; $d7aa (*)
    .byte   $04,$13,$13,$13                 ; $d7ac (D)
    .byte   $03,$03,$02,$02,$02,$02,$00,$00 ; $d7b0 (*)
    .byte   $00                             ; $d7b8 (*)
Ld7b9
    .byte   $10                             ; $d7b9 (D)
    .byte   $11,$12,$13,$14,$15,$16,$17,$18 ; $d7ba (*)
    .byte   $19,$20,$21,$22,$23,$24,$25,$26 ; $d7c2 (*)
    .byte   $27,$28,$29,$30,$31,$32,$33,$34 ; $d7ca (*)
    .byte   $35,$36,$37,$38,$39,$40,$41,$42 ; $d7d2 (*)
    .byte   $43,$44,$45,$46,$47,$48,$49,$50 ; $d7da (*)
    .byte   $51,$52,$53,$54,$55,$56,$57,$58 ; $d7e2 (*)
    .byte   $59,$60,$61,$62,$63,$64,$65,$66 ; $d7ea (*)
    .byte   $67,$68,$69,$70,$71,$72,$73     ; $d7f2 (*)
Ld7f9
    .byte   $00                             ; $d7f9 (*)
    .byte   $00,$00,$00,$00,$00,$00,$00,$3e ; $d7fa (D)
    .byte   $3e,$3e,$3e,$3e,$3e,$3e,$3e,$3f ; $d802 (D)
    .byte   $3f,$3f,$3f,$3f,$3f,$3f,$3f,$01 ; $d80a (D)
    .byte   $01,$01,$01,$01,$01,$01         ; $d812 (D)
    .byte   $01                             ; $d818 (*)
Ld819
    .byte   $80                             ; $d819 (*)
    .byte   $40,$20,$10,$08,$04,$02,$01,$01 ; $d81a (D)
    .byte   $02,$04,$08,$10,$20,$40,$80,$80 ; $d822 (D)
    .byte   $40,$20,$10,$08,$04,$02,$01,$01 ; $d82a (D)
    .byte   $02,$04,$08,$10,$20,$40         ; $d832 (D)
    .byte   $80                             ; $d838 (*)
Ld839
    .byte   $00,$00,$00,$00                 ; $d839 (*)
    
    .byte   %00000000 ; |        |            $d83d (P)
    .byte   %00000000 ; |        |            $d83e (P)
    
    .byte   $00,$00,$00,$1f,$00,$00         ; $d83f (*)
Ld845
    .byte   $e0,$3e,$c0,$f0                 ; $d845 (*)
    
    .byte   %11110000 ; |****    |            $d849 (P)
    .byte   %10000000 ; |*       |            $d84a (P)
    
    .byte   $80,$f0,$f0,$03,$c0,$f0         ; $d84b (*)
Ld851
    .byte   $00,$00,$00,$00                 ; $d851 (*)
    
    .byte   %00000000 ; |        |            $d855 (P)
    .byte   %00000000 ; |        |            $d856 (P)
    
    .byte   $00,$00,$00,$0f,$00,$00         ; $d857 (*)
Ld85d
    .byte   $c0,$1c,$80,$e0                 ; $d85d (*)
    
    .byte   %11100000 ; |***     |            $d861 (P)
    .byte   %00000000 ; |        |            $d862 (P)
    
    .byte   $00,$e0,$e0,$01,$80,$e0         ; $d863 (*)
Ld869
    .byte   $00,$00,$00,$00                 ; $d869 (*)
    
    .byte   %00000000 ; |        |            $d86d (P)
    .byte   %00000000 ; |        |            $d86e (P)
    
    .byte   $00,$00,$00,$07,$00,$00         ; $d86f (*)
Ld875
    .byte   $80,$08,$00,$c0                 ; $d875 (*)
    
    .byte   %11000000 ; |**      |            $d879 (P)
    .byte   %00000000 ; |        |            $d87a (P)
    
    .byte   $00,$c0,$c0,$00,$00,$c0         ; $d87b (*)
Ld881
    .byte   $00,$00,$00,$00                 ; $d881 (*)
    
    .byte   %00000000 ; |        |            $d885 (P)
    .byte   %00000000 ; |        |            $d886 (P)
    
    .byte   $00,$00,$00,$02,$00,$00         ; $d887 (*)
Ld88d
    .byte   $00,$00,$00,$80                 ; $d88d (*)
    
    .byte   %10000000 ; |*       |            $d891 (P)
    .byte   %00000000 ; |        |            $d892 (P)
    
    .byte   $00,$80,$80,$00,$00,$80,$00,$00 ; $d893 (*)
    .byte   $00,$00,$00,$00,$00,$00,$00,$00 ; $d89b (*)
    .byte   $00,$00,$00,$00,$00,$00,$00,$00 ; $d8a3 (*)
    .byte   $00,$00,$00,$00,$00,$00,$00,$00 ; $d8ab (*)
    .byte   $00,$00,$00,$00,$00,$00,$00,$00 ; $d8b3 (*)
    .byte   $00,$00,$00,$00,$00,$00,$00,$00 ; $d8bb (*)
    .byte   $00,$00,$00,$00,$00,$00,$00,$00 ; $d8c3 (*)
    .byte   $00,$00,$00,$00,$00,$00,$00,$00 ; $d8cb (*)
    .byte   $00,$00,$00,$00,$00,$00,$00,$00 ; $d8d3 (*)
    .byte   $00,$00,$00,$00,$00,$00,$00,$00 ; $d8db (*)
    .byte   $00,$00,$00,$00,$00,$00,$00,$00 ; $d8e3 (*)
    .byte   $00,$00,$00,$00,$00,$00,$00,$00 ; $d8eb (*)
    .byte   $00,$00,$00,$00,$00,$00,$00,$00 ; $d8f3 (*)
    .byte   $00,$00,$00,$00,$00             ; $d8fb (*)
    
    .byte   %00011000 ; |   ##   |            $d900 (G)
    .byte   %00011000 ; |   ##   |            $d901 (G)
    .byte   %00011000 ; |   ##   |            $d902 (G)
    .byte   %00001100 ; |    ##  |            $d903 (G)
    .byte   %00000110 ; |     ## |            $d904 (G)
    .byte   %00110110 ; |  ## ## |            $d905 (G)
    .byte   %00111110 ; |  ##### |            $d906 (G)
    .byte   %00111000 ; |  ###   |            $d907 (G)
    .byte   %00011100 ; |   ###  |            $d908 (G)
    .byte   %00001110 ; |    ### |            $d909 (G)
    .byte   %00110110 ; |  ## ## |            $d90a (G)
    .byte   %00110110 ; |  ## ## |            $d90b (G)
    .byte   %00011100 ; |   ###  |            $d90c (G)
    .byte   %00110110 ; |  ## ## |            $d90d (G)
    .byte   %00110110 ; |  ## ## |            $d90e (G)
    .byte   %00110110 ; |  ## ## |            $d90f (G)
    .byte   %00110110 ; |  ## ## |            $d910 (G)
    .byte   %00110110 ; |  ## ## |            $d911 (G)
    .byte   %00011100 ; |   ###  |            $d912 (G)
    .byte   %00110110 ; |  ## ## |            $d913 (G)
    .byte   %00110110 ; |  ## ## |            $d914 (G)
    .byte   %00001100 ; |    ##  |            $d915 (G)
    .byte   %00000110 ; |     ## |            $d916 (G)
    .byte   %00110110 ; |  ## ## |            $d917 (G)
    .byte   %00011100 ; |   ###  |            $d918 (G)
    .byte   %00110110 ; |  ## ## |            $d919 (G)
    .byte   %00110110 ; |  ## ## |            $d91a (G)
    .byte   %00111100 ; |  ####  |            $d91b (G)
    .byte   %00110000 ; |  ##    |            $d91c (G)
    .byte   %00110110 ; |  ## ## |            $d91d (G)
    .byte   %00011100 ; |   ###  |            $d91e (G)
    .byte   %00110110 ; |  ## ## |            $d91f (G)
    .byte   %00110110 ; |  ## ## |            $d920 (G)
    .byte   %00011100 ; |   ###  |            $d921 (G)
    .byte   %00110110 ; |  ## ## |            $d922 (G)
    .byte   %00110110 ; |  ## ## |            $d923 (G)
    .byte   %00011100 ; |   ###  |            $d924 (G)
    .byte   %00110110 ; |  ## ## |            $d925 (G)
    .byte   %00000110 ; |     ## |            $d926 (G)
    .byte   %00011110 ; |   #### |            $d927 (G)
    .byte   %00110110 ; |  ## ## |            $d928 (G)
    .byte   %00110110 ; |  ## ## |            $d929 (G)
    .byte   %00011100 ; |   ###  |            $d92a (G)
    .byte   %00110110 ; |  ## ## |            $d92b (G)
    .byte   %00000110 ; |     ## |            $d92c (G)
    .byte   %00000110 ; |     ## |            $d92d (G)
    .byte   %00111100 ; |  ####  |            $d92e (G)
    .byte   %00110000 ; |  ##    |            $d92f (G)
    .byte   %00111110 ; |  ##### |            $d930 (G)
    .byte   %00001100 ; |    ##  |            $d931 (G)
    .byte   %00001100 ; |    ##  |            $d932 (G)
    .byte   %00001100 ; |    ##  |            $d933 (G)
    .byte   %00001100 ; |    ##  |            $d934 (G)
    .byte   %00011100 ; |   ###  |            $d935 (G)
    .byte   %00011100 ; |   ###  |            $d936 (G)
    .byte   %00001100 ; |    ##  |            $d937 (G)
    .byte   %00000110 ; |     ## |            $d938 (G)
    .byte   %00000110 ; |     ## |            $d939 (G)
    .byte   %00111110 ; |  ##### |            $d93a (G)
    .byte   %00110110 ; |  ## ## |            $d93b (G)
    .byte   %00011110 ; |   #### |            $d93c (G)
    .byte   %00001110 ; |    ### |            $d93d (G)
    .byte   %00000110 ; |     ## |            $d93e (G)
    .byte   %00000000 ; |        |            $d93f (G)
    .byte   %00000000 ; |        |            $d940 (G)
    .byte   %00000000 ; |        |            $d941 (G)
    .byte   %00000000 ; |        |            $d942 (G)
    .byte   %00000000 ; |        |            $d943 (G)
    .byte   %00000000 ; |        |            $d944 (G)
    .byte   %00000000 ; |        |            $d945 (G)
    
    .byte   $00                             ; $d946 (*)
    
    .byte   %00111000 ; |  ###   |            $d947 (G)
    .byte   %01111100 ; | #####  |            $d948 (G)
    .byte   %01010100 ; | # # #  |            $d949 (G)
    .byte   %11111110 ; |####### |            $d94a (G)
    .byte   %11000110 ; |##   ## |            $d94b (G)
    
Ld94c
    .byte   $b9,$d9,$00,$da,$33,$da,$66,$da ; $d94c (D)
    .byte   $99,$da,$cc,$da                 ; $d954 (D)
Ld958
    .byte   $7a,$d9,$81,$d9,$88,$d9,$8f,$d9 ; $d958 (D)
    .byte   $96,$d9,$9d,$d9                 ; $d960 (D)
Ld964
    .byte   $a4,$d9,$ab,$d9,$b2,$d9,$3f,$d9 ; $d964 (D)
    .byte   $3f,$d9,$3f,$d9                 ; $d96c (D)
Ld970
    .byte   $0c                             ; $d970 (D)
Ld971
    .byte   $31,$06,$12,$38,$2a,$18,$00,$1e ; $d971 (D)
    .byte   $24                             ; $d979 (D)
    
    .byte   %01110001 ; | ###   #|            $d97a (G)
    .byte   %10001001 ; |#   #  #|            $d97b (G)
    .byte   %10101001 ; |# # #  #|            $d97c (G)
    .byte   %10110001 ; |# ##   #|            $d97d (G)
    .byte   %10101001 ; |# # #  #|            $d97e (G)
    .byte   %10001011 ; |#   # ##|            $d97f (G)
    .byte   %01110001 ; | ###   #|            $d980 (G)
    .byte   %00100010 ; |  #   # |            $d981 (G)
    .byte   %01010101 ; | # # # #|            $d982 (G)
    .byte   %00010101 ; |   # # #|            $d983 (G)
    .byte   %00110010 ; |  ##  # |            $d984 (G)
    .byte   %01010101 ; | # # # #|            $d985 (G)
    .byte   %01010101 ; | # # # #|            $d986 (G)
    .byte   %00100010 ; |  #   # |            $d987 (G)
    .byte   %00010011 ; |   #  ##|            $d988 (G)
    .byte   %00010011 ; |   #  ##|            $d989 (G)
    .byte   %00010011 ; |   #  ##|            $d98a (G)
    .byte   %01110011 ; | ###  ##|            $d98b (G)
    .byte   %01010011 ; | # #  ##|            $d98c (G)
    .byte   %01010011 ; | # #  ##|            $d98d (G)
    .byte   %00010001 ; |   #   #|            $d98e (G)
    
    .byte   $59,$d9,$59,$59,$59,$59,$bc     ; $d98f (D)
    
    .byte   %10101101 ; |# # ## #|            $d996 (G)
    .byte   %11101101 ; |### ## #|            $d997 (G)
    .byte   %10101110 ; |# # ### |            $d998 (G)
    .byte   %10101101 ; |# # ## #|            $d999 (G)
    .byte   %10101101 ; |# # ## #|            $d99a (G)
    .byte   %10101101 ; |# # ## #|            $d99b (G)
    .byte   %11001110 ; |##  ### |            $d99c (G)
    .byte   %01000000 ; | #      |            $d99d (G)
    .byte   %01000000 ; | #      |            $d99e (G)
    .byte   %01000000 ; | #      |            $d99f (G)
    .byte   %01000000 ; | #      |            $d9a0 (G)
    .byte   %01000000 ; | #      |            $d9a1 (G)
    .byte   %01000000 ; | #      |            $d9a2 (G)
    .byte   %01000000 ; | #      |            $d9a3 (G)
    .byte   %11110111 ; |#### ###|            $d9a4 (G)
    .byte   %11000110 ; |##   ## |            $d9a5 (G)
    .byte   %11000111 ; |##   ###|            $d9a6 (G)
    .byte   %11000110 ; |##   ## |            $d9a7 (G)
    .byte   %11000110 ; |##   ## |            $d9a8 (G)
    .byte   %11000110 ; |##   ## |            $d9a9 (G)
    .byte   %11000111 ; |##   ###|            $d9aa (G)
    .byte   %10011001 ; |#  ##  #|            $d9ab (G)
    .byte   %00110101 ; |  ## # #|            $d9ac (G)
    .byte   %00110101 ; |  ## # #|            $d9ad (G)
    .byte   %00110101 ; |  ## # #|            $d9ae (G)
    .byte   %00110101 ; |  ## # #|            $d9af (G)
    .byte   %00110101 ; |  ## # #|            $d9b0 (G)
    .byte   %10110101 ; |# ## # #|            $d9b1 (G)
    .byte   %11101111 ; |### ####|            $d9b2 (G)
    .byte   %10001100 ; |#   ##  |            $d9b3 (G)
    .byte   %11001100 ; |##  ##  |            $d9b4 (G)
    .byte   %10001100 ; |#   ##  |            $d9b5 (G)
    .byte   %10001100 ; |#   ##  |            $d9b6 (G)
    .byte   %10001100 ; |#   ##  |            $d9b7 (G)
    .byte   %11101100 ; |### ##  |            $d9b8 (G)
    .byte   %00000111 ; |     ###|            $d9b9 (G)
    .byte   %00001111 ; |    ####|            $d9ba (G)
    .byte   %00011111 ; |   #####|            $d9bb (G)
    .byte   %00111111 ; |  ######|            $d9bc (G)
    .byte   %01111100 ; | #####  |            $d9bd (G)
    .byte   %11111000 ; |#####   |            $d9be (G)
    .byte   %11110000 ; |####    |            $d9bf (G)
    .byte   %11110000 ; |####    |            $d9c0 (G)
    .byte   %11110111 ; |#### ###|            $d9c1 (G)
    .byte   %11110111 ; |#### ###|            $d9c2 (G)
    .byte   %11110111 ; |#### ###|            $d9c3 (G)
    .byte   %11110111 ; |#### ###|            $d9c4 (G)
    .byte   %11110111 ; |#### ###|            $d9c5 (G)
    .byte   %11110111 ; |#### ###|            $d9c6 (G)
    .byte   %11110111 ; |#### ###|            $d9c7 (G)
    .byte   %11110111 ; |#### ###|            $d9c8 (G)
    .byte   %11110111 ; |#### ###|            $d9c9 (G)
    .byte   %11110011 ; |####  ##|            $d9ca (G)
    .byte   %11111001 ; |#####  #|            $d9cb (G)
    .byte   %01111100 ; | #####  |            $d9cc (G)
    .byte   %00111110 ; |  ##### |            $d9cd (G)
    .byte   %00011111 ; |   #####|            $d9ce (G)
    .byte   %00001111 ; |    ####|            $d9cf (G)
    .byte   %00000111 ; |     ###|            $d9d0 (G)
    .byte   %00000011 ; |      ##|            $d9d1 (G)
    .byte   %00000111 ; |     ###|            $d9d2 (G)
    .byte   %00001111 ; |    ####|            $d9d3 (G)
    .byte   %00011111 ; |   #####|            $d9d4 (G)
    .byte   %00111110 ; |  ##### |            $d9d5 (G)
    .byte   %01111100 ; | #####  |            $d9d6 (G)
    .byte   %11111000 ; |#####   |            $d9d7 (G)
    .byte   %11110000 ; |####    |            $d9d8 (G)
    .byte   %11110111 ; |#### ###|            $d9d9 (G)
    .byte   %11110111 ; |#### ###|            $d9da (G)
    .byte   %11110111 ; |#### ###|            $d9db (G)
    .byte   %11110111 ; |#### ###|            $d9dc (G)
    .byte   %11110111 ; |#### ###|            $d9dd (G)
    .byte   %11110111 ; |#### ###|            $d9de (G)
    .byte   %11110111 ; |#### ###|            $d9df (G)
    .byte   %11110111 ; |#### ###|            $d9e0 (G)
    .byte   %11110111 ; |#### ###|            $d9e1 (G)
    .byte   %11110011 ; |####  ##|            $d9e2 (G)
    .byte   %11111001 ; |#####  #|            $d9e3 (G)
    .byte   %01111100 ; | #####  |            $d9e4 (G)
    .byte   %00111110 ; |  ##### |            $d9e5 (G)
    .byte   %00011111 ; |   #####|            $d9e6 (G)
    .byte   %00001111 ; |    ####|            $d9e7 (G)
    .byte   %00000111 ; |     ###|            $d9e8 (G)
    .byte   %00000011 ; |      ##|            $d9e9 (G)
    .byte   %00000001 ; |       #|            $d9ea (G)
    .byte   %00000000 ; |        |            $d9eb (G)
    
    .byte   $00,$00,$00,$00,$00,$00,$00,$00 ; $d9ec (*)
    .byte   $00,$00,$00,$00,$00,$00,$00,$00 ; $d9f4 (*)
    .byte   $00,$00,$00,$00                 ; $d9fc (*)
    
    .byte   %11111111 ; |########|            $da00 (G)
    .byte   %11111111 ; |########|            $da01 (G)
    .byte   %11111111 ; |########|            $da02 (G)
    .byte   %11111111 ; |########|            $da03 (G)
    .byte   %00000000 ; |        |            $da04 (G)
    .byte   %00000000 ; |        |            $da05 (G)
    .byte   %00000000 ; |        |            $da06 (G)
    .byte   %00000000 ; |        |            $da07 (G)
    .byte   %00001110 ; |    ### |            $da08 (G)
    .byte   %10001110 ; |#   ### |            $da09 (G)
    .byte   %11001110 ; |##  ### |            $da0a (G)
    .byte   %11101110 ; |### ### |            $da0b (G)
    .byte   %00001110 ; |    ### |            $da0c (G)
    .byte   %00001110 ; |    ### |            $da0d (G)
    .byte   %00001110 ; |    ### |            $da0e (G)
    .byte   %00001110 ; |    ### |            $da0f (G)
    .byte   %10001110 ; |#   ### |            $da10 (G)
    .byte   %11011110 ; |## #### |            $da11 (G)
    .byte   %11111100 ; |######  |            $da12 (G)
    .byte   %11111000 ; |#####   |            $da13 (G)
    .byte   %01110000 ; | ###    |            $da14 (G)
    .byte   %00100000 ; |  #     |            $da15 (G)
    .byte   %10000000 ; |#       |            $da16 (G)
    .byte   %11000000 ; |##      |            $da17 (G)
    .byte   %11100000 ; |###     |            $da18 (G)
    .byte   %11000000 ; |##      |            $da19 (G)
    .byte   %10000011 ; |#     ##|            $da1a (G)
    .byte   %00000011 ; |      ##|            $da1b (G)
    .byte   %00000111 ; |     ###|            $da1c (G)
    .byte   %00000111 ; |     ###|            $da1d (G)
    .byte   %00001111 ; |    ####|            $da1e (G)
    .byte   %00001111 ; |    ####|            $da1f (G)
    .byte   %00011110 ; |   #### |            $da20 (G)
    .byte   %00011111 ; |   #####|            $da21 (G)
    .byte   %00111101 ; |  #### #|            $da22 (G)
    .byte   %00111101 ; |  #### #|            $da23 (G)
    .byte   %01111001 ; | ####  #|            $da24 (G)
    .byte   %01111001 ; | ####  #|            $da25 (G)
    .byte   %00111101 ; |  #### #|            $da26 (G)
    .byte   %00011101 ; |   ### #|            $da27 (G)
    .byte   %00011101 ; |   ### #|            $da28 (G)
    .byte   %10111001 ; |# ###  #|            $da29 (G)
    .byte   %11110011 ; |####  ##|            $da2a (G)
    .byte   %11100111 ; |###  ###|            $da2b (G)
    .byte   %01001111 ; | #  ####|            $da2c (G)
    .byte   %00011110 ; |   #### |            $da2d (G)
    .byte   %10111100 ; |# ####  |            $da2e (G)
    .byte   %11000000 ; |##      |            $da2f (G)
    .byte   %11100000 ; |###     |            $da30 (G)
    .byte   %11000000 ; |##      |            $da31 (G)
    .byte   %10000000 ; |#       |            $da32 (G)
    .byte   %11111111 ; |########|            $da33 (G)
    .byte   %11111111 ; |########|            $da34 (G)
    .byte   %11111111 ; |########|            $da35 (G)
    .byte   %11111111 ; |########|            $da36 (G)
    .byte   %00000000 ; |        |            $da37 (G)
    .byte   %00000000 ; |        |            $da38 (G)
    .byte   %00000000 ; |        |            $da39 (G)
    .byte   %00000000 ; |        |            $da3a (G)
    .byte   %11111000 ; |#####   |            $da3b (G)
    .byte   %11111100 ; |######  |            $da3c (G)
    .byte   %11111110 ; |####### |            $da3d (G)
    .byte   %11111110 ; |####### |            $da3e (G)
    .byte   %00011110 ; |   #### |            $da3f (G)
    .byte   %00111100 ; |  ####  |            $da40 (G)
    .byte   %00111100 ; |  ####  |            $da41 (G)
    .byte   %01111000 ; | ####   |            $da42 (G)
    .byte   %01111000 ; | ####   |            $da43 (G)
    .byte   %11110000 ; |####    |            $da44 (G)
    .byte   %11111111 ; |########|            $da45 (G)
    .byte   %01111111 ; | #######|            $da46 (G)
    .byte   %00111111 ; |  ######|            $da47 (G)
    .byte   %00011111 ; |   #####|            $da48 (G)
    .byte   %00000000 ; |        |            $da49 (G)
    .byte   %00000000 ; |        |            $da4a (G)
    .byte   %00000000 ; |        |            $da4b (G)
    .byte   %00000000 ; |        |            $da4c (G)
    .byte   %11111111 ; |########|            $da4d (G)
    .byte   %11111111 ; |########|            $da4e (G)
    .byte   %11111111 ; |########|            $da4f (G)
    .byte   %10000000 ; |#       |            $da50 (G)
    .byte   %00000000 ; |        |            $da51 (G)
    .byte   %00000000 ; |        |            $da52 (G)
    .byte   %00000000 ; |        |            $da53 (G)
    .byte   %11111111 ; |########|            $da54 (G)
    .byte   %11111111 ; |########|            $da55 (G)
    .byte   %11111111 ; |########|            $da56 (G)
    .byte   %11111111 ; |########|            $da57 (G)
    .byte   %11000011 ; |##    ##|            $da58 (G)
    .byte   %11000111 ; |##   ###|            $da59 (G)
    .byte   %11001111 ; |##  ####|            $da5a (G)
    .byte   %11011110 ; |## #### |            $da5b (G)
    .byte   %11001111 ; |##  ####|            $da5c (G)
    .byte   %11100111 ; |###  ###|            $da5d (G)
    .byte   %11110011 ; |####  ##|            $da5e (G)
    .byte   %01111001 ; | ####  #|            $da5f (G)
    .byte   %00111100 ; |  ####  |            $da60 (G)
    .byte   %00011110 ; |   #### |            $da61 (G)
    .byte   %00000000 ; |        |            $da62 (G)
    .byte   %00000000 ; |        |            $da63 (G)
    .byte   %00000000 ; |        |            $da64 (G)
    .byte   %00000000 ; |        |            $da65 (G)
    
    .byte   $ff,$ff,$ff,$ff,$00,$00,$00,$00 ; $da66 (D)
    .byte   $e7,$e7,$e7,$e7,$e7,$e7,$e7,$e7 ; $da6e (D)
    .byte   $e7,$e3,$f9,$fc,$fe,$ff,$00,$00 ; $da76 (D)
    .byte   $00,$00,$ff,$ff,$ff,$00,$00,$00 ; $da7e (D)
    .byte   $00,$1c,$9c,$dc,$dc,$dc,$9c,$1c ; $da86 (D)
    .byte   $1c,$1c,$9c,$ff,$ff,$ff,$7f,$00 ; $da8e (D)
    .byte   $00,$00,$00                     ; $da96 (D)
    
    .byte   %11111111 ; |########|            $da99 (G)
    .byte   %11111111 ; |########|            $da9a (G)
    .byte   %11111111 ; |########|            $da9b (G)
    .byte   %11111111 ; |########|            $da9c (G)
    .byte   %00000000 ; |        |            $da9d (G)
    .byte   %00000000 ; |        |            $da9e (G)
    .byte   %00000000 ; |        |            $da9f (G)
    .byte   %00000000 ; |        |            $daa0 (G)
    .byte   %11011111 ; |## #####|            $daa1 (G)
    .byte   %11011111 ; |## #####|            $daa2 (G)
    .byte   %11011111 ; |## #####|            $daa3 (G)
    .byte   %11011111 ; |## #####|            $daa4 (G)
    .byte   %00011100 ; |   ###  |            $daa5 (G)
    .byte   %00011100 ; |   ###  |            $daa6 (G)
    .byte   %00011111 ; |   #####|            $daa7 (G)
    .byte   %00011111 ; |   #####|            $daa8 (G)
    .byte   %00011111 ; |   #####|            $daa9 (G)
    .byte   %00011100 ; |   ###  |            $daaa (G)
    .byte   %00011100 ; |   ###  |            $daab (G)
    .byte   %00011111 ; |   #####|            $daac (G)
    .byte   %00011111 ; |   #####|            $daad (G)
    .byte   %00011111 ; |   #####|            $daae (G)
    .byte   %00000000 ; |        |            $daaf (G)
    .byte   %00000000 ; |        |            $dab0 (G)
    .byte   %00000000 ; |        |            $dab1 (G)
    .byte   %00000000 ; |        |            $dab2 (G)
    .byte   %11111111 ; |########|            $dab3 (G)
    .byte   %11111111 ; |########|            $dab4 (G)
    .byte   %11111111 ; |########|            $dab5 (G)
    .byte   %00000000 ; |        |            $dab6 (G)
    .byte   %00000000 ; |        |            $dab7 (G)
    .byte   %00000000 ; |        |            $dab8 (G)
    .byte   %00000000 ; |        |            $dab9 (G)
    .byte   %11100001 ; |###    #|            $daba (G)
    .byte   %11110001 ; |####   #|            $dabb (G)
    .byte   %11111001 ; |#####  #|            $dabc (G)
    .byte   %11111101 ; |###### #|            $dabd (G)
    .byte   %11100001 ; |###    #|            $dabe (G)
    .byte   %11100001 ; |###    #|            $dabf (G)
    .byte   %11100001 ; |###    #|            $dac0 (G)
    .byte   %11100001 ; |###    #|            $dac1 (G)
    .byte   %11110001 ; |####   #|            $dac2 (G)
    .byte   %01111011 ; | #### ##|            $dac3 (G)
    .byte   %00111111 ; |  ######|            $dac4 (G)
    .byte   %10011111 ; |#  #####|            $dac5 (G)
    .byte   %11001110 ; |##  ### |            $dac6 (G)
    .byte   %11100100 ; |###  #  |            $dac7 (G)
    .byte   %00000000 ; |        |            $dac8 (G)
    .byte   %00000000 ; |        |            $dac9 (G)
    .byte   %00000000 ; |        |            $daca (G)
    .byte   %00000000 ; |        |            $dacb (G)
    .byte   %11100000 ; |###     |            $dacc (G)
    .byte   %11110000 ; |####    |            $dacd (G)
    .byte   %11111000 ; |#####   |            $dace (G)
    .byte   %11111100 ; |######  |            $dacf (G)
    .byte   %00000000 ; |        |            $dad0 (G)
    .byte   %00000000 ; |        |            $dad1 (G)
    .byte   %00000000 ; |        |            $dad2 (G)
    .byte   %00000000 ; |        |            $dad3 (G)
    .byte   %11111100 ; |######  |            $dad4 (G)
    .byte   %11111110 ; |####### |            $dad5 (G)
    .byte   %11111111 ; |########|            $dad6 (G)
    .byte   %11111111 ; |########|            $dad7 (G)
    .byte   %00001111 ; |    ####|            $dad8 (G)
    .byte   %00011110 ; |   #### |            $dad9 (G)
    .byte   %00011110 ; |   #### |            $dada (G)
    .byte   %00111100 ; |  ####  |            $dadb (G)
    .byte   %00111100 ; |  ####  |            $dadc (G)
    .byte   %01111000 ; | ####   |            $dadd (G)
    .byte   %01111111 ; | #######|            $dade (G)
    .byte   %00111111 ; |  ######|            $dadf (G)
    .byte   %10011111 ; |#  #####|            $dae0 (G)
    .byte   %11001111 ; |##  ####|            $dae1 (G)
    .byte   %00000000 ; |        |            $dae2 (G)
    .byte   %00000000 ; |        |            $dae3 (G)
    .byte   %00000000 ; |        |            $dae4 (G)
    .byte   %00000000 ; |        |            $dae5 (G)
    .byte   %11110000 ; |####    |            $dae6 (G)
    .byte   %11111000 ; |#####   |            $dae7 (G)
    .byte   %11111100 ; |######  |            $dae8 (G)
    .byte   %00000000 ; |        |            $dae9 (G)
    .byte   %00000000 ; |        |            $daea (G)
    .byte   %00000000 ; |        |            $daeb (G)
    .byte   %00000000 ; |        |            $daec (G)
    .byte   %11011111 ; |## #####|            $daed (G)
    .byte   %11011111 ; |## #####|            $daee (G)
    .byte   %11011111 ; |## #####|            $daef (G)
    .byte   %11011111 ; |## #####|            $daf0 (G)
    .byte   %11011100 ; |## ###  |            $daf1 (G)
    .byte   %11011100 ; |## ###  |            $daf2 (G)
    .byte   %11011100 ; |## ###  |            $daf3 (G)
    .byte   %11011100 ; |## ###  |            $daf4 (G)
    .byte   %11011100 ; |## ###  |            $daf5 (G)
    .byte   %11011100 ; |## ###  |            $daf6 (G)
    .byte   %10011100 ; |#  ###  |            $daf7 (G)
    .byte   %00011100 ; |   ###  |            $daf8 (G)
    .byte   %00001100 ; |    ##  |            $daf9 (G)
    .byte   %00000100 ; |     #  |            $dafa (G)
    .byte   %00000000 ; |        |            $dafb (G)
    .byte   %00000000 ; |        |            $dafc (G)
    .byte   %00000000 ; |        |            $dafd (G)
    .byte   %00000000 ; |        |            $dafe (G)
    
Ldaff
    .byte   $00                             ; $daff (*)
    .byte   $dc,$dc,$de,$dc,$dc,$dd,$dd     ; $db00 (D)
    .byte   $dc,$dc,$dd,$dd                 ; $db07 (*)
    .byte   $dd,$de                         ; $db0b (D)
    .byte   $df,$de,$de,$de,$de             ; $db0d (*)
    .byte   $de                             ; $db12 (D)
    .byte   $de                             ; $db13 (*)
    .byte   $de                             ; $db14 (D)
    .byte   $de,$de,$de,$de,$de,$de,$de     ; $db15 (*)
    .byte   $de                             ; $db1c (D)
    .byte   $de,$de,$de,$de,$de,$de,$de     ; $db1d (*)
    .byte   $de                             ; $db24 (D)
    .byte   $de,$de,$de,$de,$de,$de,$de     ; $db25 (*)
Ldb2c
    .byte   $00,$70,$8c,$23,$10,$40,$02,$2c ; $db2c (D)
    .byte   $a8,$d2                         ; $db34 (*)
    .byte   $41,$7f,$fb,$0f,$2e,$fe,$ce,$fe ; $db36 (D)
    .byte   $48,$78,$b5,$a5,$a6,$a7,$a8,$a9 ; $db3e (D)
    .byte   $aa,$ab,$ac,$ad,$ae,$af,$b0     ; $db46 (D)
    .byte   $b1,$b2,$b3,$b4                 ; $db4d (*)
    .byte   $9d                             ; $db51 (D)
    .byte   $9b,$99,$97,$95,$95,$95,$95     ; $db52 (*)
    .byte   $00,$1c,$1c,$20,$30,$30,$2a,$15 ; $db59 (D)
    .byte   $2a,$2a                         ; $db61 (*)
    .byte   $3e,$7c,$14,$14,$30,$30,$30,$30 ; $db63 (D)
    .byte   $30,$1d,$19,$01,$01,$01,$01,$01 ; $db6b (D)
    .byte   $01,$01,$01,$01,$01,$01,$01     ; $db73 (D)
    .byte   $01,$01,$01,$01,$08,$08,$08,$08 ; $db7a (*)
    .byte   $08,$08,$08,$08,$00,$00,$00,$00 ; $db82 (*)
    .byte   $00,$00,$00,$00                 ; $db8a (*)
Ldb8e
    .byte   $0d                             ; $db8e (*)
    .byte   $9d,$8d,$8d,$9d,$4d,$ad,$4d     ; $db8f (D)
    .byte   $9d,$5d,$7d,$8d                 ; $db96 (*)
    .byte   $6d,$6d                         ; $db9a (D)
    .byte   $7d,$0d,$6d,$0d,$68             ; $db9c (*)
    .byte   $4d                             ; $dba1 (D)
    .byte   $7d                             ; $dba2 (*)
    .byte   $21                             ; $dba3 (D)
    .byte   $21,$21,$21,$21,$21,$21,$21     ; $dba4 (*)
    .byte   $21                             ; $dbab (D)
    .byte   $21,$21,$21,$21,$21,$21,$21     ; $dbac (*)
    .byte   $4d                             ; $dbb3 (D)
    .byte   $4d,$4d,$4d,$4d,$4d,$4d,$4d     ; $dbb4 (*)
Ldbbb
    .byte   $ff,$28,$28,$52,$35,$35,$5e,$2f ; $dbbb (D)
    .byte   $5e,$5e                         ; $dbc3 (*)
    .byte   $40,$80,$40,$40,$54,$54,$35,$35 ; $dbc5 (D)
    .byte   $90,$ff,$cc,$80,$80,$80,$80,$80 ; $dbcd (D)
    .byte   $80,$80,$80,$80,$80,$80,$80     ; $dbd5 (D)
    .byte   $80,$80,$80,$80                 ; $dbdc (*)
    .byte   $28                             ; $dbe0 (D)
    .byte   $28,$28,$28,$28,$28,$28,$28     ; $dbe1 (*)
    .byte   $28,$28,$28,$28,$28,$28,$28,$28 ; $dbe8 (D)
    .byte   $50,$50                         ; $dbf0 (*)
    .byte   $50,$50,$50,$50,$50,$50,$50,$50 ; $dbf2 (D)
    .byte   $50,$50,$50,$50,$50,$50,$50,$50 ; $dbfa (D)
    .byte   $50,$50,$50,$50,$50,$50,$50     ; $dc02 (D)
    .byte   $50,$50,$50,$50,$50,$50,$50     ; $dc09 (*)
    .byte   $3b,$5b,$38,$58,$3d,$3d,$38,$58 ; $dc10 (D)
    .byte   $35,$35,$00,$00,$3b,$5b,$38,$58 ; $dc18 (D)
    .byte   $3d,$3d,$38,$58,$35,$55,$39,$59 ; $dc20 (D)
    .byte   $38,$38,$35,$35,$54,$55,$34,$34 ; $dc28 (D)
    .byte   $32,$32,$30,$52,$30,$50,$2d,$4d ; $dc30 (D)
    .byte   $4d,$6d,$34,$54,$3b,$5b,$00,$00 ; $dc38 (D)
    .byte   $00,$00,$00,$3b,$00,$3b,$00,$3b ; $dc40 (D)
    .byte   $00,$3b,$00,$00,$00,$00,$00,$3b ; $dc48 (D)
    .byte   $00,$5b,$00,$3b,$00,$3b,$00,$5b ; $dc50 (D)
    .byte   $00,$3b,$00,$3b,$00,$5b,$00,$3b ; $dc58 (D)
    .byte   $00,$3b,$00,$5b,$00,$54,$00,$54 ; $dc60 (D)
    .byte   $00,$54,$00,$00,$00,$00,$00,$00 ; $dc68 (D)
    .byte   $1f,$1f,$1f,$3f,$00,$5b,$00,$58 ; $dc70 (D)
    .byte   $00,$37,$00,$58,$37,$37,$34,$54 ; $dc78 (D)
    .byte   $32,$32,$31,$31,$0f,$0f,$0d,$0d ; $dc80 (D)
    .byte   $0c,$0c,$0b,$0b,$00,$00,$00,$00 ; $dc88 (D)
    .byte   $00,$00,$00,$1f,$00,$1b,$00,$1f ; $dc90 (D)
    .byte   $3b,$3b,$38,$38,$37,$37,$34,$34 ; $dc98 (D)
    .byte   $12,$12,$11,$11,$0f,$0f,$0d,$0d ; $dca0 (D)
    .byte   $3f,$3f,$5f,$5f,$7f,$9f,$00,$00 ; $dca8 (*)
    .byte   $00,$00,$5b,$7b,$00,$00,$00,$00 ; $dcb0 (*)
    .byte   $58,$78,$00,$00,$00,$00,$57,$77 ; $dcb8 (*)
    .byte   $00,$00,$00,$00,$53,$73,$00,$8f ; $dcc0 (*)
    .byte   $00,$8f,$00,$af,$00,$00,$00,$00 ; $dcc8 (*)
    .byte   $af,$af,$1f,$1f,$1f,$1f,$1f,$1f ; $dcd0 (*)
    .byte   $00,$00,$00,$00,$1f,$1f,$00,$00 ; $dcd8 (*)
    .byte   $00,$00,$1d,$1d,$00,$00,$00,$00 ; $dce0 (*)
    .byte   $1d,$1d,$00,$00,$00,$00,$37,$37 ; $dce8 (*)
    .byte   $00,$38,$00,$38,$00,$58,$00,$00 ; $dcf0 (*)
    .byte   $00,$00,$38,$58,$00,$00,$00,$00 ; $dcf8 (*)
    .byte   $00,$00                         ; $dd00 (*)
    .byte   $af,$af,$af,$af,$af,$af,$00,$00 ; $dd02 (D)
    .byte   $00,$00,$91,$91,$00,$00,$00,$00 ; $dd0a (D)
    .byte   $ad,$ad,$00,$00,$00,$00,$af,$af ; $dd12 (D)
    .byte   $00,$00,$00,$00,$af,$af,$00,$91 ; $dd1a (D)
    .byte   $00,$91,$00,$91,$00,$00,$00,$00 ; $dd22 (D)
    .byte   $91,$91,$1f,$1f,$1f,$00,$00,$00 ; $dd2a (D)
    .byte   $00,$00,$1b,$00,$00,$00,$00,$00 ; $dd32 (D)
    .byte   $39,$00,$00,$00,$00,$00,$54     ; $dd3a (D)
    .byte   $18,$38,$00,$00,$1b,$1b,$00,$00 ; $dd41 (*)
    .byte   $1d,$1d,$00,$00,$98,$b8,$00,$00 ; $dd49 (*)
    .byte   $b2,$b2,$73,$00,$92,$92,$00,$00 ; $dd51 (*)
    .byte   $b2,$b2,$70,$00,$8e,$8e,$6d,$6d ; $dd59 (*)
    .byte   $6d,$6d,$6d,$8d,$8d,$8d,$ad,$ad ; $dd61 (*)
    .byte   $b2,$b2,$00,$00,$98,$b8,$00,$00 ; $dd69 (*)
    .byte   $b2,$b2,$b8,$00,$b8,$b8,$00,$00 ; $dd71 (*)
    .byte   $b2,$b2,$00,$00,$00,$00,$52,$52 ; $dd79 (*)
    .byte   $72,$92,$00,$72,$00,$00,$52,$52 ; $dd81 (*)
    .byte   $72,$92,$00,$00,$00,$00,$52,$52 ; $dd89 (*)
    .byte   $72,$92,$00,$00,$00,$00,$00,$00 ; $dd91 (*)
    .byte   $00,$00,$00,$00,$00,$00,$1d,$1d ; $dd99 (*)
    .byte   $1d,$1d,$00,$00,$00,$00,$5b,$5b ; $dda1 (*)
    .byte   $5b,$5b,$50,$00,$00,$00,$58,$58 ; $dda9 (*)
    .byte   $78,$78,$53,$73,$00,$00,$53,$53 ; $ddb1 (*)
    .byte   $53,$53,$00,$00,$00,$00,$53,$53 ; $ddb9 (*)
    .byte   $53,$73,$00,$00,$00,$00,$52,$52 ; $ddc1 (*)
    .byte   $52,$72,$00,$00,$00,$00,$00,$00 ; $ddc9 (*)
    .byte   $00,$00,$00,$00,$00,$00,$00,$00 ; $ddd1 (*)
    .byte   $00,$00,$00,$00,$00,$00,$38,$38 ; $ddd9 (*)
    .byte   $38,$58,$00,$00,$00,$00,$1d,$1d ; $dde1 (*)
    .byte   $1d,$1d,$00,$00,$00,$00,$58,$58 ; $dde9 (*)
    .byte   $58,$58,$00,$00,$00,$00,$00,$00 ; $ddf1 (*)
    .byte   $00,$00                         ; $ddf9 (*)
    .byte   $1f,$1f,$38,$38,$34,$54,$51,$51 ; $ddfb (D)
    .byte   $6f,$8f,$71,$71,$54,$54,$58,$38 ; $de03 (D)
    .byte   $3f,$1f,$00,$00,$00,$00,$00,$1f ; $de0b (D)
    .byte   $00,$38,$00,$1f,$00,$3f,$00,$1f ; $de13 (D)
    .byte   $00,$18,$00,$1f,$00,$00,$00,$00 ; $de1b (D)
    .byte   $25,$46,$47,$48,$49,$4a,$4b,$4d ; $de23 (D)
    .byte   $4e,$4f,$30,$31,$32,$33,$34,$35 ; $de2b (D)
    .byte   $36,$37,$38,$39,$3a,$3b,$3c,$3d ; $de33 (D)
    .byte   $3e,$5f,$3e,$3d,$5c,$9b,$ba,$f9 ; $de3b (D)
    .byte   $03,$23,$44,$64,$84,$20,$21,$22 ; $de43 (*)
    .byte   $23,$24,$25,$23,$25,$24,$46,$45 ; $de4b (*)
    .byte   $47,$46,$48,$47,$49,$48,$4a,$49 ; $de53 (*)
    .byte   $4b,$4a,$4c,$4b,$4d,$4c,$4e,$4d ; $de5b (*)
    .byte   $4f,$4e,$50,$4f,$51,$50,$52,$51 ; $de63 (*)
    .byte   $53,$52,$54,$53,$55,$54,$56,$55 ; $de6b (*)
    .byte   $57,$58,$59,$58,$5a             ; $de73 (*)
    .byte   $da,$b9,$b8,$b7,$b6,$b5,$b4,$b3 ; $de78 (D)
    .byte   $b2,$b1,$b0,$af,$ae,$ad,$ac,$ab ; $de80 (D)
    .byte   $aa,$a9,$a8,$a7,$a8,$aa,$ac,$8f ; $de88 (D)
    .byte   $91,$93,$95,$76,$77             ; $de90 (D)
    .byte   $4e,$73,$4f,$74,$50,$75,$51,$77 ; $de95 (*)
    .byte   $52,$78,$53,$79,$54,$7b,$55,$7e ; $de9d (D)
    .byte   $3f                             ; $dea5 (D)
    .byte   $3b,$39,$38,$37,$35,$34,$33     ; $dea6 (*)
    .byte   $5d                             ; $dead (D)
    .byte   $59,$58,$57,$55,$54,$53,$52,$25 ; $deae (*)
    .byte   $27,$29,$2a,$2c,$27,$29,$2a,$2c ; $deb6 (*)
    .byte   $4d,$4b,$4c,$4d,$50,$55,$0c,$0d ; $debe (*)
    .byte   $31,$34,$38,$2f,$11,$15,$19,$1f ; $dec6 (*)
    .byte   $4a,$4c,$4f,$4b,$4d,$50,$4a,$4c ; $dece (*)
    .byte   $4f,$4b,$4d,$50,$4d,$50,$53,$4e ; $ded6 (*)
    .byte   $50,$54,$4d,$50,$53,$4e,$50,$54 ; $dede (*)
    .byte   $50,$53,$57,$51,$54,$58,$50,$53 ; $dee6 (*)
    .byte   $57,$51,$54,$58,$53,$57,$1e,$54 ; $deee (*)
    .byte   $58,$1f,$53,$57,$1e,$54,$58,$1f ; $def6 (*)
    .byte   $00,$00,$00,$00,$00,$00,$00,$00 ; $defe (*)
    .byte   $00,$00,$00,$00,$00,$00,$00,$00 ; $df06 (*)
    .byte   $00,$00,$00,$00,$00,$00,$00,$00 ; $df0e (*)
    .byte   $00,$00,$00,$00,$00,$00,$00,$00 ; $df16 (*)
    .byte   $00,$00,$00,$00,$00,$00,$00,$00 ; $df1e (*)
    .byte   $00,$00,$00,$00,$00,$00,$00,$00 ; $df26 (*)
    .byte   $00,$54,$00,$5b,$00,$74,$00,$50 ; $df2e (*)
    .byte   $00,$54,$00,$70,$00,$54,$00,$58 ; $df36 (*)
    .byte   $00,$74,$52,$54,$52,$54,$52,$74 ; $df3e (*)
    .byte   $00,$50,$00,$54,$00,$70,$00,$4d ; $df46 (*)
    .byte   $00,$50,$00,$6d,$00,$4c,$00,$4e ; $df4e (*)
    .byte   $00,$8c,$4b,$4c,$4b,$4c,$4b,$6c ; $df56 (*)
Ldf5e
    .byte   $05                             ; $df5e (A)
    .byte   $04                             ; $df5f (A)
    .byte   $08                             ; $df60 (A)
    .byte   $06                             ; $df61 (A)
    .byte   $05                             ; $df62 (A)
    .byte   $03                             ; $df63 (A)
    .byte   $07                             ; $df64 (A)
    .byte   $06                             ; $df65 (A)
    .byte   $18,$11,$19,$12,$17,$10,$15,$0f ; $df66 (*)
Ldf6e
    .byte   $14,$14                         ; $df6e (*)
    .byte   $14                             ; $df70 (A)
    .byte   $14                             ; $df71 (A)
    .byte   $13                             ; $df72 (A)
    .byte   $13                             ; $df73 (A)
    .byte   $12                             ; $df74 (A)
    .byte   $12                             ; $df75 (A)
    .byte   $11                             ; $df76 (A)
    .byte   $11                             ; $df77 (A)
    .byte   $10                             ; $df78 (A)
    .byte   $10                             ; $df79 (A)
    .byte   $0f                             ; $df7a (A)
    .byte   $0f                             ; $df7b (A)
    .byte   $0e                             ; $df7c (A)
    .byte   $0e                             ; $df7d (A)
    .byte   $0d                             ; $df7e (A)
    .byte   $0d                             ; $df7f (A)
    .byte   $0c                             ; $df80 (A)
    .byte   $0c                             ; $df81 (A)
    .byte   $0b                             ; $df82 (A)
    .byte   $0b                             ; $df83 (A)
    .byte   $0a                             ; $df84 (A)
    .byte   $0a                             ; $df85 (A)
    .byte   $09                             ; $df86 (A)
    .byte   $09,$08,$08,$07,$07,$07,$07,$00 ; $df87 (*)
    .byte   $00,$00,$00,$00,$00,$00,$00,$00 ; $df8f (*)
    .byte   $00,$00,$00,$00,$00,$00,$00,$00 ; $df97 (*)
    .byte   $00,$00,$00,$00,$00,$00,$00,$00 ; $df9f (*)
    .byte   $00,$00,$00,$00,$00,$00,$00,$00 ; $dfa7 (*)
    .byte   $00,$00,$00,$00,$00,$00,$00,$00 ; $dfaf (*)
    .byte   $00,$00,$00,$00,$00,$00,$00,$00 ; $dfb7 (*)
    .byte   $00,$00,$00,$00,$00,$00,$00,$00 ; $dfbf (*)
    .byte   $00,$00,$00,$00,$00,$00,$00,$00 ; $dfc7 (*)
    .byte   $00,$00,$00,$00,$00,$00,$00,$00 ; $dfcf (*)
    .byte   $00,$00,$00,$00,$00,$00,$00,$ad ; $dfd7 (*)
    .byte   $f8,$df                         ; $dfdf (*)
    
Ldfe1
    jmp     Ld100                   ;3   =   3
    
Ldfe4
    lda     $fff9                   ;4        
    
    .byte   $6c,$e1,$00                     ; $dfe7 (*)
    
Ldfea
    lda     $bff7                   ;4        
    jmp.ind (ram_E1)                ;5        
    lda     $9ff6                   ;4         *
    jmp.ind (ram_E1)                ;5   =  22
    
Ldff6
    .byte   $00                             ; $dff6 (D)
Ldff7
    .byte   $00                             ; $dff7 (D)
    .byte   $00                             ; $dff8 (*)
Ldff9
    .byte   $00                             ; $dff9 (D)
    .byte   $de,$ff,$de,$ff,$de             ; $dffa (*)
    .byte   $ff                             ; $dfff (*)


;***********************************************************
;      Bank 3 / 0..3
;***********************************************************

    SEG     CODE
    ORG     $3000
    RORG    $f000

    .byte   $6d,$e1,$9f,$63,$3b,$96,$a5,$07 ; $f000 (*)
    .byte   $d8,$af,$21,$85,$03,$7a,$44,$45 ; $f008 (*)
    .byte   $97,$25,$ba,$73,$5a,$12,$e6,$f0 ; $f010 (*)
    .byte   $10,$13,$25,$7d,$cf,$ad,$a7,$ac ; $f018 (*)
    .byte   $19,$f1,$60,$a8,$18,$96,$e8,$c3 ; $f020 (*)
    .byte   $2c,$c1,$65,$67,$68,$cd,$5a,$7b ; $f028 (*)
    .byte   $08,$65,$1d,$1a,$51,$c0,$8e,$cf ; $f030 (*)
    .byte   $f6,$bb,$42,$d8,$7d,$a1,$ae,$62 ; $f038 (*)
    .byte   $bc,$b9,$b5,$dd,$78,$ab,$99,$c4 ; $f040 (*)
    .byte   $7f,$9a,$fd,$54,$e4,$ec,$9c,$65 ; $f048 (*)
    .byte   $7c,$4c,$74,$73,$7d,$8a,$8e,$b1 ; $f050 (*)
    .byte   $98,$d7,$52,$23,$98,$19,$26,$66 ; $f058 (*)
    .byte   $df,$dc,$b1,$04,$a2,$54,$b4,$13 ; $f060 (*)
    .byte   $03,$77,$5e,$b2,$76,$9c,$da,$0b ; $f068 (*)
    .byte   $4f,$cf,$40,$44,$16,$c2,$d1,$47 ; $f070 (*)
    .byte   $26,$32,$3a,$16,$64,$75,$33,$93 ; $f078 (*)
    .byte   $ff,$3f,$e0,$5e                 ; $f080 (*)
    
    .byte   %00000000 ; |        |            $f084 (P)
    .byte   %00000000 ; |        |            $f085 (P)
    .byte   %00000000 ; |        |            $f086 (P)
    .byte   %00000000 ; |        |            $f087 (P)
    .byte   %00000000 ; |        |            $f088 (P)
    .byte   %00000000 ; |        |            $f089 (P)
    .byte   %00000000 ; |        |            $f08a (P)
    .byte   %00000000 ; |        |            $f08b (P)
    .byte   %00000000 ; |        |            $f08c (P)
    .byte   %00000000 ; |        |            $f08d (P)
    .byte   %00000001 ; |       *|            $f08e (P)
    .byte   %00000000 ; |        |            $f08f (P)
    .byte   %00000000 ; |        |            $f090 (P)
    .byte   %00000000 ; |        |            $f091 (P)
    .byte   %00000000 ; |        |            $f092 (P)
    .byte   %00000000 ; |        |            $f093 (P)
    .byte   %00000000 ; |        |            $f094 (P)
    .byte   %00000000 ; |        |            $f095 (P)
    .byte   %00000010 ; |      * |            $f096 (P)
    .byte   %00000000 ; |        |            $f097 (P)
    .byte   %00000000 ; |        |            $f098 (P)
    .byte   %00000000 ; |        |            $f099 (P)
    .byte   %00000000 ; |        |            $f09a (P)
    .byte   %00000000 ; |        |            $f09b (P)
    .byte   %00000000 ; |        |            $f09c (P)
    .byte   %00000000 ; |        |            $f09d (P)
    .byte   %00000000 ; |        |            $f09e (P)
    .byte   %00000000 ; |        |            $f09f (P)
    .byte   %00000000 ; |        |            $f0a0 (P)
    .byte   %00000000 ; |        |            $f0a1 (P)
    .byte   %00000000 ; |        |            $f0a2 (P)
    .byte   %00000000 ; |        |            $f0a3 (P)
    .byte   %00000000 ; |        |            $f0a4 (P)
    .byte   %00000000 ; |        |            $f0a5 (P)
    .byte   %00000000 ; |        |            $f0a6 (P)
    .byte   %00000000 ; |        |            $f0a7 (P)
    .byte   %00000000 ; |        |            $f0a8 (P)
    .byte   %00000000 ; |        |            $f0a9 (P)
    .byte   %00000000 ; |        |            $f0aa (P)
    .byte   %00000000 ; |        |            $f0ab (P)
    .byte   %00000000 ; |        |            $f0ac (P)
    .byte   %00000000 ; |        |            $f0ad (P)
    .byte   %00000000 ; |        |            $f0ae (P)
    .byte   %00000000 ; |        |            $f0af (P)
    .byte   %00000000 ; |        |            $f0b0 (P)
    .byte   %00000000 ; |        |            $f0b1 (P)
    .byte   %00000000 ; |        |            $f0b2 (P)
    .byte   %00000000 ; |        |            $f0b3 (P)
    .byte   %00000000 ; |        |            $f0b4 (P)
    .byte   %00000000 ; |        |            $f0b5 (P)
    .byte   %00000000 ; |        |            $f0b6 (P)
    .byte   %00000000 ; |        |            $f0b7 (P)
    .byte   %00000000 ; |        |            $f0b8 (P)
    .byte   %00000000 ; |        |            $f0b9 (P)
    .byte   %00000000 ; |        |            $f0ba (P)
    .byte   %00000000 ; |        |            $f0bb (P)
    .byte   %00000000 ; |        |            $f0bc (P)
    .byte   %00000000 ; |        |            $f0bd (P)
    .byte   %00000000 ; |        |            $f0be (P)
    .byte   %00000000 ; |        |            $f0bf (P)
    .byte   %00000000 ; |        |            $f0c0 (P)
    .byte   %00000000 ; |        |            $f0c1 (P)
    .byte   %00000000 ; |        |            $f0c2 (P)
    .byte   %00000000 ; |        |            $f0c3 (P)
    .byte   %00000000 ; |        |            $f0c4 (P)
    .byte   %00000000 ; |        |            $f0c5 (P)
    .byte   %00000000 ; |        |            $f0c6 (P)
    .byte   %00000000 ; |        |            $f0c7 (P)
    .byte   %00000000 ; |        |            $f0c8 (P)
    .byte   %00000000 ; |        |            $f0c9 (P)
    .byte   %00000010 ; |      * |            $f0ca (P)
    .byte   %00000000 ; |        |            $f0cb (P)
    .byte   %00000100 ; |     *  |            $f0cc (P)
    .byte   %00000100 ; |     *  |            $f0cd (P)
    .byte   %00001000 ; |    *   |            $f0ce (P)
    .byte   %00001000 ; |    *   |            $f0cf (P)
    .byte   %00100000 ; |  *     |            $f0d0 (P)
    .byte   %00000000 ; |        |            $f0d1 (P)
    .byte   %00000000 ; |        |            $f0d2 (P)
    .byte   %00000000 ; |        |            $f0d3 (P)
    .byte   %01000000 ; | *      |            $f0d4 (P)
    .byte   %01000000 ; | *      |            $f0d5 (P)
    .byte   %00000001 ; |       *|            $f0d6 (P)
    .byte   %00100000 ; |  *     |            $f0d7 (P)
    .byte   %00000000 ; |        |            $f0d8 (P)
    .byte   %01010000 ; | * *    |            $f0d9 (P)
    .byte   %00000000 ; |        |            $f0da (P)
    .byte   %00100000 ; |  *     |            $f0db (P)
    .byte   %00000000 ; |        |            $f0dc (P)
    .byte   %00000000 ; |        |            $f0dd (P)
    .byte   %00000000 ; |        |            $f0de (P)
    .byte   %00000000 ; |        |            $f0df (P)
    .byte   %00000000 ; |        |            $f0e0 (P)
    .byte   %00000000 ; |        |            $f0e1 (P)
    .byte   %00000000 ; |        |            $f0e2 (P)
    .byte   %00000000 ; |        |            $f0e3 (P)
    .byte   %00000000 ; |        |            $f0e4 (P)
    .byte   %00000000 ; |        |            $f0e5 (P)
    .byte   %00000000 ; |        |            $f0e6 (P)
    .byte   %00000000 ; |        |            $f0e7 (P)
    .byte   %00000000 ; |        |            $f0e8 (P)
    .byte   %00000000 ; |        |            $f0e9 (P)
    .byte   %00000000 ; |        |            $f0ea (P)
    .byte   %00000000 ; |        |            $f0eb (P)
    .byte   %00000000 ; |        |            $f0ec (P)
    .byte   %00000000 ; |        |            $f0ed (P)
    .byte   %00000000 ; |        |            $f0ee (P)
    .byte   %00000000 ; |        |            $f0ef (P)
    .byte   %00000000 ; |        |            $f0f0 (P)
    .byte   %00000000 ; |        |            $f0f1 (P)
    .byte   %00000000 ; |        |            $f0f2 (P)
    .byte   %00000000 ; |        |            $f0f3 (P)
    .byte   %00000000 ; |        |            $f0f4 (P)
    .byte   %00000000 ; |        |            $f0f5 (P)
    .byte   %00000000 ; |        |            $f0f6 (P)
    .byte   %00000000 ; |        |            $f0f7 (P)
    .byte   %00000000 ; |        |            $f0f8 (P)
    .byte   %00000000 ; |        |            $f0f9 (P)
    .byte   %00000000 ; |        |            $f0fa (P)
    .byte   %00000000 ; |        |            $f0fb (P)
    .byte   %00000000 ; |        |            $f0fc (P)
    .byte   %00000000 ; |        |            $f0fd (P)
    .byte   %00000000 ; |        |            $f0fe (P)
    .byte   %00000000 ; |        |            $f0ff (P)
    
Lf100
    lda     game_state                  ;3        
    cmp     #$03                    ;2        
    beq     Lf109                   ;2/3      
    jmp     Lf24b                   ;3   =  10
    
Lf109
    lda     player_Y_pos                  ;3        
    lsr                             ;2        
    sta     ram_DC                  ;3        
    lda     ram_C4                  ;3        
    ldx     #$05                    ;2        
    lsr                             ;2        
    bcs     Lf134                   ;2/3      
    lda     obj_0_y_pos                  ;3        
    cmp     ram_DC                  ;3        
    bne     Lf132                   ;2/3      
    lda     ram_CB                  ;3        
    bne     Lf132                   ;2/3      
    lda     obj_0_x_pos                  ;3        
    sbc     player_X_pos                  ;3        
    bpl     Lf127                   ;2/3      
    eor     #$ff                    ;2   =  40
Lf127
    cmp     #$04                    ;2        
    bcs     Lf132                   ;2/3      
    lda     ram_96                  ;3         *
    bne     Lf132                   ;2/3       *
    jmp     Lf38f                   ;3   =  12 *
    
Lf132
    ldx     #$06                    ;2   =   2
Lf134
    lda     ram_DC                  ;3        
    cmp     player_Y_pos,x                ;4        
    bne     Lf146                   ;2/3      
    lda     player_X_pos,x                ;4        
    sbc     player_X_pos                  ;3        
    bpl     Lf142                   ;2/3      
    eor     #$ff                    ;2   =  20
Lf142
    cmp     #$04                    ;2        
    bcc     Lf14c                   ;2/3 =   4
Lf146
    dex                             ;2        
    bne     Lf134                   ;2/3      
    jmp     Lf20b                   ;3   =   7
    
Lf14c
    ldy     ram_BC,x                ;4        
    cpy     #$16                    ;2        
    bne     Lf17b                   ;2/3      
    lda     #$17                    ;2         *
    sta     obj_1_id                  ;3         *
    lda     #$00                    ;2         *
    sta     ram_CA                  ;3         *
    lda     #$40                    ;2         *
    sta     ram_D2                  ;3         *
    lda     ram_C4                  ;3         *
    ora     #$01                    ;2         *
    sta     ram_C4                  ;3         *
    lda     #$05                    ;2         *
    clc                             ;2         *
    jsr     Lf3ac                   ;6         *
    ldy     #$10                    ;2         *
    ldx     #$00                    ;2         *
    jsr     Lff00                   ;6         *
    ldy     #$11                    ;2         *
    ldx     #$01                    ;2         *
    jsr     Lff00                   ;6         *
    jmp     Lf20b                   ;3   =  64 *
    
Lf17b
    lda     ram_C4                  ;3        
    lsr                             ;2        
    lda     Lfe9b,y                 ;4        
    and     #$3e                    ;2        
    beq     Lf1de                   ;2/3      
    and     #$1e                    ;2        
    bne     Lf1a7                   ;2/3      
    bcs     Lf1de                   ;2/3       *
    lda     ram_96                  ;3         *
    bne     Lf1de                   ;2/3       *
    lda     #$22                    ;2         *
    sta     ram_BC,x                ;4         *
    lda     #$20                    ;2         *
    sta     ram_CC,x                ;4         *
    lda     #$05                    ;2         *
    clc                             ;2         *
    jsr     Lf3ac                   ;6         *
    ldy     #$12                    ;2         *
    ldx     #$00                    ;2         *
    jsr     Lff00                   ;6         *
    jmp     Lf20b                   ;3   =  59 *
    
Lf1a7
    and     #$08                    ;2        
    beq     Lf1be                   ;2/3      
    bcc     Lf1e3                   ;2/3       *
    lda     #$24                    ;2         *
    sta     ram_BC,x                ;4         *
    lda     #$20                    ;2         *
    sta     ram_CC,x                ;4         *
    lda     #$30                    ;2         *
    clc                             ;2         *
    jsr     Lf3ac                   ;6         *
    jmp     Lf20b                   ;3   =  31 *
    
Lf1be
    lda     Lfe9b,y                 ;4        
    and     #$12                    ;2        
    bne     Lf1e1                   ;2/3      
    lda     #$23                    ;2         *
    sta     ram_BC,x                ;4         *
    lda     #$20                    ;2         *
    sta     ram_CC,x                ;4         *
    lda     #$00                    ;2         *
    sta     ram_D3                  ;3         *
    lda     #$10                    ;2         *
    clc                             ;2         *
    jsr     Lf3ac                   ;6         *
    ldy     #$14                    ;2         *
    ldx     #$00                    ;2         *
    jsr     Lff00                   ;6   =  45 *
Lf1de
    jmp     Lf20b                   ;3   =   3 *
    
Lf1e1
    bcs     Lf20b                   ;2/3!=   2
Lf1e3
    lda     ram_96                  ;3        
    bne     Lf1ea                   ;2/3      
    jmp     Lf38f                   ;3   =   8
    
Lf1ea
    lda     Lfe9b,y                 ;4         *
    and     #$10                    ;2         *
    beq     Lf20b                   ;2/3!      *
    cpy     #$05                    ;2         *
    bcs     Lf200                   ;2/3!      *
    lda     #$04                    ;2         *
    sta     ram_BC,x                ;4         *
    lda     #$00                    ;2         *
    sta     ram_CC,x                ;4         *
    jmp     Lf20b                   ;3   =  27 *
    
Lf200
    lda     #$1b                    ;2         *
    sta     ram_BC,x                ;4         *
    lda     #$00                    ;2         *
    sta     ram_CC,x                ;4         *
    jmp     Lf20b                   ;3   =  15 *
    
Lf20b
    lda     maincounter                  ;3        
    and     #$03                    ;2        
    tay                             ;2        
    ldx     Lf383,y                 ;4   =  11
Lf213
    stx     ram_DC                  ;3        
    ldy     #$09                    ;2        
    cpx     #$07                    ;2        
    beq     Lf221                   ;2/3      
    lda     ram_A4,x                ;4        
    beq     Lf22e                   ;2/3      
    ldy     ram_BC,x                ;4   =  19
Lf221
    lda     Lfdcc,y                 ;4        
    sta     ram_E1                  ;3        
    lda     Lfdf1,y                 ;4        
    sta     ram_E2                  ;3        
    jmp.ind (ram_E1)                ;5   =  19
Lf22e
    ldy     ram_DC                  ;3        
    ldx     Lf387,y                 ;4        
    bne     Lf213                   ;2/3      
    lda     maincounter                  ;3        
    bne     Lf24b                   ;2/3      
    ldy     ram_92                  ;3        
    cpy     #$02                    ;2        
    bcc     Lf24b                   ;2/3      
    lda     Lf959,y                 ;4        
    clc                             ;2        
    adc     #$25                    ;2        
    tay                             ;2        
    ldx     #$01                    ;2        
    jsr     Lff00                   ;6   =  39
Lf24b
    lda     game_mode                  ;3        
    bmi     Lf284                   ;2/3      
    ldx     ram_96                  ;3        
    beq     Lf258                   ;2/3      
    dec     ram_96                  ;5        
    jmp     Lf284                   ;3   =  18
    
Lf258
    lda     game_state                  ;3        
    cmp     #$07                    ;2        
    bcs     Lf284                   ;2/3      
    lda     SWCHA                   ;4        
    lsr                             ;2        
    lsr                             ;2        
    lsr                             ;2        
    lsr                             ;2        
    tax                             ;2        
    lda     Lf373,x                 ;4        
    sta     ram_CC                  ;3        
    bit     button_register                  ;3        
    bpl     Lf284                   ;2/3      
    bvs     Lf284                   ;2/3      
    lda     maincounter                  ;3        
    sta     ram_83                  ;3        
    ldx     ram_96                  ;3        
    bne     Lf284                   ;2/3      
    ldx     #$1d                    ;2        
    stx     ram_96                  ;3        
    ldy     #$13                    ;2        
    ldx     #$00                    ;2        
    jsr     Lff00                   ;6   =  61
Lf284
    lda     ram_8B                  ;3        
    and     #$0f                    ;2        
    beq     Lf28d                   ;2/3      
    lsr                             ;2        
    bcc     Lf293                   ;2/3 =  11
Lf28d
    lda     ram_C4                  ;3        
    and     #$fb                    ;2        
    sta     ram_C4                  ;3   =   8
Lf293
    lda     ram_C4                  ;3        
    and     #$04                    ;2        
    beq     Lf2ba                   ;2/3      
    lda     elevator_y_pos                  ;3         *
    asl                             ;2         *
    sta     player_Y_pos                  ;3         *
    lda     maincounter                  ;3         *
    and     #$03                    ;2         *
    cmp     #$03                    ;2         *
    bne     Lf2b7                   ;2/3       *
    lda     elevator_x_pos                  ;3         *
    sbc     player_X_pos                  ;3         *
    beq     Lf2b5                   ;2/3       *
    cmp     #$05                    ;2         *
    bcc     Lf2b7                   ;2/3       *
    inc     player_X_pos                  ;5         *
    jmp     Lf2b7                   ;3   =  44 *
    
Lf2b5
    dec     player_X_pos                  ;5   =   5 *
Lf2b7
    jmp     Lf35b                   ;3   =   3 *
    
Lf2ba
    lda     #$ee                    ;2        
    sta     ram_E3                  ;3        
    lda     #$f2                    ;2        
    sta     ram_E4                  ;3        
    lda     player_Y_pos                  ;3        
    lsr                             ;2        
    tay                             ;2        
    ldx     ram_CC                  ;3        
    bne     Lf2cd                   ;2/3      
    jmp     Lf33b                   ;3   =  25
    
Lf2cd
    clc                             ;2        
    lda     ram_97                  ;3        
    adc     Lfdbb,x                 ;4        
    sta     ram_97                  ;3        
    lda     Lfdbc,x                 ;4        
    adc     player_X_pos                  ;3        
    sta     ram_DC                  ;3        
    cmp     player_X_pos                  ;3        
    beq     Lf2fd                   ;2/3      
    lsr                             ;2        
    lsr                             ;2        
    tax                             ;2        
    lda     Lfec0,x                 ;4        
    bmi     Lf2eb                   ;2/3      
    jmp     Lffc8                   ;3   =  42
    
Lf2eb
    jmp     Lffd3                   ;3   =   3
    
    and     Lfee0,x                 ;4        
    bne     Lf2fd                   ;2/3      
    lda     ram_DC                  ;3        
    sta     player_X_pos                  ;3        
    lda     ram_C4                  ;3        
    ora     #$10                    ;2        
    sta     ram_C4                  ;3   =  20
Lf2fd
    lda     #$2c                    ;2        
    sta     ram_E3                  ;3        
    lda     #$f3                    ;2        
    sta     ram_E4                  ;3        
    ldx     ram_CC                  ;3        
    clc                             ;2        
    lda     ram_98                  ;3        
    adc     Lfdab,x                 ;4        
    sta     ram_98                  ;3        
    lda     Lfdac,x                 ;4        
    adc     player_Y_pos                  ;3        
    sta     ram_DC                  ;3        
    cmp     player_Y_pos                  ;3        
    beq     Lf33b                   ;2/3      
    lsr                             ;2        
    tay                             ;2        
    lda     player_X_pos                  ;3        
    lsr                             ;2        
    lsr                             ;2        
    tax                             ;2        
    lda     Lfec0,x                 ;4        
    bmi     Lf329                   ;2/3      
    jmp     Lffc8                   ;3   =  62
    
Lf329
    jmp     Lffd3                   ;3   =   3
    
    and     Lfee0,x                 ;4        
    bne     Lf33b                   ;2/3      
    lda     ram_DC                  ;3        
    sta     player_Y_pos                  ;3        
    lda     ram_C4                  ;3        
    ora     #$10                    ;2        
    sta     ram_C4                  ;3   =  20
Lf33b
    lda     ram_8B                  ;3        
    and     #$0f                    ;2        
    beq     Lf35b                   ;2/3      
    lsr                             ;2        
    bcc     Lf35b                   ;2/3      
    lda     player_X_pos                  ;3        
    adc     #$06                    ;2        
    sbc     elevator_x_pos                  ;3        
    cmp     #$07                    ;2        
    bcs     Lf35b                   ;2/3      
    lda     player_Y_pos                  ;3        
    lsr                             ;2        
    cmp     elevator_y_pos                  ;3        
    bne     Lf35b                   ;2/3      
    lda     ram_C4                  ;3         *
    ora     #$04                    ;2         *
    sta     ram_C4                  ;3   =  41 *
Lf35b
    lda     ram_83                  ;3        
    asl                             ;2        
    eor     ram_82                  ;3        
    asl                             ;2        
    asl                             ;2        
    rol     ram_82                  ;5        
    rol     ram_83                  ;5        
    rol     ram_82                  ;5        
    ldx     #$16                    ;2        
    stx     ram_E1                  ;3        
    ldx     #$d1                    ;2        
    stx     ram_E2                  ;3        
    jmp     Lfff0                   ;3   =  40
    
Lf373
    .byte   $00,$0b,$07,$00,$03             ; $f373 (*)
    .byte   $01,$05,$03                     ; $f378 (D)
    .byte   $0f                             ; $f37b (*)
    .byte   $09,$0d,$0f                     ; $f37c (D)
    .byte   $00                             ; $f37f (*)
    .byte   $0b,$07,$00                     ; $f380 (D)
Lf383
    .byte   $07,$02,$06,$04                 ; $f383 (D)
Lf387
    .byte   $00                             ; $f387 (*)
    .byte   $00,$01,$00,$03,$00,$05,$00     ; $f388 (D)
    
Lf38f
    ldx     #$44                    ;2        
    stx     ram_91                  ;3        
    ldx     #$04                    ;2        
    stx     game_state                  ;3        
    ldx     #$08                    ;2        
    stx     ram_BC                  ;3        
    ldy     #$03                    ;2        
    ldx     #$00                    ;2        
    jsr     Lff00                   ;6        
    ldy     #$00                    ;2        
    ldx     #$01                    ;2        
    jsr     Lff00                   ;6        
    jmp     Lf35b                   ;3   =  38
    
Lf3ac
    sed                             ;2         *
    ldy     game_mode                  ;3         *
    bmi     Lf3d7                   ;2/3       *
    adc     score_00XX00                  ;3         *
    sta     score_00XX00                  ;3         *
    bcc     Lf3d7                   ;2/3       *
    lda     score_XX0000                  ;3         *
    lsr                             ;2         *
    bcc     Lf3d0                   ;2/3       *
    inc     player_lives                  ;5         *
    bpl     Lf3c2                   ;2/3       *
    dec     player_lives                  ;5   =  34 *
Lf3c2
    ldy     #$0e                    ;2         *
    ldx     #$00                    ;2         *
    jsr     Lff00                   ;6         *
    ldy     #$0f                    ;2         *
    ldx     #$01                    ;2         *
    jsr     Lff00                   ;6   =  20 *
Lf3d0
    clc                             ;2         *
    lda     #$01                    ;2         *
    adc     score_XX0000                  ;3         *
    sta     score_XX0000                  ;3   =  10 *
Lf3d7
    cld                             ;2         *
    rts                             ;6   =   8 *
    
    .byte   $e4,$8c,$d0,$14,$a5,$8b,$29,$0f ; $f3d9 (*)
    .byte   $f0,$0a,$4a,$b0,$07,$a5,$da,$95 ; $f3e1 (*)
    .byte   $b4,$4c,$2e,$f2,$a9,$00,$85,$8c ; $f3e9 (*)
    .byte   $b4,$cc,$b5,$c4,$29,$0c,$f0,$21 ; $f3f1 (*)
    .byte   $c9,$08,$d0,$0a,$c0,$09,$90,$3a ; $f3f9 (*)
    .byte   $a9,$00,$85,$dd,$f0,$28,$c9,$0c ; $f401 (*)
    .byte   $d0,$30,$c0,$06,$90,$2c,$a5,$82 ; $f409 (*)
    .byte   $4d,$84,$02,$29,$03,$55,$c4,$b0 ; $f411 (*)
    .byte   $1b,$b9,$e1,$f4,$c5,$82,$90,$1a ; $f419 (*)
    .byte   $a5,$82,$0a,$0a,$45,$83,$38,$4d ; $f421 (*)
    .byte   $84,$02,$29,$0e,$85,$dd,$b5,$c4 ; $f429 (*)
    .byte   $69,$00,$45,$dd,$95,$c4,$a9,$00 ; $f431 (*)
    .byte   $95,$cc,$a5,$84,$29,$fc,$d0,$1d ; $f439 (*)
    .byte   $18,$b5,$c4,$69,$10,$90,$02,$09 ; $f441 (*)
    .byte   $f0,$95,$c4,$a5,$84,$29,$fc,$d0 ; $f449 (*)
    .byte   $0c,$a5,$85,$29,$0f,$d0,$06,$b5 ; $f451 (*)
    .byte   $c4,$29,$0f,$95,$c4,$b5,$c4,$29 ; $f459 (*)
    .byte   $f0,$4a,$4a,$4a,$4a,$a8,$b9,$2c ; $f461 (*)
    .byte   $f5,$a4,$94,$79,$ec,$f4,$85,$de ; $f469 (*)
    .byte   $b5,$c4,$29,$03,$a8,$b9,$dd,$f4 ; $f471 (*)
    .byte   $85,$e0,$b9,$d9,$f4,$85,$e1,$a9 ; $f479 (*)
    .byte   $00,$85,$dd,$20,$01,$fc,$a8,$f0 ; $f481 (*)
    .byte   $13,$f6,$cc,$a9,$01,$85,$dd,$a5 ; $f489 (*)
    .byte   $e0,$10,$07,$98,$49,$ff,$18,$69 ; $f491 (*)
    .byte   $01,$a8,$84,$e0                 ; $f499 (*)
    
Lf49d
    jsr     Lfbed                   ;6        
    tay                             ;2        
    beq     Lf4b6                   ;2/3      
    lda     ram_DD                  ;3        
    ora     #$04                    ;2        
    sta     ram_DD                  ;3        
    lda     ram_E1                  ;3        
    bpl     Lf4b4                   ;2/3      
    tya                             ;2        
    eor     #$ff                    ;2        
    clc                             ;2        
    adc     #$01                    ;2        
    tay                             ;2   =  33
Lf4b4
    sty     ram_E1                  ;3   =   3
Lf4b6
    jmp     Lfc3c                   ;3   =   3
    
Lf4b9
    ldx     ram_DC                  ;3         *
    ldy     ram_CC,x                ;4         *
    cpy     #$02                    ;2         *
    bcs     Lf4c8                   ;2/3       *
    lda     ram_DD                  ;3         *
    cmp     #$05                    ;2         *
    bne     Lf4d6                   ;2/3       *
    clc                             ;2   =  20 *
Lf4c8
    lda     ram_C4,x                ;4         *
    and     #$f3                    ;2         *
    adc     #$01                    ;2         *
    and     #$f3                    ;2         *
    sta     ram_C4,x                ;4         *
    lda     #$00                    ;2         *
    sta     ram_CC,x                ;4   =  20 *
Lf4d6
    jmp     Lfd0e                   ;3   =   3 *
    
    .byte   $01,$ff,$ff,$01,$01,$01,$ff,$ff ; $f4d9 (*)
    .byte   $00,$0c,$68,$0c,$90,$10,$c8,$20 ; $f4e1 (*)
    .byte   $f0,$40,$ff,$1d,$1d,$1d,$1d,$1c ; $f4e9 (*)
    .byte   $1c,$1c,$1c,$1b,$1b,$1b,$1b,$1a ; $f4f1 (*)
    .byte   $1a,$1a,$1a,$1a,$19,$19,$18,$18 ; $f4f9 (*)
    .byte   $17,$16,$15,$14,$13,$12,$10,$0e ; $f501 (*)
    .byte   $0c,$0a,$08,$24,$24,$24,$24,$23 ; $f509 (*)
    .byte   $23,$23,$23,$22,$22,$22,$22,$21 ; $f511 (*)
    .byte   $21,$21,$21,$20,$20,$1f,$1e,$1d ; $f519 (*)
    .byte   $1d,$1c,$1c,$1b,$1a,$19,$18,$17 ; $f521 (*)
    .byte   $16,$15,$14,$00,$01,$02,$03,$04 ; $f529 (*)
    .byte   $05,$06,$07,$08,$09,$0a,$0b,$0c ; $f531 (*)
    .byte   $0d,$0e,$0f,$f6,$cc,$b5,$cc,$a4 ; $f539 (*)
    .byte   $94,$d9,$70,$f5,$90,$0e,$a9,$00 ; $f541 (*)
    .byte   $95,$bc,$b5,$c4,$29,$0f,$95,$c4 ; $f549 (*)
    .byte   $a9,$00,$95,$cc,$e4,$8c,$d0,$14 ; $f551 (*)
    .byte   $a5,$8b,$29,$0f,$f0,$0a,$4a,$b0 ; $f559 (*)
    .byte   $07,$a5,$da,$95,$b4,$4c,$2e,$f2 ; $f561 (*)
    .byte   $a9,$00,$85,$8c,$4c,$0e,$fd,$0b ; $f569 (*)
    .byte   $0b,$0c,$0c,$0d,$0d,$0e,$0e,$0f ; $f571 (*)
    .byte   $0f,$10,$10,$11,$11,$12,$12,$13 ; $f579 (*)
    .byte   $13,$14,$14,$15,$15,$16,$16,$17 ; $f581 (*)
    .byte   $17,$18,$18,$19,$19,$1a,$1a,$08 ; $f589 (*)
    .byte   $08,$09,$09,$09,$0a,$0a,$0a,$0b ; $f591 (*)
    .byte   $0b,$0b,$0c,$0c,$0c,$0d,$0d,$0d ; $f599 (*)
    .byte   $0e,$0e,$0e,$0f,$0f,$0f,$10,$10 ; $f5a1 (*)
    .byte   $10,$11,$11,$11,$12,$12,$12,$f6 ; $f5a9 (*)
    .byte   $cc,$b5,$cc,$a4,$94,$d9,$dd,$f5 ; $f5b1 (*)
    .byte   $90,$1f,$b5,$bc,$18,$69,$01,$c9 ; $f5b9 (*)
    .byte   $09,$b0,$08,$95,$bc,$a9,$00,$95 ; $f5c1 (*)
    .byte   $cc,$f0,$0e,$a9,$00,$95,$bc,$b5 ; $f5c9 (*)
    .byte   $c4,$29,$0f,$95,$c4,$a9,$00,$95 ; $f5d1 (*)
    .byte   $cc,$4c,$2e,$f2,$02,$02,$02,$02 ; $f5d9 (*)
    .byte   $02,$02,$02,$02,$02,$02,$02,$02 ; $f5e1 (*)
    .byte   $02,$02,$03,$03,$03,$03,$03,$03 ; $f5e9 (*)
    .byte   $03,$03,$03,$03,$04,$04,$04,$04 ; $f5f1 (*)
    .byte   $04,$04,$04,$04,$01,$01,$01,$01 ; $f5f9 (*)
    .byte   $01,$01,$01,$01,$02,$02,$02,$02 ; $f601 (*)
    .byte   $02,$02,$02,$02,$03,$03,$03,$03 ; $f609 (*)
    .byte   $03,$03,$03,$03,$03,$03,$04,$04 ; $f611 (*)
    .byte   $04,$04,$04,$04,$e4,$8c,$d0,$14 ; $f619 (*)
    .byte   $a5,$8b,$29,$0f,$f0,$0a,$4a,$b0 ; $f621 (*)
    .byte   $07,$a5,$da,$95,$b4,$4c,$2e,$f2 ; $f629 (*)
    .byte   $a9,$00,$85,$8c,$a5,$8f,$4a,$4a ; $f631 (*)
    .byte   $a8,$b9,$5b,$f6,$d5,$cc,$b0,$10 ; $f639 (*)
    .byte   $a0,$00,$94,$cc,$b5,$bc,$69,$01 ; $f641 (*)
    .byte   $29,$03,$95,$c4,$69,$0c,$95,$bc ; $f649 (*)
    .byte   $a4,$94,$b9,$6b,$f6,$85,$de,$4c ; $f651 (*)
    .byte   $71,$f4,$05,$06,$05,$04,$06,$06 ; $f659 (*)
    .byte   $03,$03,$06,$05,$04,$04,$06,$05 ; $f661 (*)
    .byte   $03,$01,$28,$27,$27,$26,$26,$25 ; $f669 (*)
    .byte   $24,$23,$22,$21,$20,$1f,$1e,$1d ; $f671 (*)
    .byte   $1c,$1b,$1b,$1a,$1a,$19,$19,$18 ; $f679 (*)
    .byte   $18,$18,$17,$17,$16,$14,$12,$10 ; $f681 (*)
    .byte   $0e,$0c,$2b,$2a,$29,$28,$27,$26 ; $f689 (*)
    .byte   $25,$24,$23,$22,$21,$20,$1f,$1e ; $f691 (*)
    .byte   $1e,$1e,$1d,$1d,$1d,$1d,$1c,$1c ; $f699 (*)
    .byte   $1b,$1b,$1a,$1a,$19,$18,$16,$15 ; $f6a1 (*)
    .byte   $13,$12,$e4,$8c,$d0,$14,$a5,$8b ; $f6a9 (*)
    .byte   $29,$0f,$f0,$0a,$4a,$b0,$07,$a5 ; $f6b1 (*)
    .byte   $da,$95,$b4,$4c,$2e,$f2,$a9,$00 ; $f6b9 (*)
    .byte   $85,$8c,$a5,$82,$4d,$84,$02,$4a ; $f6c1 (*)
    .byte   $4a,$29,$03,$a8,$b9,$dd,$f4,$85 ; $f6c9 (*)
    .byte   $e0,$45,$82,$4d,$84,$02,$29,$03 ; $f6d1 (*)
    .byte   $a8,$b9,$d9,$f4,$85,$e1,$a4,$94 ; $f6d9 (*)
    .byte   $b9,$6b,$f6,$85,$de,$4c,$80,$f4 ; $f6e1 (*)
    
Lf6e9
    cpx     ram_8C                  ;3        
    bne     Lf701                   ;2/3!     
    lda     ram_8B                  ;3         *
    and     #$0f                    ;2         *
    beq     Lf6fd                   ;2/3       *
    lsr                             ;2         *
    bcs     Lf6fd                   ;2/3       *
    lda     elevator_y_pos                  ;3         *
    sta     player_Y_pos,x                ;4         *
    jmp     Lf22e                   ;3   =  26 *
    
Lf6fd
    lda     #$00                    ;2         *
    sta     ram_8C                  ;3   =   5 *
Lf701
    ldy     enemy_speed                  ;3        
    lda     player_Y_pos                  ;3        
    lsr                             ;2        
    sec                             ;2        
    sbc     player_Y_pos,x                ;4        
    bcs     Lf70f                   ;2/3      
    lda     #$fc                    ;2        
    bmi     Lf714                   ;2/3 =  20
Lf70f
    clc                             ;2        
    beq     Lf714                   ;2/3      
    lda     #$04                    ;2   =   6
Lf714
    adc     ram_C4,x                ;4        
    sta     ram_C4,x                ;4        
    sta     ram_DD                  ;3        
    bpl     Lf721                   ;2/3      
    eor     #$ff                    ;2        
    clc                             ;2        
    adc     #$01                    ;2   =  19
Lf721
    cmp     Lf7a9,y                 ;4        
    bcc     Lf733                   ;2/3      
    lda     Lf7a9,y                 ;4        
    bit     ram_DD                  ;3        
    bpl     Lf731                   ;2/3      
    eor     #$ff                    ;2        
    adc     #$00                    ;2   =  19
Lf731
    sta     ram_C4,x                ;4   =   4
Lf733
    lda     ram_C4,x                ;4        
    sta     ram_E0                  ;3        
    bpl     Lf73e                   ;2/3      
    eor     #$ff                    ;2        
    clc                             ;2        
    adc     #$01                    ;2   =  15
Lf73e
    sta     ram_DE                  ;3        
    lda     player_X_pos                  ;3        
    sec                             ;2        
    sbc     player_X_pos,x                ;4        
    bcs     Lf74b                   ;2/3      
    lda     #$fc                    ;2        
    bmi     Lf750                   ;2/3 =  18
Lf74b
    clc                             ;2        
    beq     Lf750                   ;2/3      
    lda     #$04                    ;2   =   6
Lf750
    adc     ram_CC,x                ;4        
    sta     ram_CC,x                ;4        
    sta     ram_DD                  ;3        
    bpl     Lf75d                   ;2/3      
    eor     #$ff                    ;2        
    clc                             ;2        
    adc     #$01                    ;2   =  19
Lf75d
    cmp     Lf7a9,y                 ;4        
    bcc     Lf76f                   ;2/3      
    lda     Lf7a9,y                 ;4        
    bit     ram_DD                  ;3        
    bpl     Lf76d                   ;2/3      
    eor     #$ff                    ;2        
    adc     #$00                    ;2   =  19
Lf76d
    sta     ram_CC,x                ;4   =   4
Lf76f
    lda     ram_CC,x                ;4        
    sta     ram_E1                  ;3        
    bpl     Lf77a                   ;2/3      
    eor     #$ff                    ;2        
    clc                             ;2        
    adc     #$01                    ;2   =  15
Lf77a
    sta     ram_DF                  ;3   =   3
Lf77c
    lda     #$00                    ;2        
    sta     ram_DD                  ;3        
    lda     ram_E0                  ;3        
    beq     Lf79b                   ;2/3      
    jsr     Lfc01                   ;6        
    tay                             ;2        
    beq     Lf79b                   ;2/3      
    lda     #$01                    ;2        
    sta     ram_DD                  ;3        
    lda     ram_E0                  ;3        
    bpl     Lf799                   ;2/3      
    tya                             ;2        
    eor     #$ff                    ;2        
    clc                             ;2        
    adc     #$01                    ;2        
    tay                             ;2   =  40
Lf799
    sty     ram_E0                  ;3   =   3
Lf79b
    lda     ram_DF                  ;3        
    sta     ram_DE                  ;3        
    lda     ram_E1                  ;3        
    bne     Lf7a6                   ;2/3      
    jmp     Lfc3c                   ;3   =  14
    
Lf7a6
    jmp     Lf49d                   ;3   =   3
    
Lf7a9
    .byte   $27,$26,$25,$24,$23,$22,$21,$20 ; $f7a9 (*)
    .byte   $1f,$1e,$1d,$1c,$1b,$1a,$19,$18 ; $f7b1 (*)
    .byte   $17,$16,$15,$14,$13,$12,$11,$10 ; $f7b9 (*)
    .byte   $0f,$0e,$0d,$0c,$0b,$0a,$09     ; $f7c1 (*)
    .byte   $08                             ; $f7c8 (D)
    .byte   $33,$32,$31,$30,$2f,$2e,$2d,$2c ; $f7c9 (*)
    .byte   $2b,$2a,$29,$28,$27,$26,$25,$24 ; $f7d1 (*)
    .byte   $23,$22,$21,$20,$1f,$1e,$1d,$1c ; $f7d9 (*)
    .byte   $1b,$1a,$19,$18,$17,$16,$15     ; $f7e1 (*)
    .byte   $14                             ; $f7e8 (D)
    
Lf7e9
    inc     ram_91                  ;5        
    lda     ram_91                  ;3        
    cmp     #$6e                    ;2        
    bcc     Lf850                   ;2/3!     
    lda     #$00                    ;2        
    sta     ram_91                  ;3        
    sta     ram_AB                  ;3        
    lda     #$e0                    ;2        
    sta     obj_0_y_pos                  ;3        
    inc     ram_92                  ;5        
    lda     ram_92                  ;3        
    cmp     #$17                    ;2        
    bcc     Lf807                   ;2/3      
    lda     #$17                    ;2         *
    sta     ram_92                  ;3   =  42 *
Lf807
    cmp     #$06                    ;2        
    bcs     Lf815                   ;2/3      
    lsr                             ;2        
    bcc     Lf812                   ;2/3      
    lda     ram_D3                  ;3        
    bne     Lf815                   ;2/3 =  13
Lf812
    jmp     Lf22e                   ;3   =   3
    
Lf815
    lda     ram_92                  ;3        
    cmp     #$0b                    ;2        
    bcs     Lf828                   ;2/3      
    ldy     castle_level                  ;3        
    lda     Lfd6c,y                 ;4        
    sta     obj_0_x_pos                  ;3        
    lda     Lfd2c,y                 ;4        
    jmp     Lf83d                   ;3   =  24
    
Lf828
    lda     player_X_pos                  ;3         *
    sta     obj_0_x_pos                  ;3         *
    lda     ram_C4                  ;3         *
    and     #$04                    ;2         *
    bne     Lf838                   ;2/3       *
    lda     player_Y_pos                  ;3         *
    lsr                             ;2         *
    jmp     Lf83d                   ;3   =  21 *
    
Lf838
    lda     elevator_selector_id                  ;3         *
    clc                             ;2         *
    adc     #$01                    ;2   =   7 *
Lf83d
    sta     ram_DD                  ;3        
    lda     #$4a                    ;2        
    sta     obj_0_y_pos                  ;3        
    sec                             ;2        
    sbc     ram_DD                  ;3        
    sta     ram_CB                  ;3        
    lda     #$09                    ;2        
    sta     obj_0_id                  ;3        
    lda     #$80                    ;2        
    sta     ram_AB                  ;3   =  26
Lf850
    lda     ram_AB                  ;3        
    bne     Lf857                   ;2/3      
    jmp     Lf22e                   ;3   =   8
    
Lf857
    ldy     ram_92                  ;3        
    lda     Lf959,y                 ;4        
    sta     ram_DD                  ;3        
    ldy     ram_91                  ;3        
    cpy     #$52                    ;2        
    bcs     Lf87f                   ;2/3      
    lda     #$15                    ;2        
    cpy     #$22                    ;2        
    bcc     Lf874                   ;2/3      
    cpy     #$32                    ;2        
    bcc     Lf872                   ;2/3      
    cpy     #$42                    ;2        
    bcc     Lf874                   ;2/3 =  31
Lf872
    lda     #$1d                    ;2   =   2
Lf874
    clc                             ;2        
    adc     ram_DD                  ;3        
    tay                             ;2        
    ldx     #$01                    ;2        
    jsr     Lff00                   ;6        
    ldx     ram_DC                  ;3   =  18
Lf87f
    lda     ram_91                  ;3        
    bne     Lf886                   ;2/3      
    jmp     Lf22e                   ;3   =   8
    
Lf886
    cmp     #$52                    ;2        
    bcc     Lf8a3                   ;2/3      
    inc     obj_0_y_pos                  ;5        
    inc     obj_0_y_pos                  ;5        
    inc     ram_CB                  ;5        
    inc     ram_CB                  ;5        
    lda     #$4a                    ;2        
    cmp     obj_0_y_pos                  ;3        
    bcs     Lf8a0                   ;2/3      
    lda     #$e0                    ;2         *
    sta     obj_0_y_pos                  ;3         *
    lda     #$00                    ;2         *
    sta     ram_AB                  ;3   =  41 *
Lf8a0
    jmp     Lf22e                   ;3   =   3
    
Lf8a3
    lda     ram_CB                  ;3        
    beq     Lf8d1                   ;2/3      
    lda     ram_91                  ;3        
    beq     Lf8a0                   ;2/3      
    ldy     ram_92                  ;3        
    lda     Lf929,y                 ;4        
    sta     ram_DE                  ;3        
    jsr     Lfbed                   ;6        
    asl                             ;2        
    cmp     ram_CB                  ;3        
    bcc     Lf8bc                   ;2/3      
    lda     ram_CB                  ;3   =  36
Lf8bc
    sta     ram_DD                  ;3        
    lda     obj_0_y_pos                  ;3        
    sec                             ;2        
    sbc     ram_DD                  ;3        
    sta     obj_0_y_pos                  ;3        
    lda     ram_CB                  ;3        
    sec                             ;2        
    sbc     ram_DD                  ;3        
    sta     ram_CB                  ;3        
    ldx     ram_DC                  ;3        
    jmp     Lf22e                   ;3   =  31
    
Lf8d1
    ldy     enemy_speed                  ;3        
    lda     Lf8e9,y                 ;4        
    clc                             ;2        
    ldy     ram_92                  ;3        
    adc     Lf941,y                 ;4        
    cmp     #$3f                    ;2        
    bcc     Lf8e2                   ;2/3      
    lda     #$3f                    ;2   =  22 *
Lf8e2
    sta     ram_DE                  ;3        
    sta     ram_DF                  ;3        
    jmp     Lfa73                   ;3   =   9
    
Lf8e9
    .byte   $07,$07,$07,$07,$06,$06,$06,$06 ; $f8e9 (*)
    .byte   $05,$05,$05,$05,$04,$04,$04,$04 ; $f8f1 (*)
    .byte   $03,$03,$03,$03,$02,$02,$02,$02 ; $f8f9 (*)
    .byte   $01,$01,$01,$01,$00,$00,$00     ; $f901 (*)
    .byte   $00                             ; $f908 (D)
    .byte   $0a,$0a,$0a,$09,$09,$09,$08,$08 ; $f909 (*)
    .byte   $08,$07,$07,$07,$06,$06,$06,$05 ; $f911 (*)
    .byte   $05,$05,$04,$04,$04,$03,$03,$03 ; $f919 (*)
    .byte   $03,$02,$02,$02,$01,$01,$01,$01 ; $f921 (*)
Lf929
    .byte   $09                             ; $f929 (*)
    .byte   $09                             ; $f92a (D)
    .byte   $09                             ; $f92b (*)
    .byte   $0a                             ; $f92c (D)
    .byte   $0a,$0a,$0b,$0b,$0b,$0c,$0c,$0d ; $f92d (*)
    .byte   $0e,$0f,$10,$11,$12,$13,$15,$17 ; $f935 (*)
    .byte   $19,$1b,$1d,$34                 ; $f93d (*)
Lf941
    .byte   $16                             ; $f941 (*)
    .byte   $16                             ; $f942 (D)
    .byte   $18,$18,$1a,$1a,$1c,$1e,$20,$21 ; $f943 (*)
    .byte   $22,$23,$24,$25,$26,$27,$28,$29 ; $f94b (*)
    .byte   $2a,$2b,$2c,$30,$34,$3c         ; $f953 (*)
Lf959
    .byte   $00                             ; $f959 (*)
    .byte   $00,$00,$00,$00                 ; $f95a (D)
    .byte   $01,$01,$02,$02,$03,$03,$04,$04 ; $f95e (*)
    .byte   $05,$05,$06,$06,$06,$07,$07,$07 ; $f966 (*)
    .byte   $07,$07,$07,$e4,$8c,$d0,$14,$a5 ; $f96e (*)
    .byte   $8b,$29,$0f,$f0,$0a,$4a,$b0,$07 ; $f976 (*)
    .byte   $a5,$da,$95,$b4,$4c,$2e,$f2,$a9 ; $f97e (*)
    .byte   $00,$85,$8c,$a4,$94,$b9,$f6,$f9 ; $f986 (*)
    .byte   $85,$de,$85,$df,$a5,$94,$29,$1f ; $f98e (*)
    .byte   $a8,$c0,$1a,$b0,$1e,$a5,$93,$29 ; $f996 (*)
    .byte   $3c,$c9,$3c,$d0,$21,$c0,$10,$b0 ; $f99e (*)
    .byte   $15,$a5,$93,$29,$fc,$c9,$fc,$d0 ; $f9a6 (*)
    .byte   $0d,$a9,$00,$85,$ca,$85,$d2,$a9 ; $f9ae (*)
    .byte   $12,$85,$c2,$4c,$0e,$fd,$a5,$82 ; $f9b6 (*)
    .byte   $45,$ac,$29,$0f,$95,$cc,$b5,$cc ; $f9be (*)
    .byte   $29,$0f,$a8,$b9,$d6,$f9,$85,$e0 ; $f9c6 (*)
    .byte   $b9,$e6,$f9,$85,$e1,$4c,$7c,$f7 ; $f9ce (*)
    .byte   $01,$01,$00,$ff,$00,$00,$ff,$01 ; $f9d6 (*)
    .byte   $ff,$01,$00,$00,$01,$ff,$00,$ff ; $f9de (*)
    .byte   $ff,$00,$00,$ff,$01,$00,$01,$01 ; $f9e6 (*)
    .byte   $00,$ff,$00,$ff,$01,$ff,$00,$01 ; $f9ee (*)
    .byte   $18,$17,$17,$16,$16,$15,$14,$14 ; $f9f6 (*)
    .byte   $13,$12,$12,$11,$11,$10,$0f,$0f ; $f9fe (*)
    .byte   $0e,$0d,$0d,$0c,$0c,$0b,$0a,$0a ; $fa06 (*)
    .byte   $09,$09,$08,$08,$07,$07,$06,$06 ; $fa0e (*)
    .byte   $2b,$2a,$29,$28,$27,$26,$25,$24 ; $fa16 (*)
    .byte   $23,$22,$21,$20,$1f,$1e,$1d,$1c ; $fa1e (*)
    .byte   $1b,$1a,$19,$18,$17,$16,$15,$14 ; $fa26 (*)
    .byte   $13,$12,$11,$10,$0f,$0e,$0d,$0c ; $fa2e (*)
    .byte   $c6,$d2,$d0,$0e,$a5,$c4,$29,$fe ; $fa36 (*)
    .byte   $85,$c4,$a9,$e0,$95,$b4,$a9,$00 ; $fa3e (*)
    .byte   $95,$a4,$4c,$2e,$f2             ; $fa46 (*)
    
Lfa4b
    cpx     ram_8C                  ;3        
    bne     Lfa63                   ;2/3      
    lda     ram_8B                  ;3         *
    and     #$0f                    ;2         *
    beq     Lfa5f                   ;2/3       *
    lsr                             ;2         *
    bcs     Lfa5f                   ;2/3       *
    lda     elevator_y_pos                  ;3         *
    sta     player_Y_pos,x                ;4         *
    jmp     Lf22e                   ;3   =  26 *
    
Lfa5f
    lda     #$00                    ;2         *
    sta     ram_8C                  ;3   =   5 *
Lfa63
    lda     #$01                    ;2        
    sta     ram_D3                  ;3        
    jmp     Lfd0e                   ;3   =   8
    
    ldy     enemy_speed                  ;3        
    lda     Lfacb,y                 ;4        
    sta     ram_DE                  ;3        
    sta     ram_DF                  ;3   =  13
Lfa73
    cpx     ram_8C                  ;3        
    bne     Lfa8b                   ;2/3      
    lda     ram_8B                  ;3        
    and     #$0f                    ;2        
    beq     Lfa87                   ;2/3      
    lsr                             ;2        
    bcs     Lfa87                   ;2/3      
    lda     elevator_y_pos                  ;3         *
    sta     player_Y_pos,x                ;4         *
    jmp     Lf22e                   ;3   =  26 *
    
Lfa87
    lda     #$00                    ;2        
    sta     ram_8C                  ;3   =   5
Lfa8b
    lda     player_Y_pos                  ;3        
    lsr                             ;2        
    sec                             ;2        
    sbc     player_Y_pos,x                ;4        
    bcs     Lfa97                   ;2/3      
    lda     #$ff                    ;2        
    bmi     Lfa9b                   ;2/3 =  17
Lfa97
    beq     Lfa9b                   ;2/3      
    lda     #$01                    ;2   =   4
Lfa9b
    sta     ram_E0                  ;3        
    lda     player_X_pos                  ;3        
    sec                             ;2        
    sbc     player_X_pos,x                ;4        
    bcs     Lfab6                   ;2/3      
    cmp     #$fc                    ;2        
    bcc     Lfac6                   ;2/3      
    lda     ram_DF                  ;3        
    cmp     #$10                    ;2        
    bcc     Lfab2                   ;2/3      
    lda     #$0f                    ;2        
    sta     ram_DF                  ;3   =  30
Lfab2
    lda     #$ff                    ;2        
    bmi     Lfac6                   ;2/3 =   4
Lfab6
    beq     Lfac6                   ;2/3      
    cmp     #$03                    ;2        
    bcs     Lfac6                   ;2/3      
    lda     ram_DF                  ;3        
    cmp     #$10                    ;2        
    bcc     Lfac6                   ;2/3      
    lda     #$0f                    ;2        
    sta     ram_DF                  ;3   =  18
Lfac6
    sta     ram_E1                  ;3        
    jmp     Lf77c                   ;3   =   6
    
Lfacb
    .byte   $2f,$2e,$2d,$2c,$2b,$2a,$29,$28 ; $facb (*)
    .byte   $27,$26,$25,$24,$23,$22,$21,$20 ; $fad3 (*)
    .byte   $1f,$1e,$1d,$1c,$1b,$1a,$19,$18 ; $fadb (*)
    .byte   $17,$16,$15,$14,$13,$12,$11     ; $fae3 (*)
    .byte   $10                             ; $faea (D)
    .byte   $37,$36,$35,$34,$33,$32,$31,$30 ; $faeb (*)
    .byte   $2f,$2e,$2d,$2c,$2b,$2a,$29,$28 ; $faf3 (*)
    .byte   $27,$26,$25,$24,$23,$22,$21,$20 ; $fafb (*)
    .byte   $1f,$1e,$1d,$1c,$1b,$1a,$19     ; $fb03 (*)
    .byte   $18                             ; $fb0a (D)
    
Lfb0b
    inc     ram_CC,x                ;6        
    lda     ram_CC,x                ;4        
    ldy     enemy_speed                  ;3        
    cmp     Lfb35,y                 ;4        
    bcc     Lfb1a                   ;2/3      
    lda     #$19                    ;2        
    sta     ram_BC,x                ;4   =  25
Lfb1a
    cpx     ram_8C                  ;3        
    bne     Lfb32                   ;2/3      
    lda     ram_8B                  ;3         *
    and     #$0f                    ;2         *
    beq     Lfb2e                   ;2/3       *
    lsr                             ;2         *
    bcs     Lfb2e                   ;2/3       *
    lda     elevator_y_pos                  ;3         *
    sta     player_Y_pos,x                ;4         *
    jmp     Lf22e                   ;3   =  26 *
    
Lfb2e
    lda     #$00                    ;2         *
    sta     ram_8C                  ;3   =   5 *
Lfb32
    jmp     Lfd0e                   ;3   =   3
    
Lfb35
    .byte   $0c,$0c,$0c,$0d,$0d,$0d,$0e,$0e ; $fb35 (*)
    .byte   $0f,$0f,$10,$10,$11,$11,$12,$12 ; $fb3d (*)
    .byte   $13,$13,$14,$14,$15,$15,$16,$16 ; $fb45 (*)
    .byte   $17,$17,$18,$18,$19,$19,$1a     ; $fb4d (*)
    .byte   $1a                             ; $fb54 (D)
    .byte   $08,$08,$08,$08,$09,$09,$09,$09 ; $fb55 (*)
    .byte   $0a,$0a,$0a,$0a,$0b,$0b,$0b,$0b ; $fb5d (*)
    .byte   $0c,$0c,$0c,$0c,$0d,$0d,$0e,$0e ; $fb65 (*)
    .byte   $0f,$0f,$10,$10,$11,$11,$12     ; $fb6d (*)
    .byte   $12                             ; $fb74 (D)
    .byte   $0d,$0e,$0f,$0f,$10,$11,$12,$12 ; $fb75 (*)
    .byte   $d6,$cc,$d0,$0b,$a9,$e0,$95,$b4 ; $fb7d (*)
    .byte   $a9,$00,$95,$a4,$4c,$2e,$f2,$e4 ; $fb85 (*)
    .byte   $8c,$d0,$14,$a5,$8b,$29,$0f,$f0 ; $fb8d (*)
    .byte   $0a,$4a,$b0,$07,$a5,$da,$95,$b4 ; $fb95 (*)
    .byte   $4c,$2e,$f2,$a9,$00,$85,$8c,$4c ; $fb9d (*)
    .byte   $0e,$fd,$4c,$2e,$f2,$e4,$8c,$d0 ; $fba5 (*)
    .byte   $14,$a5,$8b,$29,$0f,$f0,$0a,$4a ; $fbad (*)
    .byte   $b0,$07,$a5,$da,$95,$b4,$4c,$2e ; $fbb5 (*)
    .byte   $f2,$a9,$00,$85,$8c,$b4,$c4,$b5 ; $fbbd (*)
    .byte   $cc,$c9,$03,$90,$19,$a5,$82,$4d ; $fbc5 (*)
    .byte   $84,$02,$29,$03,$95,$c4,$84,$dd ; $fbcd (*)
    .byte   $49,$02,$c5,$dd,$d0,$04,$49,$02 ; $fbd5 (*)
    .byte   $95,$c4,$a9,$00,$95,$cc,$a4,$94 ; $fbdd (*)
    .byte   $b9,$6b,$f6,$85,$de,$4c,$71,$f4 ; $fbe5 (*)
    
Lfbed
    lda     ram_DE                  ;3        
    lsr                             ;2        
    lsr                             ;2        
    lsr                             ;2        
    lsr                             ;2        
    and     #$03                    ;2        
    sta     ram_E2                  ;3        
    lda     ram_DE                  ;3        
    and     #$0f                    ;2        
    ora     #$40                    ;2        
    tax                             ;2        
    jmp     Lfc0a                   ;3   =  28
    
Lfc01
    lda     ram_DE                  ;3        
    and     #$3f                    ;2        
    tax                             ;2        
    lda     #$00                    ;2        
    sta     ram_E2                  ;3   =  12
Lfc0a
    lda     Lfe16,x                 ;4        
    lsr                             ;2        
    tay                             ;2        
    and     #$7c                    ;2        
    and     maincounter                  ;3        
    bcs     Lfc24                   ;2/3      
    bne     Lfc31                   ;2/3      
    tya                             ;2        
    and     #$03                    ;2        
    beq     Lfc34                   ;2/3      
    tay                             ;2        
    lda.wy  ram_9A,y                ;4        
    beq     Lfc34                   ;2/3      
    bne     Lfc31                   ;2/3 =  33
Lfc24
    bne     Lfc34                   ;2/3      
    tya                             ;2        
    and     #$03                    ;2        
    beq     Lfc31                   ;2/3      
    tay                             ;2        
    lda.wy  ram_9A,y                ;4        
    bne     Lfc34                   ;2/3 =  16
Lfc31
    clc                             ;2        
    bcc     Lfc35                   ;2/3 =   4
Lfc34
    sec                             ;2   =   2
Lfc35
    ldx     ram_DC                  ;3        
    lda     ram_E2                  ;3        
    adc     #$00                    ;2        
    rts                             ;6   =  14
    
Lfc3c
    lda     #$67                    ;2        
    sta     ram_E3                  ;3        
    lda     #$fc                    ;2        
    sta     ram_E4                  ;3        
    lda     ram_DD                  ;3        
    bne     Lfc4b                   ;2/3      
    jmp     Lfd0e                   ;3   =  18
    
Lfc4b
    and     #$01                    ;2        
    beq     Lfc76                   ;2/3      
    lda     ram_E0                  ;3        
    clc                             ;2        
    adc     player_Y_pos,x                ;4        
    sta     ram_DE                  ;3        
    tay                             ;2        
    lda     player_X_pos,x                ;4        
    lsr                             ;2        
    lsr                             ;2        
    tax                             ;2        
    lda     Lfec0,x                 ;4        
    bmi     Lfc64                   ;2/3      
    jmp     Lffc8                   ;3   =  37
    
Lfc64
    jmp     Lffd3                   ;3   =   3
    
    and     Lfee0,x                 ;4        
    bne     Lfc76                   ;2/3      
    ldx     ram_DC                  ;3        
    lda     ram_DD                  ;3        
    ora     #$02                    ;2        
    sta     ram_DD                  ;3        
    bne     Lfc7c                   ;2/3 =  19
Lfc76
    ldx     ram_DC                  ;3        
    lda     player_Y_pos,x                ;4        
    sta     ram_DE                  ;3   =  10
Lfc7c
    lda     #$a1                    ;2        
    sta     ram_E3                  ;3        
    lda     #$fc                    ;2        
    sta     ram_E4                  ;3        
    lda     ram_DD                  ;3        
    and     #$04                    ;2        
    beq     Lfcae                   ;2/3      
    lda     ram_E1                  ;3        
    clc                             ;2        
    adc     player_X_pos,x                ;4        
    sta     ram_DF                  ;3        
    lsr                             ;2        
    lsr                             ;2        
    tax                             ;2        
    ldy     ram_DE                  ;3        
    lda     Lfec0,x                 ;4        
    bmi     Lfc9e                   ;2/3      
    jmp     Lffc8                   ;3   =  47
    
Lfc9e
    jmp     Lffd3                   ;3   =   3
    
    and     Lfee0,x                 ;4        
    bne     Lfcae                   ;2/3      
    lda     ram_DD                  ;3        
    ora     #$08                    ;2        
    sta     ram_DD                  ;3        
    bne     Lfcb4                   ;2/3 =  16
Lfcae
    ldx     ram_DC                  ;3        
    lda     player_X_pos,x                ;4        
    sta     ram_DF                  ;3   =  10
Lfcb4
    ldx     ram_DC                  ;3        
    lda     ram_DD                  ;3        
    and     #$0a                    ;2        
    beq     Lfcf9                   ;2/3      
    ldx     ram_DC                  ;3        
    cpx     #$07                    ;2        
    beq     Lfcd8                   ;2/3      
    lda     obj_0_y_pos                  ;3        
    cmp     ram_DE                  ;3        
    bne     Lfcd8                   ;2/3      
    lda     ram_CB                  ;3        
    bne     Lfcd8                   ;2/3      
    lda     obj_0_x_pos                  ;3        
    sbc     ram_DF                  ;3        
    bpl     Lfcd4                   ;2/3      
    eor     #$ff                    ;2   =  40 *
Lfcd4
    cmp     #$04                    ;2        
    bcc     Lfcf9                   ;2/3 =   4
Lfcd8
    ldx     #$07                    ;2        
    lda     ram_C4                  ;3        
    lsr                             ;2        
    bcc     Lfce0                   ;2/3      
    dex                             ;2   =  11 *
Lfce0
    dex                             ;2        
    beq     Lfd04                   ;2/3!     
    cpx     ram_DC                  ;3        
    beq     Lfce0                   ;2/3      
    lda     ram_DE                  ;3        
    cmp     player_Y_pos,x                ;4        
    bne     Lfce0                   ;2/3      
    lda     player_X_pos,x                ;4        
    sbc     ram_DF                  ;3        
    bpl     Lfcf5                   ;2/3      
    eor     #$ff                    ;2   =  29
Lfcf5
    cmp     #$04                    ;2        
    bcs     Lfce0                   ;2/3 =   4
Lfcf9
    ldx     ram_DC                  ;3        
    ldy     ram_BC,x                ;4        
    cpy     #$04                    ;2        
    bcs     Lfd0e                   ;2/3      
    jmp     Lf4b9                   ;3   =  14 *
    
Lfd04
    ldx     ram_DC                  ;3        
    lda     ram_DF                  ;3        
    sta     player_X_pos,x                ;4        
    lda     ram_DE                  ;3        
    sta     player_Y_pos,x                ;4   =  17
Lfd0e
    lda     ram_8B                  ;3        
    and     #$0f                    ;2        
    beq     Lfd29                   ;2/3      
    lsr                             ;2        
    bcc     Lfd29                   ;2/3      
    lda     player_X_pos,x                ;4        
    adc     #$04                    ;2        
    sbc     elevator_x_pos                  ;3        
    cmp     #$04                    ;2        
    bcs     Lfd29                   ;2/3      
    lda     player_Y_pos,x                ;4        
    cmp     elevator_y_pos                  ;3        
    bne     Lfd29                   ;2/3      
    stx     ram_8C                  ;3   =  36
Lfd29
    jmp     Lf22e                   ;3   =   3
    
Lfd2c
    .byte   $28                             ; $fd2c (*)
    .byte   $18                             ; $fd2d (D)
    .byte   $35,$2e,$3a,$31,$38,$28,$29,$33 ; $fd2e (*)
    .byte   $1c,$3b,$2f,$18,$0f,$0a,$31,$3a ; $fd36 (*)
    .byte   $09,$20,$26,$01,$0f,$38,$16,$18 ; $fd3e (*)
    .byte   $2f,$2f,$29,$39,$1c,$1b,$2f,$14 ; $fd46 (*)
    .byte   $3a,$0a,$01,$37,$06,$35,$36,$26 ; $fd4e (*)
    .byte   $0f,$37,$01,$28,$2e,$1b,$29,$3b ; $fd56 (*)
    .byte   $0a,$0f,$3a,$38,$08,$16,$3b,$24 ; $fd5e (*)
    .byte   $26,$2f,$36,$3c,$3b,$29         ; $fd66 (*)
Lfd6c
    .byte   $2e                             ; $fd6c (*)
    .byte   $30                             ; $fd6d (D)
    .byte   $22,$5a,$38,$20,$36,$2e,$58,$54 ; $fd6e (*)
    .byte   $40,$38,$50,$40,$40,$28,$20,$38 ; $fd76 (*)
    .byte   $40,$40,$4c,$40,$38,$36,$20,$30 ; $fd7e (*)
    .byte   $54,$46,$68,$12,$20,$66,$46,$64 ; $fd86 (*)
    .byte   $38,$28,$40,$3e,$54,$22,$42,$40 ; $fd8e (*)
    .byte   $50,$3e,$40,$2e,$5a,$32,$68,$38 ; $fd96 (*)
    .byte   $28,$18,$38,$36,$5a,$20,$34,$40 ; $fd9e (*)
    .byte   $4c,$46,$42,$38,$34             ; $fda6 (*)
Lfdab
    .byte   $68                             ; $fdab (*)
Lfdac
    .byte   $90,$ff,$00,$00,$70,$00,$70,$00 ; $fdac (D)
    .byte   $90,$ff,$90,$ff,$70,$00,$00     ; $fdb4 (D)
Lfdbb
    .byte   $00                             ; $fdbb (D)
Lfdbc
    .byte   $f0,$00,$f0,$00,$f0,$00,$00,$00 ; $fdbc (D)
    .byte   $10,$ff,$00,$00,$10,$ff,$10,$ff ; $fdc4 (D)
Lfdcc
    .byte   $d9,$d9,$d9,$d9,$3c,$b0,$b0,$b0 ; $fdcc (*)
    .byte   $b0                             ; $fdd4 (*)
    .byte   $e9                             ; $fdd5 (D)
    .byte   $e9,$e9,$1d,$1d,$1d,$1d,$ab,$ab ; $fdd6 (*)
    .byte   $e9,$e9,$e9,$e9                 ; $fdde (D)
    .byte   $71,$36                         ; $fde2 (*)
    .byte   $4b,$6a,$6a,$0b                 ; $fde4 (D)
    .byte   $a7,$a7,$aa,$aa,$aa,$aa,$7d,$7d ; $fde8 (*)
    .byte   $7d                             ; $fdf0 (*)
Lfdf1
    .byte   $f3,$f3,$f3,$f3,$f5,$f5,$f5,$f5 ; $fdf1 (*)
    .byte   $f5                             ; $fdf9 (*)
    .byte   $f7                             ; $fdfa (D)
    .byte   $f7,$f7,$f6,$f6,$f6,$f6,$f6,$f6 ; $fdfb (*)
    .byte   $f6,$f6,$f6,$f6                 ; $fe03 (D)
    .byte   $f9,$fa                         ; $fe07 (*)
    .byte   $fa,$fa,$fa,$fb                 ; $fe09 (D)
    .byte   $fb,$fb,$fb,$fb,$fb,$fb,$fb,$fb ; $fe0d (*)
    .byte   $fb                             ; $fe15 (*)
Lfe16
    .byte   $3c,$f8,$1e,$3a                 ; $fe16 (*)
    .byte   $1c                             ; $fe1a (D)
    .byte   $78,$1a,$38                     ; $fe1b (*)
    .byte   $0a                             ; $fe1e (D)
    .byte   $04,$04,$04                     ; $fe1f (*)
    .byte   $04                             ; $fe22 (D)
    .byte   $04,$18,$18                     ; $fe23 (*)
    .byte   $18                             ; $fe26 (D)
    .byte   $18,$18,$18                     ; $fe27 (*)
    .byte   $02                             ; $fe2a (D)
    .byte   $02                             ; $fe2b (*)
    .byte   $02                             ; $fe2c (D)
    .byte   $02                             ; $fe2d (*)
    .byte   $08                             ; $fe2e (D)
    .byte   $08,$08,$08,$08,$08,$08,$08,$08 ; $fe2f (*)
    .byte   $08,$08,$08,$08,$08,$03,$03,$03 ; $fe37 (*)
    .byte   $03,$03,$03,$19,$19,$19,$19,$19 ; $fe3f (*)
    .byte   $05,$05,$05,$05,$05,$0b,$39,$0f ; $fe47 (*)
    .byte   $0f,$0f,$0f,$0f,$00,$00,$00     ; $fe4f (*)
    .byte   $0e                             ; $fe56 (D)
    .byte   $38,$06,$0a                     ; $fe57 (*)
    .byte   $04                             ; $fe5a (D)
    .byte   $18                             ; $fe5b (*)
    .byte   $02                             ; $fe5c (D)
    .byte   $08                             ; $fe5d (*)
    .byte   $03,$19,$05                     ; $fe5e (D)
    .byte   $0b                             ; $fe61 (*)
    .byte   $07                             ; $fe62 (D)
    .byte   $39,$0f                         ; $fe63 (*)
    .byte   $00                             ; $fe65 (D)
Lfe66
    .byte   $00                             ; $fe66 (D)
    .byte   $1c,$1c                         ; $fe67 (*)
    .byte   $20                             ; $fe69 (D)
    .byte   $30,$30,$2a,$15,$2a,$2a,$3e,$7c ; $fe6a (*)
    .byte   $14,$14,$30,$30,$30,$30,$30     ; $fe72 (*)
    .byte   $1d                             ; $fe79 (D)
    .byte   $19                             ; $fe7a (*)
    .byte   $01                             ; $fe7b (D)
    .byte   $01,$01,$01,$01,$01,$01,$01     ; $fe7c (*)
    .byte   $01                             ; $fe83 (D)
    .byte   $01,$01,$01,$01,$01,$01,$01     ; $fe84 (*)
    .byte   $08                             ; $fe8b (D)
    .byte   $08,$08,$08,$08,$08,$08,$08,$00 ; $fe8c (*)
    .byte   $00,$00,$00,$00,$00,$00,$00     ; $fe94 (*)
Lfe9b
    .byte   $13,$13,$13,$13,$12,$20,$20,$20 ; $fe9b (*)
    .byte   $20,$02,$02,$02,$0a,$0a,$0a,$0a ; $fea3 (*)
    .byte   $02,$02                         ; $feab (*)
    .byte   $03                             ; $fead (D)
    .byte   $03,$03,$03,$04,$00,$04         ; $feae (*)
    .byte   $13,$13                         ; $feb4 (D)
    .byte   $13,$03,$03,$02,$02,$02,$02,$00 ; $feb6 (*)
    .byte   $00,$00                         ; $febe (*)
Lfec0
    .byte   $00                             ; $fec0 (*)
    .byte   $00,$00,$00,$00,$00,$00,$00,$be ; $fec1 (D)
    .byte   $be,$be,$be,$be,$be,$be,$be,$bf ; $fec9 (D)
    .byte   $bf,$bf,$bf,$bf,$bf,$bf,$bf,$01 ; $fed1 (D)
    .byte   $01,$01,$01,$01,$01,$01         ; $fed9 (D)
    .byte   $01                             ; $fedf (*)
Lfee0
    .byte   $80                             ; $fee0 (*)
    .byte   $40,$20,$10,$08,$04,$02,$01,$01 ; $fee1 (D)
    .byte   $02,$04,$08,$10,$20,$40,$80,$80 ; $fee9 (D)
    .byte   $40,$20,$10,$08,$04,$02,$01,$01 ; $fef1 (D)
    .byte   $02,$04,$08,$10,$20,$40         ; $fef9 (D)
    .byte   $80                             ; $feff (*)
    
Lff00
    lda     game_mode                  ;3        
    bmi     Lff1a                   ;2/3      
    lda     ram_A0,x                ;4        
    beq     Lff0d                   ;2/3      
    tya                             ;2        
    cmp     ram_A0,x                ;4        
    bcs     Lff1a                   ;2/3 =  19
Lff0d
    sty     ram_A0,x                ;4        
    lda     Lfe66,y                 ;4        
    sta     ram_9E,x                ;4        
    lda     #$c0                    ;2        
    sta     AUDV0,x                 ;4        
    sta     ram_A2,x                ;4   =  22
Lff1a
    rts                             ;6   =   6
    
    .byte   $00,$00,$00,$00,$00,$00,$00,$00 ; $ff1b (*)
    .byte   $00,$00,$00,$00,$00,$00,$00,$00 ; $ff23 (*)
    .byte   $00,$00,$00,$00,$00,$00,$00,$00 ; $ff2b (*)
    .byte   $00,$00,$00,$00,$00,$00,$00,$00 ; $ff33 (*)
    .byte   $00,$00,$00,$00,$00,$00,$00,$00 ; $ff3b (*)
    .byte   $00,$00,$00,$00,$00,$00,$00,$00 ; $ff43 (*)
    .byte   $00,$00,$00,$00,$00,$00,$00,$00 ; $ff4b (*)
    .byte   $00,$00,$00,$00,$00,$00,$00,$00 ; $ff53 (*)
    .byte   $00,$00,$00,$00,$00,$00,$00,$00 ; $ff5b (*)
    .byte   $00,$00,$00,$00,$00,$00,$00,$00 ; $ff63 (*)
    .byte   $00,$00,$00,$00,$00,$00,$00,$00 ; $ff6b (*)
    .byte   $00,$00,$00,$00,$00,$00,$00,$00 ; $ff73 (*)
    .byte   $00,$00,$00,$00,$00,$00,$00,$00 ; $ff7b (*)
    .byte   $00,$00,$00,$00,$00,$00,$00,$00 ; $ff83 (*)
    .byte   $00,$00,$00,$00,$00,$00,$00,$00 ; $ff8b (*)
    .byte   $00,$00,$00,$00,$00,$00,$00,$00 ; $ff93 (*)
    .byte   $00,$00,$00,$00,$00,$00,$00,$00 ; $ff9b (*)
    .byte   $00,$00,$00,$00,$00,$00,$00,$00 ; $ffa3 (*)
    .byte   $00,$00,$00,$00,$00,$00,$00,$00 ; $ffab (*)
    .byte   $00,$00,$00,$00,$00,$00,$00,$00 ; $ffb3 (*)
    .byte   $00,$00,$00,$00,$00,$00,$00,$00 ; $ffbb (*)
    .byte   $00,$00,$00,$00,$00             ; $ffc3 (*)
    
Lffc8
    lda     $9ff6                   ;4        
    lda     (ram_D4),y              ;5         *
    cmp     Lfff9                   ;4         *
    jmp.ind (ram_E3)                ;5   =  18
Lffd3
    lda     $9ff6                   ;4        
    lda     (ram_D6),y              ;5         *
    cmp     Lfff9                   ;4         *
    jmp.ind (ram_E3)                ;5        
Break
    lda     $dff8                   ;4         *
    jmp     $d100                   ;3   =  25 *
    
    .byte   $ad,$f6,$9f                     ; $ffe4 (*)
    
Lffe7
    jmp.ind (ram_E1)                ;5        
    lda     $bff7                   ;4         *
    jmp.ind (ram_E1)                ;5   =  14 *
Lfff0
    lda     $dff8                   ;4        
    jmp.ind (ram_E1)                ;5   =   9 *
    
Lfff6
    .byte   $00                             ; $fff6 (D)
Lfff7
    .byte   $00                             ; $fff7 (D)
Lfff8
    .byte   $00                             ; $fff8 (D)
Lfff9
    .byte   $00                             ; $fff9 (D)
    .byte   $de,$ff,$de,$ff,$de             ; $fffa (*)
    .byte   $ff                             ; $ffff (*)
