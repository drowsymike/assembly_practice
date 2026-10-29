use16
org 100h

start:
    mov di, 0
    mov cx, [Kolich]
    mov bx, 0
    mov bp, 5   ;;делителль

Zikl:
    mov ax, [Chisla + bx]
    xor dx, dx
    div bp

    neg dx
    sbb ax, ax
    inc ax              ;увеличение счетчика
    add di, ax

    add bx, 2 ;деление непосредственно
    loop Zikl      ;цикл

    mov ax, 4C00h
    int 21h

Kolich dw 5
Chisla dw 10, 7, 25, 3, 15
