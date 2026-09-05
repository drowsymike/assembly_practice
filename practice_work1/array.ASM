use16
org 100h

        mov ax,array
        nop
        mov ax,array_string
        nop
        mov ax,array1
        nop
        mov ax,array2
        nop
        mov ax,4C00h
        int 21h

array db 1,2,3,4,5
array_string db 'Hello'
array1 dw 5 dup(1)
array2 dd 4 dup(3,7,0)