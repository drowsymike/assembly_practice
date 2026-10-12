use16
org 100h

        mov bx,arr ;moving the address of the first sell (the start of the array in the memory)
        mov si,2h ;setting
        mov ax,[bx+si] ;the basic addresss + offset
        xor ax,ax ;zeroing
        mov ax,0h
        mov [bx+si],ax ;zeroing x2

        mov ax,4C00h
        int 21h

;--------------------------------------

arr dw 1000h, 2000h, 3000h, 4000h