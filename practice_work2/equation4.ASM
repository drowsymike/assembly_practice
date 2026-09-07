use16
org 100h

        mov al,[m]
        add al,01h
        add al,[n]
        mov ah,[r]
        neg ah
        add al,ah  ;first result

        mov bl,[m]
        add bl,01h

        neg al

        add bl,al  ;second result

        mov bh,00h

        mov [k],bx

        ;------------------------------------------------

        mov ax,4C00h
        int 21h

;--------------------------------------------------------

k dw ?
m db 3
n db 5
r db 8