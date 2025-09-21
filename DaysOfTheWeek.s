.data
first_msg: .asciz "Mantaha"
second_msg: .asciz "Labobeli"
third_msg: .asciz "Laboraro"
fourth_msg: .asciz "Labone"
fifth_msg: .asciz "Labohlano"
sixth_msg: .asciz "Moqebelo"
seventh_msg: .asciz "Sontaha"
prompt: .asciz " Enter day of the day"
.text
.globl _start
_start:
    la a0, prompt
    li a7, 4
    ecall
    
    li a7, 5
    ecall
    
    mv t0, a0
    li t1, 1
    beq t0, t1, first
    
     li t1, 2
    beq t0, t1, second
   
     li t1, 3
    beq t0, t1 , third
   
    li t1, 4
    beq t0, t1 , fourth
    
    li t1, 5
    beq t0, t1 , fifth
    
    li t1, 6
    beq t0 , t1 , sixth
    
    li t1 ,7
    beq t0 , t1 , seventh
    j exit
    
    
    first:
        la a1 , first_msg
        li a2, 8
        j print
    second:
         la a1 , second_msg
        li a2, 9
        j print
    third:
         la a1 , third_msg
        li a2, 9
        j print
    fourth:
         la a1 , fourth_msg
        li a2, 7
        j print
    fifth:
         la a1 , fifth_msg
        li a2, 11
        j print
    sixth:
         la a1 , sixth_msg
        li a2, 9
        j print
    seventh:
         la a1 , seventh_msg
        li a2, 8
        j print
    print:
    li a0, 1       
    li a7, 64      
    ecall
    j exit
    exit:
        li a7,10
        ecall
    

 
  

     
    
    
