use16
org 100h
    jmp start

start:
    mov si, arr
    mov cl, N / 2 ;количество итераций - целочисленное деление 5 на 2 (ответ 2)
    mov di, len / 2 ;длина массива

shift_loop:
    shl word [si], cl     ;сдвиг влево слова (10 << 2 = 40, 20 >> 2 = 5, 30 << 3 = 240, 40 >> 3 = 5 и тд)
    add si, 2            ;смещение по массиву

    shr word [si], cl  ;сдвиг вправо второго слова (в комментарии выше с первым сдвигом показано после запятой в примере)
    add si, 2

    inc cl             ;увеличение размера сдвига
    dec di             ;уменьшение размера сдвига (для значений по "вторым" индексам)
    jnz shift_loop   ;повторять пока не станет равно нулю

    mov si, arr    ;снова идем в начало массива
    mov di, len

print_arr:
    mov bx, [si]   ;последовательное выполнение - дальше с помощью просто стандартных функций DOS выводится массив
    mov ah, 2
    mov cx, 16

print_bits:
    shl bx, 1        ;последовательный вывод битов
    mov dl, '0'
    jnc next_bit
    inc dl
next_bit:
    int 21h
    loop print_bits

    mov dl, 13      ;символ возврата каретки
    int 21h        ;интерфейс dos/windows
    mov dl, 10      ;символ новой строки
    int 21h        ;интерфейс dos/windows

    add si, 2
    dec di
    jnz print_arr

    mov ah, 9
    mov dx, pak    ;загрузка строки приглашения
    int 21h

    mov ah, 8      ;ожидание нажатия кнопки и отключение эхо чтобы не выводился нажатый символ
    int 21h

    mov ax, 4C00h
    int 21h

N = 5
arr dw 10, 20, 30, 40, 50, 60
len = ($ - arr) / 2
pak db 13,10,'nazhmite knopku$'