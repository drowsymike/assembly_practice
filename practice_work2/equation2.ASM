use16
org 100h

        mov al,[n]
        add al,1h

        mov ah,[r]

        add al,ah  ;result of right part of equation - al (ax)
        mov ah,0h

        ;------------------------------------------------

        mov bl,[m]

        add bl,-3h  ;result of left part of equation - bl

        add ax,bx  ;the final result

        mov [k],ax

        ;------------------------------------------------

        mov ax,4C00h
        int 21h

;--------------------------------------------------------

k dw ?
m db 3
n db 5
r db 8