.MODEL SMALL
.STACK 100H
.DATA
TEN DB 10
num dw 0
M0 DB "                 WELCOME    $"
M1 DB "Addition      :`A'$" 
M2 DB "Subtraction   :`S'$" 
M10 DB "Factorial     :'F'$"
M3 DB "Enter 1st number : $"
M4 DB "Enter 2nd number : $"
M5 DB "Choose an option : $"    
M6 DB "                     THANK YOU   $" 
M7 DB "For another Calculation :`1'$"
M8 DB "For EXIT :`2'$" 
M20 DB "ENTER THE NUMBER :  $"

.CODE
MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX
    
    LEA DX,M0
    MOV AH,9
    INT 21H 
    
START:
    
    CALL Newline
    CALL Newline
    
    LEA DX,M1
    MOV AH,9
    INT 21H  
     
    CALL Newline
    
    LEA DX,M2
    MOV AH,9
    INT 21H
    CALL Newline
    
    LEA DX,M10
    MOV AH,9
    INT 21H   
    
    CALL Newline

    
    CALL Newline  
    CALL Newline  
    
    LEA DX,M5
    MOV AH,9
    INT 21H     
CALC:
    MOV AH,1
    INT 21H
    MOV BL,AL  
    
    CALL Newline
    CALL Newline
    
    
    CMP BL,'A'
    JE ADD1
    
    CMP BL,'S'
    JE SUB1   
    
    CMP BL,'F'
    JE FAC 
  
    JMP CALC   
    
ADD1:
    
    LEA DX,M3
    MOV AH,9
    INT 21H 
    
    CALL Input_value
    CALL newline
    MOV num,BX
    
    LEA DX,M4
    MOV AH,9
    INT 21H
    
    CALL Input_value
    ADD num,BX
    CALL newline
    MOV BX,num 
    
    CALL Output_value 
   
    CALL Newline
    CALL Newline
   

    LEA DX,M7
    MOV AH,9
    INT 21H
    CALL Newline
    LEA DX,M8
    MOV AH,9
    INT 21H
    CALL Newline
    LEA DX,M5
    MOV AH,9
    INT 21H
    
    MOV AH,1
    INT 21H 
    MOV BL,AL
    
    CMP BL,'1'
    JE START
    
    CALL Newline
    CALL Newline
    
    CALL TNX
    
    JMP EXIT  
    
SUB1:
    
    LEA DX,M3
    MOV AH,9
    INT 21H 
    
    CALL Input_value
    CALL newline
    MOV num,BX
    
    LEA DX,M4
    MOV AH,9
    INT 21H
    
    CALL Input_value
    SUB num,BX
    CALL newline
    MOV BX,num 
    
    CALL Output_value 
   
    CALL Newline  
    CALL Newline
    
    LEA DX,M7
    MOV AH,9
    INT 21H
    CALL Newline
    LEA DX,M8
    MOV AH,9
    INT 21H
    CALL Newline
    LEA DX,M5
    MOV AH,9
    INT 21H
    
    MOV AH,1
    INT 21H 
    
    MOV BL,AL
    CMP BL,'1'
    JE START
    
    CALL Newline
    CALL Newline
    
    CALL TNX
     
    JMP EXIT  

Newline:
    MOV AH,2
    MOV DL,13
    INT 21H
    MOV DL,10
    INT 21H
    RET
    
TNX:
    
    LEA DX,M6
    MOV AH,9
    INT 21H
    RET 
    
FAC:

  LEA DX,M20
  MOV AH,9
  INT 21H
  
 INPUT1:
  MOV AH,01H
  INT 21H
  SUB AL,48
  MOV BL,AL
  MOV BH,0
  
  MOV CL,1
  MOV CH,0
  MOV DL,1
  MOV DH,0
 T:
 
  MOV AL,0  
  CMP DL,BL
  JG OUTPUT1
  MOV AL,DL
  MUL CL
  MOV CX,AX
  ADD DL,1
  JMP T 
  
  OUTPUT1:
     CALL Newline
     MOV BL,CL
       S:
         CMP BX,0
         JE Newline
         MOV AX,BX
         DIV TEN
         MOV CL,AH
         ADD CL,48
         MOV AH,0
         MOV BX,AX
         MOV AH,02H
         MOV DL,CL
         INT 21H
         
         JMP S
    
    LEA DX,M7
    MOV AH,9
    INT 21H
    CALL Newline
    LEA DX,M8
    MOV AH,9
    INT 21H
    CALL Newline
    LEA DX,M5
    MOV AH,9
    INT 21H
    
    MOV AH,1
    INT 21H 
    MOV BL,AL
    
    CMP BL,'1'
    JE START
    
    CALL Newline
    CALL Newline
    
    CALL TNX
    
    JMP EXIT  

    
EXIT:
    MOV AH,4CH
    INT 21H
    
    MAIN ENDP
    
     Input_value PROC
        
        MOV BX,0
        MOV CH,0
        
      L:
        MOV AH,01H
        INT 21H
        CMP AL,13
        JE End_input
        SUB AL,48
        MOV CL,AL
        MOV AX,BX
        MUL TEN
        ADD AX,CX
        MOV BX,AX
        JMP L
        End_input:
        MOV CL,1
        RET
        
      Input_value ENDP
       
      Output_value PROC
        
       J:
         CMP BX,0
         JE End_output
         MOV AX,BX
         DIV TEN
         MOV CL,AH
         ADD CL,48
         MOV AH,0
         MOV BX,AX
         MOV AH,02H
         MOV DL,CL
         INT 21H
         
         JMP J
         
       End_output:
        
         MOV CL,7
         RET
         
      Output_value ENDP
      
      
END MAIN




