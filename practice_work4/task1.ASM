use16
org 100h

mov ax,[a]
add ax,[c]
mov cx,ax ;результат в cx

mov ax,[a]
imul ax,[b]

cwd

idiv cx

mov [k],ax

mov ax,4C00h
int 21h

;--------------------------------------

a dw 0x03
b dw 0x03
c dw 0x03
k dw ?