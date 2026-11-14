use16
org 100h
    jmp start



arr1      dw 100, 1, 2, 3, 4, 200, 6, 7, 8, 9, 300   ; Кратны 5: 100, 200, 300
arr2      dw 100, 9, 8, 7, 6, 200, 4, 3, 2, 1, 300   ; Кратны 5: 100, 200, 300
len       db 11                                      ; Размер массивов (8-битная переменная)

msg_eq    db 'Multiples of 5 are equal!$'
msg_neq   db 'Multiples of 5 are NOT equal!$'

start:
    movzx ax, [len]
    test ax, ax
    jz equal

    dec ax
    mov bl, 5
    div bl
    movzx cx, al
    inc cx

    mov si, arr1
    mov di, arr2

check_loop:
    mov ax, [si]
    cmp ax, [di]
    
    lea si, [si + 10]
    lea di, [di + 10]
    
    loopz check_loop

    jne not_equal

equal:
    mov dx, msg_eq
    jmp print

not_equal:
    mov dx, msg_neq

print:
    mov ah, 09h
    int 21h

    mov ax, 4C00h
    int 21h
