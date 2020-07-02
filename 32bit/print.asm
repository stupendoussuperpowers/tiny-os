[bits 32]

VIDEO_MEM equ 0xb8000
W_ON_B equ 0x0f

print:
pusha
mov edx, VIDEO_MEM

print_loop:
mov al, [ebx]
mov ah, W_ON_B

cmp al, 0
je print_done

mov [edx], ax

add ebx, 1
add edx, 2

jmp print_loop

print_done:
popa
ret
