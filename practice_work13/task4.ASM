use16
org 100h
    jmp start

arr1      dw 10, 20, 30, 40, 50
arr2      dw 50, 40, 30, 20, 10
len       db 5

msg_eq    db 'Equal!$'
msg_neq   db 'Not equal!$'

start:
    movzx cx, [len]
    mov si, arr1
    
    mov di, cx
    add di, di
    add di, arr2 - 2

check_loop:
    mov ax, [si]
    cmp ax, [di]
    
    inc si
    inc si
    dec di
    dec di
    
    loopz check_loop

    jne not_equal

    mov dx, msg_eq
    jmp print

not_equal:
    mov dx, msg_neq

print:
    mov ah, 09h
    int 21h

    mov ax, 4C00h
    int 21h
