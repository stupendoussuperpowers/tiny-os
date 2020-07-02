
[org 0x7c00]

KERNEL_OFFSET equ 0x1000

mov [BOOT_DRIVE], dl

mov bp, 0x9000
mov sp, bp

call load_kernel

call switch_to_pm

jmp $

%include "print.asm"
%include "../16bit/diskload.asm"
%include "gdt.asm"
%include "switch.asm"
%include "../16bit/print.asm"

[bits 16]

load_kernel:

mov bx, KERNEL_LOAD
call print_bios

mov bx, KERNEL_OFFSET
mov dh, 15
mov dl, [BOOT_DRIVE]
call disk_load

ret

[bits 32]

BEGIN_PM:

mov ebx, PROT_MODE
call print

call KERNEL_OFFSET

jmp $

BOOT_DRIVE db 0
PROT_MODE db "Inside protected mode"
KERNEL_LOAD DB "Loading kernel"

times 510-($-$$) db 0
dw 0xaa55 
