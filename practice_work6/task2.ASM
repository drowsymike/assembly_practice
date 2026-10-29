use16
org 100h

start:
    mov di, 0
    mov bx, 0
    mov bp, 3

Zikl:
    mov ax, [Chisla + bx]

    cmp ax, 0
    je Konec   ;условие проверка на значение НУЛЯ

    xor dx, dx
    div bp     ;деление на три (ПРОВЕРКА ДЕЛЕНИЯ)

    neg dx
    sbb ax, ax
    inc ax      ;увеличение счетчика
    add di, ax

    add bx, 2
    jmp Zikl ;указатель на метку начала цикла

Konec:
    mov ax, 4C00h
    int 21h

Chisla dw 9, 4, 7, 6, 11, 0
