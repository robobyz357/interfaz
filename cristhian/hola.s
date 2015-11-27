@cristhian.cerda programa que despliega hola mundo
.data       @Almacena una cadena en variable.
msg:

    .ascii "Hola atte: cristhian!!\n"
len = . - msg
.section .text
.global _start
_start:
mov r0, $1
ldr r1, = msg
ldr r2, = len
mov r7, $4
swi $0

mov r0, $0
mov r7, $1
svc $0
