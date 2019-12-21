secretMonth proc
	; random function and count size of string
	xor ebx,ebx
	xor eax,eax       ;;;;;;;;;
	mov eax,12        ;;;;;;;;;
	call Randomize     ;;;;;;;;;;;
	call Randomrange   ;;;;;;;;;;;
	movzx bx,al       ;;;;;;;;;;;;
	;call writedec 
	;call dumpregs
	;mov garbage, eax
	xor esi, esi
	cmp bx, 0
	je L0
	cmp bx, 13
	je L13
	cmp bx, 14
	je L14
	cmp bx, 15
	je L15
	cmp bx, 1
	jne L1
	mov esi, offset month1
	mov count, sizeof month1
	dec count
	dec count    ;bk
	movzx ecx, count
	xor edi, edi
	arrayC1:
	mov al, [esi]
	mov month[edi], al
	mov monthC[edi], al
	inc edi
	inc esi
	Loop arrayC1

	jmp last
	L1:
	cmp bx, 2
	jne L2
	mov esi, offset month2
	mov count, sizeof month2
	dec count
	dec count
	movzx ecx, count
	xor edi, edi
	arrayC2:
	mov al, [esi]
	mov month[edi], al
	mov monthC[edi], al
	inc edi
	inc esi
	Loop arrayC2
	jmp last
	L2:
	cmp bx, 3
	jne L3
	mov esi, offset month3
	mov count, sizeof month3
	dec count
	dec count
	movzx ecx, count
	xor edi, edi
	arrayC3:
	mov al, [esi]
	mov month[edi], al
	mov monthC[edi], al
	inc edi
	inc esi
	Loop arrayC3
	jmp last
	L3:
	cmp bx, 4
	jne L4
	mov esi, offset month4
	mov count, sizeof month4
	dec count
	dec count
	movzx ecx, count
	xor edi, edi
	arrayC4:
	mov al, [esi]
	mov month[edi], al
	mov monthC[edi], al
	inc edi
	inc esi
	Loop arrayC4
	jmp last
	L4:
	cmp bx, 5
	jne L5
	L0:
	mov esi, offset month5
	mov count, sizeof month5
	dec count
	dec count
	movzx ecx, count
	xor edi, edi
	arrayC5:
	mov al, [esi]
	mov monthC[edi], al
	mov month[edi], al
	inc edi
	inc esi
	Loop arrayC5
	jmp last
	L5:
	cmp bx, 6
	jne L6
	mov esi, offset month6
	mov count, sizeof month6
	dec count
	dec count
	movzx ecx, count
	xor edi, edi
	arrayC6:
	mov al, [esi]
	mov monthC[edi], al
	mov month[edi], al
	inc edi
	inc esi
	Loop arrayC6
	jmp last
	L6:
	cmp bx, 7
	jne L7
	mov esi, offset month7
	mov count, sizeof month7
	dec count
	dec count
	movzx ecx, count
	xor edi, edi
	arrayC7:
	mov al, [esi]
	mov monthC[edi], al
	mov month[edi], al
	inc edi
	inc esi
	Loop arrayC7
	jmp last
	L7:
	cmp bx, 8
	jne L8
	L13:
	mov esi, offset month8
	mov count, sizeof month8
	dec count
	dec count
	movzx ecx, count
	xor edi, edi
	arrayC8:
	mov al, [esi]
	mov monthC[edi], al
	mov month[edi], al
	inc edi
	inc esi
	Loop arrayC8
	jmp last
	L8:
	cmp bx, 9
	jne L9
	mov esi, offset month9
	mov count, sizeof month9
	dec count
	dec count
	movzx ecx, count
	xor edi, edi
	arrayC9:
	mov al, [esi]
	mov monthC[edi], al
	mov month[edi], al
	inc edi
	inc esi
	Loop arrayC9
	jmp last

	L9:
	cmp bx, 10
	jne L10
	L14:
	mov esi, offset month10
	mov count, sizeof month10
	dec count
	dec count
	movzx ecx, count
	xor edi, edi
	arrayC10:
	mov al, [esi]
	mov monthC[edi], al
	mov month[edi], al
	inc edi
	inc esi
	Loop arrayC10
	jmp last

	L10:
	cmp bx,11
	jne L11
	mov esi, offset month11
	mov count, sizeof month11
	dec count
	dec count
	movzx ecx, count
	xor edi, edi
	arrayC11:
	mov al, [esi]
	mov month[edi], al
	mov monthC[edi], al
	inc edi
	inc esi
	Loop arrayC11
	jmp last

	L11:
	cmp bx, 12
	jne L12
	L15:
	mov esi, offset month12
	mov count, sizeof month12
	dec count
	dec count
	movzx ecx, count
	xor edi, edi
	arrayC12:
	mov al, [esi]
	mov monthC[edi], al
	mov month[edi], al
	inc edi
	inc esi
	Loop arrayC12
	last:
	L12:

	ret
secretMonth endp
