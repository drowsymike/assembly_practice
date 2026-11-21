use16
org 100h
        ;task 1
        ;push ebx
        ;xor ebx, ebx
        ;pop bx

        ;example with mov command
        ;mov ebx, 5
        ;mov ebx, eax

        ;example with rewriting the memory cell by the address in ebx register
        ;mov [ebx], eax

        ;example with defining the data size
        ;mov [eax], word 50
        ;mov ebx, word [eax]

        ;calculatng the memory cell address by the mov command
        ;mov eax, dword [ebx+4*ebx]
        ;mov eax, dword [ebx+2]

        mov ax,4C00h
        int 21h

;example with string
;string db 'Hello, world!', 0
;a1 dd ?