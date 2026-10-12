use16
org 100h
        mov cl, [array1_size]  ;загрузка размера
        mov ch, 0 ;очистка для чистоты эксперимента
        xor si, si ;очистка для дальнейших вычислений
        xor ax, ax ;очистка
sum_loop:
        add ax, [array1 + si] ;сложение элементов
        add si, 2 ;вычисление смещения
        loop sum_loop

        cwd ;расширение ax до dx для деления
        mov bl, [array1_size] ;загрузка размера массива
        xor bh, bh ;очистка
        idiv bx ;целочисленное деление dx:ax на bx
        mov bx, ax ;сохранение результата среднего значения
        mov cl, [array1_size] ;
        mov ch, 0 ;
        xor si, si ;
sub_loop:
        mov ax, [array2 + si] ;
        sub ax, bx ;
        mov [array2 + si], ax ;
        add si, 2 ;
        loop sub_loop

        mov ax, 4C00h
        int 21h

;--------------------------------------
array1 dw 100, -100, 101, -101, 102, -102
array2 dw 200, -200, 201, -201, 202, -202
array1_size db 6
