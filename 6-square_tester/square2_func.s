
.section .data

.section .text 
.local _start
.globl square

_start:
.type square, @function     #I don't have any local variables here, so that is why I'm not using any of the callee-saved resiters. 
    
    square:
        pushl %ebp
        movl %esp, %ebp

        cmpl $0, %ecx
        jle negative_num

    positive_num:

        cmpl $0, %ecx       #base-case: when %ecx (counter) reaches 0, clean up and exit function. 
        je end_square

        decl %ecx
        pushl %edx
        call square 
        popl %edx
        addl %edx, %eax     #I'm using %eax as the accumulator and to store the final result (callee rule)
    
    negative_num:

        cmpl $0, %ecx       #base-case: when %ecx (counter) reaches 0, clean up and exit function. 
        je end_square

        incl %ecx
        pushl %edx
        call square 
        popl %edx
        imul $-1, %edx
        addl %edx, %eax     #I'm using %eax as the accumulator and to store the final result (callee rule)

    end_square:
        movl %ebp, %esp
        popl %ebp
        ret 
