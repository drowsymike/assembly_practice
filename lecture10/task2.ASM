use16
org 100h

start:
        push wn
        call printf

        push name
        push formatStr
        call scanf

        push ho
        call printf

        push age
        push formatNum
        call scanf

        push hello
        call printf

        push name
        call printf

        push dot
        call printf

        push age
        call printf

        push crlf
        call printf

        push address
        call printf

        lea ax, [hello]
        push ax
        call print_num

        mov ax, 4C00h
        int 21h

printf:
    push bp
    mov bp, sp
    mov dx, [bp + 4]
    mov ah, 09h
    int 21h
    pop bp
    ret 2

print_num:
    push bp
    mov bp, sp
    push ax bx cx dx

    mov ax, [bp + 4]
    xor cx, cx
    mov bx, 10

.div_loop:
    xor dx, dx
    div bx
    push dx
    inc cx
    test ax, ax
    jnz .div_loop

.print_loop:
    pop dx
    add dl, '0'
    mov ah, 02h
    int 21h
    loop .print_loop

    pop dx cx bx ax
    pop bp
    ret 2

scanf:
    push bp
    mov bp, sp

    mov dx, dos_buf
    mov ah, 0Ah
    int 21h

    mov dx, crlf
    mov ah, 09h
    int 21h

    xor cx, cx
    mov cl, [dos_buf + 1]
    mov si, dos_buf + 2
    mov di, [bp + 6]

    jcxz .done
.copy_loop:
    mov al, [si]
    mov [di], al
    inc si
    inc di
    loop .copy_loop

.done:
    mov byte [di], '$'

    pop bp
    ret 4

formatStr db '%s', 0
formatNum db '%d', 0
name      rb 32
age       rb 16
wn        db 'What is your name? $'
ho        db 'How old are you? $'
hello     db 'Hello $'
address   db 'hello var address is $'
dot       db ', $'
dos_buf   db 30, 0, 30 dup(0)
crlf      db 13, 10, '$'
