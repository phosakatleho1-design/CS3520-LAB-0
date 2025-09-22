.data
litres_msg: .asciz "Total litres: "             # string litres_msg = "Total litres: ";
mak_msg:    .asciz "\n Full Makokopo (20L): "   # string mak_msg = "\n Full Makokopo (20L): ";
rem_msg:    .asciz "\n Remaining litres: "      # string rem_msg = "\n Remaining litres: ";
prompt:     .asciz " Enter number of grain in litres"  # string prompt = "Enter number of grain in litres";

.text
.globl _start
_start:
    la a0, prompt    # cout << "Enter number of grain in litres";
    li a7, 4
    ecall

    li a7, 5         # cin >> litres;
    ecall
    mv t0, a0        # int litres = a0;

    li   t1, 20      # const int size = 20;
    div  t2, t0, t1  # int makokopo = litres / 20;
    rem  t3, t0, t1  # int remaining = litres % 20;

    la   a0, litres_msg   # cout << "Total litres: ";
    li   a7, 4
    ecall

    mv   a0, t0      # cout << litres;
    li   a7, 1
    ecall

    la   a0, mak_msg # cout << "\n Full Makokopo (20L): ";
    li   a7, 4
    ecall

    mv   a0, t2      # cout << makokopo;
    li   a7, 1
    ecall

    la   a0, rem_msg # cout << "\n Remaining litres: ";
    li   a7, 4
    ecall

    mv   a0, t3      # cout << remaining;
    li   a7, 1
    ecall

    li   a7, 10      # return 0;
    ecall
