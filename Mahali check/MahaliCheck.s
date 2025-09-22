.data
  input:  .asciz " Enter number of cattle: "   # string input = "Enter number of cattle: ";
  less:   .asciz " Not enough for bohali"      # string less = "Not enough for bohali";
  enough: .asciz " Small herd"                 # string enough = "Small herd";
  More:   .asciz " Wealthy cattle owner"       # string More = "Wealthy cattle owner";

.text
.globl _start
_start:
  la a0, input    # cout << "Enter number of cattle: ";
  li a7, 4
  ecall

  li a7, 5        # cin >> cattle;
  ecall
  mv t0, a0       # int cattle = a0;

  li t1, 30       # threshold = 30;

  blt t0, t1, print_less    # if (cattle < 30) goto print_less;
  beq t0, t1, print_enough  # else if (cattle == 30) goto print_enough;
  bgt t0, t1, print_More    # else if (cattle > 30) goto print_More;

print_less:
  la a0, less     # cout << "Not enough for bohali";
  li a7, 4
  ecall
  j exit          # jump to exit

print_enough:
  la a0, enough   # cout << "Small herd";
  li a7, 4
  ecall
  j exit

print_More:
  la a0, More     # cout << "Wealthy cattle owner";
  li a7, 4
  ecall
  j exit

exit:
  li a7, 10       # return 0;
  ecall
