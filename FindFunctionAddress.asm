section .text
global GetFunctionAddress

GetFunctionAddress:
sub rsp, 200h
mov [rsp + 40h], rbp
mov [rsp + 48h], rdi
mov [rsp + 50h], rsi
mov [rsp + 58h], rbx
mov [rsp + 60h], rcx
mov [rsp + 68h], r12
mov [rsp + 70h], r13
mov [rsp + 78h], r14
mov [rsp + 80h], r15

mov rdi, -1
inc rdi
xor rax, rax
lea rsi, [rax + 0x10]
add rsi, 0x50
mov rbx, gs:[rsi]
lea rsi, [rbx + 0x10]
add rsi, 0x8
mov rbx, [rsi]
lea rsi, [rbx + 0x10]
add rsi, 0x10
mov rbx, [rsi]
mov rbx, [rbx]
mov rbx, [rbx]
lea rsi, [rbx + 0x10]
add rsi, 0x10
mov rbx, [rsi]

mov rax, [rsp + 60h]
mov rax, [rax]
xor r8, r8
xor r14, r14
mov r14d, 0x1E
add r14d, r14d
add r14, rbx
mov r8d, [r14]
xor r14, r14
mov rdx, r8
add rdx, rbx
mov r14d, 0x44
shl r14d, 1
add r14, rdx
mov r8d, [r14]
add r8, rbx
xor rsi, rsi
mov r14d, 0x10
shl r14d, 1
add r14, r8
mov esi, [r14]
add rsi, rbx
xor rcx, rcx
mov r9, rax

Get_Function:
inc rcx
xor rax, rax
mov eax, [rsi + rcx * 4]
add rax, rbx
cmp qword [rax], r9
jnz Get_Function
xor r14, r14
mov r14d, 0x12
shl r14d, 1
add r14, r8
mov esi, [r14]
add rsi, rbx
mov cx, [rsi + rcx * 2]
xor rsi, rsi
xor r14, r14
mov r14d, 0x0E
shl r14d, 1
add r14, r8
mov esi, [r14]
add rsi, rbx
xor rdx, rdx
mov edx, [rsi + rcx * 4]
add rdx, rbx
mov rax, rdx
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
