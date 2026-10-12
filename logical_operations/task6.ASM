use16
org 100h

        mov ax,[x]
        and ax,[y]
        or ax,0F0F0h
        xor ax,0AAAAh
        mov [z],ax

        mov ax,4C00h
        int 21h

;--------------------------------------

x dw 1234h
y dw 5678h
z dw ?