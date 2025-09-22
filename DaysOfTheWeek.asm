.data
first_msg:   .asciz "Mantaha"     # string first_msg = "Mantaha";      
second_msg:  .asciz "Labobeli"    # string second_msg = "Labobeli";    
third_msg:   .asciz "Laboraro"    # string third_msg = "Laboraro";     
fourth_msg:  .asciz "Labone"      # string fourth_msg = "Labone";      
fifth_msg:   .asciz "Labohlano"   # string fifth_msg = "Labohlano";    
sixth_msg:   .asciz "Moqebelo"    #string sixth_msg = "Moqebelo";     
seventh_msg: .asciz "Sontaha"     # string seventh_msg = "Sontaha";    
prompt:      .asciz " Enter day of the day"  # string prompt = "Enter day of the day";

.text
.globl _start
_start:
    la a0, prompt     # cout << prompt;
    li a7, 4          
    ecall

    li a7, 5          # cin >> input;
    ecall
    mv t0, a0         # int input = a0;

    # if (input == 1) { cout << "Mantaha"; }
    li t1, 1
    beq t0, t1, first

    # else if (input == 2) { cout << "Labobeli"; }
    li t1, 2
    beq t0, t1, second

    # else if (input == 3) { cout << "Laboraro"; }
    li t1, 3
    beq t0, t1, third

    # else if (input == 4) { cout << "Labone"; }
    li t1, 4
    beq t0, t1, fourth

    # else if (input == 5) { cout << "Labohlano"; }
    li t1, 5
    beq t0, t1, fifth

    # else if (input == 6) { cout << "Moqebelo"; }
    li t1, 6
    beq t0, t1, sixth

    # else if (input == 7) { cout << "Sontaha"; }
    li t1, 7
    beq t0, t1, seventh

    j exit   # else { return 0; }

# --- Day outputs ---
first:
    la a1, first_msg  # cout << "Mantaha";
    li a2, 8
    j print

second:
    la a1, second_msg # cout << "Labobeli";
    li a2, 9
    j print

third:
    la a1, third_msg  # cout << "Laboraro";
    li a2, 9
    j print

fourth:
    la a1, fourth_msg # cout << "Labone";
    li a2, 7
    j print

fifth:
    la a1, fifth_msg  # cout << "Labohlano";
    li a2, 11
    j print

sixth:
    la a1, sixth_msg  # cout << "Moqebelo";
    li a2, 9
    j print

seventh:
    la a1, seventh_msg # cout << "Sontaha";
    li a2, 8
    j print

# --- Print routine ---
print:
    li a0, 1          # write(stdout, message, length);
    li a7, 64
    ecall
    j exit

# --- Exit program ---
exit:
    li a7, 10         # return 0;
    ecall


 
  

     
    
    
