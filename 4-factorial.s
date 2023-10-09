#This function is a recursive function and its purpose is to caluclute and output the factorial of a given input. (the output must be less than 256)

.section .data

.section .text
.globl _start

_start:
    pushl $4
    call factorial
    popl %ebx
    movl %eax, %ebx

    movl $1, %eax
    int $0x80

.type factorial, @function

factorial:
    pushl %ebp
    movl %esp, %ebp
    movl 8(%ebp), %eax
    cmpl $1, %eax
    je end_factorial
    decl %eax
    pushl %eax
    call factorial
    
    pop %ebx
    incl %ebx
    imul %ebx, %eax

end_factorial:
    movl %ebp, %esp
    popl %ebp 
    ret

    