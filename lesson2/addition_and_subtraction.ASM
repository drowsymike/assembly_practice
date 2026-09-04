use16
org 100h

        mov al,[a]
        mov ah,[b]
        mov ah,[c]
        dec ah
        sub al,ah
        mov cl,[d]
        neg cl
        add al,cl
        mov [e],al
        mov ax,4C00h
        int 21h
;-----------------------------
a db 2
b db 3
c db 5
d db -8
e db ?