 #this program tests if the square function is empirically correct
# by looping through  and calculating the output of the digits -15 and 15
# if it is correct it outputs 0, then the 'square' function is correct.
# if it outputs 1, then it is incorrect
#
# EXECUTION:
#   to execute, you need to enter 'echo $?' twice because the first echo shows the exit status of sqaure2 
#   the second exit status is for this program. 
.section .data

.section .text
.globl _start

    _start:
        movl $5, %edi     
        movl %edi, %edx

    main:
        cmpl $5, %edx
        je valid_end

        movl $0, %eax      
        movl %edx, %ecx     
        pushl %edx
        call square

        popl %edx
        movl %edx, %edi
        imul %edx, %edi
        cmpl %eax, %edi
        jne invalid_end

        incl %edx
        jmp main

    valid_end:
        movl $0, %ebx
        movl $1, %eax
        int $0x80
    
    invalid_end:
        movl $1, %ebx
        movl $1, %eax
        int $0x80

