/*this program takes 5 test scores as its input and outputs the average score. 
I am praticing applying expressions. The expression for this program is: (a+b+c+d+e)/5 
I also want to practice addressing modes, so I'll store and retrieve the test scores in memory locations.*/

.section .data
    testscores:
        .long 87, 28, 84, 96, 98
.section .text
.globl _start
_start:
	movl $0, %ecx
	movl $0, %eax

	add_loop:
		addl testscores(, %ecx, 1), %eax
		addl $4, %ecx
		cmpl $20, %ecx
		jne add_loop
	
	movl $5, %ebx
	idiv %ebx
	movl %eax, %ebx
	movl $1, %eax
	int $0x80

/*had a bug in it. Problem was: it started with accessing the second memory location starting from testscores. 
Lesson Learned: 'addl testscores(, %ecx, 1), %eax' means 'take 4 bytes of data from %ecx*1 + testscores and store in %eax'
				the 4 bytes comes from the fact that it is add long, not because the value of %ecx is 4 bytes. 





