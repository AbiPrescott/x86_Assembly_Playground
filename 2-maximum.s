.section .data
    data_items:
        .long 3, 67, 34, 222, 45, 75, 54, 34, 44, 33, 22, 11, 66, 0

.section .text
.globl _start

#this section loads %eax with the xth digit of the array "data_items"
_start:
    movl $0, %edi
    movl data_items(,%edi, 4), %eax
    movl %eax, %ebx

#this section loads %ebx with the current highest digit that has been encountered
start_loop:
    cmpl $0, %eax
    je loop_exit
    incl %edi
    movl data_items(,%edi, 4), %eax
    cmpl %ebx, %eax
    jle start_loop

    movl %eax, %ebx
    jmp start_loop

#this section exits the program. The value in %ebx will be shown when command 'echo $?' is executed
loop_exit:
    movl $1, %eax
    int $0x80
