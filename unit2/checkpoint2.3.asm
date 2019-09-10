  .file [name="checkpoint2.3.bin", type="bin", segments="XMega65Bin"]
.segmentdef XMega65Bin [segments="Syscall, Code, Data, Stack, Zeropage"]
.segmentdef Syscall [start=$8000, max=$81ff]
.segmentdef Code [start=$8200, min=$8200, max=$bdff]
.segmentdef Data [startAfter="Code", min=$8200, max=$bdff]
.segmentdef Stack [min=$be00, max=$beff, fill]
.segmentdef Zeropage [min=$bf00, max=$bfff, fill]
  .label RASTER = $d012
  .label VIC_MEMORY = $d018
  .label SCREEN = $400
  .label BGCOL = $d021
  .label COLS = $d800
  .const BLACK = 0
  .const WHITE = 1
  .const JMP = $4c
  .const NOP = $ea
.segment Code
main: {
    .label sc = 4
    .label msg = 2
    lda #$14
    sta VIC_MEMORY
    ldx #' '
    lda #<SCREEN
    sta.z memset.str
    lda #>SCREEN
    sta.z memset.str+1
    lda #<$28*$19
    sta.z memset.num
    lda #>$28*$19
    sta.z memset.num+1
    jsr memset
    ldx #WHITE
    lda #<COLS
    sta.z memset.str
    lda #>COLS
    sta.z memset.str+1
    lda #<$28*$19
    sta.z memset.num
    lda #>$28*$19
    sta.z memset.num+1
    jsr memset
    lda #<SCREEN+$28
    sta.z sc
    lda #>SCREEN+$28
    sta.z sc+1
    lda #<MESSAGE
    sta.z msg
    lda #>MESSAGE
    sta.z msg+1
  b1:
    ldy #0
    lda (msg),y
    cmp #0
    bne b2
  b3:
    lda #$36
    cmp RASTER
    beq b4
    lda #$42
    cmp RASTER
    beq b4
    lda #BLACK
    sta BGCOL
    jmp b3
  b4:
    lda #WHITE
    sta BGCOL
    jmp b3
  b2:
    ldy #0
    lda (msg),y
    sta (sc),y
    inc.z sc
    bne !+
    inc.z sc+1
  !:
    inc.z msg
    bne !+
    inc.z msg+1
  !:
    jmp b1
}
// Copies the character c (an unsigned char) to the first num characters of the object pointed to by the argument str.
// memset(void* zeropage(4) str, byte register(X) c, word zeropage(2) num)
memset: {
    .label end = 2
    .label dst = 4
    .label num = 2
    .label str = 4
    lda.z num
    bne !+
    lda.z num+1
    beq breturn
  !:
    lda.z end
    clc
    adc.z str
    sta.z end
    lda.z end+1
    adc.z str+1
    sta.z end+1
  b2:
    lda.z dst+1
    cmp.z end+1
    bne b3
    lda.z dst
    cmp.z end
    bne b3
  breturn:
    rts
  b3:
    txa
    ldy #0
    sta (dst),y
    inc.z dst
    bne !+
    inc.z dst+1
  !:
    jmp b2
}
CPUKIL: {
    rts
}
RESERVED: {
    rts
}
VF011WR: {
    rts
}
VF011RD: {
    rts
}
ALTTABKEY: {
    rts
}
RESTORKEY: {
    rts
}
PAGEFAULT: {
    rts
}
syscall3F: {
    lda #'>'
    sta SCREEN+$4f
    rts
}
syscall3E: {
    lda #'<'
    sta SCREEN+$4e
    rts
}
syscall3D: {
    lda #'>'
    sta SCREEN+$4f
    rts
}
syscall3C: {
    lda #'<'
    sta SCREEN+$4e
    rts
}
syscall3B: {
    lda #'>'
    sta SCREEN+$4f
    rts
}
syscall3A: {
    lda #'<'
    sta SCREEN+$4e
    rts
}
syscall39: {
    lda #'>'
    sta SCREEN+$4f
    rts
}
syscall38: {
    lda #'<'
    sta SCREEN+$4e
    rts
}
syscall37: {
    lda #'>'
    sta SCREEN+$4f
    rts
}
syscall36: {
    lda #'<'
    sta SCREEN+$4e
    rts
}
syscall35: {
    lda #'>'
    sta SCREEN+$4f
    rts
}
syscall34: {
    lda #'<'
    sta SCREEN+$4e
    rts
}
syscall33: {
    lda #'>'
    sta SCREEN+$4f
    rts
}
syscall32: {
    lda #'<'
    sta SCREEN+$4e
    rts
}
syscall31: {
    lda #'>'
    sta SCREEN+$4f
    rts
}
syscall30: {
    lda #'<'
    sta SCREEN+$4e
    rts
}
syscall2F: {
    lda #'>'
    sta SCREEN+$4f
    rts
}
syscall2E: {
    lda #'<'
    sta SCREEN+$4e
    rts
}
syscall2D: {
    lda #'>'
    sta SCREEN+$4f
    rts
}
syscall2C: {
    lda #'<'
    sta SCREEN+$4e
    rts
}
syscall2B: {
    lda #'>'
    sta SCREEN+$4f
    rts
}
syscall2A: {
    lda #'<'
    sta SCREEN+$4e
    rts
}
syscall29: {
    lda #'>'
    sta SCREEN+$4f
    rts
}
syscall28: {
    lda #'<'
    sta SCREEN+$4e
    rts
}
syscall27: {
    lda #'>'
    sta SCREEN+$4f
    rts
}
syscall26: {
    lda #'<'
    sta SCREEN+$4e
    rts
}
syscall25: {
    lda #'>'
    sta SCREEN+$4f
    rts
}
syscall24: {
    lda #'<'
    sta SCREEN+$4e
    rts
}
syscall23: {
    lda #'>'
    sta SCREEN+$4f
    rts
}
syscall22: {
    lda #'<'
    sta SCREEN+$4e
    rts
}
syscall21: {
    lda #'>'
    sta SCREEN+$4f
    rts
}
syscall20: {
    lda #'<'
    sta SCREEN+$4e
    rts
}
syscall1F: {
    lda #'>'
    sta SCREEN+$4f
    rts
}
syscall1E: {
    lda #'<'
    sta SCREEN+$4e
    rts
}
syscall1D: {
    lda #'>'
    sta SCREEN+$4f
    rts
}
syscall1C: {
    lda #'<'
    sta SCREEN+$4e
    rts
}
syscall1B: {
    lda #'>'
    sta SCREEN+$4f
    rts
}
syscall1A: {
    lda #'<'
    sta SCREEN+$4e
    rts
}
syscall19: {
    lda #'>'
    sta SCREEN+$4f
    rts
}
syscall18: {
    lda #'<'
    sta SCREEN+$4e
    rts
}
syscall17: {
    lda #'>'
    sta SCREEN+$4f
    rts
}
syscall16: {
    lda #'<'
    sta SCREEN+$4e
    rts
}
syscall15: {
    lda #'>'
    sta SCREEN+$4f
    rts
}
syscall14: {
    lda #'<'
    sta SCREEN+$4e
    rts
}
syscall13: {
    lda #'>'
    sta SCREEN+$4f
    rts
}
SECUREEXIT: {
    lda #'<'
    sta SCREEN+$4e
    rts
}
SECUREENTER: {
    lda #'>'
    sta SCREEN+$4f
    rts
}
syscall10: {
    lda #'<'
    sta SCREEN+$4e
    rts
}
syscall0F: {
    lda #'>'
    sta SCREEN+$4f
    rts
}
syscall0E: {
    lda #'<'
    sta SCREEN+$4e
    rts
}
syscall0D: {
    lda #'>'
    sta SCREEN+$4f
    rts
}
syscall0C: {
    lda #'<'
    sta SCREEN+$4e
    rts
}
syscall0B: {
    lda #'>'
    sta SCREEN+$4f
    rts
}
syscall0A: {
    lda #'<'
    sta SCREEN+$4e
    rts
}
syscall09: {
    lda #'>'
    sta SCREEN+$4f
    rts
}
syscall08: {
    lda #'<'
    sta SCREEN+$4e
    rts
}
syscall07: {
    lda #'>'
    sta SCREEN+$4f
    rts
}
syscall06: {
    lda #'<'
    sta SCREEN+$4e
    rts
}
syscall05: {
    lda #'>'
    sta SCREEN+$4f
    rts
}
syscall04: {
    lda #'<'
    sta SCREEN+$4e
    rts
}
syscall03: {
    lda #'>'
    sta SCREEN+$4f
    rts
}
syscall02: {
    lda #'<'
    sta SCREEN+$4e
    rts
}
syscall01: {
    lda #'>'
    sta SCREEN+$4f
    rts
}
.segment Data
  MESSAGE: .text "checkpoint 2.3 by kaur0494"
  .byte 0
.segment Syscall
SYSCALLS:
  .byte JMP
  .word syscall01
  .byte NOP
  .byte JMP
  .word syscall02
  .byte NOP
  .byte JMP
  .word syscall03
  .byte NOP
  .byte JMP
  .word syscall04
  .byte NOP
  .byte JMP
  .word syscall05
  .byte NOP
  .byte JMP
  .word syscall06
  .byte NOP
  .byte JMP
  .word syscall07
  .byte NOP
  .byte JMP
  .word syscall08
  .byte NOP
  .byte JMP
  .word syscall09
  .byte NOP
  .byte JMP
  .word syscall0A
  .byte NOP
  .byte JMP
  .word syscall0B
  .byte NOP
  .byte JMP
  .word syscall0C
  .byte NOP
  .byte JMP
  .word syscall0D
  .byte NOP
  .byte JMP
  .word syscall0E
  .byte NOP
  .byte JMP
  .word syscall0F
  .byte NOP
  .byte JMP
  .word syscall10
  .byte NOP
  .byte JMP
  .word SECUREENTER
  .byte NOP
  .byte JMP
  .word SECUREEXIT
  .byte NOP
  .byte JMP
  .word syscall13
  .byte NOP
  .byte JMP
  .word syscall14
  .byte NOP
  .byte JMP
  .word syscall15
  .byte NOP
  .byte JMP
  .word syscall16
  .byte NOP
  .byte JMP
  .word syscall17
  .byte NOP
  .byte JMP
  .word syscall18
  .byte NOP
  .byte JMP
  .word syscall19
  .byte NOP
  .byte JMP
  .word syscall1A
  .byte NOP
  .byte JMP
  .word syscall1B
  .byte NOP
  .byte JMP
  .word syscall1C
  .byte NOP
  .byte JMP
  .word syscall1D
  .byte NOP
  .byte JMP
  .word syscall1E
  .byte NOP
  .byte JMP
  .word syscall1F
  .byte NOP
  .byte JMP
  .word syscall20
  .byte NOP
  .byte JMP
  .word syscall21
  .byte NOP
  .byte JMP
  .word syscall22
  .byte NOP
  .byte JMP
  .word syscall23
  .byte NOP
  .byte JMP
  .word syscall24
  .byte NOP
  .byte JMP
  .word syscall25
  .byte NOP
  .byte JMP
  .word syscall26
  .byte NOP
  .byte JMP
  .word syscall27
  .byte NOP
  .byte JMP
  .word syscall28
  .byte NOP
  .byte JMP
  .word syscall29
  .byte NOP
  .byte JMP
  .word syscall2A
  .byte NOP
  .byte JMP
  .word syscall2B
  .byte NOP
  .byte JMP
  .word syscall2C
  .byte NOP
  .byte JMP
  .word syscall2D
  .byte NOP
  .byte JMP
  .word syscall2E
  .byte NOP
  .byte JMP
  .word syscall2F
  .byte NOP
  .byte JMP
  .word syscall30
  .byte NOP
  .byte JMP
  .word syscall31
  .byte NOP
  .byte JMP
  .word syscall32
  .byte NOP
  .byte JMP
  .word syscall33
  .byte NOP
  .byte JMP
  .word syscall34
  .byte NOP
  .byte JMP
  .word syscall35
  .byte NOP
  .byte JMP
  .word syscall36
  .byte NOP
  .byte JMP
  .word syscall37
  .byte NOP
  .byte JMP
  .word syscall38
  .byte NOP
  .byte JMP
  .word syscall39
  .byte NOP
  .byte JMP
  .word syscall3A
  .byte NOP
  .byte JMP
  .word syscall3B
  .byte NOP
  .byte JMP
  .word syscall3C
  .byte NOP
  .byte JMP
  .word syscall3D
  .byte NOP
  .byte JMP
  .word syscall3E
  .byte NOP
  .byte JMP
  .word syscall3F
  .byte NOP
  .align $100
SYSCALL_RESET:
  .byte JMP
  .word main
  .byte NOP
  .byte JMP
  .word PAGEFAULT
  .byte NOP
  .byte JMP
  .word RESTORKEY
  .byte NOP
  .byte JMP
  .word ALTTABKEY
  .byte NOP
  .byte JMP
  .word VF011RD
  .byte NOP
  .byte JMP
  .word VF011WR
  .byte NOP
  .byte JMP
  .word RESERVED
  .byte NOP
  .byte JMP
  .word RESERVED
  .byte NOP
  .byte JMP
  .word RESERVED
  .byte NOP
  .byte JMP
  .word RESERVED
  .byte NOP
  .byte JMP
  .word RESERVED
  .byte NOP
  .byte JMP
  .word RESERVED
  .byte NOP
  .byte JMP
  .word RESERVED
  .byte NOP
  .byte JMP
  .word RESERVED
  .byte NOP
  .byte JMP
  .word RESERVED
  .byte NOP
  .byte JMP
  .word RESERVED
  .byte NOP
  .byte JMP
  .word RESERVED
  .byte NOP
  .byte JMP
  .word RESERVED
  .byte NOP
  .byte JMP
  .word RESERVED
  .byte NOP
  .byte JMP
  .word RESERVED
  .byte NOP
  .byte JMP
  .word RESERVED
  .byte NOP
  .byte JMP
  .word RESERVED
  .byte NOP
  .byte JMP
  .word RESERVED
  .byte NOP
  .byte JMP
  .word RESERVED
  .byte NOP
  .byte JMP
  .word RESERVED
  .byte NOP
  .byte JMP
  .word RESERVED
  .byte NOP
  .byte JMP
  .word RESERVED
  .byte NOP
  .byte JMP
  .word RESERVED
  .byte NOP
  .byte JMP
  .word RESERVED
  .byte NOP
  .byte JMP
  .word RESERVED
  .byte NOP
  .byte JMP
  .word RESERVED
  .byte NOP
  .byte JMP
  .word RESERVED
  .byte NOP
  .byte JMP
  .word RESERVED
  .byte NOP
  .byte JMP
  .word RESERVED
  .byte NOP
  .byte JMP
  .word RESERVED
  .byte NOP
  .byte JMP
  .word RESERVED
  .byte NOP
  .byte JMP
  .word RESERVED
  .byte NOP
  .byte JMP
  .word RESERVED
  .byte NOP
  .byte JMP
  .word RESERVED
  .byte NOP
  .byte JMP
  .word RESERVED
  .byte NOP
  .byte JMP
  .word RESERVED
  .byte NOP
  .byte JMP
  .word RESERVED
  .byte NOP
  .byte JMP
  .word RESERVED
  .byte NOP
  .byte JMP
  .word RESERVED
  .byte NOP
  .byte JMP
  .word RESERVED
  .byte NOP
  .byte JMP
  .word RESERVED
  .byte NOP
  .byte JMP
  .word RESERVED
  .byte NOP
  .byte JMP
  .word RESERVED
  .byte NOP
  .byte JMP
  .word RESERVED
  .byte NOP
  .byte JMP
  .word RESERVED
  .byte NOP
  .byte JMP
  .word RESERVED
  .byte NOP
  .byte JMP
  .word RESERVED
  .byte NOP
  .byte JMP
  .word RESERVED
  .byte NOP
  .byte JMP
  .word RESERVED
  .byte NOP
  .byte JMP
  .word RESERVED
  .byte NOP
  .byte JMP
  .word RESERVED
  .byte NOP
  .byte JMP
  .word RESERVED
  .byte NOP
  .byte JMP
  .word RESERVED
  .byte NOP
  .byte JMP
  .word RESERVED
  .byte NOP
  .byte JMP
  .word RESERVED
  .byte NOP
  .byte JMP
  .word RESERVED
  .byte NOP
  .byte JMP
  .word RESERVED
  .byte NOP
  .byte JMP
  .word RESERVED
  .byte NOP
  .byte JMP
  .word CPUKIL
  .byte NOP
