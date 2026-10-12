use16
org 100h            

        mov al,14
        sub al,11
        mov cl,al
        mov al,36
        mov ah,0
        div cl
        mov bl,al
        mov bh,0

        mov al,6
        mov cl,8
        mul cl

        add ax,bx

        mov ax,4C00h
        int 21h

;--------------------------------------