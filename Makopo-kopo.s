    .data
litres_msg: .asciz "Total litres: "
mak_msg:    .asciz "\n Full Makokopo (20L): "
rem_msg:    .asciz "\n Remaining litres: "
prompt:     .asciz" Enter number of grain in litres"

    .text
    .globl _start
_start:
    
	la a0, prompt
	li a7, 4
	ecall
	
	li a7 , 5
	ecall
	
	mv t0, a0
    
    li   t1, 20
    div  t2, t0, t1      
    rem  t3, t0, t1     

    
    la   a0, litres_msg
    li   a7, 4           
    ecall

    mv   a0, t0
    li   a7, 1           
    ecall

    
    la   a0, mak_msg
    li   a7, 4
    ecall

    mv   a0, t2
    li   a7, 1
    ecall

    la   a0, rem_msg
    li   a7, 4
    ecall

    mv   a0, t3
    li   a7, 1
    ecall

    li   a7, 10
    ecall


     
    
    
