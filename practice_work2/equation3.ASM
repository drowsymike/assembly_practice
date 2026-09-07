use16
org 100h

        mov al,[n]
        mov ah,[m]
        neg ah
        add al,ah
        mov ah,[r]
        add al,ah
        mov ah,0h  ;result of the center part of equation - al (ax)

        mov bl,[m]
        add bl,3h  ;result of the left part of equation - bl (bx)

        mov dl,al
        neg dl
        add bx,dx  ;first step-closer result

        dec bx     ;second step-closer result

        mov [k],bx

        ;------------------------------------------------

        mov ax,4C00h
        int 21h

;--------------------------------------------------------

k dw ?
m db 3
n db 5
r db 8