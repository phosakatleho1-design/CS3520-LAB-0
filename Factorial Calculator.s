.data
 prompt: .asciz "Enter a positive integer: "
 error: .asciz "Error:Please enter a non-negative integer.\n"
 result: .asciz "The factorial is: "
 .text
 .globl _start
 _start:
 la a0 , prompt
 li a7 , 4
 ecall
 
 li a7, 5
 ecall
 
  mv t0, a0
 blt t0, x0, print_error
 li t1, 1 
 beq t0, x0, done
 
 mv t2, x0
 
 
 
      loop:
         addi t2, t2, 1 #i++
         bgt t2, t0, done #if i>n,exitloop
         mul t1, t1, t2 #factorial*=i
         j loop
 done:
 #Printresultlabel
     la a0, result
     li a7, 4 
     ecall
 #Printfactorialresult
    mv a0, t1
    li a7,1
    ecall
    j exit
 print_error:
     la a0, error
     li a7,4
     ecall
 exit:
 li a7, 10
 ecall
 
  
