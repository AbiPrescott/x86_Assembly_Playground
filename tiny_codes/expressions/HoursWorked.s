#this program caluates the hours Jessica worked using the expression: (NightOut-NoonIn)+(NoonOut-MorningIn)
#LESSON LEARNED: read the reference guide properly. sub instruction subtracts 1st operand from second, not 2nd operand from first. 

.section .data
    MorningIn:
        .long 6
    NoonOut:
        .long 12
    NoonIn:
        .long 13
    NightOut:
        .long 15
.section .text
.globl _start
_start:


    movq MorningIn, %rax
    movq NoonIn, %rdx

    subq %rax, NoonOut      #First shift = 12-6 
    subq %rdx, NightOut     #Second shift = 15-13

    movq NoonOut, %rcx
    addq %rcx, NightOut     #first shift + second shift 

    movq NightOut, %rbx
    movq $1, %rax
    int $0x80

    
