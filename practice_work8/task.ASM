use16
org 100h
    ;выгрузка
    mov ax,word[x]
    mov dx,word[x+2]

    ; инвертируем биты 5, 10 и 11 через маску
    xor ax, 0000110000100000b

    ; обнуляем младший байт
    mov al, 0

    ;присваиваем 1 битам от 5 до 9, от 10 до 14
    or ax, 0111111111100000b

    ;целиком инвертируем значение
    mov ax, word[x]
    mov dx, word[x+2]
    not ax
    not dx
    mov word[x], ax
    mov word[x+2], dx

    mov ax, 4C00h
    int 21h

;--------------------------------------

x dd 0x12345678
y dd ?
