use16
org 100h            
  
        mov al,81
        mov ah,0
        mov cl,9
        div cl
        mov bl,al
        mov bh,0
  
        mov al,8
        sub al,5
        mov cl,7
        mul cl
  
        add ax,bx
  
        mov ax,4C00h
        int 21h

;--------------------------------------