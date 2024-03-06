section .text
global GetFunctionAddress

GetFunctionAddress:
    ; Save callee-saved registers and prepare the stack
    sub rsp, 200h
    mov [rsp + 40h], rbp
    mov [rsp + 48h], rdi
    mov [rsp + 50h], rsi
    mov [rsp + 58h], rbx
    mov [rsp + 60h], rcx  ; Save argument passed in RCX
    mov [rsp + 68h], r12
    mov [rsp + 70h], r13
    mov [rsp + 78h], r14
    mov [rsp + 80h], r15

    ; Start of finding kernel32 base address
    mov rdi, -1
    inc rdi
    xor rax, rax
    lea rsi, [rax + 0x10]
    add rsi, 0x50
    mov rbx, gs:[rsi]
    lea rsi, [rbx + 0x10 + 0x8]
    mov rbx, [rsi]
    lea rsi, [rbx + 0x10 + 0x10]
    mov rbx, [rsi]
    mov rbx, [rbx]
    mov rbx, [rbx]
    lea rsi, [rbx + 0x10 + 0x10]
    mov rbx, [rsi]

    ; RBX now contains Kernel32 base address

    ; Function name comparison preparation
    mov rax, [rsp + 60h]
    mov rax, [rax]  ; Dereference to get the function name

    ; Export table parsing setup
    xor r8, r8
    mov r8d, [rbx + 0x3c]  ; Adjusted to directly use 0x3c for DOS->e_lfanew
    mov rdx, r8
    add rdx, rbx
    mov r8d, [rdx + 0x88]  ; Adjusted for direct offset
    add r8, rbx
    xor rsi, rsi
    mov esi, [r8 + 0x20]  ; Names table
    add rsi, rbx
    xor rcx, rcx
    mov r9, rax  ; Prepared function name for comparison

Get_Function:
    inc rcx
    xor rax, rax
    mov eax, [rsi + rcx * 4]
    add rax, rbx
    cmp qword [rax], r9
    jnz Get_Function
    xor rsi, rsi
    mov esi, [r8 + 0x24]
    add rsi, rbx
    mov cx, [rsi + rcx * 2]
    xor rsi, rsi
    mov esi, [r8 + 0x1c]
    add rsi, rbx
    xor rdx, rdx
    mov edx, [rsi + rcx * 4]
    add rdx, rbx

    ; Place the found function address in RAX for return
    mov rax, rdx

    ; Restore registers and clean up the stack
    mov rbp, [rsp + 40h]
    mov rdi, [rsp + 48h]
    mov rsi, [rsp + 50h]
    mov rbx, [rsp + 58h]
    mov r12, [rsp + 68h]
    mov r13, [rsp + 70h]
    mov r14, [rsp + 78h]
    mov r15, [rsp + 80h]
    add rsp, 200h
    ret
