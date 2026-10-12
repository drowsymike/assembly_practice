use16
org 100h            
  
        mov al,[a]
        mov ah,0
        mov cl,[b]
        div cl
        mov bl,al
        mov bh,0
  
        mov al,[c]
        sub al,[d]
        mov cl,[e]
        mul cl
  
        add ax,bx
  
        mov [k],ax
  
        mov ax, 4C00h
        int 21h

;--------------------------------------

a db 48
b db 8
c db 65
d db 56
e db 5
k dw ?