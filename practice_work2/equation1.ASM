use16
org 100h

        mov al,[n]
        dec al

        mov ah,[r]
        neg ah

        add al,ah  ;result of right part of equation - al
        mov ah,0h

        ;------------------------------------------------

        mov bl,[m]

        add bl,1h  ;result of left part of equation - bl

        neg al
        add ax,bx  ;the final result

        mov [k],ax

        ;------------------------------------------------

        ;mov bx,[k]
        ;mov ah,9
        ;int 21h

        mov ax,4C00h
        int 21h

;--------------------------------------------------------

k dw ?
m db 3
n db 5
r db 8