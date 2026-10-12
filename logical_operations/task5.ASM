use16
org 100h

        mov bx,table ;moving the start address
        mov si,4h
        mov ax,[bx+si+2] ;table+4+2 - 5th element
        test ax,0001h
        ;'test' calls the 'and' operation. Practically, in this line
        ;is going the camparing of AX value and the 0001 value with AND
        ;operation
        ;also, the 'test' looks the ZF flag due its value will execute the first
        ;line after the 'test' call or the second
        ;ZF=1 - the result of operation is ZERO
        ;ZF=0 - the result of operation is NOT ZERO
        ;if YES, it's zero:
        jz its_zero
        ;if NO, it isn't zero:
        mov [bx+si+2],word 0FFFFh

        mov ax,04C00h
        int 21h

its_zero:
        mov [bx+si+2],word 0
        mov ax,04C00h
        int 21h

;--------------------------------------

table dw 10 dup(0FFFFh)