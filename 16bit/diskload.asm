disk_load:
	pusha

	push dx
	mov ah, 0x02
	mov al, dh
	mov ch, 0x00
	mov dh, 0x00
	mov cl, 0x02

	;mov bx, MSG
	;call print
	
	int 0x13

	mov bx, MSG
	call print

	jc disk_error
	
	pop dx

	cmp dh, al
	
	jne disk_error
	popa
	ret

disk_error:
	mov bx, [ERROR_MSG]
	call print

ERROR_MSG: db "Disk Read Error", 0
MSG: db "Test Message", 0
