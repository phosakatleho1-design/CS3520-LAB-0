.data
prompt:   .asciz "Enter the height of the Mokorotlo: "   # string prompt = "Enter the height of the Mokorotlo: ";
star:     .asciz "*"                                    # string star = "*";
space:    .asciz " "                                    # string space = " ";
newline:  .asciz "\n"                                   # string newline = "\n";

.text
.globl _start

_start:
    li a7, 4
    la a0, prompt   # cout << "Enter the height of the Mokorotlo: ";
    ecall

    li a7, 5
    ecall           # cin >> height;
    mv s0, a0       # int height = a0;

    li s1, 1        # int row = 1;

# --- Outer loop: for (row = 1; row <= height; row++) ---
outer_loop:
    bgt s1, s0, end_outer_loop   # if (row > height) break;

    mv t0, s0
    sub t0, t0, s1   # spaces = height - row;
    li t1, 0         # int i = 0;

# --- Print spaces before stars ---
space_loop:
    bge t1, t0, end_space_loop   # while (i < spaces)
    li a7, 4
    la a0, space   # cout << " ";
    ecall
    addi t1, t1, 1
    j space_loop

end_space_loop:
    li t2, 0
    slli t4, s1, 1      # t4 = row * 2
    addi t4, t4, -1     # stars = 2*row - 1;

# --- Print stars ---
star_loop:
    bge t2, t4, end_star_loop   # while (j < stars)
    li a7, 4
    la a0, star   # cout << "*";
    ecall
    addi t2, t2, 1
    j star_loop

end_star_loop:
    li a7, 4
    la a0, newline   # cout << "\n";
    ecall

    addi s1, s1, 1   # row++;
    j outer_loop

# --- End of outer loop ---
end_outer_loop:
    li a7, 10   # return 0;
    ecall
