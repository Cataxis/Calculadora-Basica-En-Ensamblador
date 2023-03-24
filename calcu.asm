.MODEL SMALL
.STACK
.DATA
    varNum1 db ?
    varNum2 db ?
    varResultado db ?


    msjError db 'Opcion no valida compa, o coma' , '$'


    msjIntro db "Selecciona una opcion: ",10,"$"


    opc1 db "1. Suma",10,"$"
    opc2 db "2. Multiplicacion",10,"$"
    opc3 db "3. Division",10,"$"
    opc4 db "4. Resta",10,"$"
    opc5 db "5. Salir",10,"$"


    msjExit db 10, "Saliendo...",10,"$"


    mensaje1 db 10,"Resultado Suma: ",10,"$"
    mensaje2 db 10,"Resultado Multiplicacion: ",10,"$"
    mensaje3 db 10,"Resultado Division: ",10,"$"
    mensaje4 db 10,"Resultado Resta: ",10,"$"


    msjn1   db 10,"Numero 1: $"
    msjn2 db 10,"Numero 2: $"
   
    diez db 10
    punto db ".$"


.CODE
    MOV AX, @DATA
    MOV DS, AX


Menu:
    MOV ah, 02h
    MOV dx, 10 ;ENTER
    int 21h


    MOV ah,09h
    lea dx,msjIntro
    int 21h


    MOV ah,09h
    lea dx,opc1
    int 21h


    MOV ah,09h
    lea dx,opc2
    int 21h
    MOV ah,09h
   
    lea dx,opc3
    int 21h
    MOV ah,09h
    lea dx,opc4
    int 21h


    MOV ah,09h
    lea dx,opc5
    int 21h


    MOV ah,01h
    int 21h
    sub al,30h


    cmp al,01h ;Ver si el digito es 1
    je Suma
    ja com1


Suma:
    MOV ah,09H
    MOV dx, offset msjn1
    int 21h


    MOV AH,01H
    int 21h
    sub al,30h
    MOV varNum1,al


    MOV ah,09H
    MOV dx, offset msjn2
    int 21h
   
    MOV ah, 01h
    int 21h
    sub al, 30h
    MOV varNum2, al
    add al, varNum1
    MOV varResultado, al
   
    AAA
   
    xor ax, 3030h
    MOV bx, ax
    sub bh, 01H
   
    MOV ah,09H
    MOV dx, offset mensaje1
    int 21h
   
    MOV ah,02h
    MOV varResultado, bh
    MOV dl, varResultado
    int 21h
   
    MOV ah,02
    MOV varResultado, bl
    MOV dl, varResultado
    int 21h
   
    MOV ah, 02h
    MOV dx, 10 ;ENTER
    int 21h


call Menu


com1:
    cmp al,02h  ;Ver su el digito es 2
    je Multiplicar
    ja com2


Multiplicar:
    MOV AH,09h
    LEA DX,msjn1
    INT 21H
   
    MOV AH,01H
    INT 21H
    SUB AL, 30H
    MOV varNum1,AL
   
    MOV AH,09h
    LEA DX,msjn2
    INT 21H
   
    MOV AH,01h
    INT 21H
    SUB AL,30H
    MOV varNum2,AL
   
    MOV AH,09h
    LEA DX,mensaje2
    INT 21H
   
    MOV AL,varNum1
    MUL varNum2
   
    AAM
   
    ADD AX,3030H
    MOV BX,AX
    MOV AH,02h
    MOV DL,BH
    INT 21H      
   
    MOV DL,BL
    INT 21h
call Menu


com2:
    cmp al,03h  ;Ver si el digito es 3
    je Division
    ja com3


Division:
    MOV AH, 09h
    LEA DX, msjn1
    INT 21H  
   
    MOV AH,01H
    INT 21H
    SUB AL, 30H
    MOV varNum1,AL
    MOV AH,09h
    LEA DX,msjn2
    INT 21H
   
    MOV AH,01h
    INT 21H
    SUB AL,30H
    MOV varNum2,AL
    MOV AH,09h
    LEA DX,mensaje3
    INT 21H
   
    MOV AL,varNum1
    MUL diez
    DIV varNum2
   
    AAM
   
    ADD AX,3030H
    MOV BX,AX
    MOV AH,02h
    MOV DL,BH
    INT 21H      
   
    MOV AH,09H
    LEA DX,punto
    INT 21H
    MOV AH,02h
    MOV DL,BL
    INT 21h
   
    MOV ah, 02h
    MOV dx, 10 ;ENTER
    int 21h
   
call Menu


com3:
    cmp al,04h  ;Ver si el digito es 4
    je Resta
    ja com4


Resta:
    MOV AH, 09h
    LEA DX, msjn1
    INT 21H
   
    MOV AH,01H
    INT 21H
    SUB AL, 30H
    MOV varNum1,AL
    INT 21H  
   
    SUB AL,30H
    MOV AH,varNum1
   
    AAD ;Ajuste de ASCII
   
    MOV varNum1,AL
    MOV AH,09h
    LEA DX,msjn2
    INT 21H
   
    MOV AH,01h
    INT 21H
    SUB AL,30H
    MOV varNum2,AL
    INT 21H
    SUB AL,30H
   
    MOV AH,varNum2
   
    AAD
    MOV varNum2,AL
    MOV AH,09h
    LEA DX,mensaje4
    INT 21H
   
    MOV AL,varNum1
    SUB AL,varNum2
   
    AAM
   
    ADD AX,3030H
    mOV BX,Ax
    MOV AH,02h
    MOV DL,BH
    INT 21H
   
    MOV DL,BL
    INT 21H
call Menu


com4:
    cmp al,05h  ;Ver si el digito es 4
    je Salir
    ja salir


salir:
    MOV ah,09h
    lea dx,msjExit
    int 21h
    int 27h
END
