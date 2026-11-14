use16
org 100h
    jmp start

arr1      dw 10, 20, 30, 40, 50, 60
arr2      dw 10, 99, 30, 88, 50, 77
len       db 6

msg_eq    db 'Odd elements are equal!$'
msg_neq   db 'Odd elements are NOT equal!$'

start:
    movzx cx, [len]
    inc cx
    shr cx, 1

    mov si, arr1
    mov di, arr2

check_loop:
    mov ax, [si]
    cmp ax, [di]
    
    lea si, [si + 4]
    lea di, [di + 4]
    
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
