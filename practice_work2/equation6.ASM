use16
org 100h

        mov al,[n]
        add al,-2h
        add al,[r]  ;first result

        add al,1h
        neg al  ;second result

        mov bl,[m]
        add bl,[n]

        add bl,al  ;third result

        mov bh,00h
        mov [k],bx

;--------------------------------------------------------

k dw ?
m db 3
n db 5
r db 8