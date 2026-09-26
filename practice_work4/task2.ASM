use16
org 100h

mov ax,[X_low]
mul [Y_low]
mov [Res_0],ax
mov [Res_1],dx

mov ax,[X_high]
mul [Y_low]
add [Res_1],ax
adc dx, 0
mov [Res_2],dx
mov word [Res_3],0
adc word [Res_3],0

mov ax,[X_low]
mul [Y_high]
add [Res_1],ax
adc [Res_2],dx
adc word [Res_3],0

mov ax,[X_high]
mul [Y_high]
add [Res_2],ax
adc [Res_3],dx

mov ax, 4C00h
int 21h

; ----------------------------------------------------

X_low  dw 0x5678
X_high dw 0x1234

Y_low  dw 0x0002
Y_high dw 0x0000

Res_0  dw ?
Res_1  dw ?
Res_2  dw ?
Res_3  dw ?
