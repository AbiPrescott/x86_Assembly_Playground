;this is not my code. I got it from a tutorial. 
;I just needed a print function in order to play around with integers
;Source: https://www.youtube.com/watch?v=XuUD0WQ9kaE

section .bss
    digitSpace resb 100
    digitSpacePos resb 8

section .text
    global printRAX

printRAX:
    mov rcx, digitSpace
    mov rbx, 10
    mov [rcx], rbx
    inc rcx
    mov [digitSpacePos], rcx

printRAXLoop:
    mov rdx, 0
    mov rbx, 10
    div rbx
    push rax 
    add rdx, 48

    mov rcx, [digitSpacePos]
    mov [rcx], dl
    inc rcx
    mov [digitSpacePos], rcx

    pop rax
    cmp rax, 0
    jne printRAXLoop

printRAXLoop2:
    mov rcx, [digitSpacePos]

    mov rax, 1
    mov rdi, 1
    mov rsi, rcx
    mov rdx, 1
    syscall

    mov rcx, [digitSpacePos]
    dec rcx
    mov [digitSpacePos], rcx
    cmp rcx, digitSpace
    jge printRAXLoop2

    ret



