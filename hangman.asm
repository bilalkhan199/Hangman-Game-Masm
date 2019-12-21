INCLUDE Irvine16.inc
.data
	month1 byte "january",0dh,0ah
	month2 byte "febuary",0dh,0ah
	month3 byte "march",0dh,0ah
	month4 byte "april",0dh,0ah
	month5 byte "may",0dh,0ah
	month6 byte "june",0dh,0ah
	month7 byte "july",0dh,0ah
	month8 byte "august",0dh,0ah
	month9 byte "september",0dh,0ah
	month10 byte "october",0dh,0ah
	month11 byte "november",0dh,0ah
	month12 byte "december",0dh,0ah
	;garbage dword ?
	count byte 0
	month byte 10 dup(0)
	monthC byte 10 dup(0)
	hide_month byte 10 dup('-')
	ATTRIB_HI = 10000000b
	showmsg byte "MADE BY TAIMOOR,ABDULLAH AND BILAL ",0dh,0ah
	msg1 byte "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@",0dh,0ah
	msg2 byte "Hangman Game! ",0dh,0ah
	msg3 byte "You have ",0dh,0ah
	msg4 byte " tries to try and guess the month. ",0dh,0ah
	msg5 byte "Play! ",0dh,0ah

	msg6 byte "Guess a letter: ",0dh,0ah
	msg7 byte "Incorrect letter. ",0dh,0ah
	msg8 byte "NICE! You guess a letter ",0dh,0ah
	msg9 byte "Congratulations! You got it! ",0dh,0ah
	msg10 byte "The month is ", 0dh,0ah
	msg11 byte "NOOOOOOO!...you've been hanged. ",0dh,0ah
	msg12 byte "The month was ", 0dh,0ah
	msg13 byte "play again y/n ", 0dh,0ah

	numTry byte 3
	letter byte 0
	flag1 byte 0
	flag2 byte 0
	color  BYTE red
	char byte ?

.code
INCLUDE func.inc
hideMonth proc
	mov cl, count
	xor esi, esi
	hide:
	;call dumpregs
	mov al,hide_month[esi]
	;call writechar  	;;INTERUPTS ;;
	push eax
	push edx
	mov ah,2 ; character output function
	mov dl,al
	int 21h
	pop edx
	pop eax
	mov char,al       
	inc esi
	Loop hide
	call crlf
	
	ret
hideMonth endp

mainMenu proc
	
	call crlf
	mov ah,40h
	mov bx,1
	mov cx,SIZEOF msg1-3         ;;;;;;;;;;;;;
	mov si,offset msg1
	mov dx,OFFSET msg1
	
	call coloring
	int 10h
	;int 21h
	;mov edx, offset msg1            ;;;;;;;;;;;;;;;;;;;;;;
	;call writestring
	call crlf
	call crlf
	
	mov ah,40h
	mov bx,1
	mov cx,SIZEOF msg2-3
	mov si,offset msg2
	mov dx,OFFSET msg2         ;;;;;;;;;;
	call coloring
	;int 21h
	;mov edx, offset msg2      ;;;;;;;;;;
	;call writestring  ;;;;;;;;;;;;;;;;
	call crlf
	call crlf
	
	mov ah,40h
	mov bx,1
	mov cx,SIZEOF msg3-3
	mov si,offset msg3
	mov dx,OFFSET msg3         ;;;;;;;;;;
	call coloring
	int 10h
	;mov edx, offset msg3
	;call writestring

	xor eax,eax
	mov al, numTry
	call writedec

	mov ah,40h
	mov bx,1
	mov cx,SIZEOF msg4-3    ;;;;;;;;;
	mov si,offset msg4
	mov dx,OFFSET msg4         ;;;;;;;;;;
	call coloring
	int 10h
	;mov edx, offset msg4    ;;;;;;
	;call writestring
	call crlf
	call crlf

	mov ah,40h
	mov bx,1
	mov cx,SIZEOF msg1-3    ;;;;;;;;;
	mov si,offset msg1
	mov dx,OFFSET msg1         ;;;;;;;;;;
	call coloring
	int 10h
	;mov edx, offset msg1
	;call writestring
	call crlf
	call crlf
	ret
mainMenu endp
LoopWhile proc

	mov cl, numTry
	.while cl != 0
	call mainMenu
	call hideMonth
	xor eax,eax
	
	mov ah,40h
	mov bx,1
	mov cx,SIZEOF msg6-3    ;;;;;;;;;
	mov si,offset msg6
	mov dx,OFFSET msg6         ;;;;;;;;;;
	call coloring
	int 10h
	;mov edx, offset msg6
	;call writestring
	;call readchar      ;;;;;;;;;;;
	xor eax,eax          ;;;;;;;;;
	mov ax,@data      ;;;;;;;;;;;;
	mov ds,ax
	mov ah,1
	int 21h
	mov char,al       ;taking character input to check
	
	call crlf
	call crlf
	;call dumpregs
	mov letter, al
	call checkGuess
	mov al, flag2
	cmp al, 0
	jz match
	
	mov ah,40h
	mov bx,1
	mov cx,SIZEOF msg7-3    ;;;;;;;;;
	mov si,offset msg7
	mov dx,OFFSET msg7         ;;;;;;;;;;
	call coloring
	int 10h
	;mov edx, offset msg7
	;call writestring
	call crlf
	mov al, numTry
	dec al
	mov numTry, al
	jmp nextt

	match:
	mov ah,40h
	mov bx,1
	mov cx,SIZEOF msg8-3    ;;;;;;;;;
	mov si,offset msg8
	mov dx,OFFSET msg8         ;;;;;;;;;;
	call coloring
	int 10h;mov edx, offset msg8
	;call writestring
	call crlf
	nextt:
	call CompareString
	mov al, flag1
	cmp al, 1
	jnz notBreak
	
	mov ah,40h
	mov bx,1
	mov cx,SIZEOF msg9 -3    ;;;;;;;;;
	mov si,offset msg9
	mov dx,OFFSET msg9         ;;;;;;;;;;
	call coloring
	int 10h;mov edx, offset msg9
	;call writestring
	call crlf
	call mainMenu
	mov ah,40h
	mov bx,1
	mov cx,SIZEOF msg10-3    ;;;;;;;;;
	mov si,offset msg10
	mov dx,OFFSET msg10        ;;;;;;;;;;
	call coloring
	int 10h;mov edx, offset msg10
	;call writestring
	mov cl, count
	xor esi,esi
	search:
	mov al, month[esi]
	;call writechar                                ;;;;; INTERUTOTS
	mov ah,2 ; character output function
	mov dl,al
	int 21h
	inc esi
	Loop search
	call crlf
	jmp break

	notBreak:

	mov al, numTry
	cmp al, 0
	jnz continue
	mov ah,40h
	mov bx,1
	mov cx,SIZEOF msg11-3   ;;;;;;;;;
	mov si,offset msg11
	mov dx,OFFSET msg11        ;;;;;;;;;;
	call coloring
	int 10h;mov edx, offset msg11
	;call writestring
	call crlf
	call mainMenu
	mov ah,40h
	mov bx,1
	mov cx,SIZEOF msg12-3    ;;;;;;;;;
	mov si,offset msg12
	mov dx,OFFSET msg12        ;;;;;;;;;;
	call coloring
	int 10h;mov edx, offset msg12
	;call writestring
	mov cl, count
	xor esi,esi
	search1:
	mov al, month[esi]
	mov ah,2 ; character output function
	mov dl,al
	int 21h
	inc esi
	Loop search1
	call crlf
	continue:
	mov cl, numTry
	mov flag1,0
	mov flag2,0
	.endw

	break:
	ret
LoopWhile endp

checkGuess proc
	xor esi,esi
	xor edi,edi
	mov al, letter
	movzx edi, count
	.while edi != esi
	cmp al, monthC[esi]
	jz next1
	inc esi
	.endw
	mov flag2, 1
	Jmp next3
	next1:
	xor ebx,ebx
	mov bl, hide_month[esi]
	mov hide_month[esi], al
	mov monthC[esi], bl
	;call dumpregs
	next3:
	ret
checkGuess endp

CompareString proc
	xor edi,esi
	xor esi,esi
	movzx edi, count
	.while edi != esi
	xor eax,eax
	mov al, hide_month[esi]
	cmp al, month[esi]
	jnz next
	inc esi
	.endw
	mov flag1, 1
	next:
	ret
CompareString endp

blankArray proc
	xor ecx,ecx
	xor esi, esi
	mov ecx, 10
	blank:
	mov hide_month[esi], '-'
	int 10h
	mov month[esi], 0
	mov monthC[esi],0

	inc esi
	Loop blank
	mov count, 0
	mov letter, 0
	mov numtry, 3
	mov flag1, 0
	mov flag2, 0
	;mov eax, garbage
	;call dumpregs
	ret
blankArray endp

AdvanceCursor PROC
;
; Advances the cursor n columns to the right.
; (Cursor does not wrap around to the next line.)
; Receives: CX = number of columns
; Returns: nothing
;--------------------------------------------------
pusha
L1: push cx ; save loop counter
mov ah,3 ; get cursor position
mov bh,0 ; into DH, DL
int 10h ; changes CX register!
inc dl ; increment column
mov ah,2 ; set cursor position
int 10h
pop cx ; restore loop counter
loop L1 ; next column
popa
ret
AdvanceCursor ENDP

coloring PROC 
L1: push cx ; save loop counter
mov ah,9 ; write character/attribute
mov al,[si] ; character to display
mov bh,0 ; video page 0
mov bl,color ; attribute
;MOV BL,0EH ; Background =
;MOV BL,4EH ; Background string color 
	
;or bl,ATTRIB_HI ; set blink/intensity bit
mov cx,1 ; display it one time
int 10h
mov cx,1 ; advance cursor to
call AdvanceCursor ; next screen column
;inc color ; next color
inc si ; next character
pop cx ; restore loop counter
loop L1
call Crlf
ret
coloring endp

Backgroundcolor proc

mov dx,3c8h ; video paletter port
mov al,0 ; index 0 (background color)
out dx,al
mov dx,3c9h ; colors go to port 3C9h
mov al,10 ; red
out dx,al
mov al,10 ; green (intensity = 63)
out dx,al
mov al,10 ; blue
out dx,al 
call clrscr
ret
Backgroundcolor endp

main proc
	mov ax,@data
	mov ds,ax
	call Backgroundcolor

	mov cx,SIZEOF showmsg-3
	mov si,offset showmsg
	mov dx,OFFSET showmsg
	call coloring
	int 10h
	
	
	again:
	call crlf
	mov ah,40h
	mov bx,1
	mov cx,SIZEOF msg5-3
	mov si,offset msg5
	mov dx,OFFSET msg5        ;;;;;;;;;;
	call coloring
	int 10h;mov edx, offset msg11
	;mov edx, offset msg5
	;call writestring
	call crlf
	xor esi,esi
	xor edi,edi
	
	call secretMonth
	call LoopWhile

	mov ah,40h
	mov bx,1
	mov cx,SIZEOF msg13-3    ;play again?
	mov si,offset msg13
	mov dx,OFFSET msg13       ;;;;;;;;;;
	call coloring
	int 10h;mov edx, offset msg13
	;call writestring
	;call readchar        ;;;;;;;;;;
	
	mov ah,1
	int 21h
	mov char,al
	
	
	cmp char, 'y'
	jnz notagain
	invoke blankArray
	jmp again
	notagain:
		exit
main endp
end main

