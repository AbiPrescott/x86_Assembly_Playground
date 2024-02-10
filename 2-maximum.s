.section .data
data_items:
        .quad 3, 67, 34, 222, 45, 75, 54, 34, 44, 33, 22, 11, 66, 0

.section .text
.globl _start

#this section loads %eax with the xth digit of the array "data_items"
_start:
    mov $0, %rdi
    mov data_items(,%rdi, 4), %rax
    mov %rax, %rbx

#this section loads %ebx with the current highest digit that has been encountered
start_loop:
    cmp $1, %rax
    je loop_exit
    inc %rdi
    mov data_items(,%rdi, 4), %rax
    cmp %rbx, %rax
    jle start_loop

    mov %rax, %rbx
    jmp start_loop

#this section exits the program. The value in %ebx will be shown when command 'echo $?' is executed
loop_exit:
    mov $1, %rax
    int $0x80
