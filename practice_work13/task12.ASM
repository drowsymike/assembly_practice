use16
org 100h
    jmp start

arr1      dw 100, 1, 2, 3, 4, 200, 6, 7, 8, 9, 300
arr2      dw 300, 9, 8, 7, 6, 200, 4, 3, 2, 1, 100
len       db 11

msg_eq    db 'Multiples of 5 match in reverse!$'
msg_neq   db 'Multiples of 5 do NOT match!$'

start:
    movzx ax, [len]
    test ax, ax
    jz equal

    dec ax
    mov bl, 5
    div bl
    movzx cx, al

    mov ah, 10
    mul ah
    mov di, arr2
    add di, ax

    inc cx
    mov si, arr1

check_loop:
    mov ax, [si]
    cmp ax, [di]
    
    lea si, [si + 10]
    lea di, [di - 10]
    
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
