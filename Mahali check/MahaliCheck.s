.data
  input: .asciz" Enter number of cattle: "
  less: .asciz " Not enough for bohali"
  enough: .asciz " Small herd"
  More: .asciz " Wealthy cattle owner"
  .text
  
 .globl _start
 _start:
 
 la a0, input
 li a7, 4
 ecall
 
 li a7, 5 
 ecall
 
 mv t0,a0
 
 li t1, 30
 
 blt t0,t1, print_less
 beq t0,t1, print_enough
 bgt t0,t1, print_More
 
 print_less:
 la a0, less
 li a7,4
 ecall
 j exit
 
 print_enough:
 la a0 , enough
 li a7, 4
 ecall
 j exit
 
 print_More:
 la a0 , More
 li a7, 4
 ecall
 j exit
 
 exit:
 li a7,10
 ecall
 
 
 
 
