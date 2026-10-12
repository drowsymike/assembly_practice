use16
org 100h
        mov cl, [array1_size]
        mov ch, 0
        xor si, si
        xor ax, ax
sum_loop:
        add ax, [array1 + si]
        add si, 2
        loop sum_loop

        cwd
        mov bl, [array1_size]
        xor bh, bh
        idiv bx
        mov bx, ax
        mov cl, [array1_size]
        mov ch, 0
        xor si, si
sub_loop:
        mov ax, [array2 + si]
        add ax, bx
        mov [array2 + si], ax
        add si, 2
        loop sub_loop

        mov ax, 4C00h
        int 21h

;--------------------------------------
array1 dw 100, -100, 101, -101, 102, -102
array2 dw 200, -200, 201, -201, 202, -202
array1_size db 6
