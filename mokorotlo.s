.data
prompt:   .asciz "Enter the height of the Mokorotlo: "
star:     .asciz "*"
space:    .asciz " "
newline:  .asciz "\n"

.text
.globl _start

_start:
    
    li a7, 4
    la a0, prompt
    ecall

    li a7, 5
    ecall
    
    mv s0, a0  
          
    li s1, 1  
          
outer_loop:
    bgt s1, s0, end_outer_loop   
    
    mv t0, s0
    sub t0, t0, s1
    li t1, 0        

space_loop:
    bge t1, t0, end_space_loop
    li a7, 4
    la a0, space
    ecall
    addi t1, t1, 1
    j space_loop

end_space_loop:
   
    li t2, 0
    slli t4, s1, 1  
    addi t4, t4, -1 

star_loop:
    bge t2, t4, end_star_loop
    li a7, 4
    la a0, star
    ecall
    addi t2, t2, 1
    j star_loop

end_star_loop:
    
    li a7, 4
    la a0, newline
    ecall

    
    addi s1, s1, 1
    j outer_loop

end_outer_loop:
    
    li a7, 10
    ecall
