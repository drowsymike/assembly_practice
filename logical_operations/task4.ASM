use16
org 100h

        mov di,3h ;setting the offset
        mov al,[arr+di]
        not al
        mov [arr+di],al

        mov ax,4C00h
        int 21h

;--------------------------------------

arr db 1h,2h,3h,4h,5h,6h,7h,8h,9h,10h