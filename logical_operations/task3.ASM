use16
org 100h

        mov bx,flags ;moving the address of the memory cell
        mov al,[bx] ;reaging the value of the 'flags' variable into the al register
        or al,0C0h ;applying the 'or' logical operation
        mov [bx],ax

        mov ax,4C00h
        int 21h

;--------------------------------------

flags db 0Fh