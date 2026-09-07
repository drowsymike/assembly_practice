use16
org 100h

        mov al,[n]
        mov ah,[r]
        neg ah
        add al,ah
        dec al
        neg al  ;first result

        mov bl,[r]
        add bl,[m]  ;second result

        mov ah,0h
        mov bh,0h

        add bx,ax

        mov [k],ax

        ;------------------------------------------------

        mov ax,4C00h
        int 21h

;--------------------------------------------------------

k dw ?
m db 3
n db 5
r db 8