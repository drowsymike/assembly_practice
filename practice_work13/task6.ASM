use16
org 100h
    jmp start

arr1      dw 99, 10, 88, 20, 77, 30
arr2      dw 10, 55, 20, 44, 30, 66
len       db 6

msg_eq    db 'Elements match!$'
msg_neq   db 'Elements do NOT match!$'

start:
    movzx cx, [len]
    shr cx, 1
    jcxz equal

    mov si, arr1 + 2
    mov di, arr2

check_loop:
    mov ax, [si]
    cmp ax, [di]
    
    lea si, [si + 4]
    lea di, [di + 4]
    
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
