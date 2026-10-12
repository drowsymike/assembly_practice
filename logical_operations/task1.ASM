use16
org 100h

        mov ax,[valA] ;load the value (hidden access to an external memory cell)
        and ax,[valB] ;logical 'and' operation with hidden access to an external memory cell
        mov [valA],ax ;hidden access to the memry cell and then writing inside of it the new value

        mov ax,4C00h
        int 21h

;--------------------------------------

valA dw 0ABCDh
valB dw 0123h
