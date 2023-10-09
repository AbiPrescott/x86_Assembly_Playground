#THIS IS THE FIRST PROGRAM I WROTE WITHOUT ANY BUGS IN IT!!! 0 SECONDS SPENT ON DEBUGGING!! LET'S GOOOO
#
#this program squares the input and outputs the result. 
#It does it by adding the input to itself the input number of times. 
#   a^2 = a x a = (a + a + a) (a times). 
#   example: 5^2 = 5 x 5 = (5+5+5+5+5) 
#
#it is has a recursive function in it that is executed until the counter in %ecx == 0. 
#in the function square, a stack is made where it has the argument 'a' a + 1 number of times 
#then, when it is done calling itself 'a' number of times, the arguments are accumulated in the %eax register. 
#
#
#note: yes, it would make sense to just accumulate the result in %ebx because it is going to end up there anyway.
#      But apparently the accumulator must always be %eax. Just the standards, I guess. 
#note: will not work for negative numbers. Version 2 coming out soon...

.section .data

.section .text
.globl _start 

    _start:
        movl $8, %ebx
        movl $0, %eax
        movl %ebx, %ecx

        pushl %ebx
        call square

        popl %ebx
        movl %eax, %ebx
        movl $1, %eax
        int $0x80 

square, @function

    square:
        pushl %ebp
        movl %esp, %ebp

        cmpl $0, %ecx
        je end_square

        decl %ecx
        pushl %ebx
        call square
        popl %ebx
        addl %ebx, %eax

    end_square:
        movl %ebp, %esp
        popl %ebp
        ret

