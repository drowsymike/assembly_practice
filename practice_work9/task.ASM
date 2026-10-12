use16
org 100h

    jmp start

menu    db 'Select data set:', 13, 10
        db '1 - Set 1: r=5, m=2, n=10 (Result should be < 0)', 13, 10
        db '2 - Set 2: r=1, m=8, n=5  (Result should be > 0)', 13, 10
        db '3 - Set 3: r=3, m=2, n=6  (Result should be = 0)', 13, 10
        db '0 - Exit', 13, 10, '$'

select  db 13, 10, 'Select>$'

msg_gt  db 13, 10, 'Result: X > 0', 13, 10, 13, 10, '$'
msg_lt  db 13, 10, 'Result: X < 0', 13, 10, 13, 10, '$'
msg_eq  db 13, 10, 'Result: X = 0', 13, 10, 13, 10, '$'

r       db 0
m       db 0
n       db 0
k       db 0

start:
    mov ah, 09h
    mov dx, menu ;menu echo
    int 21h

select_loop:
    mov ah, 09h                   
    mov dx, select
    int 21h

    mov ah, 01h
    int 21h

    cmp al, '1'  ;if entered symbol is 1
    je set_1
    cmp al, '2'  ;if entered symbol is 2
    je set_2
    cmp al, '3'  ;if entered symbol is 3
    je set_3
    cmp al, '0'  ;if entered symbol is 0
    je exit
    jmp select_loop

set_1: ;first init
    mov [r], 5
    mov [m], 2
    mov [n], 10
    jmp calculate

set_2: ;second init
    mov [r], 1
    mov [m], 8
    mov [n], 5
    jmp calculate

set_3: ;third init
    mov [r], 3
    mov [m], 2
    mov [n], 6
    jmp calculate

calculate:

    mov al, [n]
    sub al, 1

    mov bl, [r]
    add bl, [m]

    sub bl, al
    mov [k], bl

    cmp bl, 0
    jg print_gt  ;greater
    jl print_lt  ;less
    je print_eq  ;equal

print_gt:
    mov dx, msg_gt
    jmp echo

print_lt:
    mov dx, msg_lt
    jmp echo

print_eq:
    mov dx, msg_eq

echo:
    mov ah, 09h
    int 21h

exit:
    mov ax, 4C00h
    int 21h
