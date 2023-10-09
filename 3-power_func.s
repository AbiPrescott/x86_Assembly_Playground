#this program raises a number to an exponent.
#enter 'echo $?' to see the result after execution
#
#Uses of the Registers
#   %ebp: base pointer
#   %esp: stack pointer
#   %ecx: holds exponent
#   %ebx: holds current result (%ebx = %ebx + %ebx * %eax)
#   %eax: holds the base number to be multiplied and also holds $1 for int$0x80
#
#How it works:
#   First, the arguments are pushed into the stack. Then, the base pointer (%ebp) is assigned the value of the stack pointer (%esp). 
#   The base pointer's job here is to simply extract the contents of the stack and move them around: it is merely used to access data in the stack frame.
#   The stack pointer's job here is to extend and shrink the stack frame.
#   
#   Now that the arguments are pushed in and the base address is established with its own base pointer, the base number is stored in %eax, and the exponent in %ecx
#   The exponent is compare to 1 and 0 to prevent the program from looping until it reacher 2^32. 
#   Then, if the exponent is not equal 1 or 0, then the stack pointer makes space to store the base number as a variable.
#   Then, the base number (in %eax) is copied to %ebx just so that they can be multiplied together, then the result is stored in %ebx. 
#   This process repeats until exponent = 1. 



.section .data

.section .text
.globl _start
    _start:
        pushl $0    #second argument (exponent)
        pushl $10   #first argument (base number)
        call power
        addl $8, %esp   #clears stack

        movl $1, %eax
        int $0x80

.type power, @function
    power:
        pushl %ebp 
        movl %esp, %ebp
        subl $4, %esp

        movl 8(%ebp), %eax
        movl 12(%ebp), %ecx

        movl %eax, -4(%ebp)
    
    power_loop_start:
        cmpl $1, %ecx
        je end_power
        cmpl $0, %ecx
        je if_zero
        movl -4(%ebp), %ebx
        imul %eax, %ebx
        
        movl %ebx, -4(%ebp)

        decl %ecx
        jmp power_loop_start

    if_zero: 
        mov $1, %ebx
        movl %ebp, %esp
        popl %ebp
        ret

    end_power:
        movl -4(%ebp), %ebx
        movl %ebp, %esp
        popl %ebp
        ret

    


 
