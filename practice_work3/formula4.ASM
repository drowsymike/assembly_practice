use16
org 100h

  mov ax,word [a]
  mov bl,byte [a+2]
  mov bh,0x00

  sub ax,word [b]
  sbb bl,byte [b+2]

  sub ax,0x1
  sbb bl,0x0

  sub ax,word [c]
  sbb bl,byte [c+2]

  mov [k],al
  mov [k+1],ah
  mov [k+2],bl

;--------------------------------------------------------

  mov ax,4C00h
  int 21h

;--------------------------------------------------------

a db 0x11
  db 0x22
  db 0x33
b db 0x44
  db 0x55
  db 0x66
c db 0x77
  db 0x88
  db 0x99
k db ?
  db ?
  db ?