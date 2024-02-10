.section __DATA, __data
message:
  .asciz "Hello world!\n"
.section __TEXT, __text
  .globl  _main
_main:
  mov   $0x02000004, %rax            # system call for write
  mov   $1, %rdi                     # file descriptor 1 is stdout
  movq  message@GOTPCREL(%rip), %rsi # get string address
  mov   $13, %rdx                    # number of bytes
  syscall                            # execute syscall (write)
  mov   $0x02000001, %rax            # system call for exit
  xor   $0, %rdi                     # exit code 0
  syscall                            # execute syscall (exit)

