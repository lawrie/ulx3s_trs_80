; z80dasm 1.1.5
; command line: z80dasm -a -t BOOT.ROM

	org	00100h

	di			;0100	f3 	. 
	xor a			;0101	af 	. 
	jp 00674h		;0102	c3 74 06 	. t . 
	jp 04000h		;0105	c3 00 40 	. . @ 
rst8:
	jp 04000h		;0108	c3 00 40 	. . @ 

	pop hl			;010b	e1 	. 
	jp (hl)			;010c	e9 	. 
	jp 0069fh		;010d	c3 9f 06 	. . . 
rst10:
	jp 04003h		;0110	c3 03 40 	. . @ 
	push bc			;0113	c5 	. 
	ld b,001h		;0114	06 01 	. . 
	jr $+48		;0116	18 2e 	. . 
	jp 04006h		;0118	c3 06 40 	. . @ 
	push bc			;011b	c5 	. 
	ld b,002h		;011c	06 02 	. . 
	jr $+40		;011e	18 26 	. & 
	jp 04009h		;0120	c3 09 40 	. . @ 
	push bc			;0123	c5 	. 
	ld b,004h		;0124	06 04 	. . 
	jr $+32		;0126	18 1e 	. . 
	jp 0400ch		;0128	c3 0c 40 	. . @ 
	ld de,04015h		;012b	11 15 40 	. . @ 
	jr $-27		;012e	18 e3 	. . 
	jp 0400fh		;0130	c3 0f 40 	. . @ 
	ld de,0401dh		;0133	11 1d 40 	. . @ 
	jr $-27		;0136	18 e3 	. . 
	jp 04012h		;0138	c3 12 40 	. . @ 
	ld de,04025h		;013b	11 25 40 	. % @ 
	jr $-35		;013e	18 db 	. . 
	jp 005d9h		;0140	c3 d9 05 	. . . 
	ret			;0143	c9 	. 

	nop			;0144	00 	. 
	nop			;0145	00 	. 
	jp 003c2h		;0146	c3 c2 03 	. . . 
	call 0002bh		;0149	cd 2b 00 	. + . 
	or a			;014c	b7 	. 
	ret nz			;014d	c0 	. 
	jr $-5		;014e	18 f9 	. . 
control_chars:
	dec c			;0150	0d 	. 
	dec c			;0151	0d 	. 
	rra			;0152	1f 	. 
	rra			;0153	1f 	. 
	ld bc,05b01h		;0154	01 01 5b 	. . [ 
	dec de			;0157	1b 	. 
	ld a,(bc)			;0158	0a 	. 
	ld a,(de)			;0159	1a 	. 
	ex af,af'			;015a	08 	. 
	jr $+11		;015b	18 09 	. . 
	add hl,de			;015d	19 	. 
	jr nz,$+34		;015e	20 20 	    
delay_loop:
	dec bc			;0160	0b 	. 
	ld a,b			;0161	78 	x 
	or c			;0162	b1 	. 
	jr nz,$-3		;0163	20 fb 	  . 
	ret			;0165	c9 	. 

nmi:
	ld sp,00600h		;0166	31 00 06 	1 . .
; Disk drive connected? 
	ld a,(037ech)		;0169	3a ec 37 	: . 7 
	inc a			;016c	3c 	< 
	cp 002h		;016d	fe 02 	. . 
	jp nc,00000h		;016f	d2 00 00 	. . . 
	jp 006cch		;0172	c3 cc 06 	. . 
. 
	ld de,04080h		;0175	11 80 40 	. . @ 
	ld hl,018f7h		;0178	21 f7 18 	! . . 
	ld bc,00027h		;017b	01 27 00 	. ' . 
	ldir		;017e	ed b0 	. . 
	ld hl,041e5h		;0180	21 e5 41 	! . A 
	ld (hl),03ah		;0183	36 3a 	6 : 
	inc hl			;0185	23 	# 
	ld (hl),b			;0186	70 	p 
	inc hl			;0187	23 	# 
	ld (hl),02ch		;0188	36 2c 	6 , 
	inc hl			;018a	23 	# 

	ld (040a7h),hl		;018b	22 a7 40 	" . @ 
	ld de,0012dh		;018e	11 2d 01 	. - . 
	ld b,01ch		;0191	06 1c 	. . 

	ld hl,04152h		;0193	21 52 41 	! R A 
	ld (hl),0c3h		;0196	36 c3 	6 . 
	inc hl			;0198	23 	# 
	ld (hl),e			;0199	73 	s 
	inc hl			;019a	23 	# 
	ld (hl),d			;019b	72 	r 
	inc hl			;019c	23 	# 
	djnz $-7		;019d	10 f7 	. . 
	ld b,015h		;019f	06 15 	. . 
	ld (hl),0c9h		;01a1	36 c9 	6 . 
	inc hl			;01a3	23 	# 
	inc hl			;01a4	23 	# 
	inc hl			;01a5	23 	# 
	djnz $-5		;01a6	10 f9 	. . 
	ld hl,042e8h		;01a8	21 e8 42 	! . B 
	ld (hl),b			;01ab	70 	p 
	ld sp,041f8h		;01ac	31 f8 41 	1 . A 
	call 01b8fh		;01af	cd 8f 1b 	. . . 
	call 001c9h		;01b2	cd c9 01 	. . . 
	ld hl,00105h		;01b5	21 05 01 	! . . 
	call 028a7h		;01b8	cd a7 28 	. . ( 
	call 01bb3h		;01bb	cd b3 1b 	. . . 
	jr c,$-9		;01be	38 f5 	8 . 
	rst 10h			;01c0	d7 	. 
	or a			;01c1	b7 	. 
	jr nz,$+20		;01c2	20 12 	  . 
	ld hl,0434ch		;01c4	21 4c 43 	! L C 
	inc hl			;01c7	23 	# 
	ld a,h			;01c8	7c 	| 
	or l			;01c9	b5 	. 
	jr z,$+29		;01ca	28 1b 	( . 
	ld a,(hl)			;01cc	7e 	~ 
	ld b,a			;01cd	47 	G 
	cpl			;01ce	2f 	/ 
	ld (hl),a			;01cf	77 	w 
	cp (hl)			;01d0	be 	. 
	ld (hl),b			;01d1	70 	p 
	jr z,$-11		;01d2	28 f3 	( . 
	jr $+19		;01d4	18 11 	. . 
	call 01e5ah		;01d6	cd 5a 1e 	. Z . 
	or a			;01d9	b7 	. 
	jp nz,01997h		;01da	c2 97 19 	. . . 
	ex de,hl			;01dd	eb 	. 
	dec hl			;01de	2b 	+ 
	ld a,08fh		;01df	3e 8f 	> . 
	ld b,(hl)			;01e1	46 	F 
	ld (hl),a			;01e2	77 	w 
	cp (hl)			;01e3	be 	. 
	ld (hl),b			;01e4	70 	p 
	jr nz,$-48		;01e5	20 ce 	  . 
	dec hl			;01e7	2b 	+ 
	ld de,04414h		;01e8	11 14 44 	. . D 
	rst 18h			;01eb	df 	. 
	jp c,0197ah		;01ec	da 7a 19 	. z . 
	ld de,0ffceh		;01ef	11 ce ff 	. . . 
	ld (040b1h),hl		;01f2	22 b1 40 	" . @ 
	add hl,de			;01f5	19 	. 
	ld (040a0h),hl		;01f6	22 a0 40 	" . @ 
	call 01b4dh		;01f9	cd 4d 1b 	. M . 
	ld hl,00111h		;01fc	21 11 01 	! . . 
	call 028a7h		;01ff	cd a7 28 	. . ( 
	jp 01a19h		;0202	c3 19 1a 	. . . 
ready:
	ld d,d			;0205	52 	R 
	ld b,l			;0206	45 	E 
	ld b,c			;0207	41 	A 
	ld b,h			;0208	44 	D 
	ld e,c			;0209	59 	Y 
	jr nz,$+2		;020a	20 00 	  . 
	nop			;020c	00 	. 
	nop			;020d	00 	. 
	nop			;020e	00 	. 
	nop			;020f	00 	. 
	nop			;0210	00 	. 

	dec c			;0211	0d 	. 
	dec c			;0212	0d 	. 
	dec c			;0213	0d 	. 
	dec c			;0214	0d 	. 
	dec c			;0215	0d 	. 
	dec c			;0216	0d 	. 
	dec c			;0217	0d 	. 
	dec c			;0218	0d 	. 
	dec c			;0219	0d 	. 
	dec c			;021a	0d 	. 
	dec c			;021b	0d 	. 
	dec c			;021c	0d 	. 
	dec c			;021d	0d 	. 
	dec c			;021e	0d 	. 
	dec c			;021f	0d 	. 
	dec c			;0220	0d 	. 
	dec c			;0221	0d 	. 
	dec c			;0222	0d 	. 
	dec c			;0223	0d 	. 
	dec c			;0224	0d 	. 
	dec c			;0225	0d 	. 
	dec c			;0226	0d 	. 
	dec c			;0227	0d 	. 
	dec c			;0228	0d 	. 
	dec c			;0229	0d 	. 
	dec c			;022a	0d 	. 
	dec c			;022b	0d 	. 
	nop			;022c	00 	. 

	ld e,02ch		;022d	1e 2c 	. , 
	jp 019a2h		;022f	c3 a2 19 	. . . 
	rst 10h			;0232	d7 	. 
	xor a			;0233	af 	. 
	ld bc,0803eh		;0234	01 3e 80 	. > . 
	ld bc,0013eh		;0237	01 3e 01 	. > . 
	push af			;023a	f5 	. 
	rst 8			;023b	cf 	. 
	jr z,$-49		;023c	28 cd 	( . 
	inc e			;023e	1c 	. 
	dec hl			;023f	2b 	+ 
	cp 080h		;0240	fe 80 	. . 
	jp nc,01e4ah		;0242	d2 4a 1e 	. J . 
	push af			;0245	f5 	. 
	rst 8			;0246	cf 	. 
	inc l			;0247	2c 	, 
	call 02b1ch		;0248	cd 1c 2b 	. . + 
	cp 030h		;024b	fe 30 	. 0 
	jp nc,01e4ah		;024d	d2 4a 1e 	. J . 
graphics:
	ld d,0ffh		;0250	16 ff 	. . 
	inc d			;0252	14 	. 
	sub 003h		;0253	d6 03 	. . 
	jr nc,$-3		;0255	30 fb 	0 . 
	add a,003h		;0257	c6 03 	. . 
	ld c,a			;0259	4f 	O 
	pop af			;025a	f1 	. 
	add a,a			;025b	87 	. 
	ld e,a			;025c	5f 	_ 
	ld b,002h		;025d	06 02 	. . 
	ld a,d			;025f	7a 	z 
	rra			;0260	1f 	. 
	ld d,a			;0261	57 	W 
	ld a,e			;0262	7b 	{ 
	rra			;0263	1f 	. 
	ld e,a			;0264	5f 	_ 
	djnz $-6		;0265	10 f8 	. . 
	ld a,c			;0267	79 	y 
	adc a,a			;0268	8f 	. 
	inc a			;0269	3c 	< 
	ld b,a			;026a	47 	G 
	xor a			;026b	af 	. 
	scf			;026c	37 	7 
	adc a,a			;026d	8f 	. 
	djnz $-1		;026e	10 fd 	. . 
	ld c,a			;0270	4f 	O 
	ld a,d			;0271	7a 	z 
	or 03ch		;0272	f6 3c 	. < 
	ld d,a			;0274	57 	W 
	ld a,(de)			;0275	1a 	. 
	or a			;0276	b7 	. 
	jp m,0017ch		;0277	fa 7c 01 	. | . 
	ld a,080h		;027a	3e 80 	> . 
	ld b,a			;027c	47 	G 
	pop af			;027d	f1 	. 
	or a			;027e	b7 	. 
	ld a,b			;027f	78 	x 
	jr z,$+18		;0280	28 10 	( . 
	ld (de),a			;0282	12 	. 
	jp m,0018fh		;0283	fa 8f 01 	. . . 
	ld a,c			;0286	79 	y 
	cpl			;0287	2f 	/ 
	ld c,a			;0288	4f 	O 
	ld a,(de)			;0289	1a 	. 
	and c			;028a	a1 	. 
	ld (de),a			;028b	12 	. 
	rst 8			;028c	cf 	. 
	add hl,hl			;028d	29 	) 
	ret			;028e	c9 	. 

	or c			;028f	b1 	. 
	jr $-5		;0290	18 f9 	. . 
	and c			;0292	a1 	. 
	add a,0ffh		;0293	c6 ff 	. . 
	sbc a,a			;0295	9f 	. 
	push hl			;0296	e5 	. 
	call 0098dh		;0297	cd 8d 09 	. . . 
	pop hl			;029a	e1 	. 
	jr $-15		;029b	18 ef 	. . 
	rst 10h			;029d	d7 	. 
	push hl			;029e	e5 	. 
	ld a,(04099h)		;029f	3a 99 40 	: . @ 
	or a			;02a2	b7 	. 
	jr nz,$+8		;02a3	20 06 	  . 
	call 00358h		;02a5	cd 58 03 	. X . 
	or a			;02a8	b7 	. 
	jr z,$+19		;02a9	28 11 	( . 
	push af			;02ab	f5 	. 
	xor a			;02ac	af 	. 
	ld (04099h),a		;02ad	32 99 40 	2 . @ 
	inc a			;02b0	3c 	< 
	call 02857h		;02b1	cd 57 28 	. W ( 
	pop af			;02b4	f1 	. 
	ld hl,(040d4h)		;02b5	2a d4 40 	* . @ 
	ld (hl),a			;02b8	77 	w 
	jp 02884h		;02b9	c3 84 28 	. . ( 
	ld hl,01928h		;02bc	21 28 19 	! ( . 
	ld (04121h),hl		;02bf	22 21 41 	" ! A 
	ld a,003h		;02c2	3e 03 	> . 
	ld (040afh),a		;02c4	32 af 40 	2 . @ 
	pop hl			;02c7	e1 	. 
	ret			;02c8	c9 	. 

cls:
	ld a,01ch		;02c9	3e 1c 	> . 
	call 0033ah		;02cb	cd 3a 03 	. : . 
	ld a,01fh		;02ce	3e 1f 	> . 
	jp 0033ah		;02d0	c3 3a 03 	. : . 
	ld a,r		;02d3	ed 5f 	. _ 
	ld (040abh),a		;02d5	32 ab 40 	2 . @ 
	ret			;02d8	c9 	. 

	ld hl,0fc01h		;02d9	21 01 fc 	! . . 
	call 00221h		;02dc	cd 21 02 	. ! . 
	ld b,00bh		;02df	06 0b 	. . 
	djnz $+0		;02e1	10 fe 	. . 
	ld hl,0fc02h		;02e3	21 02 fc 	! . . 
	call 00221h		;02e6	cd 21 02 	. ! . 
	ld b,00bh		;02e9	06 0b 	. . 
	djnz $+0		;02eb	10 fe 	. . 
	ld hl,0fc00h		;02ed	21 00 fc 	! . . 
	call 00221h		;02f0	cd 21 02 	. ! . 
	ld b,05ch		;02f3	06 5c 	. \ 
	djnz $+0		;02f5	10 fe 	. . 
	ret			;02f7	c9 	. 

cass_off:
	push hl			;02f8	e5 	. 
	ld hl,0fb00h		;02f9	21 00 fb 	! . . 
	jr $+29		;02fc	18 1b 	. . 
	ld a,(hl)			;02fe	7e 	~ 
	sub 023h		;02ff	d6 23 	. # 
	ld a,000h		;0301	3e 00 	> . 
	jr nz,$+15		;0303	20 0d 	  . 
	call 02b01h		;0305	cd 01 2b 	. . + 
	rst 8			;0308	cf 	. 
	inc l			;0309	2c 	, 
	ld a,e			;030a	7b 	{ 
	and d			;030b	a2 	. 
	add a,002h		;030c	c6 02 	. . 
	jp nc,01e4ah		;030e	d2 4a 1e 	. J . 
	dec a			;0311	3d 	= 

choose_cass:
	out (0feh),a		;0312	d3 fe 	. . 
	nop			;0314	00 	. 
	push hl			;0315	e5 	. 
	ld hl,0ff04h		;0316	21 04 ff 	! . . 
	call 00221h		;0319	cd 21 02 	. ! . 
	pop hl			;031c	e1 	. 
	ret			;031d	c9 	. 

turn_motor_on:
	ld hl,0ff00h		;031e	21 00 ff 	! . . 
	ld a,(0403dh)		;0321	3a 3d 40 	: = @ 
	and h			;0324	a4 	. 
	or l			;0325	b5 	. 
	out (0ffh),a		;0326	d3 ff 	. . 
	ld (0403dh),a		;0328	32 3d 40 	2 = @ 
	ret			;032b	c9 	. 

blink:
	ld a,(03c3fh)		;032c	3a 3f 3c 	: ? < 
	xor 00ah		;032f	ee 0a 	. . 
	ld (03c3fh),a		;0331	32 3f 3c 	2 ? < 
	ret			;0334	c9 	. 

read_tape_save:
	push bc			;0335	c5 	. 
	push hl			;0336	e5 	. 
	in a,(004h)		;0337	db 04 	. . 
	nop			;0339	00 	. 
	nop			;033a	00 	. 
	nop			;033b	00 	. 
	nop			;033c	00 	. 
	nop			;033d	00 	. 
	pop hl			;033e	e1 	. 
	pop bc			;033f	c1 	. 
	ret			;0340	c9 	. 

read_tape:
	in a,(004h)		;0341	db 04 	. . 
	ret			;0343	c9 	. 

	rst 38h			;0344	ff 	. 
	rla			;0345	17 	. 
	jr nc,$-3		;0346	30 fb 	0 . 
	ld b,041h		;0348	06 41 	. A 
	djnz $+0		;034a	10 fe 	. . 
	call 0021eh		;034c	cd 1e 02 	. . . 
	ld b,076h		;034f	06 76 	. v 
	djnz $+0		;0351	10 fe 	. . 
	in a,(0ffh)		;0353	db ff 	. . 
	ld b,a			;0355	47 	G 
	pop af			;0356	f1 	. 
	rl b		;0357	cb 10 	. . 
	rla			;0359	17 	. 
	push af			;035a	f5 	. 
	call 0021eh		;035b	cd 1e 02 	. . . 
	pop af			;035e	f1 	. 
	pop bc			;035f	c1 	. 
	ret			;0360	c9 	. 

	call 00264h		;0361	cd 64 02 	. d . 
write_tape:
	push hl			;0364	e5 	. 
	push bc			;0365	c5 	. 
	push de			;0366	d5 	. 
	push af			;0367	f5 	. 
	ld c,008h		;0368	0e 08 	. . 
	ld d,a			;036a	57 	W 
	call 001d9h		;036b	cd d9 01 	. . . 
	ld a,d			;036e	7a 	z 
	rlca			;036f	07 	. 
	ld d,a			;0370	57 	W 
	jr nc,$+13		;0371	30 0b 	0 . 
	call 001d9h		;0373	cd d9 01 	. . . 
	dec c			;0376	0d 	. 
	jr nz,$-12		;0377	20 f2 	  . 
	pop af			;0379	f1 	. 
	pop de			;037a	d1 	. 
	pop bc			;037b	c1 	. 
	pop hl			;037c	e1 	. 
	ret			;037d	c9 	. 

	ld b,087h		;037e	06 87 	. . 
	djnz $+0		;0380	10 fe 	. . 
	jr $-12		;0382	18 f2 	. . 
	call 001feh		;0384	cd fe 01 	. . . 

write_tape_header:
	ld b,0ffh		;0387	06 ff 	. . 
	xor a			;0389	af 	. 
	call 00264h		;038a	cd 64 02 	. d . 
	djnz $-3		;038d	10 fb 	. . 
	ld a,0a5h		;038f	3e a5 	> . 
	jr $-45		;0391	18 d1 	. . 
	call 001feh		;0393	cd fe 01 	. . . 

read_header:
	push hl			;0396	e5 	. 
	xor a			;0397	af 	. 
	call 00241h		;0398	cd 41 02 	. A . 
	cp 0a5h		;039b	fe a5 	. . 
	jr nz,$-5		;039d	20 f9 	  . 

found_sync:
	ld a,02ah		;039f	3e 2a 	> * 
	ld (03c3eh),a		;03a1	32 3e 3c 	2 > < 
	ld (03c3fh),a		;03a4	32 3f 3c 	2 ? < 
	pop hl			;03a7	e1 	. 
	ret			;03a8	c9 	. 

	call 00314h		;03a9	cd 14 03 	. . . 
	ld (040dfh),hl		;03ac	22 df 40 	" . @ 
	call 001f8h		;03af	cd f8 01 	. . . 
	call 041e2h		;03b2	cd e2 41 	. . A 
	ld sp,04288h		;03b5	31 88 42 	1 . B 
	call 020feh		;03b8	cd fe 20 	. .   
	ld a,02ah		;03bb	3e 2a 	> * 
	call 0032ah		;03bd	cd 2a 03 	. * . 
	call 01bb3h		;03c0	cd b3 1b 	. . . 
	jp c,006cch		;03c3	da cc 06 	. . . 
	rst 10h			;03c6	d7 	. 
	jp z,01997h		;03c7	ca 97 19 	. . . 
	cp 02fh		;03ca	fe 2f 	. / 
	jr z,$+81		;03cc	28 4f 	( O 
	call 00293h		;03ce	cd 93 02 	. . . 
	call 00235h		;03d1	cd 35 02 	. 5 . 
	cp 055h		;03d4	fe 55 	. U 
	jr nz,$-5		;03d6	20 f9 	  . 
	ld b,006h		;03d8	06 06 	. . 
	ld a,(hl)			;03da	7e 	~ 
	or a			;03db	b7 	. 
	jr z,$+11		;03dc	28 09 	( . 
	call 00235h		;03de	cd 35 02 	. 5 . 
	cp (hl)			;03e1	be 	. 
	jr nz,$-17		;03e2	20 ed 	  . 
	inc hl			;03e4	23 	# 
	djnz $-11		;03e5	10 f3 	. . 
	call 0022ch		;03e7	cd 2c 02 	. , . 
	call 00235h		;03ea	cd 35 02 	. 5 . 
	cp 078h		;03ed	fe 78 	. x 
	jr z,$-70		;03ef	28 b8 	( . 
	cp 03ch		;03f1	fe 3c 	. < 
	jr nz,$-9		;03f3	20 f5 	  . 
	call 00235h		;03f5	cd 35 02 	. 5 . 
	ld b,a			;03f8	47 	G 
	call 00314h		;03f9	cd 14 03 	. . . 
	add a,l			;03fc	85 	. 
	ld c,a			;03fd	4f 	O 
	call 00235h		;03fe	cd 35 02 	. 5 . 
	ld (hl),a			;0401	77 	w 
	inc hl			;0402	23 	# 
	add a,c			;0403	81 	. 
	ld c,a			;0404	4f 	O 
	djnz $-7		;0405	10 f7 	. . 
	call 00235h		;0407	cd 35 02 	. 5 . 
	cp c			;040a	b9 	. 
	jr z,$-36		;040b	28 da 	( . 
	ld a,043h		;040d	3e 43 	> C 
	ld (03c3eh),a		;040f	32 3e 3c 	2 > < 
	jr $-40		;0412	18 d6 	. . 
	call 00235h		;0414	cd 35 02 	. 5 . 
	ld l,a			;0417	6f 	o 
	call 00235h		;0418	cd 35 02 	. 5 . 
	ld h,a			;041b	67 	g 
	ret			;041c	c9 	. 

	ex de,hl			;041d	eb 	. 
	ld hl,(040dfh)		;041e	2a df 40 	* . @ 
	ex de,hl			;0421	eb 	. 
	rst 10h			;0422	d7 	. 
	call nz,01e5ah		;0423	c4 5a 1e 	. Z . 
	jr nz,$-116		;0426	20 8a 	  . 
	ex de,hl			;0428	eb 	. 
	jp (hl)			;0429	e9 	. 
	push bc			;042a	c5 	. 
	ld c,a			;042b	4f 	O 
	call 041c1h		;042c	cd c1 41 	. . A 
	ld a,(0409ch)		;042f	3a 9c 40 	: . @ 
	or a			;0432	b7 	. 
	ld a,c			;0433	79 	y 
	pop bc			;0434	c1 	. 
	jp m,00264h		;0435	fa 64 02 	. d . 
	jr nz,$+100		;0438	20 62 	  b 
	push de			;043a	d5 	. 
	call 00033h		;043b	cd 33 00 	. 3 . 
	push af			;043e	f5 	. 
	call 00348h		;043f	cd 48 03 	. H . 
	ld (040a6h),a		;0442	32 a6 40 	2 . @ 
	pop af			;0445	f1 	. 
	pop de			;0446	d1 	. 
	ret			;0447	c9 	. 

	ld a,(0403dh)		;0448	3a 3d 40 	: = @ 
	and 008h		;044b	e6 08 	. . 
	ld a,(04020h)		;044d	3a 20 40 	:   @ 
	jr z,$+5		;0450	28 03 	( . 
	rrca			;0452	0f 	. 
	and 01fh		;0453	e6 1f 	. . 
	and 03fh		;0455	e6 3f 	. ? 
	ret			;0457	c9 	. 

	call 041c4h		;0458	cd c4 41 	. . A 
	push de			;045b	d5 	. 
	call 0002bh		;045c	cd 2b 00 	. + . 
	pop de			;045f	d1 	. 
	ret			;0460	c9 	. 

	xor a			;0461	af 	. 
	ld (04099h),a		;0462	32 99 40 	2 . @ 
	ld (040a6h),a		;0465	32 a6 40 	2 . @ 
	call 041afh		;0468	cd af 41 	. . A 
	push bc			;046b	c5 	. 
	ld hl,(040a7h)		;046c	2a a7 40 	* . @ 
	ld b,0f0h		;046f	06 f0 	. . 
	call 005d9h		;0471	cd d9 05 	. . . 
	push af			;0474	f5 	. 
	ld c,b			;0475	48 	H 
	ld b,000h		;0476	06 00 	. . 
	add hl,bc			;0478	09 	. 
	ld (hl),000h		;0479	36 00 	6 . 
	ld hl,(040a7h)		;047b	2a a7 40 	* . @ 
	pop af			;047e	f1 	. 
	pop bc			;047f	c1 	. 
	dec hl			;0480	2b 	+ 
	ret c			;0481	d8 	. 
	xor a			;0482	af 	. 
	ret			;0483	c9 	. 

	call 00358h		;0484	cd 58 03 	. X . 
	or a			;0487	b7 	. 
	ret nz			;0488	c0 	. 
	jr $-5		;0489	18 f9 	. . 
	xor a			;048b	af 	. 
	ld (0409ch),a		;048c	32 9c 40 	2 . @ 
	ld a,(0409bh)		;048f	3a 9b 40 	: . @ 
	or a			;0492	b7 	. 
	ret z			;0493	c8 	. 
	ld a,00dh		;0494	3e 0d 	> . 
	push de			;0496	d5 	. 
	call 0039ch		;0497	cd 9c 03 	. . . 
	pop de			;049a	d1 	. 
	ret			;049b	c9 	. 

	push af			;049c	f5 	. 
	push de			;049d	d5 	. 
	push bc			;049e	c5 	. 
	ld c,a			;049f	4f 	O 
	ld e,000h		;04a0	1e 00 	. . 
	cp 00ch		;04a2	fe 0c 	. . 
	jr z,$+18		;04a4	28 10 	( . 
	cp 00ah		;04a6	fe 0a 	. . 
	jr nz,$+5		;04a8	20 03 	  . 
	ld a,00dh		;04aa	3e 0d 	> . 
	ld c,a			;04ac	4f 	O 
	cp 00dh		;04ad	fe 0d 	. . 
	jr z,$+7		;04af	28 05 	( . 
	ld a,(0409bh)		;04b1	3a 9b 40 	: . @ 
	inc a			;04b4	3c 	< 
	ld e,a			;04b5	5f 	_ 
	ld a,e			;04b6	7b 	{ 
	ld (0409bh),a		;04b7	32 9b 40 	2 . @ 
	ld a,c			;04ba	79 	y 
	call 0003bh		;04bb	cd 3b 00 	. ; . 
	pop bc			;04be	c1 	. 
	pop de			;04bf	d1 	. 
	pop af			;04c0	f1 	. 
	ret			;04c1	c9 	. 

	push hl			;04c2	e5 	. 
	push ix		;04c3	dd e5 	. . 
	push de			;04c5	d5 	. 
	pop ix		;04c6	dd e1 	. . 
	push de			;04c8	d5 	. 
	ld hl,003ddh		;04c9	21 dd 03 	! . . 
	push hl			;04cc	e5 	. 
	ld c,a			;04cd	4f 	O 
	ld a,(de)			;04ce	1a 	. 
	and b			;04cf	a0 	. 
	cp b			;04d0	b8 	. 
	jp nz,04033h		;04d1	c2 33 40 	. 3 @ 
	cp 002h		;04d4	fe 02 	. . 
	ld l,(ix+001h)		;04d6	dd 6e 01 	. n . 
	ld h,(ix+002h)		;04d9	dd 66 02 	. f . 
	jp (hl)			;04dc	e9 	. 
	pop de			;04dd	d1 	. 
	pop ix		;04de	dd e1 	. . 
	pop hl			;04e0	e1 	. 
	pop bc			;04e1	c1 	. 
	ret			;04e2	c9 	. 

	ld hl,04036h		;04e3	21 36 40 	! 6 @ 
	ld bc,03801h		;04e6	01 01 38 	. . 8 
	ld d,000h		;04e9	16 00 	. . 
	ld a,(bc)			;04eb	0a 	. 
	ld e,a			;04ec	5f 	_ 
	xor (hl)			;04ed	ae 	. 
	ld (hl),e			;04ee	73 	s 
	and e			;04ef	a3 	. 
	jr nz,$+10		;04f0	20 08 	  . 
	inc d			;04f2	14 	. 
	inc l			;04f3	2c 	, 
	rlc c		;04f4	cb 01 	. . 
	jp p,003ebh		;04f6	f2 eb 03 	. . . 
	ret			;04f9	c9 	. 

	ld e,a			;04fa	5f 	_ 
	ld a,d			;04fb	7a 	z 
	rlca			;04fc	07 	. 
	rlca			;04fd	07 	. 
	rlca			;04fe	07 	. 
	ld d,a			;04ff	57 	W 
	ld c,001h		;0500	0e 01 	. . 
	ld a,c			;0502	79 	y 
	and e			;0503	a3 	. 
	jr nz,$+7		;0504	20 05 	  . 
	inc d			;0506	14 	. 
	rlc c		;0507	cb 01 	. . 
	jr $-7		;0509	18 f7 	. . 
	ld a,(03880h)		;050b	3a 80 38 	: . 8 
	ld b,a			;050e	47 	G 
	ld a,d			;050f	7a 	z 
	add a,040h		;0510	c6 40 	. @ 
	cp 060h		;0512	fe 60 	. ` 
	jr nc,$+21		;0514	30 13 	0 . 
	rrc b		;0516	cb 08 	. . 
	jr nc,$+51		;0518	30 31 	0 1 
	add a,020h		;051a	c6 20 	.   
	ld d,a			;051c	57 	W 
	ld a,(03840h)		;051d	3a 40 38 	: @ 8 
	and 010h		;0520	e6 10 	. . 
	jr z,$+42		;0522	28 28 	( ( 
	ld a,d			;0524	7a 	z 
	sub 060h		;0525	d6 60 	. ` 
	jr $+36		;0527	18 22 	. " 
	sub 070h		;0529	d6 70 	. p 
	jr nc,$+18		;052b	30 10 	0 . 
	add a,040h		;052d	c6 40 	. @ 
	cp 03ch		;052f	fe 3c 	. < 
	jr c,$+4		;0531	38 02 	8 . 
	xor 010h		;0533	ee 10 	. . 
	rrc b		;0535	cb 08 	. . 
	jr nc,$+20		;0537	30 12 	0 . 
	xor 010h		;0539	ee 10 	. . 
	jr $+16		;053b	18 0e 	. . 
	rlca			;053d	07 	. 
	rrc b		;053e	cb 08 	. . 
	jr nc,$+3		;0540	30 01 	0 . 
	inc a			;0542	3c 	< 
	ld hl,00050h		;0543	21 50 00 	! P . 
	ld c,a			;0546	4f 	O 
	ld b,000h		;0547	06 00 	. . 
	add hl,bc			;0549	09 	. 
	ld a,(hl)			;054a	7e 	~ 
	ld d,a			;054b	57 	W 
	ld bc,00dach		;054c	01 ac 0d 	. . . 
	call 00060h		;054f	cd 60 00 	. ` . 
	ld a,d			;0552	7a 	z 
	cp 001h		;0553	fe 01 	. . 
	ret nz			;0555	c0 	. 
	rst 28h			;0556	ef 	. 
	ret			;0557	c9 	. 

	ld l,(ix+003h)		;0558	dd 6e 03 	. n . 
	ld h,(ix+004h)		;055b	dd 66 04 	. f . 
	jr c,$+60		;055e	38 3a 	8 : 
	ld a,(ix+005h)		;0560	dd 7e 05 	. ~ . 
	or a			;0563	b7 	. 
	jr z,$+3		;0564	28 01 	( . 
	ld (hl),a			;0566	77 	w 
	ld a,c			;0567	79 	y 
	cp 020h		;0568	fe 20 	.   
	jp c,00506h		;056a	da 06 05 	. . . 
	cp 080h		;056d	fe 80 	. . 
	jr nc,$+55		;056f	30 35 	0 5 
	cp 040h		;0571	fe 40 	. @ 
	jr c,$+10		;0573	38 08 	8 . 
	sub 040h		;0575	d6 40 	. @ 
	cp 020h		;0577	fe 20 	.   
	jr c,$+4		;0579	38 02 	8 . 
	sub 020h		;057b	d6 20 	.   
	call 00541h		;057d	cd 41 05 	. A . 
	ld a,h			;0580	7c 	| 
	and 003h		;0581	e6 03 	. . 
	or 03ch		;0583	f6 3c 	. < 
	ld h,a			;0585	67 	g 
	ld d,(hl)			;0586	56 	V 
	ld a,(ix+005h)		;0587	dd 7e 05 	. ~ . 
	or a			;058a	b7 	. 
	jr z,$+7		;058b	28 05 	( . 
	ld (ix+005h),d		;058d	dd 72 05 	. r . 
	ld (hl),05fh		;0590	36 5f 	6 _ 
	ld (ix+003h),l		;0592	dd 75 03 	. u . 
	ld (ix+004h),h		;0595	dd 74 04 	. t . 
	ld a,c			;0598	79 	y 
	ret			;0599	c9 	. 

	ld a,(ix+005h)		;059a	dd 7e 05 	. ~ . 
	or a			;059d	b7 	. 
	ret nz			;059e	c0 	. 
	ld a,(hl)			;059f	7e 	~ 
	ret			;05a0	c9 	. 

	ld a,l			;05a1	7d 	} 
	and 0c0h		;05a2	e6 c0 	. . 
	ld l,a			;05a4	6f 	o 
	ret			;05a5	c9 	. 

	cp 0c0h		;05a6	fe c0 	. . 
	jr c,$-43		;05a8	38 d3 	8 . 
	sub 0c0h		;05aa	d6 c0 	. . 
	jr z,$-44		;05ac	28 d2 	( . 
	ld b,a			;05ae	47 	G 
	ld a,020h		;05af	3e 20 	>   
	call 00541h		;05b1	cd 41 05 	. A . 
	djnz $-5		;05b4	10 f9 	. . 
	jr $-54		;05b6	18 c8 	. . 
	ld a,(hl)			;05b8	7e 	~ 
	ld (ix+005h),a		;05b9	dd 77 05 	. w . 
	ret			;05bc	c9 	. 

	xor a			;05bd	af 	. 
	jr $-5		;05be	18 f9 	. . 
	ld hl,03c00h		;05c0	21 00 3c 	! . < 
	ld a,(0403dh)		;05c3	3a 3d 40 	: = @ 
	and 0f7h		;05c6	e6 f7 	. . 
	ld (0403dh),a		;05c8	32 3d 40 	2 = @ 
	out (0ffh),a		;05cb	d3 ff 	. . 
	ret			;05cd	c9 	. 

	dec hl			;05ce	2b 	+ 
	ld a,(0403dh)		;05cf	3a 3d 40 	: = @ 
	and 008h		;05d2	e6 08 	. . 
	jr z,$+3		;05d4	28 01 	( . 
	dec hl			;05d6	2b 	+ 
	ld (hl),020h		;05d7	36 20 	6   
	ret			;05d9	c9 	. 

	ld a,(0403dh)		;05da	3a 3d 40 	: = @ 
	and 008h		;05dd	e6 08 	. . 
	call nz,004e2h		;05df	c4 e2 04 	. . . 
	ld a,l			;05e2	7d 	} 
	and 03fh		;05e3	e6 3f 	. ? 
	dec hl			;05e5	2b 	+ 
	ret nz			;05e6	c0 	. 
	ld de,00040h		;05e7	11 40 00 	. @ . 
	add hl,de			;05ea	19 	. 
	ret			;05eb	c9 	. 

	inc hl			;05ec	23 	# 
	ld a,l			;05ed	7d 	} 
	and 03fh		;05ee	e6 3f 	. ? 
	ret nz			;05f0	c0 	. 
	ld de,0ffc0h		;05f1	11 c0 ff 	. . . 
	add hl,de			;05f4	19 	. 
	ret			;05f5	c9 	. 

	ld a,(0403dh)		;05f6	3a 3d 40 	: = @ 
	or 008h		;05f9	f6 08 	. . 
	ld (0403dh),a		;05fb	32 3d 40 	2 = @ 
	out (0ffh),a		;05fe	d3 ff 	. . 
	inc hl			;0600	23 	# 
	ld a,l			;0601	7d 	} 
	and 0feh		;0602	e6 fe 	. . 
	ld l,a			;0604	6f 	o 
	ret			;0605	c9 	. 

	ld de,00480h		;0606	11 80 04 	. . . 
	push de			;0609	d5 	. 
	cp 008h		;060a	fe 08 	. . 
	jr z,$-62		;060c	28 c0 	( . 
	cp 00ah		;060e	fe 0a 	. . 
	ret c			;0610	d8 	. 
	cp 00eh		;0611	fe 0e 	. . 
	jr c,$+81		;0613	38 4f 	8 O 
	jr z,$-93		;0615	28 a1 	( . 
	cp 00fh		;0617	fe 0f 	. . 
	jr z,$-92		;0619	28 a2 	( . 
	cp 017h		;061b	fe 17 	. . 
	jr z,$-39		;061d	28 d7 	( . 
	cp 018h		;061f	fe 18 	. . 
	jr z,$-71		;0621	28 b7 	( . 
	cp 019h		;0623	fe 19 	. . 
	jr z,$-57		;0625	28 c5 	( . 
	cp 01ah		;0627	fe 1a 	. . 
	jr z,$-66		;0629	28 bc 	( . 
	cp 01bh		;062b	fe 1b 	. . 
	jr z,$-60		;062d	28 c2 	( . 
	cp 01ch		;062f	fe 1c 	. . 
	jr z,$-113		;0631	28 8d 	( . 
	cp 01dh		;0633	fe 1d 	. . 
	jp z,004a1h		;0635	ca a1 04 	. . . 
	cp 01eh		;0638	fe 1e 	. . 
	jr z,$+57		;063a	28 37 	( 7 
	cp 01fh		;063c	fe 1f 	. . 
	jr z,$+62		;063e	28 3c 	( < 
	ret			;0640	c9 	. 

	ld (hl),a			;0641	77 	w 
	inc hl			;0642	23 	# 
	ld a,(0403dh)		;0643	3a 3d 40 	: = @ 
	and 008h		;0646	e6 08 	. . 
	jr z,$+3		;0648	28 01 	( . 
	inc hl			;064a	23 	# 
	ld a,h			;064b	7c 	| 
	cp 040h		;064c	fe 40 	. @ 
	ret nz			;064e	c0 	. 
	ld de,0ffc0h		;064f	11 c0 ff 	. . . 
	add hl,de			;0652	19 	. 
	push hl			;0653	e5 	. 
	ld de,03c00h		;0654	11 00 3c 	. . < 
	ld hl,03c40h		;0657	21 40 3c 	! @ < 
	push bc			;065a	c5 	. 
	ld bc,003c0h		;065b	01 c0 03 	. . . 
	ldir		;065e	ed b0 	. . 
	pop bc			;0660	c1 	. 
	ex de,hl			;0661	eb 	. 
	jr $+27		;0662	18 19 	. . 
	ld a,l			;0664	7d 	} 
	and 0c0h		;0665	e6 c0 	. . 
	ld l,a			;0667	6f 	o 
	push hl			;0668	e5 	. 
	ld de,00040h		;0669	11 40 00 	. @ . 
	add hl,de			;066c	19 	. 
	ld a,h			;066d	7c 	| 
	cp 040h		;066e	fe 40 	. @ 
	jr z,$-28		;0670	28 e2 	( . 
	pop de			;0672	d1 	. 
	push hl			;0673	e5 	. 
	ld d,h			;0674	54 	T 
	ld a,l			;0675	7d 	} 
	or 03fh		;0676	f6 3f 	. ? 
	ld e,a			;0678	5f 	_ 
	inc de			;0679	13 	. 
	jr $+6		;067a	18 04 	. . 
	push hl			;067c	e5 	. 
	ld de,04000h		;067d	11 00 40 	. . @ 
	ld (hl),020h		;0680	36 20 	6   
	inc hl			;0682	23 	# 
	ld a,h			;0683	7c 	| 
	cp d			;0684	ba 	. 
	jr nz,$-5		;0685	20 f9 	  . 
	ld a,l			;0687	7d 	} 
	cp e			;0688	bb 	. 
	jr nz,$-9		;0689	20 f5 	  . 
	pop hl			;068b	e1 	. 
	ret			;068c	c9 	. 

	ld a,c			;068d	79 	y 
	or a			;068e	b7 	. 
	jr z,$+66		;068f	28 40 	( @ 
	cp 00bh		;0691	fe 0b 	. . 
	jr z,$+12		;0693	28 0a 	( . 
	cp 00ch		;0695	fe 0c 	. . 
	jr nz,$+29		;0697	20 1b 	  . 
	xor a			;0699	af 	. 
	or (ix+003h)		;069a	dd b6 03 	. . . 
	jr z,$+23		;069d	28 15 	( . 
	ld a,(ix+003h)		;069f	dd 7e 03 	. ~ . 
	sub (ix+004h)		;06a2	dd 96 04 	. . . 
	ld b,a			;06a5	47 	G 
	call 005d1h		;06a6	cd d1 05 	. . . 
	jr nz,$-3		;06a9	20 fb 	  . 
	ld a,00ah		;06ab	3e 0a 	> . 
	nop			;06ad	00 	. 
	out (0fdh),a		;06ae	d3 fd 	. . 
	djnz $-10		;06b0	10 f4 	. . 
	jr $+26		;06b2	18 18 	. . 
	push af			;06b4	f5 	. 
	call 005d1h		;06b5	cd d1 05 	. . . 
	jr nz,$-3		;06b8	20 fb 	  . 
	pop af			;06ba	f1 	. 
	nop			;06bb	00 	. 
	out (0fdh),a		;06bc	d3 fd 	. . 
	cp 00dh		;06be	fe 0d 	. . 
	ret nz			;06c0	c0 	. 
	inc (ix+004h)		;06c1	dd 34 04 	. 4 . 
	ld a,(ix+004h)		;06c4	dd 7e 04 	. ~ . 
	cp (ix+003h)		;06c7	dd be 03 	. . . 
	ld a,c			;06ca	79 	y 
	ret nz			;06cb	c0 	. 
	ld (ix+004h),000h		;06cc	dd 36 04 00 	. 6 . . 
	ret			;06d0	c9 	. 

	nop			;06d1	00 	. 
	in a,(0fdh)		;06d2	db fd 	. . 
	and 0f0h		;06d4	e6 f0 	. . 
	cp 030h		;06d6	fe 30 	. 0 
	ret			;06d8	c9 	. 

	push hl			;06d9	e5 	. 
	ld a,00eh		;06da	3e 0e 	> . 
	call 00033h		;06dc	cd 33 00 	. 3 . 
	ld c,b			;06df	48 	H 
	call 00049h		;06e0	cd 49 00 	. I . 
	cp 020h		;06e3	fe 20 	.   
	jr nc,$+39		;06e5	30 25 	0 % 
	cp 00dh		;06e7	fe 0d 	. . 
	jp z,00662h		;06e9	ca 62 06 	. b . 
	cp 01fh		;06ec	fe 1f 	. . 
	jr z,$+43		;06ee	28 29 	( ) 
	cp 001h		;06f0	fe 01 	. . 
	jr z,$+111		;06f2	28 6d 	( m 
	ld de,005e0h		;06f4	11 e0 05 	. . . 
	push de			;06f7	d5 	. 
	cp 008h		;06f8	fe 08 	. . 
	jr z,$+54		;06fa	28 34 	( 4 
	cp 018h		;06fc	fe 18 	. . 
	jr z,$+45		;06fe	28 2b 	( + 
	cp 009h		;0700	fe 09 	. . 
	jr z,$+68		;0702	28 42 	( B 
	cp 019h		;0704	fe 19 	. . 
	jr z,$+59		;0706	28 39 	( 9 
	cp 00ah		;0708	fe 0a 	. . 
	ret nz			;070a	c0 	. 
	pop de			;070b	d1 	. 
	ld (hl),a			;070c	77 	w 
	ld a,b			;070d	78 	x 
	or a			;070e	b7 	. 
	jr z,$-47		;070f	28 cf 	( . 
	ld a,(hl)			;0711	7e 	~ 
	inc hl			;0712	23 	# 
	call 00033h		;0713	cd 33 00 	. 3 . 
	dec b			;0716	05 	. 
	jr $-55		;0717	18 c7 	. . 
	call 001c9h		;0719	cd c9 01 	. . . 
	ld b,c			;071c	41 	A 
	pop hl			;071d	e1 	. 
	push hl			;071e	e5 	. 
	jp 005e0h		;071f	c3 e0 05 	. . . 
	call 00630h		;0722	cd 30 06 	. 0 . 
	dec hl			;0725	2b 	+ 
	ld a,(hl)			;0726	7e 	~ 
	inc hl			;0727	23 	# 
	cp 00ah		;0728	fe 0a 	. . 
	ret z			;072a	c8 	. 
	ld a,b			;072b	78 	x 
	cp c			;072c	b9 	. 
	jr nz,$-11		;072d	20 f3 	  . 
	ret			;072f	c9 	. 

	ld a,b			;0730	78 	x 
	cp c			;0731	b9 	. 
	ret z			;0732	c8 	. 
	dec hl			;0733	2b 	+ 
	ld a,(hl)			;0734	7e 	~ 
	cp 00ah		;0735	fe 0a 	. . 
	inc hl			;0737	23 	# 
	ret z			;0738	c8 	. 
	dec hl			;0739	2b 	+ 
	ld a,008h		;073a	3e 08 	> . 
	call 00033h		;073c	cd 33 00 	. 3 . 
	inc b			;073f	04 	. 
	ret			;0740	c9 	. 

	ld a,017h		;0741	3e 17 	> . 
	jp 00033h		;0743	c3 33 00 	. 3 . 
	call 00348h		;0746	cd 48 03 	. H . 
	and 007h		;0749	e6 07 	. . 
	cpl			;074b	2f 	/ 
	inc a			;074c	3c 	< 
	add a,008h		;074d	c6 08 	. . 
	ld e,a			;074f	5f 	_ 
	ld a,b			;0750	78 	x 
	or a			;0751	b7 	. 
	ret z			;0752	c8 	. 
	ld a,020h		;0753	3e 20 	>   
	ld (hl),a			;0755	77 	w 
	inc hl			;0756	23 	# 
	push de			;0757	d5 	. 
	call 00033h		;0758	cd 33 00 	. 3 . 
	pop de			;075b	d1 	. 
	dec b			;075c	05 	. 
	dec e			;075d	1d 	. 
	ret z			;075e	c8 	. 
	jr $-15		;075f	18 ef 	. . 
	scf			;0761	37 	7 
	push af			;0762	f5 	. 
	ld a,00dh		;0763	3e 0d 	> . 
	ld (hl),a			;0765	77 	w 
	call 00033h		;0766	cd 33 00 	. 3 . 
	ld a,00fh		;0769	3e 0f 	> . 
	call 00033h		;076b	cd 33 00 	. 3 . 
	ld a,c			;076e	79 	y 
	sub b			;076f	90 	. 
	ld b,a			;0770	47 	G 
	pop af			;0771	f1 	. 
	pop hl			;0772	e1 	. 
	ret			;0773	c9 	. 

	out (0ffh),a		;0774	d3 ff 	. . 
	ld hl,006d2h		;0776	21 d2 06 	! . . 
	ld de,04000h		;0779	11 00 40 	. . @ 
	ld bc,00036h		;077c	01 36 00 	. 6 . 
	ldir		;077f	ed b0 	. . 
	dec a			;0781	3d 	= 
	dec a			;0782	3d 	= 
	jr nz,$-13		;0783	20 f1 	  . 
	ld b,027h		;0785	06 27 	. ' 
	ld (de),a			;0787	12 	. 
	inc de			;0788	13 	. 
	djnz $-2		;0789	10 fc 	. . 
	ld a,(03840h)		;078b	3a 40 38 	: @ 8 
	and 004h		;078e	e6 04 	. . 
	jp nz,00075h		;0790	c2 75 00 	. u . 
	ld sp,0407dh		;0793	31 7d 40 	1 } @ 
	ld a,(037ech)		;0796	3a ec 37 	: . 7 
	inc a			;0799	3c 	< 
	cp 002h		;079a	fe 02 	. . 
	jp c,00075h		;079c	da 75 00 	. u . 
	ld a,001h		;079f	3e 01 	> . 
	ld (037e1h),a		;07a1	32 e1 37 	2 . 7 
	ld hl,037ech		;07a4	21 ec 37 	! . 7 
	ld de,037efh		;07a7	11 ef 37 	. . 7 
	ld (hl),003h		;07aa	36 03 	6 . 
	ld bc,00000h		;07ac	01 00 00 	. . . 
	call 00060h		;07af	cd 60 00 	. ` . 
	bit 0,(hl)		;07b2	cb 46 	. F 
	jr nz,$-2		;07b4	20 fc 	  . 
	xor a			;07b6	af 	. 
	ld (037eeh),a		;07b7	32 ee 37 	2 . 7 
	ld bc,04200h		;07ba	01 00 42 	. . B 
	ld a,08ch		;07bd	3e 8c 	> . 
	ld (hl),a			;07bf	77 	w 
	bit 1,(hl)		;07c0	cb 4e 	. N 
	jr z,$-2		;07c2	28 fc 	( . 
	ld a,(de)			;07c4	1a 	. 
	ld (bc),a			;07c5	02 	. 
	inc c			;07c6	0c 	. 
	jr nz,$-7		;07c7	20 f7 	  . 
	jp 04200h		;07c9	c3 00 42 	. . B 
	ld bc,01a18h		;07cc	01 18 1a 	. . . 
	jp 019aeh		;07cf	c3 ae 19 	. . . 
	jp 01c96h		;07d2	c3 96 1c 	. . . 
	jp 01d78h		;07d5	c3 78 1d 	. x . 
	jp 01c90h		;07d8	c3 90 1c 	. . . 
	jp 025d9h		;07db	c3 d9 25 	. . % 
	ret			;07de	c9 	. 

	nop			;07df	00 	. 
	nop			;07e0	00 	. 
	ret			;07e1	c9 	. 
	nop			;07e2	00 	. 
	nop			;07e3	00 	. 
	ei			;07e4	fb 	. 
	ret			;07e5	c9 	. 
	nop			;07e6	00 	. 
	ld bc,003e3h		;07e7	01 e3 03 	. . . 
	nop			;07ea	00 	. 
	nop			;07eb	00 	. 
	nop			;07ec	00 	. 
	ld c,e			;07ed	4b 	K 
	ld c,c			;07ee	49 	I 
	rlca			;07ef	07 	. 
	ld e,b			;07f0	58 	X 
	inc b			;07f1	04 	. 
	nop			;07f2	00 	. 
	inc a			;07f3	3c 	< 
	nop			;07f4	00 	. 
	ld b,h			;07f5	44 	D 
	ld c,a			;07f6	4f 	O 
	ld b,08dh		;07f7	06 8d 	. . 
	dec b			;07f9	05 	. 
	ld b,e			;07fa	43 	C 
	nop			;07fb	00 	. 
	nop			;07fc	00 	. 
	ld d,b			;07fd	50 	P 
	ld d,d			;07fe	52 	R 
	jp 05000h		;07ff	c3 00 50 	. . P 
	rst 0			;0802	c7 	. 
	nop			;0803	00 	. 
	nop			;0804	00 	. 
	ld a,000h		;0805	3e 00 	> . 
	ret			;0807	c9 	. 
	ld hl,01380h		;0808	21 80 13 	! . . 
	call 009c2h		;080b	cd c2 09 	. . . 
	jr $+8		;080e	18 06 	. . 
	call 009c2h		;0810	cd c2 09 	. . . 
	call 00982h		;0813	cd 82 09 	. . . 
	ld a,b			;0816	78 	x 
	or a			;0817	b7 	. 
	ret z			;0818	c8 	. 
	ld a,(04124h)		;0819	3a 24 41 	: $ A 
	or a			;081c	b7 	. 
	jp z,009b4h		;081d	ca b4 09 	. . . 
	sub b			;0820	90 	. 
	jr nc,$+14		;0821	30 0c 	0 . 
	cpl			;0823	2f 	/ 
	inc a			;0824	3c 	< 
	ex de,hl			;0825	eb 	. 
	call 009a4h		;0826	cd a4 09 	. . . 
	ex de,hl			;0829	eb 	. 
	call 009b4h		;082a	cd b4 09 	. . . 
	pop bc			;082d	c1 	. 
	pop de			;082e	d1 	. 
	cp 019h		;082f	fe 19 	. . 
	ret nc			;0831	d0 	. 
	push af			;0832	f5 	. 
	call 009dfh		;0833	cd df 09 	. . . 
	ld h,a			;0836	67 	g 
	pop af			;0837	f1 	. 
	call 007d7h		;0838	cd d7 07 	. . . 
	or h			;083b	b4 	. 
	ld hl,04121h		;083c	21 21 41 	! ! A 
	jp p,00754h		;083f	f2 54 07 	. T . 
	call 007b7h		;0842	cd b7 07 	. . . 
	jp nc,00796h		;0845	d2 96 07 	. . . 
	inc hl			;0848	23 	# 
	inc (hl)			;0849	34 	4 
	jp z,007b2h		;084a	ca b2 07 	. . . 
	ld l,001h		;084d	2e 01 	. . 
	call 007ebh		;084f	cd eb 07 	. . . 
	jr $+68		;0852	18 42 	. B 
	xor a			;0854	af 	. 
	sub b			;0855	90 	. 
	ld b,a			;0856	47 	G 
	ld a,(hl)			;0857	7e 	~ 
	sbc a,e			;0858	9b 	. 
	ld e,a			;0859	5f 	_ 
	inc hl			;085a	23 	# 
	ld a,(hl)			;085b	7e 	~ 
	sbc a,d			;085c	9a 	. 
	ld d,a			;085d	57 	W 
	inc hl			;085e	23 	# 
	ld a,(hl)			;085f	7e 	~ 
	sbc a,c			;0860	99 	. 
	ld c,a			;0861	4f 	O 
	call c,007c3h		;0862	dc c3 07 	. . . 
	ld l,b			;0865	68 	h 
	ld h,e			;0866	63 	c 
	xor a			;0867	af 	. 
	ld b,a			;0868	47 	G 
	ld a,c			;0869	79 	y 
	or a			;086a	b7 	. 
	jr nz,$+26		;086b	20 18 	  . 
	ld c,d			;086d	4a 	J 
	ld d,h			;086e	54 	T 
	ld h,l			;086f	65 	e 
	ld l,a			;0870	6f 	o 
	ld a,b			;0871	78 	x 
	sub 008h		;0872	d6 08 	. . 
	cp 0e0h		;0874	fe e0 	. . 
	jr nz,$-14		;0876	20 f0 	  . 
	xor a			;0878	af 	. 
	ld (04124h),a		;0879	32 24 41 	2 $ A 
	ret			;087c	c9 	. 
	dec b			;087d	05 	. 
	add hl,hl			;087e	29 	) 
	ld a,d			;087f	7a 	z 
	rla			;0880	17 	. 
	ld d,a			;0881	57 	W 
	ld a,c			;0882	79 	y 
	adc a,a			;0883	8f 	. 
	ld c,a			;0884	4f 	O 
	jp p,0077dh		;0885	f2 7d 07 	. } . 
	ld a,b			;0888	78 	x 
	ld e,h			;0889	5c 	\ 
	ld b,l			;088a	45 	E 
	or a			;088b	b7 	. 
	jr z,$+10		;088c	28 08 	( . 
	ld hl,04124h		;088e	21 24 41 	! $ A 
	add a,(hl)			;0891	86 	. 
	ld (hl),a			;0892	77 	w 
	jr nc,$-27		;0893	30 e3 	0 . 
	ret z			;0895	c8 	. 
	ld a,b			;0896	78 	x 
	ld hl,04124h		;0897	21 24 41 	! $ A 
	or a			;089a	b7 	. 
	call m,007a8h		;089b	fc a8 07 	. . . 
	ld b,(hl)			;089e	46 	F 
	inc hl			;089f	23 	# 
	ld a,(hl)			;08a0	7e 	~ 
	and 080h		;08a1	e6 80 	. . 
	xor c			;08a3	a9 	. 
	ld c,a			;08a4	4f 	O 
	jp 009b4h		;08a5	c3 b4 09 	. . . 
	inc e			;08a8	1c 	. 
	ret nz			;08a9	c0 	. 
	inc d			;08aa	14 	. 
	ret nz			;08ab	c0 	. 
	inc c			;08ac	0c 	. 
	ret nz			;08ad	c0 	. 
	ld c,080h		;08ae	0e 80 	. . 
	inc (hl)			;08b0	34 	4 
	ret nz			;08b1	c0 	. 
	ld e,00ah		;08b2	1e 0a 	. . 
	jp 019a2h		;08b4	c3 a2 19 	. . . 
	ld a,(hl)			;08b7	7e 	~ 
	add a,e			;08b8	83 	. 
	ld e,a			;08b9	5f 	_ 
	inc hl			;08ba	23 	# 
	ld a,(hl)			;08bb	7e 	~ 
	adc a,d			;08bc	8a 	. 
	ld d,a			;08bd	57 	W 
	inc hl			;08be	23 	# 
	ld a,(hl)			;08bf	7e 	~ 
	adc a,c			;08c0	89 	. 
	ld c,a			;08c1	4f 	O 
	ret			;08c2	c9 	. 
	ld hl,04125h		;08c3	21 25 41 	! % A 
	ld a,(hl)			;08c6	7e 	~ 
	cpl			;08c7	2f 	/ 
	ld (hl),a			;08c8	77 	w 
	xor a			;08c9	af 	. 
	ld l,a			;08ca	6f 	o 
	sub b			;08cb	90 	. 
	ld b,a			;08cc	47 	G 
	ld a,l			;08cd	7d 	} 
	sbc a,e			;08ce	9b 	. 
	ld e,a			;08cf	5f 	_ 
	ld a,l			;08d0	7d 	} 
	sbc a,d			;08d1	9a 	. 
	ld d,a			;08d2	57 	W 
	ld a,l			;08d3	7d 	} 
	sbc a,c			;08d4	99 	. 
	ld c,a			;08d5	4f 	O 
	ret			;08d6	c9 	. 
	ld b,000h		;08d7	06 00 	. . 
	sub 008h		;08d9	d6 08 	. . 
	jr c,$+9		;08db	38 07 	8 . 
	ld b,e			;08dd	43 	C 
	ld e,d			;08de	5a 	Z 
	ld d,c			;08df	51 	Q 
	ld c,000h		;08e0	0e 00 	. . 
	jr $-9		;08e2	18 f5 	. . 
	add a,009h		;08e4	c6 09 	. . 
	ld l,a			;08e6	6f 	o 
	xor a			;08e7	af 	. 
	dec l			;08e8	2d 	- 
	ret z			;08e9	c8 	. 
	ld a,c			;08ea	79 	y 
	rra			;08eb	1f 	. 
	ld c,a			;08ec	4f 	O 
	ld a,d			;08ed	7a 	z 
	rra			;08ee	1f 	. 
	ld d,a			;08ef	57 	W 
	ld a,e			;08f0	7b 	{ 
	rra			;08f1	1f 	. 
	ld e,a			;08f2	5f 	_ 
	ld a,b			;08f3	78 	x 
	rra			;08f4	1f 	. 
	ld b,a			;08f5	47 	G 
	jr $-15		;08f6	18 ef 	. . 
	nop			;08f8	00 	. 
	nop			;08f9	00 	. 
	nop			;08fa	00 	. 
	add a,c			;08fb	81 	. 
	inc bc			;08fc	03 	. 
	xor d			;08fd	aa 	. 
	ld d,(hl)			;08fe	56 	V 
	add hl,de			;08ff	19 	. 
	add a,b			;0900	80 	. 
	pop af			;0901	f1 	. 
	ld (08076h),hl		;0902	22 76 80 	" v . 
	ld b,l			;0905	45 	E 
	xor d			;0906	aa 	. 
	jr c,$-124		;0907	38 82 	8 . 
	call 00955h		;0909	cd 55 09 	. U . 
	or a			;090c	b7 	. 
	jp pe,01e4ah		;090d	ea 4a 1e 	. J . 
	ld hl,04124h		;0910	21 24 41 	! $ A 
	ld a,(hl)			;0913	7e 	~ 
	ld bc,08035h		;0914	01 35 80 	. 5 . 
	ld de,004f3h		;0917	11 f3 04 	. . . 
	sub b			;091a	90 	. 
	push af			;091b	f5 	. 
	ld (hl),b			;091c	70 	p 
	push de			;091d	d5 	. 
	push bc			;091e	c5 	. 
	call 00716h		;091f	cd 16 07 	. . . 
	pop bc			;0922	c1 	. 
	pop de			;0923	d1 	. 
	inc b			;0924	04 	. 
	call 008a2h		;0925	cd a2 08 	. . . 
	ld hl,007f8h		;0928	21 f8 07 	! . . 
	call 00710h		;092b	cd 10 07 	. . . 
	ld hl,007fch		;092e	21 fc 07 	! . . 
	call 0149ah		;0931	cd 9a 14 	. . . 
	ld bc,08080h		;0934	01 80 80 	. . . 
	ld de,00000h		;0937	11 00 00 	. . . 
	call 00716h		;093a	cd 16 07 	. . . 
	pop af			;093d	f1 	. 
	call 00f89h		;093e	cd 89 0f 	. . . 
	ld bc,08031h		;0941	01 31 80 	. 1 . 
	ld de,07218h		;0944	11 18 72 	. . r 
	call 00955h		;0947	cd 55 09 	. U . 
	ret z			;094a	c8 	. 
	ld l,000h		;094b	2e 00 	. . 
	call 00914h		;094d	cd 14 09 	. . . 
	ld a,c			;0950	79 	y 
	ld (0414fh),a		;0951	32 4f 41 	2 O A 
	ex de,hl			;0954	eb 	. 
	ld (04150h),hl		;0955	22 50 41 	" P A 
	ld bc,00000h		;0958	01 00 00 	. . . 
	ld d,b			;095b	50 	P 
	ld e,b			;095c	58 	X 
	ld hl,00765h		;095d	21 65 07 	! e . 
	push hl			;0960	e5 	. 
	ld hl,00869h		;0961	21 69 08 	! i . 
	push hl			;0964	e5 	. 
	push hl			;0965	e5 	. 
	ld hl,04121h		;0966	21 21 41 	! ! A 
	ld a,(hl)			;0969	7e 	~ 
	inc hl			;096a	23 	# 
	or a			;096b	b7 	. 
	jr z,$+38		;096c	28 24 	( $ 
	push hl			;096e	e5 	. 
	ld l,008h		;096f	2e 08 	. . 
	rra			;0971	1f 	. 
	ld h,a			;0972	67 	g 
	ld a,c			;0973	79 	y 
	jr nc,$+13		;0974	30 0b 	0 . 
	push hl			;0976	e5 	. 
	ld hl,(04150h)		;0977	2a 50 41 	* P A 
	add hl,de			;097a	19 	. 
	ex de,hl			;097b	eb 	. 
	pop hl			;097c	e1 	. 
	ld a,(0414fh)		;097d	3a 4f 41 	: O A 
	adc a,c			;0980	89 	. 
	rra			;0981	1f 	. 
	ld c,a			;0982	4f 	O 
	ld a,d			;0983	7a 	z 
	rra			;0984	1f 	. 
	ld d,a			;0985	57 	W 
	ld a,e			;0986	7b 	{ 
	rra			;0987	1f 	. 
	ld e,a			;0988	5f 	_ 
	ld a,b			;0989	78 	x 
	rra			;098a	1f 	. 
	ld b,a			;098b	47 	G 
	dec l			;098c	2d 	- 
	ld a,h			;098d	7c 	| 
	jr nz,$-29		;098e	20 e1 	  . 
	pop hl			;0990	e1 	. 
	ret			;0991	c9 	. 
	ld b,e			;0992	43 	C 
	ld e,d			;0993	5a 	Z 
	ld d,c			;0994	51 	Q 
	ld c,a			;0995	4f 	O 
	ret			;0996	c9 	. 
	call 009a4h		;0997	cd a4 09 	. . . 
	ld hl,00dd8h		;099a	21 d8 0d 	! . . 
	call 009b1h		;099d	cd b1 09 	. . . 
	pop bc			;09a0	c1 	. 
	pop de			;09a1	d1 	. 
	call 00955h		;09a2	cd 55 09 	. U . 
	jp z,0199ah		;09a5	ca 9a 19 	. . . 
	ld l,0ffh		;09a8	2e ff 	. . 
	call 00914h		;09aa	cd 14 09 	. . . 
	inc (hl)			;09ad	34 	4 
	inc (hl)			;09ae	34 	4 
	dec hl			;09af	2b 	+ 
	ld a,(hl)			;09b0	7e 	~ 
	ld (04089h),a		;09b1	32 89 40 	2 . @ 
	dec hl			;09b4	2b 	+ 
	ld a,(hl)			;09b5	7e 	~ 
	ld (04085h),a		;09b6	32 85 40 	2 . @ 
	dec hl			;09b9	2b 	+ 
	ld a,(hl)			;09ba	7e 	~ 
	ld (04081h),a		;09bb	32 81 40 	2 . @ 
	ld b,c			;09be	41 	A 
	ex de,hl			;09bf	eb 	. 
	xor a			;09c0	af 	. 
	ld c,a			;09c1	4f 	O 
	ld d,a			;09c2	57 	W 
	ld e,a			;09c3	5f 	_ 
	ld (0408ch),a		;09c4	32 8c 40 	2 . @ 
	push hl			;09c7	e5 	. 
	push bc			;09c8	c5 	. 
	ld a,l			;09c9	7d 	} 
	call 04080h		;09ca	cd 80 40 	. . @ 
	sbc a,000h		;09cd	de 00 	. . 
	ccf			;09cf	3f 	? 
	jr nc,$+9		;09d0	30 07 	0 . 
	ld (0408ch),a		;09d2	32 8c 40 	2 . @ 
	pop af			;09d5	f1 	. 
	pop af			;09d6	f1 	. 
	scf			;09d7	37 	7 
	jp nc,0e1c1h		;09d8	d2 c1 e1 	. . . 
	ld a,c			;09db	79 	y 
	inc a			;09dc	3c 	< 
	dec a			;09dd	3d 	= 
	rra			;09de	1f 	. 
	jp m,00797h		;09df	fa 97 07 	. . . 
	rla			;09e2	17 	. 
	ld a,e			;09e3	7b 	{ 
	rla			;09e4	17 	. 
	ld e,a			;09e5	5f 	_ 
	ld a,d			;09e6	7a 	z 
	rla			;09e7	17 	. 
	ld d,a			;09e8	57 	W 
	ld a,c			;09e9	79 	y 
	rla			;09ea	17 	. 
	ld c,a			;09eb	4f 	O 
	add hl,hl			;09ec	29 	) 
	ld a,b			;09ed	78 	x 
	rla			;09ee	17 	. 
	ld b,a			;09ef	47 	G 
	ld a,(0408ch)		;09f0	3a 8c 40 	: . @ 
	rla			;09f3	17 	. 
	ld (0408ch),a		;09f4	32 8c 40 	2 . @ 
	ld a,c			;09f7	79 	y 
	or d			;09f8	b2 	. 
	or e			;09f9	b3 	. 
	jr nz,$-51		;09fa	20 cb 	  . 
	push hl			;09fc	e5 	. 
	ld hl,04124h		;09fd	21 24 41 	! $ A 
	dec (hl)			;0a00	35 	5 
	pop hl			;0a01	e1 	. 
	jr nz,$-59		;0a02	20 c3 	  . 
	jp 007b2h		;0a04	c3 b2 07 	. . . 
	ld a,0ffh		;0a07	3e ff 	> . 
	ld l,0afh		;0a09	2e af 	. . 
	ld hl,0412dh		;0a0b	21 2d 41 	! - A 
	ld c,(hl)			;0a0e	4e 	N 
	inc hl			;0a0f	23 	# 
	xor (hl)			;0a10	ae 	. 
	ld b,a			;0a11	47 	G 
	ld l,000h		;0a12	2e 00 	. . 
	ld a,b			;0a14	78 	x 
	or a			;0a15	b7 	. 
	jr z,$+33		;0a16	28 1f 	( . 
	ld a,l			;0a18	7d 	} 
	ld hl,04124h		;0a19	21 24 41 	! $ A 
	xor (hl)			;0a1c	ae 	. 
	add a,b			;0a1d	80 	. 
	ld b,a			;0a1e	47 	G 
	rra			;0a1f	1f 	. 
	xor b			;0a20	a8 	. 
	ld a,b			;0a21	78 	x 
	jp p,00936h		;0a22	f2 36 09 	. 6 . 
	add a,080h		;0a25	c6 80 	. . 
	ld (hl),a			;0a27	77 	w 
	jp z,00890h		;0a28	ca 90 08 	. . . 
	call 009dfh		;0a2b	cd df 09 	. . . 
	ld (hl),a			;0a2e	77 	w 
	dec hl			;0a2f	2b 	+ 
	ret			;0a30	c9 	. 
	call 00955h		;0a31	cd 55 09 	. U . 
	cpl			;0a34	2f 	/ 
	pop hl			;0a35	e1 	. 
	or a			;0a36	b7 	. 
	pop hl			;0a37	e1 	. 
	jp p,00778h		;0a38	f2 78 07 	. x . 
	jp 007b2h		;0a3b	c3 b2 07 	. . . 
	call 009bfh		;0a3e	cd bf 09 	. . . 
	ld a,b			;0a41	78 	x 
	or a			;0a42	b7 	. 
	ret z			;0a43	c8 	. 
	add a,002h		;0a44	c6 02 	. . 
	jp c,007b2h		;0a46	da b2 07 	. . . 
	ld b,a			;0a49	47 	G 
	call 00716h		;0a4a	cd 16 07 	. . . 
	ld hl,04124h		;0a4d	21 24 41 	! $ A 
	inc (hl)			;0a50	34 	4 
	ret nz			;0a51	c0 	. 
	jp 007b2h		;0a52	c3 b2 07 	. . . 
	ld a,(04124h)		;0a55	3a 24 41 	: $ A 
	or a			;0a58	b7 	. 
	ret z			;0a59	c8 	. 
	ld a,(04123h)		;0a5a	3a 23 41 	: # A 
	cp 02fh		;0a5d	fe 2f 	. / 
	rla			;0a5f	17 	. 
	sbc a,a			;0a60	9f 	. 
	ret nz			;0a61	c0 	. 
	inc a			;0a62	3c 	< 
	ret			;0a63	c9 	. 
	ld b,088h		;0a64	06 88 	. . 
	ld de,00000h		;0a66	11 00 00 	. . . 
	ld hl,04124h		;0a69	21 24 41 	! $ A 
	ld c,a			;0a6c	4f 	O 
	ld (hl),b			;0a6d	70 	p 
	ld b,000h		;0a6e	06 00 	. . 
	inc hl			;0a70	23 	# 
	ld (hl),080h		;0a71	36 80 	6 . 
	rla			;0a73	17 	. 
	jp 00762h		;0a74	c3 62 07 	. b . 
	call 00994h		;0a77	cd 94 09 	. . . 
	ret p			;0a7a	f0 	. 
	rst 20h			;0a7b	e7 	. 
	jp m,00c5bh		;0a7c	fa 5b 0c 	. [ . 
	jp z,00af6h		;0a7f	ca f6 0a 	. . . 
	ld hl,04123h		;0a82	21 23 41 	! # A 
	ld a,(hl)			;0a85	7e 	~ 
	xor 080h		;0a86	ee 80 	. . 
	ld (hl),a			;0a88	77 	w 
	ret			;0a89	c9 	. 
	call 00994h		;0a8a	cd 94 09 	. . . 
	ld l,a			;0a8d	6f 	o 
	rla			;0a8e	17 	. 
	sbc a,a			;0a8f	9f 	. 
	ld h,a			;0a90	67 	g 
	jp 00a9ah		;0a91	c3 9a 0a 	. . . 
	rst 20h			;0a94	e7 	. 
	jp z,00af6h		;0a95	ca f6 0a 	. . . 
	jp p,00955h		;0a98	f2 55 09 	. U . 
	ld hl,(04121h)		;0a9b	2a 21 41 	* ! A 
	ld a,h			;0a9e	7c 	| 
	or l			;0a9f	b5 	. 
	ret z			;0aa0	c8 	. 
	ld a,h			;0aa1	7c 	| 
	jr $-67		;0aa2	18 bb 	. . 
	ex de,hl			;0aa4	eb 	. 
	ld hl,(04121h)		;0aa5	2a 21 41 	* ! A 
	ex (sp),hl			;0aa8	e3 	. 
	push hl			;0aa9	e5 	. 
	ld hl,(04123h)		;0aaa	2a 23 41 	* # A 
	ex (sp),hl			;0aad	e3 	. 
	push hl			;0aae	e5 	. 
	ex de,hl			;0aaf	eb 	. 
	ret			;0ab0	c9 	. 
	call 009c2h		;0ab1	cd c2 09 	. . . 
	ex de,hl			;0ab4	eb 	. 
	ld (04121h),hl		;0ab5	22 21 41 	" ! A 
	ld h,b			;0ab8	60 	` 
	ld l,c			;0ab9	69 	i 
	ld (04123h),hl		;0aba	22 23 41 	" # A 
	ex de,hl			;0abd	eb 	. 
	ret			;0abe	c9 	. 
	ld hl,04121h		;0abf	21 21 41 	! ! A 
	ld e,(hl)			;0ac2	5e 	^ 
	inc hl			;0ac3	23 	# 
	ld d,(hl)			;0ac4	56 	V 
	inc hl			;0ac5	23 	# 
	ld c,(hl)			;0ac6	4e 	N 
	inc hl			;0ac7	23 	# 
	ld b,(hl)			;0ac8	46 	F 
	inc hl			;0ac9	23 	# 
	ret			;0aca	c9 	. 
	ld de,04121h		;0acb	11 21 41 	. ! A 
	ld b,004h		;0ace	06 04 	. . 
	jr $+7		;0ad0	18 05 	. . 
	ex de,hl			;0ad2	eb 	. 
	ld a,(040afh)		;0ad3	3a af 40 	: . @ 
	ld b,a			;0ad6	47 	G 
	ld a,(de)			;0ad7	1a 	. 
	ld (hl),a			;0ad8	77 	w 
	inc de			;0ad9	13 	. 
	inc hl			;0ada	23 	# 
	dec b			;0adb	05 	. 
	jr nz,$-5		;0adc	20 f9 	  . 
	ret			;0ade	c9 	. 
	ld hl,04123h		;0adf	21 23 41 	! # A 
	ld a,(hl)			;0ae2	7e 	~ 
	rlca			;0ae3	07 	. 
	scf			;0ae4	37 	7 
	rra			;0ae5	1f 	. 
	ld (hl),a			;0ae6	77 	w 
	ccf			;0ae7	3f 	? 
	rra			;0ae8	1f 	. 
	inc hl			;0ae9	23 	# 
	inc hl			;0aea	23 	# 
	ld (hl),a			;0aeb	77 	w 
	ld a,c			;0aec	79 	y 
	rlca			;0aed	07 	. 
	scf			;0aee	37 	7 
	rra			;0aef	1f 	. 
	ld c,a			;0af0	4f 	O 
	rra			;0af1	1f 	. 
	xor (hl)			;0af2	ae 	. 
	ret			;0af3	c9 	. 
	ld hl,04127h		;0af4	21 27 41 	! ' A 
	ld de,009d2h		;0af7	11 d2 09 	. . . 
	jr $+8		;0afa	18 06 	. . 
	ld hl,04127h		;0afc	21 27 41 	! ' A 
	ld de,009d3h		;0aff	11 d3 09 	. . . 
	push de			;0b02	d5 	. 
	ld de,04121h		;0b03	11 21 41 	. ! A 
	rst 20h			;0b06	e7 	. 
	ret c			;0b07	d8 	. 
	ld de,0411dh		;0b08	11 1d 41 	. . A 
	ret			;0b0b	c9 	. 
	ld a,b			;0b0c	78 	x 
	or a			;0b0d	b7 	. 
	jp z,00955h		;0b0e	ca 55 09 	. U . 
	ld hl,0095eh		;0b11	21 5e 09 	! ^ . 
	push hl			;0b14	e5 	. 
	call 00955h		;0b15	cd 55 09 	. U . 
	ld a,c			;0b18	79 	y 
	ret z			;0b19	c8 	. 
	ld hl,04123h		;0b1a	21 23 41 	! # A 
	xor (hl)			;0b1d	ae 	. 
	ld a,c			;0b1e	79 	y 
	ret m			;0b1f	f8 	. 
	call 00a26h		;0b20	cd 26 0a 	. & . 
	rra			;0b23	1f 	. 
	xor c			;0b24	a9 	. 
	ret			;0b25	c9 	. 
	inc hl			;0b26	23 	# 
	ld a,b			;0b27	78 	x 
	cp (hl)			;0b28	be 	. 
	ret nz			;0b29	c0 	. 
	dec hl			;0b2a	2b 	+ 
	ld a,c			;0b2b	79 	y 
	cp (hl)			;0b2c	be 	. 
	ret nz			;0b2d	c0 	. 
	dec hl			;0b2e	2b 	+ 
	ld a,d			;0b2f	7a 	z 
	cp (hl)			;0b30	be 	. 
	ret nz			;0b31	c0 	. 
	dec hl			;0b32	2b 	+ 
	ld a,e			;0b33	7b 	{ 
	sub (hl)			;0b34	96 	. 
	ret nz			;0b35	c0 	. 
	pop hl			;0b36	e1 	. 
	pop hl			;0b37	e1 	. 
	ret			;0b38	c9 	. 
	ld a,d			;0b39	7a 	z 
	xor h			;0b3a	ac 	. 
	ld a,h			;0b3b	7c 	| 
	jp m,0095fh		;0b3c	fa 5f 09 	. _ . 
	cp d			;0b3f	ba 	. 
	jp nz,00960h		;0b40	c2 60 09 	. ` . 
	ld a,l			;0b43	7d 	} 
	sub e			;0b44	93 	. 
	jp nz,00960h		;0b45	c2 60 09 	. ` . 
	ret			;0b48	c9 	. 
	ld hl,04127h		;0b49	21 27 41 	! ' A 
	call 009d3h		;0b4c	cd d3 09 	. . . 
	ld de,0412eh		;0b4f	11 2e 41 	. . A 
	ld a,(de)			;0b52	1a 	. 
	or a			;0b53	b7 	. 
	jp z,00955h		;0b54	ca 55 09 	. U . 
	ld hl,0095eh		;0b57	21 5e 09 	! ^ . 
	push hl			;0b5a	e5 	. 
	call 00955h		;0b5b	cd 55 09 	. U . 
	dec de			;0b5e	1b 	. 
	ld a,(de)			;0b5f	1a 	. 
	ld c,a			;0b60	4f 	O 
	ret z			;0b61	c8 	. 
	ld hl,04123h		;0b62	21 23 41 	! # A 
	xor (hl)			;0b65	ae 	. 
	ld a,c			;0b66	79 	y 
	ret m			;0b67	f8 	. 
	inc de			;0b68	13 	. 
	inc hl			;0b69	23 	# 
	ld b,008h		;0b6a	06 08 	. . 
	ld a,(de)			;0b6c	1a 	. 
	sub (hl)			;0b6d	96 	. 
	jp nz,00a23h		;0b6e	c2 23 0a 	. # . 
	dec de			;0b71	1b 	. 
	dec hl			;0b72	2b 	+ 
	dec b			;0b73	05 	. 
	jr nz,$-8		;0b74	20 f6 	  . 
	pop bc			;0b76	c1 	. 
	ret			;0b77	c9 	. 
	call 00a4fh		;0b78	cd 4f 0a 	. O . 
	jp nz,0095eh		;0b7b	c2 5e 09 	. ^ . 
	ret			;0b7e	c9 	. 
	rst 20h			;0b7f	e7 	. 
	ld hl,(04121h)		;0b80	2a 21 41 	* ! A 
	ret m			;0b83	f8 	. 
	jp z,00af6h		;0b84	ca f6 0a 	. . . 
	call nc,00ab9h		;0b87	d4 b9 0a 	. . . 
	ld hl,007b2h		;0b8a	21 b2 07 	! . . 
	push hl			;0b8d	e5 	. 
	ld a,(04124h)		;0b8e	3a 24 41 	: $ A 
	cp 090h		;0b91	fe 90 	. . 
	jr nc,$+16		;0b93	30 0e 	0 . 
	call 00afbh		;0b95	cd fb 0a 	. . . 
	ex de,hl			;0b98	eb 	. 
	pop de			;0b99	d1 	. 
	ld (04121h),hl		;0b9a	22 21 41 	" ! A 
	ld a,002h		;0b9d	3e 02 	> . 
	ld (040afh),a		;0b9f	32 af 40 	2 . @ 
	ret			;0ba2	c9 	. 
	ld bc,09080h		;0ba3	01 80 90 	. . . 
	ld de,00000h		;0ba6	11 00 00 	. . . 
	call 00a0ch		;0ba9	cd 0c 0a 	. . . 
	ret nz			;0bac	c0 	. 
	ld h,c			;0bad	61 	a 
	ld l,d			;0bae	6a 	j 
	jr $-22		;0baf	18 e8 	. . 
	rst 20h			;0bb1	e7 	. 
	ret po			;0bb2	e0 	. 
	jp m,00acch		;0bb3	fa cc 0a 	. . . 
	jp z,00af6h		;0bb6	ca f6 0a 	. . . 
	call 009bfh		;0bb9	cd bf 09 	. . . 
	call 00aefh		;0bbc	cd ef 0a 	. . . 
	ld a,b			;0bbf	78 	x 
	or a			;0bc0	b7 	. 
	ret z			;0bc1	c8 	. 
	call 009dfh		;0bc2	cd df 09 	. . . 
	ld hl,04120h		;0bc5	21 20 41 	!   A 
	ld b,(hl)			;0bc8	46 	F 
	jp 00796h		;0bc9	c3 96 07 	. . . 
	ld hl,(04121h)		;0bcc	2a 21 41 	* ! A 
	call 00aefh		;0bcf	cd ef 0a 	. . . 
	ld a,h			;0bd2	7c 	| 
	ld d,l			;0bd3	55 	U 
	ld e,000h		;0bd4	1e 00 	. . 
	ld b,090h		;0bd6	06 90 	. . 
	jp 00969h		;0bd8	c3 69 09 	. i . 
	rst 20h			;0bdb	e7 	. 
	ret nc			;0bdc	d0 	. 
	jp z,00af6h		;0bdd	ca f6 0a 	. . . 
	call m,00acch		;0be0	fc cc 0a 	. . . 
	ld hl,00000h		;0be3	21 00 00 	! . . 
	ld (0411dh),hl		;0be6	22 1d 41 	" . A 
	ld (0411fh),hl		;0be9	22 1f 41 	" . A 
	ld a,008h		;0bec	3e 08 	> . 
	ld bc,0043eh		;0bee	01 3e 04 	. > . 
	jp 00a9fh		;0bf1	c3 9f 0a 	. . . 
	rst 20h			;0bf4	e7 	. 
	ret z			;0bf5	c8 	. 
	ld e,018h		;0bf6	1e 18 	. . 
	jp 019a2h		;0bf8	c3 a2 19 	. . . 
	ld b,a			;0bfb	47 	G 
	ld c,a			;0bfc	4f 	O 
	ld d,a			;0bfd	57 	W 
	ld e,a			;0bfe	5f 	_ 
	or a			;0bff	b7 	. 
	ret z			;0c00	c8 	. 
	push hl			;0c01	e5 	. 
	call 009bfh		;0c02	cd bf 09 	. . . 
	call 009dfh		;0c05	cd df 09 	. . . 
	xor (hl)			;0c08	ae 	. 
	ld h,a			;0c09	67 	g 
	call m,00b1fh		;0c0a	fc 1f 0b 	. . . 
	ld a,098h		;0c0d	3e 98 	> . 
	sub b			;0c0f	90 	. 
	call 007d7h		;0c10	cd d7 07 	. . . 
	ld a,h			;0c13	7c 	| 
	rla			;0c14	17 	. 
	call c,007a8h		;0c15	dc a8 07 	. . . 
	ld b,000h		;0c18	06 00 	. . 
	call c,007c3h		;0c1a	dc c3 07 	. . . 
	pop hl			;0c1d	e1 	. 
	ret			;0c1e	c9 	. 
	dec de			;0c1f	1b 	. 
	ld a,d			;0c20	7a 	z 
	and e			;0c21	a3 	. 
	inc a			;0c22	3c 	< 
	ret nz			;0c23	c0 	. 
	dec bc			;0c24	0b 	. 
	ret			;0c25	c9 	. 
	rst 20h			;0c26	e7 	. 
	ret m			;0c27	f8 	. 
	call 00955h		;0c28	cd 55 09 	. U . 
	jp p,00b37h		;0c2b	f2 37 0b 	. 7 . 
	call 00982h		;0c2e	cd 82 09 	. . . 
	call 00b37h		;0c31	cd 37 0b 	. 7 . 
	jp 0097bh		;0c34	c3 7b 09 	. { . 
	rst 20h			;0c37	e7 	. 
	ret m			;0c38	f8 	. 
	jr nc,$+32		;0c39	30 1e 	0 . 
	jr z,$-69		;0c3b	28 b9 	( . 
	call 00a8eh		;0c3d	cd 8e 0a 	. . . 
	ld hl,04124h		;0c40	21 24 41 	! $ A 
	ld a,(hl)			;0c43	7e 	~ 
	cp 098h		;0c44	fe 98 	. . 
	ld a,(04121h)		;0c46	3a 21 41 	: ! A 
	ret nc			;0c49	d0 	. 
	ld a,(hl)			;0c4a	7e 	~ 
	call 00afbh		;0c4b	cd fb 0a 	. . . 
	ld (hl),098h		;0c4e	36 98 	6 . 
	ld a,e			;0c50	7b 	{ 
	push af			;0c51	f5 	. 
	ld a,c			;0c52	79 	y 
	rla			;0c53	17 	. 
	call 00762h		;0c54	cd 62 07 	. b . 
	pop af			;0c57	f1 	. 
	ret			;0c58	c9 	. 
	ld hl,04124h		;0c59	21 24 41 	! $ A 
	ld a,(hl)			;0c5c	7e 	~ 
	cp 090h		;0c5d	fe 90 	. . 
	jp c,00a7fh		;0c5f	da 7f 0a 	.  . 
	jr nz,$+22		;0c62	20 14 	  . 
	ld c,a			;0c64	4f 	O 
	dec hl			;0c65	2b 	+ 
	ld a,(hl)			;0c66	7e 	~ 
	xor 080h		;0c67	ee 80 	. . 
	ld b,006h		;0c69	06 06 	. . 
	dec hl			;0c6b	2b 	+ 
	or (hl)			;0c6c	b6 	. 
	dec b			;0c6d	05 	. 
	jr nz,$-3		;0c6e	20 fb 	  . 
	or a			;0c70	b7 	. 
	ld hl,08000h		;0c71	21 00 80 	! . . 
	jp z,00a9ah		;0c74	ca 9a 0a 	. . . 
	ld a,c			;0c77	79 	y 
	cp 0b8h		;0c78	fe b8 	. . 
	ret nc			;0c7a	d0 	. 
	push af			;0c7b	f5 	. 
	call 009bfh		;0c7c	cd bf 09 	. . . 
	call 009dfh		;0c7f	cd df 09 	. . . 
	xor (hl)			;0c82	ae 	. 
	dec hl			;0c83	2b 	+ 
	ld (hl),0b8h		;0c84	36 b8 	6 . 
	push af			;0c86	f5 	. 
	call m,00ba0h		;0c87	fc a0 0b 	. . . 
	ld hl,04123h		;0c8a	21 23 41 	! # A 
	ld a,0b8h		;0c8d	3e b8 	> . 
	sub b			;0c8f	90 	. 
	call 00d69h		;0c90	cd 69 0d 	. i . 
	pop af			;0c93	f1 	. 
	call m,00d20h		;0c94	fc 20 0d 	.   . 
	xor a			;0c97	af 	. 
	ld (0411ch),a		;0c98	32 1c 41 	2 . A 
	pop af			;0c9b	f1 	. 
	ret nc			;0c9c	d0 	. 
	jp 00cd8h		;0c9d	c3 d8 0c 	. . . 
	ld hl,0411dh		;0ca0	21 1d 41 	! . A 
	ld a,(hl)			;0ca3	7e 	~ 
	dec (hl)			;0ca4	35 	5 
	or a			;0ca5	b7 	. 
	inc hl			;0ca6	23 	# 
	jr z,$-4		;0ca7	28 fa 	( . 
	ret			;0ca9	c9 	. 
	push hl			;0caa	e5 	. 
	ld hl,00000h		;0cab	21 00 00 	! . . 
	ld a,b			;0cae	78 	x 
	or c			;0caf	b1 	. 
	jr z,$+20		;0cb0	28 12 	( . 
	ld a,010h		;0cb2	3e 10 	> . 
	add hl,hl			;0cb4	29 	) 
	jp c,0273dh		;0cb5	da 3d 27 	. = ' 
	ex de,hl			;0cb8	eb 	. 
	add hl,hl			;0cb9	29 	) 
	ex de,hl			;0cba	eb 	. 
	jr nc,$+6		;0cbb	30 04 	0 . 
	add hl,bc			;0cbd	09 	. 
	jp c,0273dh		;0cbe	da 3d 27 	. = ' 
	dec a			;0cc1	3d 	= 
	jr nz,$-14		;0cc2	20 f0 	  . 
	ex de,hl			;0cc4	eb 	. 
	pop hl			;0cc5	e1 	. 
	ret			;0cc6	c9 	. 
	ld a,h			;0cc7	7c 	| 
	rla			;0cc8	17 	. 
	sbc a,a			;0cc9	9f 	. 
	ld b,a			;0cca	47 	G 
	call 00c51h		;0ccb	cd 51 0c 	. Q . 
	ld a,c			;0cce	79 	y 
	sbc a,b			;0ccf	98 	. 
	jr $+5		;0cd0	18 03 	. . 
	ld a,h			;0cd2	7c 	| 
	rla			;0cd3	17 	. 
	sbc a,a			;0cd4	9f 	. 
	ld b,a			;0cd5	47 	G 
	push hl			;0cd6	e5 	. 
	ld a,d			;0cd7	7a 	z 
	rla			;0cd8	17 	. 
	sbc a,a			;0cd9	9f 	. 
	add hl,de			;0cda	19 	. 
	adc a,b			;0cdb	88 	. 
	rrca			;0cdc	0f 	. 
	xor h			;0cdd	ac 	. 
	jp p,00a99h		;0cde	f2 99 0a 	. . . 
	push bc			;0ce1	c5 	. 
	ex de,hl			;0ce2	eb 	. 
	call 00acfh		;0ce3	cd cf 0a 	. . . 
	pop af			;0ce6	f1 	. 
	pop hl			;0ce7	e1 	. 
	call 009a4h		;0ce8	cd a4 09 	. . . 
	ex de,hl			;0ceb	eb 	. 
	call 00c6bh		;0cec	cd 6b 0c 	. k . 
	jp 00f8fh		;0cef	c3 8f 0f 	. . . 
	ld a,h			;0cf2	7c 	| 
	or l			;0cf3	b5 	. 
	jp z,00a9ah		;0cf4	ca 9a 0a 	. . . 
	push hl			;0cf7	e5 	. 
	push de			;0cf8	d5 	. 
	call 00c45h		;0cf9	cd 45 0c 	. E . 
	push bc			;0cfc	c5 	. 
	ld b,h			;0cfd	44 	D 
	ld c,l			;0cfe	4d 	M 
	ld hl,00000h		;0cff	21 00 00 	! . . 
	ld a,010h		;0d02	3e 10 	> . 
	add hl,hl			;0d04	29 	) 
	jr c,$+33		;0d05	38 1f 	8 . 
	ex de,hl			;0d07	eb 	. 
	add hl,hl			;0d08	29 	) 
	ex de,hl			;0d09	eb 	. 
	jr nc,$+6		;0d0a	30 04 	0 . 
	add hl,bc			;0d0c	09 	. 
	jp c,00c26h		;0d0d	da 26 0c 	. & . 
	dec a			;0d10	3d 	= 
	jr nz,$-13		;0d11	20 f1 	  . 
	pop bc			;0d13	c1 	. 
	pop de			;0d14	d1 	. 
	ld a,h			;0d15	7c 	| 
	or a			;0d16	b7 	. 
	jp m,00c1fh		;0d17	fa 1f 0c 	. . . 
	pop de			;0d1a	d1 	. 
	ld a,b			;0d1b	78 	x 
	jp 00c4dh		;0d1c	c3 4d 0c 	. M . 
	xor 080h		;0d1f	ee 80 	. . 
	or l			;0d21	b5 	. 
	jr z,$+21		;0d22	28 13 	( . 
	ex de,hl			;0d24	eb 	. 
	ld bc,0e1c1h		;0d25	01 c1 e1 	. . . 
	call 00acfh		;0d28	cd cf 0a 	. . . 
	pop hl			;0d2b	e1 	. 
	call 009a4h		;0d2c	cd a4 09 	. . . 
	call 00acfh		;0d2f	cd cf 0a 	. . . 
	pop bc			;0d32	c1 	. 
	pop de			;0d33	d1 	. 
	jp 00847h		;0d34	c3 47 08 	. G . 
	ld a,b			;0d37	78 	x 
	or a			;0d38	b7 	. 
	pop bc			;0d39	c1 	. 
	jp m,00a9ah		;0d3a	fa 9a 0a 	. . . 
	push de			;0d3d	d5 	. 
	call 00acfh		;0d3e	cd cf 0a 	. . . 
	pop de			;0d41	d1 	. 
	jp 00982h		;0d42	c3 82 09 	. . . 
	ld a,h			;0d45	7c 	| 
	xor d			;0d46	aa 	. 
	ld b,a			;0d47	47 	G 
	call 00c4ch		;0d48	cd 4c 0c 	. L . 
	ex de,hl			;0d4b	eb 	. 
	ld a,h			;0d4c	7c 	| 
	or a			;0d4d	b7 	. 
	jp p,00a9ah		;0d4e	f2 9a 0a 	. . . 
	xor a			;0d51	af 	. 
	ld c,a			;0d52	4f 	O 
	sub l			;0d53	95 	. 
	ld l,a			;0d54	6f 	o 
	ld a,c			;0d55	79 	y 
	sbc a,h			;0d56	9c 	. 
	ld h,a			;0d57	67 	g 
	jp 00a9ah		;0d58	c3 9a 0a 	. . . 
	ld hl,(04121h)		;0d5b	2a 21 41 	* ! A 
	call 00c51h		;0d5e	cd 51 0c 	. Q . 
	ld a,h			;0d61	7c 	| 
	xor 080h		;0d62	ee 80 	. . 
	or l			;0d64	b5 	. 
	ret nz			;0d65	c0 	. 
	ex de,hl			;0d66	eb 	. 
	call 00aefh		;0d67	cd ef 0a 	. . . 
	xor a			;0d6a	af 	. 
	ld b,098h		;0d6b	06 98 	. . 
	jp 00969h		;0d6d	c3 69 09 	. i . 
	ld hl,0412dh		;0d70	21 2d 41 	! - A 
	ld a,(hl)			;0d73	7e 	~ 
	xor 080h		;0d74	ee 80 	. . 
	ld (hl),a			;0d76	77 	w 
	ld hl,0412eh		;0d77	21 2e 41 	! . A 
	ld a,(hl)			;0d7a	7e 	~ 
	or a			;0d7b	b7 	. 
	ret z			;0d7c	c8 	. 
	ld b,a			;0d7d	47 	G 
	dec hl			;0d7e	2b 	+ 
	ld c,(hl)			;0d7f	4e 	N 
	ld de,04124h		;0d80	11 24 41 	. $ A 
	ld a,(de)			;0d83	1a 	. 
	or a			;0d84	b7 	. 
	jp z,009f4h		;0d85	ca f4 09 	. . . 
	sub b			;0d88	90 	. 
	jr nc,$+24		;0d89	30 16 	0 . 
	cpl			;0d8b	2f 	/ 
	inc a			;0d8c	3c 	< 
	push af			;0d8d	f5 	. 
	ld c,008h		;0d8e	0e 08 	. . 
	inc hl			;0d90	23 	# 
	push hl			;0d91	e5 	. 
	ld a,(de)			;0d92	1a 	. 
	ld b,(hl)			;0d93	46 	F 
	ld (hl),a			;0d94	77 	w 
	ld a,b			;0d95	78 	x 
	ld (de),a			;0d96	12 	. 
	dec de			;0d97	1b 	. 
	dec hl			;0d98	2b 	+ 
	dec c			;0d99	0d 	. 
	jr nz,$-8		;0d9a	20 f6 	  . 
	pop hl			;0d9c	e1 	. 
	ld b,(hl)			;0d9d	46 	F 
	dec hl			;0d9e	2b 	+ 
	ld c,(hl)			;0d9f	4e 	N 
	pop af			;0da0	f1 	. 
	cp 039h		;0da1	fe 39 	. 9 
	ret nc			;0da3	d0 	. 
	push af			;0da4	f5 	. 
	call 009dfh		;0da5	cd df 09 	. . . 
	inc hl			;0da8	23 	# 
	ld (hl),000h		;0da9	36 00 	6 . 
	ld b,a			;0dab	47 	G 
	pop af			;0dac	f1 	. 
	ld hl,0412dh		;0dad	21 2d 41 	! - A 
	call 00d69h		;0db0	cd 69 0d 	. i . 
	ld a,(04126h)		;0db3	3a 26 41 	: & A 
	ld (0411ch),a		;0db6	32 1c 41 	2 . A 
	ld a,b			;0db9	78 	x 
	or a			;0dba	b7 	. 
	jp p,00ccfh		;0dbb	f2 cf 0c 	. . . 
	call 00d33h		;0dbe	cd 33 0d 	. 3 . 
	jp nc,00d0eh		;0dc1	d2 0e 0d 	. . . 
	ex de,hl			;0dc4	eb 	. 
	inc (hl)			;0dc5	34 	4 
	jp z,007b2h		;0dc6	ca b2 07 	. . . 
	call 00d90h		;0dc9	cd 90 0d 	. . . 
	jp 00d0eh		;0dcc	c3 0e 0d 	. . . 
	call 00d45h		;0dcf	cd 45 0d 	. E . 
	ld hl,04125h		;0dd2	21 25 41 	! % A 
	call c,00d57h		;0dd5	dc 57 0d 	. W . 
	xor a			;0dd8	af 	. 
	ld b,a			;0dd9	47 	G 
	ld a,(04123h)		;0dda	3a 23 41 	: # A 
	or a			;0ddd	b7 	. 
	jr nz,$+32		;0dde	20 1e 	  . 
	ld hl,0411ch		;0de0	21 1c 41 	! . A 
	ld c,008h		;0de3	0e 08 	. . 
	ld d,(hl)			;0de5	56 	V 
	ld (hl),a			;0de6	77 	w 
	ld a,d			;0de7	7a 	z 
	inc hl			;0de8	23 	# 
	dec c			;0de9	0d 	. 
	jr nz,$-5		;0dea	20 f9 	  . 
	ld a,b			;0dec	78 	x 
	sub 008h		;0ded	d6 08 	. . 
	cp 0c0h		;0def	fe c0 	. . 
	jr nz,$-24		;0df1	20 e6 	  . 
	jp 00778h		;0df3	c3 78 07 	. x . 
	dec b			;0df6	05 	. 
	ld hl,0411ch		;0df7	21 1c 41 	! . A 
	call 00d97h		;0dfa	cd 97 0d 	. . . 
	or a			;0dfd	b7 	. 
	jp p,00cf6h		;0dfe	f2 f6 0c 	. . . 
	ld a,b			;0e01	78 	x 
	or a			;0e02	b7 	. 
	jr z,$+11		;0e03	28 09 	( . 
	ld hl,04124h		;0e05	21 24 41 	! $ A 
	add a,(hl)			;0e08	86 	. 
	ld (hl),a			;0e09	77 	w 
	jp nc,00778h		;0e0a	d2 78 07 	. x . 
	ret z			;0e0d	c8 	. 
	ld a,(0411ch)		;0e0e	3a 1c 41 	: . A 
	or a			;0e11	b7 	. 
	call m,00d20h		;0e12	fc 20 0d 	.   . 
	ld hl,04125h		;0e15	21 25 41 	! % A 
	ld a,(hl)			;0e18	7e 	~ 
	and 080h		;0e19	e6 80 	. . 
	dec hl			;0e1b	2b 	+ 
	dec hl			;0e1c	2b 	+ 
	xor (hl)			;0e1d	ae 	. 
	ld (hl),a			;0e1e	77 	w 
	ret			;0e1f	c9 	. 
	ld hl,0411dh		;0e20	21 1d 41 	! . A 
	ld b,007h		;0e23	06 07 	. . 
	inc (hl)			;0e25	34 	4 
	ret nz			;0e26	c0 	. 
	inc hl			;0e27	23 	# 
	dec b			;0e28	05 	. 
	jr nz,$-4		;0e29	20 fa 	  . 
	inc (hl)			;0e2b	34 	4 
	jp z,007b2h		;0e2c	ca b2 07 	. . . 
	dec hl			;0e2f	2b 	+ 
	ld (hl),080h		;0e30	36 80 	6 . 
	ret			;0e32	c9 	. 
	ld hl,04127h		;0e33	21 27 41 	! ' A 
	ld de,0411dh		;0e36	11 1d 41 	. . A 
	ld c,007h		;0e39	0e 07 	. . 
	xor a			;0e3b	af 	. 
	ld a,(de)			;0e3c	1a 	. 
	adc a,(hl)			;0e3d	8e 	. 
	ld (de),a			;0e3e	12 	. 
	inc de			;0e3f	13 	. 
	inc hl			;0e40	23 	# 
	dec c			;0e41	0d 	. 
	jr nz,$-6		;0e42	20 f8 	  . 
	ret			;0e44	c9 	. 
	ld hl,04127h		;0e45	21 27 41 	! ' A 
	ld de,0411dh		;0e48	11 1d 41 	. . A 
	ld c,007h		;0e4b	0e 07 	. . 
	xor a			;0e4d	af 	. 
	ld a,(de)			;0e4e	1a 	. 
	sbc a,(hl)			;0e4f	9e 	. 
	ld (de),a			;0e50	12 	. 
	inc de			;0e51	13 	. 
	inc hl			;0e52	23 	# 
	dec c			;0e53	0d 	. 
	jr nz,$-6		;0e54	20 f8 	  . 
	ret			;0e56	c9 	. 
	ld a,(hl)			;0e57	7e 	~ 
	cpl			;0e58	2f 	/ 
	ld (hl),a			;0e59	77 	w 
	ld hl,0411ch		;0e5a	21 1c 41 	! . A 
	ld b,008h		;0e5d	06 08 	. . 
	xor a			;0e5f	af 	. 
	ld c,a			;0e60	4f 	O 
	ld a,c			;0e61	79 	y 
	sbc a,(hl)			;0e62	9e 	. 
	ld (hl),a			;0e63	77 	w 
	inc hl			;0e64	23 	# 
	dec b			;0e65	05 	. 
	jr nz,$-5		;0e66	20 f9 	  . 
	ret			;0e68	c9 	. 
	ld (hl),c			;0e69	71 	q 
	push hl			;0e6a	e5 	. 
	sub 008h		;0e6b	d6 08 	. . 
	jr c,$+16		;0e6d	38 0e 	8 . 
	pop hl			;0e6f	e1 	. 
	push hl			;0e70	e5 	. 
	ld de,00800h		;0e71	11 00 08 	. . . 
	ld c,(hl)			;0e74	4e 	N 
	ld (hl),e			;0e75	73 	s 
	ld e,c			;0e76	59 	Y 
	dec hl			;0e77	2b 	+ 
	dec d			;0e78	15 	. 
	jr nz,$-5		;0e79	20 f9 	  . 
	jr $-16		;0e7b	18 ee 	. . 
	add a,009h		;0e7d	c6 09 	. . 
	ld d,a			;0e7f	57 	W 
	xor a			;0e80	af 	. 
	pop hl			;0e81	e1 	. 
	dec d			;0e82	15 	. 
	ret z			;0e83	c8 	. 
	push hl			;0e84	e5 	. 
	ld e,008h		;0e85	1e 08 	. . 
	ld a,(hl)			;0e87	7e 	~ 
	rra			;0e88	1f 	. 
	ld (hl),a			;0e89	77 	w 
	dec hl			;0e8a	2b 	+ 
	dec e			;0e8b	1d 	. 
	jr nz,$-5		;0e8c	20 f9 	  . 
	jr $-14		;0e8e	18 f0 	. . 
	ld hl,04123h		;0e90	21 23 41 	! # A 
	ld d,001h		;0e93	16 01 	. . 
	jr $-17		;0e95	18 ed 	. . 
	ld c,008h		;0e97	0e 08 	. . 
	ld a,(hl)			;0e99	7e 	~ 
	rla			;0e9a	17 	. 
	ld (hl),a			;0e9b	77 	w 
	inc hl			;0e9c	23 	# 
	dec c			;0e9d	0d 	. 
	jr nz,$-5		;0e9e	20 f9 	  . 
	ret			;0ea0	c9 	. 
	call 00955h		;0ea1	cd 55 09 	. U . 
	ret z			;0ea4	c8 	. 
	call 0090ah		;0ea5	cd 0a 09 	. . . 
	call 00e39h		;0ea8	cd 39 0e 	. 9 . 
	ld (hl),c			;0eab	71 	q 
	inc de			;0eac	13 	. 
	ld b,007h		;0ead	06 07 	. . 
	ld a,(de)			;0eaf	1a 	. 
	inc de			;0eb0	13 	. 
	or a			;0eb1	b7 	. 
	push de			;0eb2	d5 	. 
	jr z,$+25		;0eb3	28 17 	( . 
	ld c,008h		;0eb5	0e 08 	. . 
	push bc			;0eb7	c5 	. 
	rra			;0eb8	1f 	. 
	ld b,a			;0eb9	47 	G 
	call c,00d33h		;0eba	dc 33 0d 	. 3 . 
	call 00d90h		;0ebd	cd 90 0d 	. . . 
	ld a,b			;0ec0	78 	x 
	pop bc			;0ec1	c1 	. 
	dec c			;0ec2	0d 	. 
	jr nz,$-12		;0ec3	20 f2 	  . 
	pop de			;0ec5	d1 	. 
	dec b			;0ec6	05 	. 
	jr nz,$-24		;0ec7	20 e6 	  . 
	jp 00cd8h		;0ec9	c3 d8 0c 	. . . 
	ld hl,04123h		;0ecc	21 23 41 	! # A 
	call 00d70h		;0ecf	cd 70 0d 	. p . 
	jr $-13		;0ed2	18 f1 	. . 
	nop			;0ed4	00 	. 
	nop			;0ed5	00 	. 
	nop			;0ed6	00 	. 
	nop			;0ed7	00 	. 
	nop			;0ed8	00 	. 
	nop			;0ed9	00 	. 
	jr nz,$-122		;0eda	20 84 	  . 
	ld de,00dd4h		;0edc	11 d4 0d 	. . . 
	ld hl,04127h		;0edf	21 27 41 	! ' A 
	call 009d3h		;0ee2	cd d3 09 	. . . 
	ld a,(0412eh)		;0ee5	3a 2e 41 	: . A 
	or a			;0ee8	b7 	. 
	jp z,0199ah		;0ee9	ca 9a 19 	. . . 
	call 00907h		;0eec	cd 07 09 	. . . 
	inc (hl)			;0eef	34 	4 
	inc (hl)			;0ef0	34 	4 
	call 00e39h		;0ef1	cd 39 0e 	. 9 . 
	ld hl,04151h		;0ef4	21 51 41 	! Q A 
	ld (hl),c			;0ef7	71 	q 
	ld b,c			;0ef8	41 	A 
	ld de,0414ah		;0ef9	11 4a 41 	. J A 
	ld hl,04127h		;0efc	21 27 41 	! ' A 
	call 00d4bh		;0eff	cd 4b 0d 	. K . 
	ld a,(de)			;0f02	1a 	. 
	sbc a,c			;0f03	99 	. 
	ccf			;0f04	3f 	? 
	jr c,$+13		;0f05	38 0b 	8 . 
	ld de,0414ah		;0f07	11 4a 41 	. J A 
	ld hl,04127h		;0f0a	21 27 41 	! ' A 
	call 00d39h		;0f0d	cd 39 0d 	. 9 . 
	xor a			;0f10	af 	. 
	jp c,00412h		;0f11	da 12 04 	. . . 
	ld a,(04123h)		;0f14	3a 23 41 	: # A 
	inc a			;0f17	3c 	< 
	dec a			;0f18	3d 	= 
	rra			;0f19	1f 	. 
	jp m,00d11h		;0f1a	fa 11 0d 	. . . 
	rla			;0f1d	17 	. 
	ld hl,0411dh		;0f1e	21 1d 41 	! . A 
	ld c,007h		;0f21	0e 07 	. . 
	call 00d99h		;0f23	cd 99 0d 	. . . 
	ld hl,0414ah		;0f26	21 4a 41 	! J A 
	call 00d97h		;0f29	cd 97 0d 	. . . 
	ld a,b			;0f2c	78 	x 
	or a			;0f2d	b7 	. 
	jr nz,$-53		;0f2e	20 c9 	  . 
	ld hl,04124h		;0f30	21 24 41 	! $ A 
	dec (hl)			;0f33	35 	5 
	jr nz,$-59		;0f34	20 c3 	  . 
	jp 007b2h		;0f36	c3 b2 07 	. . . 
	ld a,c			;0f39	79 	y 
	ld (0412dh),a		;0f3a	32 2d 41 	2 - A 
	dec hl			;0f3d	2b 	+ 
	ld de,04150h		;0f3e	11 50 41 	. P A 
	ld bc,00700h		;0f41	01 00 07 	. . . 
	ld a,(hl)			;0f44	7e 	~ 
	ld (de),a			;0f45	12 	. 
	ld (hl),c			;0f46	71 	q 
	dec de			;0f47	1b 	. 
	dec hl			;0f48	2b 	+ 
	dec b			;0f49	05 	. 
	jr nz,$-6		;0f4a	20 f8 	  . 
	ret			;0f4c	c9 	. 
	call 009fch		;0f4d	cd fc 09 	. . . 
	ex de,hl			;0f50	eb 	. 
	dec hl			;0f51	2b 	+ 
	ld a,(hl)			;0f52	7e 	~ 
	or a			;0f53	b7 	. 
	ret z			;0f54	c8 	. 
	add a,002h		;0f55	c6 02 	. . 
	jp c,007b2h		;0f57	da b2 07 	. . . 
	ld (hl),a			;0f5a	77 	w 
	push hl			;0f5b	e5 	. 
	call 00c77h		;0f5c	cd 77 0c 	. w . 
	pop hl			;0f5f	e1 	. 
	inc (hl)			;0f60	34 	4 
	ret nz			;0f61	c0 	. 
	jp 007b2h		;0f62	c3 b2 07 	. . . 
	call 00778h		;0f65	cd 78 07 	. x . 
	call 00aech		;0f68	cd ec 0a 	. . . 
	or 0afh		;0f6b	f6 af 	. . 
	ex de,hl			;0f6d	eb 	. 
	ld bc,000ffh		;0f6e	01 ff 00 	. . . 
	ld h,b			;0f71	60 	` 
	ld l,b			;0f72	68 	h 
	call z,00a9ah		;0f73	cc 9a 0a 	. . . 
	ex de,hl			;0f76	eb 	. 
	ld a,(hl)			;0f77	7e 	~ 
	cp 02dh		;0f78	fe 2d 	. - 
	push af			;0f7a	f5 	. 
	jp z,00e83h		;0f7b	ca 83 0e 	. . . 
	cp 02bh		;0f7e	fe 2b 	. + 
	jr z,$+3		;0f80	28 01 	( . 
	dec hl			;0f82	2b 	+ 
	rst 10h			;0f83	d7 	. 
	jp c,00f29h		;0f84	da 29 0f 	. ) . 
	cp 02eh		;0f87	fe 2e 	. . 
	jp z,00ee4h		;0f89	ca e4 0e 	. . . 
	cp 045h		;0f8c	fe 45 	. E 
	jr z,$+22		;0f8e	28 14 	( . 
	cp 025h		;0f90	fe 25 	. % 
	jp z,00eeeh		;0f92	ca ee 0e 	. . . 
	cp 023h		;0f95	fe 23 	. # 
	jp z,00ef5h		;0f97	ca f5 0e 	. . . 
	cp 021h		;0f9a	fe 21 	. ! 
	jp z,00ef6h		;0f9c	ca f6 0e 	. . . 
	cp 044h		;0f9f	fe 44 	. D 
	jr nz,$+38		;0fa1	20 24 	  $ 
	or a			;0fa3	b7 	. 
	call 00efbh		;0fa4	cd fb 0e 	. . . 
	push hl			;0fa7	e5 	. 
	ld hl,00ebdh		;0fa8	21 bd 0e 	! . . 
	ex (sp),hl			;0fab	e3 	. 
	rst 10h			;0fac	d7 	. 
	dec d			;0fad	15 	. 
	cp 0ceh		;0fae	fe ce 	. . 
	ret z			;0fb0	c8 	. 
	cp 02dh		;0fb1	fe 2d 	. - 
	ret z			;0fb3	c8 	. 
	inc d			;0fb4	14 	. 
	cp 0cdh		;0fb5	fe cd 	. . 
	ret z			;0fb7	c8 	. 
	cp 02bh		;0fb8	fe 2b 	. + 
	ret z			;0fba	c8 	. 
	dec hl			;0fbb	2b 	+ 
	pop af			;0fbc	f1 	. 
	rst 10h			;0fbd	d7 	. 
	jp c,00f94h		;0fbe	da 94 0f 	. . . 
	inc d			;0fc1	14 	. 
	jr nz,$+5		;0fc2	20 03 	  . 
	xor a			;0fc4	af 	. 
	sub e			;0fc5	93 	. 
	ld e,a			;0fc6	5f 	_ 
	push hl			;0fc7	e5 	. 
	ld a,e			;0fc8	7b 	{ 
	sub b			;0fc9	90 	. 
	call p,00f0ah		;0fca	f4 0a 0f 	. . . 
	call m,00f18h		;0fcd	fc 18 0f 	. . . 
	jr nz,$-6		;0fd0	20 f8 	  . 
	pop hl			;0fd2	e1 	. 
	pop af			;0fd3	f1 	. 
	push hl			;0fd4	e5 	. 
	call z,0097bh		;0fd5	cc 7b 09 	. { . 
	pop hl			;0fd8	e1 	. 
	rst 20h			;0fd9	e7 	. 
	ret pe			;0fda	e8 	. 
	push hl			;0fdb	e5 	. 
	ld hl,00890h		;0fdc	21 90 08 	! . . 
	push hl			;0fdf	e5 	. 
	call 00aa3h		;0fe0	cd a3 0a 	. . . 
	ret			;0fe3	c9 	. 
	rst 20h			;0fe4	e7 	. 
	inc c			;0fe5	0c 	. 
	jr nz,$-31		;0fe6	20 df 	  . 
	call c,00efbh		;0fe8	dc fb 0e 	. . . 
	jp 00e83h		;0feb	c3 83 0e 	. . . 
	rst 20h			;0fee	e7 	. 
	jp p,01997h		;0fef	f2 97 19 	. . . 
	inc hl			;0ff2	23 	# 
	jr $-44		;0ff3	18 d2 	. . 
	or a			;0ff5	b7 	. 
	call 00efbh		;0ff6	cd fb 0e 	. . . 
	jr $-7		;0ff9	18 f7 	. . 
	push hl			;0ffb	e5 	. 
	push de			;0ffc	d5 	. 
	push bc			;0ffd	c5 	. 
	push af			;0ffe	f5 	. 
	call z,00ab1h		;0fff	cc b1 0a 	. . . 
	pop af			;1002	f1 	. 
	call nz,00adbh		;1003	c4 db 0a 	. . . 
	pop bc			;1006	c1 	. 
	pop de			;1007	d1 	. 
	pop hl			;1008	e1 	. 
	ret			;1009	c9 	. 
	ret z			;100a	c8 	. 
	push af			;100b	f5 	. 
	rst 20h			;100c	e7 	. 
	push af			;100d	f5 	. 
	call po,0093eh		;100e	e4 3e 09 	. > . 
	pop af			;1011	f1 	. 
	call pe,00e4dh		;1012	ec 4d 0e 	. M . 
	pop af			;1015	f1 	. 
	dec a			;1016	3d 	= 
	ret			;1017	c9 	. 
	push de			;1018	d5 	. 
	push hl			;1019	e5 	. 
	push af			;101a	f5 	. 
	rst 20h			;101b	e7 	. 
	push af			;101c	f5 	. 
	call po,00897h		;101d	e4 97 08 	. . . 
	pop af			;1020	f1 	. 
	call pe,00ddch		;1021	ec dc 0d 	. . . 
	pop af			;1024	f1 	. 
	pop hl			;1025	e1 	. 
	pop de			;1026	d1 	. 
	inc a			;1027	3c 	< 
	ret			;1028	c9 	. 
	push de			;1029	d5 	. 
	ld a,b			;102a	78 	x 
	adc a,c			;102b	89 	. 
	ld b,a			;102c	47 	G 
	push bc			;102d	c5 	. 
	push hl			;102e	e5 	. 
	ld a,(hl)			;102f	7e 	~ 
	sub 030h		;1030	d6 30 	. 0 
	push af			;1032	f5 	. 
	rst 20h			;1033	e7 	. 
	jp p,00f5dh		;1034	f2 5d 0f 	. ] . 
	ld hl,(04121h)		;1037	2a 21 41 	* ! A 
	ld de,00ccdh		;103a	11 cd 0c 	. . . 
	rst 18h			;103d	df 	. 
	jr nc,$+27		;103e	30 19 	0 . 
	ld d,h			;1040	54 	T 
	ld e,l			;1041	5d 	] 
	add hl,hl			;1042	29 	) 
	add hl,hl			;1043	29 	) 
	add hl,de			;1044	19 	. 
	add hl,hl			;1045	29 	) 
	pop af			;1046	f1 	. 
	ld c,a			;1047	4f 	O 
	add hl,bc			;1048	09 	. 
	ld a,h			;1049	7c 	| 
	or a			;104a	b7 	. 
	jp m,00f57h		;104b	fa 57 0f 	. W . 
	ld (04121h),hl		;104e	22 21 41 	" ! A 
	pop hl			;1051	e1 	. 
	pop bc			;1052	c1 	. 
	pop de			;1053	d1 	. 
	jp 00e83h		;1054	c3 83 0e 	. . . 
	ld a,c			;1057	79 	y 
	push af			;1058	f5 	. 
	call 00acch		;1059	cd cc 0a 	. . . 
	scf			;105c	37 	7 
	jr nc,$+26		;105d	30 18 	0 . 
	ld bc,09474h		;105f	01 74 94 	. t . 
	ld de,02400h		;1062	11 00 24 	. . $ 
	call 00a0ch		;1065	cd 0c 0a 	. . . 
	jp p,00f74h		;1068	f2 74 0f 	. t . 
	call 0093eh		;106b	cd 3e 09 	. > . 
	pop af			;106e	f1 	. 
	call 00f89h		;106f	cd 89 0f 	. . . 
	jr $-33		;1072	18 dd 	. . 
	call 00ae3h		;1074	cd e3 0a 	. . . 
	call 00e4dh		;1077	cd 4d 0e 	. M . 
	call 009fch		;107a	cd fc 09 	. . . 
	pop af			;107d	f1 	. 
	call 00964h		;107e	cd 64 09 	. d . 
	call 00ae3h		;1081	cd e3 0a 	. . . 
	call 00c77h		;1084	cd 77 0c 	. w . 
	jr $-54		;1087	18 c8 	. . 
	call 009a4h		;1089	cd a4 09 	. . . 
	call 00964h		;108c	cd 64 09 	. d . 
	pop bc			;108f	c1 	. 
	pop de			;1090	d1 	. 
	jp 00716h		;1091	c3 16 07 	. . . 
	ld a,e			;1094	7b 	{ 
	cp 00ah		;1095	fe 0a 	. . 
	jr nc,$+11		;1097	30 09 	0 . 
	rlca			;1099	07 	. 
	rlca			;109a	07 	. 
	add a,e			;109b	83 	. 
	rlca			;109c	07 	. 
	add a,(hl)			;109d	86 	. 
	sub 030h		;109e	d6 30 	. 0 
	ld e,a			;10a0	5f 	_ 
	jp m,0321eh		;10a1	fa 1e 32 	. . 2 
	jp 00ebdh		;10a4	c3 bd 0e 	. . . 
	push hl			;10a7	e5 	. 
	ld hl,01924h		;10a8	21 24 19 	! $ . 
	call 028a7h		;10ab	cd a7 28 	. . ( 
	pop hl			;10ae	e1 	. 
	call 00a9ah		;10af	cd 9a 0a 	. . . 
	xor a			;10b2	af 	. 
	call 01034h		;10b3	cd 34 10 	. 4 . 
	or (hl)			;10b6	b6 	. 
	call 00fd9h		;10b7	cd d9 0f 	. . . 
	jp 028a6h		;10ba	c3 a6 28 	. . ( 
	xor a			;10bd	af 	. 
	call 01034h		;10be	cd 34 10 	. 4 . 
	and 008h		;10c1	e6 08 	. . 
	jr z,$+4		;10c3	28 02 	( . 
	ld (hl),02bh		;10c5	36 2b 	6 + 
	ex de,hl			;10c7	eb 	. 
	call 00994h		;10c8	cd 94 09 	. . . 
	ex de,hl			;10cb	eb 	. 
	jp p,00fd9h		;10cc	f2 d9 0f 	. . . 
	ld (hl),02dh		;10cf	36 2d 	6 - 
	push bc			;10d1	c5 	. 
	push hl			;10d2	e5 	. 
	call 0097bh		;10d3	cd 7b 09 	. { . 
	pop hl			;10d6	e1 	. 
	pop bc			;10d7	c1 	. 
	or h			;10d8	b4 	. 
	inc hl			;10d9	23 	# 
	ld (hl),030h		;10da	36 30 	6 0 
	ld a,(040d8h)		;10dc	3a d8 40 	: . @ 
	ld d,a			;10df	57 	W 
	rla			;10e0	17 	. 
	ld a,(040afh)		;10e1	3a af 40 	: . @ 
	jp c,0109ah		;10e4	da 9a 10 	. . . 
	jp z,01092h		;10e7	ca 92 10 	. . . 
	cp 004h		;10ea	fe 04 	. . 
	jp nc,0103dh		;10ec	d2 3d 10 	. = . 
	ld bc,00000h		;10ef	01 00 00 	. . . 
	call 0132fh		;10f2	cd 2f 13 	. / . 
	ld hl,04130h		;10f5	21 30 41 	! 0 A 
	ld b,(hl)			;10f8	46 	F 
	ld c,020h		;10f9	0e 20 	.   
	ld a,(040d8h)		;10fb	3a d8 40 	: . @ 
	ld e,a			;10fe	5f 	_ 
	and 020h		;10ff	e6 20 	.   
	jr z,$+9		;1101	28 07 	( . 
	ld a,b			;1103	78 	x 
	cp c			;1104	b9 	. 
	ld c,02ah		;1105	0e 2a 	. * 
	jr nz,$+3		;1107	20 01 	  . 
	ld b,c			;1109	41 	A 
	ld (hl),c			;110a	71 	q 
	rst 10h			;110b	d7 	. 
	jr z,$+22		;110c	28 14 	( . 
	cp 045h		;110e	fe 45 	. E 
	jr z,$+18		;1110	28 10 	( . 
	cp 044h		;1112	fe 44 	. D 
	jr z,$+14		;1114	28 0c 	( . 
	cp 030h		;1116	fe 30 	. 0 
	jr z,$-14		;1118	28 f0 	( . 
	cp 02ch		;111a	fe 2c 	. , 
	jr z,$-18		;111c	28 ec 	( . 
	cp 02eh		;111e	fe 2e 	. . 
	jr nz,$+5		;1120	20 03 	  . 
	dec hl			;1122	2b 	+ 
	ld (hl),030h		;1123	36 30 	6 0 
	ld a,e			;1125	7b 	{ 
	and 010h		;1126	e6 10 	. . 
	jr z,$+5		;1128	28 03 	( . 
	dec hl			;112a	2b 	+ 
	ld (hl),024h		;112b	36 24 	6 $ 
	ld a,e			;112d	7b 	{ 
	and 004h		;112e	e6 04 	. . 
	ret nz			;1130	c0 	. 
	dec hl			;1131	2b 	+ 
	ld (hl),b			;1132	70 	p 
	ret			;1133	c9 	. 
	ld (040d8h),a		;1134	32 d8 40 	2 . @ 
	ld hl,04130h		;1137	21 30 41 	! 0 A 
	ld (hl),020h		;113a	36 20 	6   
	ret			;113c	c9 	. 
	cp 005h		;113d	fe 05 	. . 
	push hl			;113f	e5 	. 
	sbc a,000h		;1140	de 00 	. . 
	rla			;1142	17 	. 
	ld d,a			;1143	57 	W 
	inc d			;1144	14 	. 
	call 01201h		;1145	cd 01 12 	. . . 
	ld bc,00300h		;1148	01 00 03 	. . . 
	add a,d			;114b	82 	. 
	jp m,01057h		;114c	fa 57 10 	. W . 
	inc d			;114f	14 	. 
	cp d			;1150	ba 	. 
	jr nc,$+6		;1151	30 04 	0 . 
	inc a			;1153	3c 	< 
	ld b,a			;1154	47 	G 
	ld a,002h		;1155	3e 02 	> . 
	sub 002h		;1157	d6 02 	. . 
	pop hl			;1159	e1 	. 
	push af			;115a	f5 	. 
	call 01291h		;115b	cd 91 12 	. . . 
	ld (hl),030h		;115e	36 30 	6 0 
	call z,009c9h		;1160	cc c9 09 	. . . 
	call 012a4h		;1163	cd a4 12 	. . . 
	dec hl			;1166	2b 	+ 
	ld a,(hl)			;1167	7e 	~ 
	cp 030h		;1168	fe 30 	. 0 
	jr z,$-4		;116a	28 fa 	( . 
	cp 02eh		;116c	fe 2e 	. . 
	call nz,009c9h		;116e	c4 c9 09 	. . . 
	pop af			;1171	f1 	. 
	jr z,$+33		;1172	28 1f 	( . 
	push af			;1174	f5 	. 
	rst 20h			;1175	e7 	. 
	ld a,022h		;1176	3e 22 	> " 
	adc a,a			;1178	8f 	. 
	ld (hl),a			;1179	77 	w 
	inc hl			;117a	23 	# 
	pop af			;117b	f1 	. 
	ld (hl),02bh		;117c	36 2b 	6 + 
	jp p,01085h		;117e	f2 85 10 	. . . 
	ld (hl),02dh		;1181	36 2d 	6 - 
	cpl			;1183	2f 	/ 
	inc a			;1184	3c 	< 
	ld b,02fh		;1185	06 2f 	. / 
	inc b			;1187	04 	. 
	sub 00ah		;1188	d6 0a 	. . 
	jr nc,$-3		;118a	30 fb 	0 . 
	add a,03ah		;118c	c6 3a 	. : 
	inc hl			;118e	23 	# 
	ld (hl),b			;118f	70 	p 
	inc hl			;1190	23 	# 
	ld (hl),a			;1191	77 	w 
	inc hl			;1192	23 	# 
	ld (hl),000h		;1193	36 00 	6 . 
	ex de,hl			;1195	eb 	. 
	ld hl,04130h		;1196	21 30 41 	! 0 A 
	ret			;1199	c9 	. 
	inc hl			;119a	23 	# 
	push bc			;119b	c5 	. 
	cp 004h		;119c	fe 04 	. . 
	ld a,d			;119e	7a 	z 
	jp nc,01109h		;119f	d2 09 11 	. . . 
	rra			;11a2	1f 	. 
	jp c,011a3h		;11a3	da a3 11 	. . . 
	ld bc,00603h		;11a6	01 03 06 	. . . 
	call 01289h		;11a9	cd 89 12 	. . . 
	pop de			;11ac	d1 	. 
	ld a,d			;11ad	7a 	z 
	sub 005h		;11ae	d6 05 	. . 
	call p,01269h		;11b0	f4 69 12 	. i . 
	call 0132fh		;11b3	cd 2f 13 	. / . 
	ld a,e			;11b6	7b 	{ 
	or a			;11b7	b7 	. 
	call z,0092fh		;11b8	cc 2f 09 	. / . 
	dec a			;11bb	3d 	= 
	call p,01269h		;11bc	f4 69 12 	. i . 
	push hl			;11bf	e5 	. 
	call 00ff5h		;11c0	cd f5 0f 	. . . 
	pop hl			;11c3	e1 	. 
	jr z,$+4		;11c4	28 02 	( . 
	ld (hl),b			;11c6	70 	p 
	inc hl			;11c7	23 	# 
	ld (hl),000h		;11c8	36 00 	6 . 
	ld hl,0412fh		;11ca	21 2f 41 	! / A 
	inc hl			;11cd	23 	# 
	ld a,(040f3h)		;11ce	3a f3 40 	: . @ 
	sub l			;11d1	95 	. 
	sub d			;11d2	92 	. 
	ret z			;11d3	c8 	. 
	ld a,(hl)			;11d4	7e 	~ 
	cp 020h		;11d5	fe 20 	.   
	jr z,$-10		;11d7	28 f4 	( . 
	cp 02ah		;11d9	fe 2a 	. * 
	jr z,$-14		;11db	28 f0 	( . 
	dec hl			;11dd	2b 	+ 
	push hl			;11de	e5 	. 
	push af			;11df	f5 	. 
	ld bc,010dfh		;11e0	01 df 10 	. . . 
	push bc			;11e3	c5 	. 
	rst 10h			;11e4	d7 	. 
	cp 02dh		;11e5	fe 2d 	. - 
	ret z			;11e7	c8 	. 
	cp 02bh		;11e8	fe 2b 	. + 
	ret z			;11ea	c8 	. 
	cp 024h		;11eb	fe 24 	. $ 
	ret z			;11ed	c8 	. 
	pop bc			;11ee	c1 	. 
	cp 030h		;11ef	fe 30 	. 0 
	jr nz,$+17		;11f1	20 0f 	  . 
	inc hl			;11f3	23 	# 
	rst 10h			;11f4	d7 	. 
	jr nc,$+13		;11f5	30 0b 	0 . 
	dec hl			;11f7	2b 	+ 
	ld bc,0772bh		;11f8	01 2b 77 	. + w 
	pop af			;11fb	f1 	. 
	jr z,$-3		;11fc	28 fb 	( . 
	pop bc			;11fe	c1 	. 
	jp 010ceh		;11ff	c3 ce 10 	. . . 
	pop af			;1202	f1 	. 
	jr z,$-1		;1203	28 fd 	( . 
	pop hl			;1205	e1 	. 
	ld (hl),025h		;1206	36 25 	6 % 
	ret			;1208	c9 	. 
	push hl			;1209	e5 	. 
	rra			;120a	1f 	. 
	jp c,011aah		;120b	da aa 11 	. . . 
	jr z,$+22		;120e	28 14 	( . 
	ld de,01384h		;1210	11 84 13 	. . . 
	call 00a49h		;1213	cd 49 0a 	. I . 
	ld d,010h		;1216	16 10 	. . 
	jp m,01132h		;1218	fa 32 11 	. 2 . 
	pop hl			;121b	e1 	. 
	pop bc			;121c	c1 	. 
	call 00fbdh		;121d	cd bd 0f 	. . . 
	dec hl			;1220	2b 	+ 
	ld (hl),025h		;1221	36 25 	6 % 
	ret			;1223	c9 	. 
	ld bc,0b60eh		;1224	01 0e b6 	. . . 
	ld de,01bcah		;1227	11 ca 1b 	. . . 
	call 00a0ch		;122a	cd 0c 0a 	. . . 
	jp p,0111bh		;122d	f2 1b 11 	. . . 
	ld d,006h		;1230	16 06 	. . 
	call 00955h		;1232	cd 55 09 	. U . 
	call nz,01201h		;1235	c4 01 12 	. . . 
	pop hl			;1238	e1 	. 
	pop bc			;1239	c1 	. 
	jp m,01157h		;123a	fa 57 11 	. W . 
	push bc			;123d	c5 	. 
	ld e,a			;123e	5f 	_ 
	ld a,b			;123f	78 	x 
	sub d			;1240	92 	. 
	sub e			;1241	93 	. 
	call p,01269h		;1242	f4 69 12 	. i . 
	call 0127dh		;1245	cd 7d 12 	. } . 
	call 012a4h		;1248	cd a4 12 	. . . 
	or e			;124b	b3 	. 
	call nz,01277h		;124c	c4 77 12 	. w . 
	or e			;124f	b3 	. 
	call nz,01291h		;1250	c4 91 12 	. . . 
	pop de			;1253	d1 	. 
	jp 010b6h		;1254	c3 b6 10 	. . . 
	ld e,a			;1257	5f 	_ 
	ld a,c			;1258	79 	y 
	or a			;1259	b7 	. 
	call nz,00f16h		;125a	c4 16 0f 	. . . 
	add a,e			;125d	83 	. 
	jp m,01162h		;125e	fa 62 11 	. b . 
	xor a			;1261	af 	. 
	push bc			;1262	c5 	. 
	push af			;1263	f5 	. 
	call m,00f18h		;1264	fc 18 0f 	. . . 
	jp m,01164h		;1267	fa 64 11 	. d . 
	pop bc			;126a	c1 	. 
	ld a,e			;126b	7b 	{ 
	sub b			;126c	90 	. 
	pop bc			;126d	c1 	. 
	ld e,a			;126e	5f 	_ 
	add a,d			;126f	82 	. 
	ld a,b			;1270	78 	x 
	jp m,0117fh		;1271	fa 7f 11 	.  . 
	sub d			;1274	92 	. 
	sub e			;1275	93 	. 
	call p,01269h		;1276	f4 69 12 	. i . 
	push bc			;1279	c5 	. 
	call 0127dh		;127a	cd 7d 12 	. } . 
	jr $+19		;127d	18 11 	. . 
	call 01269h		;127f	cd 69 12 	. i . 
	ld a,c			;1282	79 	y 
	call 01294h		;1283	cd 94 12 	. . . 
	ld c,a			;1286	4f 	O 
	xor a			;1287	af 	. 
	sub d			;1288	92 	. 
	sub e			;1289	93 	. 
	call 01269h		;128a	cd 69 12 	. i . 
	push bc			;128d	c5 	. 
	ld b,a			;128e	47 	G 
	ld c,a			;128f	4f 	O 
	call 012a4h		;1290	cd a4 12 	. . . 
	pop bc			;1293	c1 	. 
	or c			;1294	b1 	. 
	jr nz,$+5		;1295	20 03 	  . 
	ld hl,(040f3h)		;1297	2a f3 40 	* . @ 
	add a,e			;129a	83 	. 
	dec a			;129b	3d 	= 
	call p,01269h		;129c	f4 69 12 	. i . 
	ld d,b			;129f	50 	P 
	jp 010bfh		;12a0	c3 bf 10 	. . . 
	push hl			;12a3	e5 	. 
	push de			;12a4	d5 	. 
	call 00acch		;12a5	cd cc 0a 	. . . 
	pop de			;12a8	d1 	. 
	xor a			;12a9	af 	. 
	jp z,011b0h		;12aa	ca b0 11 	. . . 
	ld e,010h		;12ad	1e 10 	. . 
	ld bc,0061eh		;12af	01 1e 06 	. . . 
	call 00955h		;12b2	cd 55 09 	. U . 
	scf			;12b5	37 	7 
	call nz,01201h		;12b6	c4 01 12 	. . . 
	pop hl			;12b9	e1 	. 
	pop bc			;12ba	c1 	. 
	push af			;12bb	f5 	. 
	ld a,c			;12bc	79 	y 
	or a			;12bd	b7 	. 
	push af			;12be	f5 	. 
	call nz,00f16h		;12bf	c4 16 0f 	. . . 
	add a,b			;12c2	80 	. 
	ld c,a			;12c3	4f 	O 
	ld a,d			;12c4	7a 	z 
	and 004h		;12c5	e6 04 	. . 
	cp 001h		;12c7	fe 01 	. . 
	sbc a,a			;12c9	9f 	. 
	ld d,a			;12ca	57 	W 
	add a,c			;12cb	81 	. 
	ld c,a			;12cc	4f 	O 
	sub e			;12cd	93 	. 
	push af			;12ce	f5 	. 
	push bc			;12cf	c5 	. 
	call m,00f18h		;12d0	fc 18 0f 	. . . 
	jp m,011d0h		;12d3	fa d0 11 	. . . 
	pop bc			;12d6	c1 	. 
	pop af			;12d7	f1 	. 
	push bc			;12d8	c5 	. 
	push af			;12d9	f5 	. 
	jp m,011deh		;12da	fa de 11 	. . . 
	xor a			;12dd	af 	. 
	cpl			;12de	2f 	/ 
	inc a			;12df	3c 	< 
	add a,b			;12e0	80 	. 
	inc a			;12e1	3c 	< 
	add a,d			;12e2	82 	. 
	ld b,a			;12e3	47 	G 
	ld c,000h		;12e4	0e 00 	. . 
	call 012a4h		;12e6	cd a4 12 	. . . 
	pop af			;12e9	f1 	. 
	call p,01271h		;12ea	f4 71 12 	. q . 
	pop bc			;12ed	c1 	. 
	pop af			;12ee	f1 	. 
	call z,0092fh		;12ef	cc 2f 09 	. / . 
	pop af			;12f2	f1 	. 
	jr c,$+5		;12f3	38 03 	8 . 
	add a,e			;12f5	83 	. 
	sub b			;12f6	90 	. 
	sub d			;12f7	92 	. 
	push bc			;12f8	c5 	. 
	call 01074h		;12f9	cd 74 10 	. t . 
	ex de,hl			;12fc	eb 	. 
	pop de			;12fd	d1 	. 
	jp 010bfh		;12fe	c3 bf 10 	. . . 
	push de			;1301	d5 	. 
	xor a			;1302	af 	. 
	push af			;1303	f5 	. 
	rst 20h			;1304	e7 	. 
	jp po,01222h		;1305	e2 22 12 	. " . 
	ld a,(04124h)		;1308	3a 24 41 	: $ A 
	cp 091h		;130b	fe 91 	. . 
	jp nc,01222h		;130d	d2 22 12 	. " . 
	ld de,01364h		;1310	11 64 13 	. d . 
	ld hl,04127h		;1313	21 27 41 	! ' A 
	call 009d3h		;1316	cd d3 09 	. . . 
	call 00da1h		;1319	cd a1 0d 	. . . 
	pop af			;131c	f1 	. 
	sub 00ah		;131d	d6 0a 	. . 
	push af			;131f	f5 	. 
	jr $-24		;1320	18 e6 	. . 
	call 0124fh		;1322	cd 4f 12 	. O . 
	rst 20h			;1325	e7 	. 
	jr nc,$+13		;1326	30 0b 	0 . 
	ld bc,09143h		;1328	01 43 91 	. C . 
	ld de,04ff9h		;132b	11 f9 4f 	. . O 
	call 00a0ch		;132e	cd 0c 0a 	. . . 
	jr $+8		;1331	18 06 	. . 
	ld de,0136ch		;1333	11 6c 13 	. l . 
	call 00a49h		;1336	cd 49 0a 	. I . 
	jp p,0124bh		;1339	f2 4b 12 	. K . 
	pop af			;133c	f1 	. 
	call 00f0bh		;133d	cd 0b 0f 	. . . 
	push af			;1340	f5 	. 
	jr $-28		;1341	18 e2 	. . 
	pop af			;1343	f1 	. 
	call 00f18h		;1344	cd 18 0f 	. . . 
	push af			;1347	f5 	. 
	call 0124fh		;1348	cd 4f 12 	. O . 
	pop af			;134b	f1 	. 
	or a			;134c	b7 	. 
	pop de			;134d	d1 	. 
	ret			;134e	c9 	. 
	rst 20h			;134f	e7 	. 
	jp pe,0125eh		;1350	ea 5e 12 	. ^ . 
	ld bc,09474h		;1353	01 74 94 	. t . 
	ld de,023f8h		;1356	11 f8 23 	. . # 
	call 00a0ch		;1359	cd 0c 0a 	. . . 
	jr $+8		;135c	18 06 	. . 
	ld de,01374h		;135e	11 74 13 	. t . 
	call 00a49h		;1361	cd 49 0a 	. I . 
	pop hl			;1364	e1 	. 
	jp p,01243h		;1365	f2 43 12 	. C . 
	jp (hl)			;1368	e9 	. 
	or a			;1369	b7 	. 
	ret z			;136a	c8 	. 
	dec a			;136b	3d 	= 
	ld (hl),030h		;136c	36 30 	6 0 
	inc hl			;136e	23 	# 
	jr $-5		;136f	18 f9 	. . 
	jr nz,$+6		;1371	20 04 	  . 
	ret z			;1373	c8 	. 
	call 01291h		;1374	cd 91 12 	. . . 
	ld (hl),030h		;1377	36 30 	6 0 
	inc hl			;1379	23 	# 
	dec a			;137a	3d 	= 
	jr $-8		;137b	18 f6 	. . 
	ld a,e			;137d	7b 	{ 
	add a,d			;137e	82 	. 
	inc a			;137f	3c 	< 
	ld b,a			;1380	47 	G 
	inc a			;1381	3c 	< 
	sub 003h		;1382	d6 03 	. . 
	jr nc,$-2		;1384	30 fc 	0 . 
	add a,005h		;1386	c6 05 	. . 
	ld c,a			;1388	4f 	O 
	ld a,(040d8h)		;1389	3a d8 40 	: . @ 
	and 040h		;138c	e6 40 	. @ 
	ret nz			;138e	c0 	. 
	ld c,a			;138f	4f 	O 
	ret			;1390	c9 	. 
	dec b			;1391	05 	. 
	jr nz,$+10		;1392	20 08 	  . 
	ld (hl),02eh		;1394	36 2e 	6 . 
	ld (040f3h),hl		;1396	22 f3 40 	" . @ 
	inc hl			;1399	23 	# 
	ld c,b			;139a	48 	H 
	ret			;139b	c9 	. 
	dec c			;139c	0d 	. 
	ret nz			;139d	c0 	. 
	ld (hl),02ch		;139e	36 2c 	6 , 
	inc hl			;13a0	23 	# 
	ld c,003h		;13a1	0e 03 	. . 
	ret			;13a3	c9 	. 
	push de			;13a4	d5 	. 
	rst 20h			;13a5	e7 	. 
	jp po,012eah		;13a6	e2 ea 12 	. . . 
	push bc			;13a9	c5 	. 
	push hl			;13aa	e5 	. 
	call 009fch		;13ab	cd fc 09 	. . . 
	ld hl,0137ch		;13ae	21 7c 13 	! | . 
	call 009f7h		;13b1	cd f7 09 	. . . 
	call 00c77h		;13b4	cd 77 0c 	. w . 
	xor a			;13b7	af 	. 
	call 00b7bh		;13b8	cd 7b 0b 	. { . 
	pop hl			;13bb	e1 	. 
	pop bc			;13bc	c1 	. 
	ld de,0138ch		;13bd	11 8c 13 	. . . 
	ld a,00ah		;13c0	3e 0a 	> . 
	call 01291h		;13c2	cd 91 12 	. . . 
	push bc			;13c5	c5 	. 
	push af			;13c6	f5 	. 
	push hl			;13c7	e5 	. 
	push de			;13c8	d5 	. 
	ld b,02fh		;13c9	06 2f 	. / 
	inc b			;13cb	04 	. 
	pop hl			;13cc	e1 	. 
	push hl			;13cd	e5 	. 
	call 00d48h		;13ce	cd 48 0d 	. H . 
	jr nc,$-6		;13d1	30 f8 	0 . 
	pop hl			;13d3	e1 	. 
	call 00d36h		;13d4	cd 36 0d 	. 6 . 
	ex de,hl			;13d7	eb 	. 
	pop hl			;13d8	e1 	. 
	ld (hl),b			;13d9	70 	p 
	inc hl			;13da	23 	# 
	pop af			;13db	f1 	. 
	pop bc			;13dc	c1 	. 
	dec a			;13dd	3d 	= 
	jr nz,$-28		;13de	20 e2 	  . 
	push bc			;13e0	c5 	. 
	push hl			;13e1	e5 	. 
	ld hl,0411dh		;13e2	21 1d 41 	! . A 
	call 009b1h		;13e5	cd b1 09 	. . . 
	jr $+14		;13e8	18 0c 	. . 
	push bc			;13ea	c5 	. 
	push hl			;13eb	e5 	. 
	call 00708h		;13ec	cd 08 07 	. . . 
	inc a			;13ef	3c 	< 
	call 00afbh		;13f0	cd fb 0a 	. . . 
	call 009b4h		;13f3	cd b4 09 	. . . 
	pop hl			;13f6	e1 	. 
	pop bc			;13f7	c1 	. 
	xor a			;13f8	af 	. 
	ld de,013d2h		;13f9	11 d2 13 	. . . 
	ccf			;13fc	3f 	? 
	call 01291h		;13fd	cd 91 12 	. . . 
	push bc			;1400	c5 	. 
	push af			;1401	f5 	. 
	push hl			;1402	e5 	. 
	push de			;1403	d5 	. 
	call 009bfh		;1404	cd bf 09 	. . . 
	pop hl			;1407	e1 	. 
	ld b,02fh		;1408	06 2f 	. / 
	inc b			;140a	04 	. 
	ld a,e			;140b	7b 	{ 
	sub (hl)			;140c	96 	. 
	ld e,a			;140d	5f 	_ 
	inc hl			;140e	23 	# 
	ld a,d			;140f	7a 	z 
	sbc a,(hl)			;1410	9e 	. 
	ld d,a			;1411	57 	W 
	inc hl			;1412	23 	# 
	ld a,c			;1413	79 	y 
	sbc a,(hl)			;1414	9e 	. 
	ld c,a			;1415	4f 	O 
	dec hl			;1416	2b 	+ 
	dec hl			;1417	2b 	+ 
	jr nc,$-14		;1418	30 f0 	0 . 
	call 007b7h		;141a	cd b7 07 	. . . 
	inc hl			;141d	23 	# 
	call 009b4h		;141e	cd b4 09 	. . . 
	ex de,hl			;1421	eb 	. 
	pop hl			;1422	e1 	. 
	ld (hl),b			;1423	70 	p 
	inc hl			;1424	23 	# 
	pop af			;1425	f1 	. 
	pop bc			;1426	c1 	. 
	jr c,$-43		;1427	38 d3 	8 . 
	inc de			;1429	13 	. 
	inc de			;142a	13 	. 
	ld a,004h		;142b	3e 04 	> . 
	jr $+8		;142d	18 06 	. . 
	push de			;142f	d5 	. 
	ld de,013d8h		;1430	11 d8 13 	. . . 
	ld a,005h		;1433	3e 05 	> . 
	call 01291h		;1435	cd 91 12 	. . . 
	push bc			;1438	c5 	. 
	push af			;1439	f5 	. 
	push hl			;143a	e5 	. 
	ex de,hl			;143b	eb 	. 
	ld c,(hl)			;143c	4e 	N 
	inc hl			;143d	23 	# 
	ld b,(hl)			;143e	46 	F 
	push bc			;143f	c5 	. 
	inc hl			;1440	23 	# 
	ex (sp),hl			;1441	e3 	. 
	ex de,hl			;1442	eb 	. 
	ld hl,(04121h)		;1443	2a 21 41 	* ! A 
	ld b,02fh		;1446	06 2f 	. / 
	inc b			;1448	04 	. 
	ld a,l			;1449	7d 	} 
	sub e			;144a	93 	. 
	ld l,a			;144b	6f 	o 
	ld a,h			;144c	7c 	| 
	sbc a,d			;144d	9a 	. 
	ld h,a			;144e	67 	g 
	jr nc,$-7		;144f	30 f7 	0 . 
	add hl,de			;1451	19 	. 
	ld (04121h),hl		;1452	22 21 41 	" ! A 
	pop de			;1455	d1 	. 
	pop hl			;1456	e1 	. 
	ld (hl),b			;1457	70 	p 
	inc hl			;1458	23 	# 
	pop af			;1459	f1 	. 
	pop bc			;145a	c1 	. 
	dec a			;145b	3d 	= 
	jr nz,$-39		;145c	20 d7 	  . 
	call 01291h		;145e	cd 91 12 	. . . 
	ld (hl),a			;1461	77 	w 
	pop de			;1462	d1 	. 
	ret			;1463	c9 	. 
	nop			;1464	00 	. 
	nop			;1465	00 	. 
	nop			;1466	00 	. 
	nop			;1467	00 	. 
	ld sp,hl			;1468	f9 	. 
	ld (bc),a			;1469	02 	. 
	dec d			;146a	15 	. 
	and d			;146b	a2 	. 
	defb 0fdh,0ffh,09fh	;illegal sequence		;146c	fd ff 9f 	. . . 
	ld sp,05fa9h		;146f	31 a9 5f 	1 . _ 
	ld h,e			;1472	63 	c 
	or d			;1473	b2 	. 
	cp 0ffh		;1474	fe ff 	. . 
	inc bc			;1476	03 	. 
	cp a			;1477	bf 	. 
	ret			;1478	c9 	. 
	dec de			;1479	1b 	. 
	ld c,0b6h		;147a	0e b6 	. . 
	nop			;147c	00 	. 
	nop			;147d	00 	. 
	nop			;147e	00 	. 
	nop			;147f	00 	. 
	nop			;1480	00 	. 
	nop			;1481	00 	. 
	nop			;1482	00 	. 
	add a,b			;1483	80 	. 
	nop			;1484	00 	. 
	nop			;1485	00 	. 
	inc b			;1486	04 	. 
	cp a			;1487	bf 	. 
	ret			;1488	c9 	. 
	dec de			;1489	1b 	. 
	ld c,0b6h		;148a	0e b6 	. . 
	nop			;148c	00 	. 
	add a,b			;148d	80 	. 
	add a,0a4h		;148e	c6 a4 	. . 
	ld a,(hl)			;1490	7e 	~ 
	adc a,l			;1491	8d 	. 
	inc bc			;1492	03 	. 
	nop			;1493	00 	. 
	ld b,b			;1494	40 	@ 
	ld a,d			;1495	7a 	z 
	djnz $-11		;1496	10 f3 	. . 
	ld e,d			;1498	5a 	Z 
	nop			;1499	00 	. 
	nop			;149a	00 	. 
	and b			;149b	a0 	. 
	ld (hl),d			;149c	72 	r 
	ld c,(hl)			;149d	4e 	N 
	jr $+11		;149e	18 09 	. . 
	nop			;14a0	00 	. 
	nop			;14a1	00 	. 
	djnz $-89		;14a2	10 a5 	. . 
	call nc,000e8h		;14a4	d4 e8 00 	. . . 
	nop			;14a7	00 	. 
	nop			;14a8	00 	. 
	ret pe			;14a9	e8 	. 
	halt			;14aa	76 	v 
	ld c,b			;14ab	48 	H 
	rla			;14ac	17 	. 
	nop			;14ad	00 	. 
	nop			;14ae	00 	. 
	nop			;14af	00 	. 
	call po,0540bh		;14b0	e4 0b 54 	. . T 
	ld (bc),a			;14b3	02 	. 
	nop			;14b4	00 	. 
	nop			;14b5	00 	. 
	nop			;14b6	00 	. 
	jp z,03b9ah		;14b7	ca 9a 3b 	. . ; 
	nop			;14ba	00 	. 
	nop			;14bb	00 	. 
	nop			;14bc	00 	. 
	nop			;14bd	00 	. 
	pop hl			;14be	e1 	. 
	push af			;14bf	f5 	. 
	dec b			;14c0	05 	. 
	nop			;14c1	00 	. 
	nop			;14c2	00 	. 
	nop			;14c3	00 	. 
	add a,b			;14c4	80 	. 
	sub (hl)			;14c5	96 	. 
	sbc a,b			;14c6	98 	. 
	nop			;14c7	00 	. 
	nop			;14c8	00 	. 
	nop			;14c9	00 	. 
	nop			;14ca	00 	. 
	ld b,b			;14cb	40 	@ 
	ld b,d			;14cc	42 	B 
	rrca			;14cd	0f 	. 
	nop			;14ce	00 	. 
	nop			;14cf	00 	. 
	nop			;14d0	00 	. 
	nop			;14d1	00 	. 
	and b			;14d2	a0 	. 
	add a,(hl)			;14d3	86 	. 
	ld bc,02710h		;14d4	01 10 27 	. . ' 
	nop			;14d7	00 	. 
	djnz $+41		;14d8	10 27 	. ' 
	ret pe			;14da	e8 	. 
	inc bc			;14db	03 	. 
	ld h,h			;14dc	64 	d 
	nop			;14dd	00 	. 
	ld a,(bc)			;14de	0a 	. 
	nop			;14df	00 	. 
	ld bc,02100h		;14e0	01 00 21 	. . ! 
	add a,d			;14e3	82 	. 
	add hl,bc			;14e4	09 	. 
	ex (sp),hl			;14e5	e3 	. 
	jp (hl)			;14e6	e9 	. 
	call 009a4h		;14e7	cd a4 09 	. . . 
	ld hl,01380h		;14ea	21 80 13 	! . . 
	call 009b1h		;14ed	cd b1 09 	. . . 
	jr $+5		;14f0	18 03 	. . 
	call 00ab1h		;14f2	cd b1 0a 	. . . 
	pop bc			;14f5	c1 	. 
	pop de			;14f6	d1 	. 
	call 00955h		;14f7	cd 55 09 	. U . 
	ld a,b			;14fa	78 	x 
	jr z,$+62		;14fb	28 3c 	( < 
	jp p,01404h		;14fd	f2 04 14 	. . . 
	or a			;1500	b7 	. 
	jp z,0199ah		;1501	ca 9a 19 	. . . 
	or a			;1504	b7 	. 
	jp z,00779h		;1505	ca 79 07 	. y . 
	push de			;1508	d5 	. 
	push bc			;1509	c5 	. 
	ld a,c			;150a	79 	y 
	or 07fh		;150b	f6 7f 	.  
	call 009bfh		;150d	cd bf 09 	. . . 
	jp p,01421h		;1510	f2 21 14 	. ! . 
	push de			;1513	d5 	. 
	push bc			;1514	c5 	. 
	call 00b40h		;1515	cd 40 0b 	. @ . 
	pop bc			;1518	c1 	. 
	pop de			;1519	d1 	. 
	push af			;151a	f5 	. 
	call 00a0ch		;151b	cd 0c 0a 	. . . 
	pop hl			;151e	e1 	. 
	ld a,h			;151f	7c 	| 
	rra			;1520	1f 	. 
	pop hl			;1521	e1 	. 
	ld (04123h),hl		;1522	22 23 41 	" # A 
	pop hl			;1525	e1 	. 
	ld (04121h),hl		;1526	22 21 41 	" ! A 
	call c,013e2h		;1529	dc e2 13 	. . . 
	call z,00982h		;152c	cc 82 09 	. . . 
	push de			;152f	d5 	. 
	push bc			;1530	c5 	. 
	call 00809h		;1531	cd 09 08 	. . . 
	pop bc			;1534	c1 	. 
	pop de			;1535	d1 	. 
	call 00847h		;1536	cd 47 08 	. G . 
	call 009a4h		;1539	cd a4 09 	. . . 
	ld bc,08138h		;153c	01 38 81 	. 8 . 
	ld de,0aa3bh		;153f	11 3b aa 	. ; . 
	call 00847h		;1542	cd 47 08 	. G . 
	ld a,(04124h)		;1545	3a 24 41 	: $ A 
	cp 088h		;1548	fe 88 	. . 
	jp nc,00931h		;154a	d2 31 09 	. 1 . 
	call 00b40h		;154d	cd 40 0b 	. @ . 
	add a,080h		;1550	c6 80 	. . 
	add a,002h		;1552	c6 02 	. . 
	jp c,00931h		;1554	da 31 09 	. 1 . 
	push af			;1557	f5 	. 
	ld hl,007f8h		;1558	21 f8 07 	! . . 
	call 0070bh		;155b	cd 0b 07 	. . . 
	call 00841h		;155e	cd 41 08 	. A . 
	pop af			;1561	f1 	. 
	pop bc			;1562	c1 	. 
	pop de			;1563	d1 	. 
	push af			;1564	f5 	. 
	call 00713h		;1565	cd 13 07 	. . . 
	call 00982h		;1568	cd 82 09 	. . . 
	ld hl,01479h		;156b	21 79 14 	! y . 
	call 014a9h		;156e	cd a9 14 	. . . 
	ld de,00000h		;1571	11 00 00 	. . . 
	pop bc			;1574	c1 	. 
	ld c,d			;1575	4a 	J 
	jp 00847h		;1576	c3 47 08 	. G . 
	ex af,af'			;1579	08 	. 
	ld b,b			;157a	40 	@ 
	ld l,094h		;157b	2e 94 	. . 
	ld (hl),h			;157d	74 	t 
	ld (hl),b			;157e	70 	p 
	ld c,a			;157f	4f 	O 
	ld l,077h		;1580	2e 77 	. w 
	ld l,(hl)			;1582	6e 	n 
	ld (bc),a			;1583	02 	. 
	adc a,b			;1584	88 	. 
	ld a,d			;1585	7a 	z 
	and 0a0h		;1586	e6 a0 	. . 
	ld hl,(0507ch)		;1588	2a 7c 50 	* | P 
	xor d			;158b	aa 	. 
	xor d			;158c	aa 	. 
	ld a,(hl)			;158d	7e 	~ 
	rst 38h			;158e	ff 	. 
	rst 38h			;158f	ff 	. 
	ld a,a			;1590	7f 	 
	ld a,a			;1591	7f 	 
	nop			;1592	00 	. 
	nop			;1593	00 	. 
	add a,b			;1594	80 	. 
	add a,c			;1595	81 	. 
	nop			;1596	00 	. 
	nop			;1597	00 	. 
	nop			;1598	00 	. 
	add a,c			;1599	81 	. 
	call 009a4h		;159a	cd a4 09 	. . . 
	ld de,00c32h		;159d	11 32 0c 	. 2 . 
	push de			;15a0	d5 	. 
	push hl			;15a1	e5 	. 
	call 009bfh		;15a2	cd bf 09 	. . . 
	call 00847h		;15a5	cd 47 08 	. G . 
	pop hl			;15a8	e1 	. 
	call 009a4h		;15a9	cd a4 09 	. . . 
	ld a,(hl)			;15ac	7e 	~ 
	inc hl			;15ad	23 	# 
	call 009b1h		;15ae	cd b1 09 	. . . 
	ld b,0f1h		;15b1	06 f1 	. . 
	pop bc			;15b3	c1 	. 
	pop de			;15b4	d1 	. 
	dec a			;15b5	3d 	= 
	ret z			;15b6	c8 	. 
	push de			;15b7	d5 	. 
	push bc			;15b8	c5 	. 
	push af			;15b9	f5 	. 
	push hl			;15ba	e5 	. 
	call 00847h		;15bb	cd 47 08 	. G . 
	pop hl			;15be	e1 	. 
	call 009c2h		;15bf	cd c2 09 	. . . 
	push hl			;15c2	e5 	. 
	call 00716h		;15c3	cd 16 07 	. . . 
	pop hl			;15c6	e1 	. 
	jr $-21		;15c7	18 e9 	. . 
	call 00a7fh		;15c9	cd 7f 0a 	.  . 
	ld a,h			;15cc	7c 	| 
	or a			;15cd	b7 	. 
	jp m,01e4ah		;15ce	fa 4a 1e 	. J . 
	or l			;15d1	b5 	. 
	jp z,014f0h		;15d2	ca f0 14 	. . . 
	push hl			;15d5	e5 	. 
	call 014f0h		;15d6	cd f0 14 	. . . 
	call 009bfh		;15d9	cd bf 09 	. . . 
	ex de,hl			;15dc	eb 	. 
	ex (sp),hl			;15dd	e3 	. 
	push bc			;15de	c5 	. 
	call 00acfh		;15df	cd cf 0a 	. . . 
	pop bc			;15e2	c1 	. 
	pop de			;15e3	d1 	. 
	call 00847h		;15e4	cd 47 08 	. G . 
	ld hl,007f8h		;15e7	21 f8 07 	! . . 
	call 0070bh		;15ea	cd 0b 07 	. . . 
	jp 00b40h		;15ed	c3 40 0b 	. @ . 
	ld hl,04090h		;15f0	21 90 40 	! . @ 
	push hl			;15f3	e5 	. 
	ld de,00000h		;15f4	11 00 00 	. . . 
	ld c,e			;15f7	4b 	K 
	ld h,003h		;15f8	26 03 	& . 
	ld l,008h		;15fa	2e 08 	. . 
	ex de,hl			;15fc	eb 	. 
	add hl,hl			;15fd	29 	) 
	ex de,hl			;15fe	eb 	. 
	ld a,c			;15ff	79 	y 
	rla			;1600	17 	. 
	ld c,a			;1601	4f 	O 
	ex (sp),hl			;1602	e3 	. 
	ld a,(hl)			;1603	7e 	~ 
	rlca			;1604	07 	. 
	ld (hl),a			;1605	77 	w 
	ex (sp),hl			;1606	e3 	. 
	jp nc,01516h		;1607	d2 16 15 	. . . 
	push hl			;160a	e5 	. 
	ld hl,(040aah)		;160b	2a aa 40 	* . @ 
	add hl,de			;160e	19 	. 
	ex de,hl			;160f	eb 	. 
	ld a,(040ach)		;1610	3a ac 40 	: . @ 
	adc a,c			;1613	89 	. 
	ld c,a			;1614	4f 	O 
	pop hl			;1615	e1 	. 
	dec l			;1616	2d 	- 
	jp nz,014fch		;1617	c2 fc 14 	. . . 
	ex (sp),hl			;161a	e3 	. 
	inc hl			;161b	23 	# 
	ex (sp),hl			;161c	e3 	. 
	dec h			;161d	25 	% 
	jp nz,014fah		;161e	c2 fa 14 	. . . 
	pop hl			;1621	e1 	. 
	ld hl,0b065h		;1622	21 65 b0 	! e . 
	add hl,de			;1625	19 	. 
	ld (040aah),hl		;1626	22 aa 40 	" . @ 
	call 00aefh		;1629	cd ef 0a 	. . . 
	ld a,005h		;162c	3e 05 	> . 
	adc a,c			;162e	89 	. 
	ld (040ach),a		;162f	32 ac 40 	2 . @ 
	ex de,hl			;1632	eb 	. 
	ld b,080h		;1633	06 80 	. . 
	ld hl,04125h		;1635	21 25 41 	! % A 
	ld (hl),b			;1638	70 	p 
	dec hl			;1639	2b 	+ 
	ld (hl),b			;163a	70 	p 
	ld c,a			;163b	4f 	O 
	ld b,000h		;163c	06 00 	. . 
	jp 00765h		;163e	c3 65 07 	. e . 
	ld hl,0158bh		;1641	21 8b 15 	! . . 
	call 0070bh		;1644	cd 0b 07 	. . . 
	call 009a4h		;1647	cd a4 09 	. . . 
	ld bc,08349h		;164a	01 49 83 	. I . 
	ld de,00fdbh		;164d	11 db 0f 	. . . 
	call 009b4h		;1650	cd b4 09 	. . . 
	pop bc			;1653	c1 	. 
	pop de			;1654	d1 	. 
	call 008a2h		;1655	cd a2 08 	. . . 
	call 009a4h		;1658	cd a4 09 	. . . 
	call 00b40h		;165b	cd 40 0b 	. @ . 
	pop bc			;165e	c1 	. 
	pop de			;165f	d1 	. 
	call 00713h		;1660	cd 13 07 	. . . 
	ld hl,0158fh		;1663	21 8f 15 	! . . 
	call 00710h		;1666	cd 10 07 	. . . 
	call 00955h		;1669	cd 55 09 	. U . 
	scf			;166c	37 	7 
	jp p,01577h		;166d	f2 77 15 	. w . 
	call 00708h		;1670	cd 08 07 	. . . 
	call 00955h		;1673	cd 55 09 	. U . 
	or a			;1676	b7 	. 
	push af			;1677	f5 	. 
	call p,00982h		;1678	f4 82 09 	. . . 
	ld hl,0158fh		;167b	21 8f 15 	! . . 
	call 0070bh		;167e	cd 0b 07 	. . . 
	pop af			;1681	f1 	. 
	call nc,00982h		;1682	d4 82 09 	. . . 
	ld hl,01593h		;1685	21 93 15 	! . . 
	jp 0149ah		;1688	c3 9a 14 	. . . 
	in a,(00fh)		;168b	db 0f 	. . 
	ld c,c			;168d	49 	I 
	add a,c			;168e	81 	. 
	nop			;168f	00 	. 
	nop			;1690	00 	. 
	nop			;1691	00 	. 
	ld a,a			;1692	7f 	 
	dec b			;1693	05 	. 
	cp d			;1694	ba 	. 
	rst 10h			;1695	d7 	. 
	ld e,086h		;1696	1e 86 	. . 
	ld h,h			;1698	64 	d 
	ld h,099h		;1699	26 99 	& . 
	add a,a			;169b	87 	. 
	ld e,b			;169c	58 	X 
	inc (hl)			;169d	34 	4 
	inc hl			;169e	23 	# 
	add a,a			;169f	87 	. 
	ret po			;16a0	e0 	. 
	ld e,l			;16a1	5d 	] 
	and l			;16a2	a5 	. 
	add a,(hl)			;16a3	86 	. 
	jp c,0490fh		;16a4	da 0f 49 	. . I 
	add a,e			;16a7	83 	. 
	call 009a4h		;16a8	cd a4 09 	. . . 
	call 01547h		;16ab	cd 47 15 	. G . 
	pop bc			;16ae	c1 	. 
	pop hl			;16af	e1 	. 
	call 009a4h		;16b0	cd a4 09 	. . . 
	ex de,hl			;16b3	eb 	. 
	call 009b4h		;16b4	cd b4 09 	. . . 
	call 01541h		;16b7	cd 41 15 	. A . 
	jp 008a0h		;16ba	c3 a0 08 	. . . 
	call 00955h		;16bd	cd 55 09 	. U . 
	call m,013e2h		;16c0	fc e2 13 	. . . 
	call m,00982h		;16c3	fc 82 09 	. . . 
	ld a,(04124h)		;16c6	3a 24 41 	: $ A 
	cp 081h		;16c9	fe 81 	. . 
	jr c,$+14		;16cb	38 0c 	8 . 
	ld bc,08100h		;16cd	01 00 81 	. . . 
	ld d,c			;16d0	51 	Q 
	ld e,c			;16d1	59 	Y 
	call 008a2h		;16d2	cd a2 08 	. . . 
	ld hl,00710h		;16d5	21 10 07 	! . . 
	push hl			;16d8	e5 	. 
	ld hl,015e3h		;16d9	21 e3 15 	! . . 
	call 0149ah		;16dc	cd 9a 14 	. . . 
	ld hl,0158bh		;16df	21 8b 15 	! . . 
	ret			;16e2	c9 	. 
	add hl,bc			;16e3	09 	. 
	ld c,d			;16e4	4a 	J 
	rst 10h			;16e5	d7 	. 
	dec sp			;16e6	3b 	; 
	ld a,b			;16e7	78 	x 
	ld (bc),a			;16e8	02 	. 
	ld l,(hl)			;16e9	6e 	n 
	add a,h			;16ea	84 	. 
	ld a,e			;16eb	7b 	{ 
	cp 0c1h		;16ec	fe c1 	. . 
	cpl			;16ee	2f 	/ 
	ld a,h			;16ef	7c 	| 
	ld (hl),h			;16f0	74 	t 
	ld sp,07d9ah		;16f1	31 9a 7d 	1 . } 
	add a,h			;16f4	84 	. 
	dec a			;16f5	3d 	= 
	ld e,d			;16f6	5a 	Z 
	ld a,l			;16f7	7d 	} 
	ret z			;16f8	c8 	. 
	ld a,a			;16f9	7f 	 
	sub c			;16fa	91 	. 
	ld a,(hl)			;16fb	7e 	~ 
	call po,04cbbh		;16fc	e4 bb 4c 	. . L 
	ld a,(hl)			;16ff	7e 	~ 
	ld l,h			;1700	6c 	l 
	xor d			;1701	aa 	. 
	xor d			;1702	aa 	. 
	ld a,a			;1703	7f 	 
	nop			;1704	00 	. 
	nop			;1705	00 	. 
	nop			;1706	00 	. 
	add a,c			;1707	81 	. 
	adc a,d			;1708	8a 	. 
	add hl,bc			;1709	09 	. 
	scf			;170a	37 	7 
	dec bc			;170b	0b 	. 
	ld (hl),a			;170c	77 	w 
	add hl,bc			;170d	09 	. 
	call nc,0ef27h		;170e	d4 27 ef 	. ' . 
	ld hl,(027f5h)		;1711	2a f5 27 	* . ' 
	rst 20h			;1714	e7 	. 
	inc de			;1715	13 	. 
	ret			;1716	c9 	. 
	inc d			;1717	14 	. 
	add hl,bc			;1718	09 	. 
	ex af,af'			;1719	08 	. 
	add hl,sp			;171a	39 	9 
	inc d			;171b	14 	. 
	ld b,c			;171c	41 	A 
	dec d			;171d	15 	. 
	ld b,a			;171e	47 	G 
	dec d			;171f	15 	. 
	xor b			;1720	a8 	. 
	dec d			;1721	15 	. 
	cp l			;1722	bd 	. 
	dec d			;1723	15 	. 
	xor d			;1724	aa 	. 
	inc l			;1725	2c 	, 
	ld d,d			;1726	52 	R 
	ld b,c			;1727	41 	A 
	ld e,b			;1728	58 	X 
	ld b,c			;1729	41 	A 
	ld e,(hl)			;172a	5e 	^ 
	ld b,c			;172b	41 	A 
	ld h,c			;172c	61 	a 
	ld b,c			;172d	41 	A 
	ld h,h			;172e	64 	d 
	ld b,c			;172f	41 	A 
	ld h,a			;1730	67 	g 
	ld b,c			;1731	41 	A 
	ld l,d			;1732	6a 	j 
	ld b,c			;1733	41 	A 
	ld l,l			;1734	6d 	m 
	ld b,c			;1735	41 	A 
	ld (hl),b			;1736	70 	p 
	ld b,c			;1737	41 	A 
	ld a,a			;1738	7f 	 
	ld a,(bc)			;1739	0a 	. 
	or c			;173a	b1 	. 
	ld a,(bc)			;173b	0a 	. 
	in a,(00ah)		;173c	db 0a 	. . 
	ld h,00bh		;173e	26 0b 	& . 
	inc bc			;1740	03 	. 
	ld hl,(02836h)		;1741	2a 36 28 	* 6 ( 
	push bc			;1744	c5 	. 
	ld hl,(02a0fh)		;1745	2a 0f 2a 	* . * 
	rra			;1748	1f 	. 
	ld hl,(02a61h)		;1749	2a 61 2a 	* a * 
	sub c			;174c	91 	. 
	ld hl,(02a9ah)		;174d	2a 9a 2a 	* . * 
	push bc			;1750	c5 	. 
	ld c,(hl)			;1751	4e 	N 
	ld b,h			;1752	44 	D 
	add a,04fh		;1753	c6 4f 	. O 
	ld d,d			;1755	52 	R 
	jp nc,05345h		;1756	d2 45 53 	. E S 
	ld b,l			;1759	45 	E 
	ld d,h			;175a	54 	T 
	out (045h),a		;175b	d3 45 	. E 
	ld d,h			;175d	54 	T 
	jp 0534ch		;175e	c3 4c 53 	. L S 
	jp 0444dh		;1761	c3 4d 44 	. M D 
	jp nc,04e41h		;1764	d2 41 4e 	. A N 
	ld b,h			;1767	44 	D 
	ld c,a			;1768	4f 	O 
	ld c,l			;1769	4d 	M 
	adc a,045h		;176a	ce 45 	. E 
	ld e,b			;176c	58 	X 
	ld d,h			;176d	54 	T 
	call nz,05441h		;176e	c4 41 54 	. A T 
	ld b,c			;1771	41 	A 
	ret			;1772	c9 	. 
	ld c,(hl)			;1773	4e 	N 
	ld d,b			;1774	50 	P 
	ld d,l			;1775	55 	U 
	ld d,h			;1776	54 	T 
	call nz,04d49h		;1777	c4 49 4d 	. I M 
	jp nc,04145h		;177a	d2 45 41 	. E A 
	ld b,h			;177d	44 	D 
	call z,05445h		;177e	cc 45 54 	. E T 
	rst 0			;1781	c7 	. 
	ld c,a			;1782	4f 	O 
	ld d,h			;1783	54 	T 
	ld c,a			;1784	4f 	O 
	jp nc,04e55h		;1785	d2 55 4e 	. U N 
	ret			;1788	c9 	. 
	ld b,(hl)			;1789	46 	F 
	jp nc,05345h		;178a	d2 45 53 	. E S 
	ld d,h			;178d	54 	T 
	ld c,a			;178e	4f 	O 
	ld d,d			;178f	52 	R 
	ld b,l			;1790	45 	E 
	rst 0			;1791	c7 	. 
	ld c,a			;1792	4f 	O 
	ld d,e			;1793	53 	S 
	ld d,l			;1794	55 	U 
	ld b,d			;1795	42 	B 
	jp nc,05445h		;1796	d2 45 54 	. E T 
	ld d,l			;1799	55 	U 
	ld d,d			;179a	52 	R 
	ld c,(hl)			;179b	4e 	N 
	jp nc,04d45h		;179c	d2 45 4d 	. E M 
	out (054h),a		;179f	d3 54 	. T 
	ld c,a			;17a1	4f 	O 
	ld d,b			;17a2	50 	P 
	push bc			;17a3	c5 	. 
	ld c,h			;17a4	4c 	L 
	ld d,e			;17a5	53 	S 
	ld b,l			;17a6	45 	E 
	call nc,04f52h		;17a7	d4 52 4f 	. R O 
	ld c,(hl)			;17aa	4e 	N 
	call nc,04f52h		;17ab	d4 52 4f 	. R O 
	ld b,(hl)			;17ae	46 	F 
	ld b,(hl)			;17af	46 	F 
	call nz,04645h		;17b0	c4 45 46 	. E F 
	ld d,e			;17b3	53 	S 
	ld d,h			;17b4	54 	T 
	ld d,d			;17b5	52 	R 
	call nz,04645h		;17b6	c4 45 46 	. E F 
	ld c,c			;17b9	49 	I 
	ld c,(hl)			;17ba	4e 	N 
	ld d,h			;17bb	54 	T 
	call nz,04645h		;17bc	c4 45 46 	. E F 
	ld d,e			;17bf	53 	S 
	ld c,(hl)			;17c0	4e 	N 
	ld b,a			;17c1	47 	G 
	call nz,04645h		;17c2	c4 45 46 	. E F 
	ld b,h			;17c5	44 	D 
	ld b,d			;17c6	42 	B 
	ld c,h			;17c7	4c 	L 
	call z,04e49h		;17c8	cc 49 4e 	. I N 
	ld b,l			;17cb	45 	E 
	push bc			;17cc	c5 	. 
	ld b,h			;17cd	44 	D 
	ld c,c			;17ce	49 	I 
	ld d,h			;17cf	54 	T 
	push bc			;17d0	c5 	. 
	ld d,d			;17d1	52 	R 
	ld d,d			;17d2	52 	R 
	ld c,a			;17d3	4f 	O 
	ld d,d			;17d4	52 	R 
	jp nc,05345h		;17d5	d2 45 53 	. E S 
	ld d,l			;17d8	55 	U 
	ld c,l			;17d9	4d 	M 
	ld b,l			;17da	45 	E 
	rst 8			;17db	cf 	. 
	ld d,l			;17dc	55 	U 
	ld d,h			;17dd	54 	T 
	rst 8			;17de	cf 	. 
	ld c,(hl)			;17df	4e 	N 
	rst 8			;17e0	cf 	. 
	ld d,b			;17e1	50 	P 
	ld b,l			;17e2	45 	E 
	ld c,(hl)			;17e3	4e 	N 
	add a,049h		;17e4	c6 49 	. I 
	ld b,l			;17e6	45 	E 
	ld c,h			;17e7	4c 	L 
	ld b,h			;17e8	44 	D 
	rst 0			;17e9	c7 	. 
	ld b,l			;17ea	45 	E 
	ld d,h			;17eb	54 	T 
	ret nc			;17ec	d0 	. 
	ld d,l			;17ed	55 	U 
	ld d,h			;17ee	54 	T 
	jp 04f4ch		;17ef	c3 4c 4f 	. L O 
	ld d,e			;17f2	53 	S 
	ld b,l			;17f3	45 	E 
	call z,0414fh		;17f4	cc 4f 41 	. O A 
	ld b,h			;17f7	44 	D 
	call 05245h		;17f8	cd 45 52 	. E R 
	ld b,a			;17fb	47 	G 
	ld b,l			;17fc	45 	E 
	adc a,041h		;17fd	ce 41 	. A 
	ld c,l			;17ff	4d 	M 
	ld b,l			;1800	45 	E 
	bit 1,c		;1801	cb 49 	. I 
	ld c,h			;1803	4c 	L 
	ld c,h			;1804	4c 	L 
	call z,04553h		;1805	cc 53 45 	. S E 
	ld d,h			;1808	54 	T 
	jp nc,04553h		;1809	d2 53 45 	. S E 
	ld d,h			;180c	54 	T 
	out (041h),a		;180d	d3 41 	. A 
	ld d,(hl)			;180f	56 	V 
	ld b,l			;1810	45 	E 
	out (059h),a		;1811	d3 59 	. Y 
	ld d,e			;1813	53 	S 
	ld d,h			;1814	54 	T 
	ld b,l			;1815	45 	E 
	ld c,l			;1816	4d 	M 
	call z,05250h		;1817	cc 50 52 	. P R 
	ld c,c			;181a	49 	I 
	ld c,(hl)			;181b	4e 	N 
	ld d,h			;181c	54 	T 
	call nz,04645h		;181d	c4 45 46 	. E F 
	ret nc			;1820	d0 	. 
	ld c,a			;1821	4f 	O 
	ld c,e			;1822	4b 	K 
	ld b,l			;1823	45 	E 
	ret nc			;1824	d0 	. 
	ld d,d			;1825	52 	R 
	ld c,c			;1826	49 	I 
	ld c,(hl)			;1827	4e 	N 
	ld d,h			;1828	54 	T 
	jp 04e4fh		;1829	c3 4f 4e 	. O N 
	ld d,h			;182c	54 	T 
	call z,05349h		;182d	cc 49 53 	. I S 
	ld d,h			;1830	54 	T 
	call z,0494ch		;1831	cc 4c 49 	. L I 
	ld d,e			;1834	53 	S 
	ld d,h			;1835	54 	T 
	call nz,04c45h		;1836	c4 45 4c 	. E L 
	ld b,l			;1839	45 	E 
	ld d,h			;183a	54 	T 
	ld b,l			;183b	45 	E 
	pop bc			;183c	c1 	. 
	ld d,l			;183d	55 	U 
	ld d,h			;183e	54 	T 
	ld c,a			;183f	4f 	O 
	jp 0454ch		;1840	c3 4c 45 	. L E 
	ld b,c			;1843	41 	A 
	ld d,d			;1844	52 	R 
	jp 04f4ch		;1845	c3 4c 4f 	. L O 
	ld b,c			;1848	41 	A 
	ld b,h			;1849	44 	D 
	jp 04153h		;184a	c3 53 41 	. S A 
	ld d,(hl)			;184d	56 	V 
	ld b,l			;184e	45 	E 
	adc a,045h		;184f	ce 45 	. E 
	ld d,a			;1851	57 	W 
	call nc,04241h		;1852	d4 41 42 	. A B 
	jr z,$-42		;1855	28 d4 	( . 
	ld c,a			;1857	4f 	O 
	add a,04eh		;1858	c6 4e 	. N 
	push de			;185a	d5 	. 
	ld d,e			;185b	53 	S 
	ld c,c			;185c	49 	I 
	ld c,(hl)			;185d	4e 	N 
	ld b,a			;185e	47 	G 
	sub 041h		;185f	d6 41 	. A 
	ld d,d			;1861	52 	R 
	ld d,b			;1862	50 	P 
	ld d,h			;1863	54 	T 
	ld d,d			;1864	52 	R 
	push de			;1865	d5 	. 
	ld d,e			;1866	53 	S 
	ld d,d			;1867	52 	R 
	push bc			;1868	c5 	. 
	ld d,d			;1869	52 	R 
	ld c,h			;186a	4c 	L 
	push bc			;186b	c5 	. 
	ld d,d			;186c	52 	R 
	ld d,d			;186d	52 	R 
	out (054h),a		;186e	d3 54 	. T 
	ld d,d			;1870	52 	R 
	ld c,c			;1871	49 	I 
	ld c,(hl)			;1872	4e 	N 
	ld b,a			;1873	47 	G 
	inc h			;1874	24 	$ 
	ret			;1875	c9 	. 
	ld c,(hl)			;1876	4e 	N 
	ld d,e			;1877	53 	S 
	ld d,h			;1878	54 	T 
	ld d,d			;1879	52 	R 
	ret nc			;187a	d0 	. 
	ld c,a			;187b	4f 	O 
	ld c,c			;187c	49 	I 
	ld c,(hl)			;187d	4e 	N 
	ld d,h			;187e	54 	T 
	call nc,04d49h		;187f	d4 49 4d 	. I M 
	ld b,l			;1882	45 	E 
	inc h			;1883	24 	$ 
	call 04d45h		;1884	cd 45 4d 	. E M 
	ret			;1887	c9 	. 
	ld c,(hl)			;1888	4e 	N 
	ld c,e			;1889	4b 	K 
	ld b,l			;188a	45 	E 
	ld e,c			;188b	59 	Y 
	inc h			;188c	24 	$ 
	call nc,04548h		;188d	d4 48 45 	. H E 
	ld c,(hl)			;1890	4e 	N 
	adc a,04fh		;1891	ce 4f 	. O 
	ld d,h			;1893	54 	T 
	out (054h),a		;1894	d3 54 	. T 
	ld b,l			;1896	45 	E 
	ld d,b			;1897	50 	P 
	xor e			;1898	ab 	. 
	xor l			;1899	ad 	. 
	xor d			;189a	aa 	. 
	xor a			;189b	af 	. 
	in a,(0c1h)		;189c	db c1 	. . 
	ld c,(hl)			;189e	4e 	N 
	ld b,h			;189f	44 	D 
	rst 8			;18a0	cf 	. 
	ld d,d			;18a1	52 	R 
	cp (hl)			;18a2	be 	. 
	cp l			;18a3	bd 	. 
	cp h			;18a4	bc 	. 
	out (047h),a		;18a5	d3 47 	. G 
	ld c,(hl)			;18a7	4e 	N 
	ret			;18a8	c9 	. 
	ld c,(hl)			;18a9	4e 	N 
	ld d,h			;18aa	54 	T 
	pop bc			;18ab	c1 	. 
	ld b,d			;18ac	42 	B 
	ld d,e			;18ad	53 	S 
	add a,052h		;18ae	c6 52 	. R 
	ld b,l			;18b0	45 	E 
	ret			;18b1	c9 	. 
	ld c,(hl)			;18b2	4e 	N 
	ld d,b			;18b3	50 	P 
	ret nc			;18b4	d0 	. 
	ld c,a			;18b5	4f 	O 
	ld d,e			;18b6	53 	S 
	out (051h),a		;18b7	d3 51 	. Q 
	ld d,d			;18b9	52 	R 
	jp nc,0444eh		;18ba	d2 4e 44 	. N D 
	call z,0474fh		;18bd	cc 4f 47 	. O G 
	push bc			;18c0	c5 	. 
	ld e,b			;18c1	58 	X 
	ld d,b			;18c2	50 	P 
	jp 0534fh		;18c3	c3 4f 53 	. O S 
	out (049h),a		;18c6	d3 49 	. I 
	ld c,(hl)			;18c8	4e 	N 
	call nc,04e41h		;18c9	d4 41 4e 	. A N 
	pop bc			;18cc	c1 	. 
	ld d,h			;18cd	54 	T 
	ld c,(hl)			;18ce	4e 	N 
	ret nc			;18cf	d0 	. 
	ld b,l			;18d0	45 	E 
	ld b,l			;18d1	45 	E 
	ld c,e			;18d2	4b 	K 
	jp 04956h		;18d3	c3 56 49 	. V I 
	jp 05356h		;18d6	c3 56 53 	. V S 
	jp 04456h		;18d9	c3 56 44 	. V D 
	push bc			;18dc	c5 	. 
	ld c,a			;18dd	4f 	O 
	ld b,(hl)			;18de	46 	F 
	call z,0434fh		;18df	cc 4f 43 	. O C 
	call z,0464fh		;18e2	cc 4f 46 	. O F 
	call 0494bh		;18e5	cd 4b 49 	. K I 
	inc h			;18e8	24 	$ 
	call 0534bh		;18e9	cd 4b 53 	. K S 
	inc h			;18ec	24 	$ 
	call 0444bh		;18ed	cd 4b 44 	. K D 
	inc h			;18f0	24 	$ 
	jp 04e49h		;18f1	c3 49 4e 	. I N 
	ld d,h			;18f4	54 	T 
	jp 04e53h		;18f5	c3 53 4e 	. S N 
	ld b,a			;18f8	47 	G 
	jp 04244h		;18f9	c3 44 42 	. D B 
	ld c,h			;18fc	4c 	L 
	add a,049h		;18fd	c6 49 	. I 
	ld e,b			;18ff	58 	X 
	call z,04e45h		;1900	cc 45 4e 	. E N 
	out (054h),a		;1903	d3 54 	. T 
	ld d,d			;1905	52 	R 
	inc h			;1906	24 	$ 
	sub 041h		;1907	d6 41 	. A 
	ld c,h			;1909	4c 	L 
	pop bc			;190a	c1 	. 
	ld d,e			;190b	53 	S 
	ld b,e			;190c	43 	C 
	jp 05248h		;190d	c3 48 52 	. H R 
	inc h			;1910	24 	$ 
	call z,04645h		;1911	cc 45 46 	. E F 
	ld d,h			;1914	54 	T 
	inc h			;1915	24 	$ 
	jp nc,04749h		;1916	d2 49 47 	. I G 
	ld c,b			;1919	48 	H 
	ld d,h			;191a	54 	T 
	inc h			;191b	24 	$ 
	call 04449h		;191c	cd 49 44 	. I D 
	inc h			;191f	24 	$ 
	and a			;1920	a7 	. 
	add a,b			;1921	80 	. 
	xor (hl)			;1922	ae 	. 
	dec e			;1923	1d 	. 
	and c			;1924	a1 	. 
	inc e			;1925	1c 	. 
	jr c,$+3		;1926	38 01 	8 . 
	dec (hl)			;1928	35 	5 
	ld bc,001c9h		;1929	01 c9 01 	. . . 
	ld (hl),e			;192c	73 	s 
	ld b,c			;192d	41 	A 
	out (001h),a		;192e	d3 01 	. . 
	or (hl)			;1930	b6 	. 
	ld (01f05h),hl		;1931	22 05 1f 	" . . 
	sbc a,d			;1934	9a 	. 
	ld hl,02608h		;1935	21 08 26 	! . & 
	rst 28h			;1938	ef 	. 
	ld hl,01f21h		;1939	21 21 1f 	! ! . 
	jp nz,0a31eh		;193c	c2 1e a3 	. . . 
	ld e,039h		;193f	1e 39 	. 9 
	jr nz,$-109		;1941	20 91 	  . 
	dec e			;1943	1d 	. 
	or c			;1944	b1 	. 
	ld e,0deh		;1945	1e de 	. . 
	ld e,007h		;1947	1e 07 	. . 
	rra			;1949	1f 	. 
	xor c			;194a	a9 	. 
	dec e			;194b	1d 	. 
	rlca			;194c	07 	. 
	rra			;194d	1f 	. 
	rst 30h			;194e	f7 	. 
	dec e			;194f	1d 	. 
	ret m			;1950	f8 	. 
	dec e			;1951	1d 	. 
	nop			;1952	00 	. 
	ld e,003h		;1953	1e 03 	. . 
	ld e,006h		;1955	1e 06 	. . 
	ld e,009h		;1957	1e 09 	. . 
	ld e,0a3h		;1959	1e a3 	. . 
	ld b,c			;195b	41 	A 
	ld h,b			;195c	60 	` 
	ld l,0f4h		;195d	2e f4 	. . 
	rra			;195f	1f 	. 
	xor a			;1960	af 	. 
	rra			;1961	1f 	. 
	ei			;1962	fb 	. 
	ld hl,(01f6ch)		;1963	2a 6c 1f 	* l . 
	ld a,c			;1966	79 	y 
	ld b,c			;1967	41 	A 
	ld a,h			;1968	7c 	| 
	ld b,c			;1969	41 	A 
	ld a,a			;196a	7f 	 
	ld b,c			;196b	41 	A 
	add a,d			;196c	82 	. 
	ld b,c			;196d	41 	A 
	add a,l			;196e	85 	. 
	ld b,c			;196f	41 	A 
	adc a,b			;1970	88 	. 
	ld b,c			;1971	41 	A 
	adc a,e			;1972	8b 	. 
	ld b,c			;1973	41 	A 
	adc a,(hl)			;1974	8e 	. 
	ld b,c			;1975	41 	A 
	sub c			;1976	91 	. 
	ld b,c			;1977	41 	A 
	sub a			;1978	97 	. 
	ld b,c			;1979	41 	A 
	sbc a,d			;197a	9a 	. 
	ld b,c			;197b	41 	A 
	and b			;197c	a0 	. 
	ld b,c			;197d	41 	A 
	or d			;197e	b2 	. 
	ld (bc),a			;197f	02 	. 
	ld h,a			;1980	67 	g 
	jr nz,$+93		;1981	20 5b 	  [ 
	ld b,c			;1983	41 	A 
	or c			;1984	b1 	. 
	inc l			;1985	2c 	, 
	ld l,a			;1986	6f 	o 
	jr nz,$-26		;1987	20 e4 	  . 
	dec e			;1989	1d 	. 
	ld l,02bh		;198a	2e 2b 	. + 
	add hl,hl			;198c	29 	) 
	dec hl			;198d	2b 	+ 
	add a,02bh		;198e	c6 2b 	. + 
	ex af,af'			;1990	08 	. 
	jr nz,$+124		;1991	20 7a 	  z 
	ld e,01fh		;1993	1e 1f 	. . 
	inc l			;1995	2c 	, 
	push af			;1996	f5 	. 
	dec hl			;1997	2b 	+ 
	ld c,c			;1998	49 	I 
	dec de			;1999	1b 	. 
	ld a,c			;199a	79 	y 
	ld a,c			;199b	79 	y 
	ld a,h			;199c	7c 	| 
	ld a,h			;199d	7c 	| 
	ld a,a			;199e	7f 	 
	ld d,b			;199f	50 	P 
	ld b,(hl)			;19a0	46 	F 
	in a,(00ah)		;19a1	db 0a 	. . 
	nop			;19a3	00 	. 
	nop			;19a4	00 	. 
	ld a,a			;19a5	7f 	 
	ld a,(bc)			;19a6	0a 	. 
	call p,0b10ah		;19a7	f4 0a b1 	. . . 
	ld a,(bc)			;19aa	0a 	. 
	ld (hl),a			;19ab	77 	w 
	inc c			;19ac	0c 	. 
	ld (hl),b			;19ad	70 	p 
	inc c			;19ae	0c 	. 
	and c			;19af	a1 	. 
	dec c			;19b0	0d 	. 
	push hl			;19b1	e5 	. 
	dec c			;19b2	0d 	. 
	ld a,b			;19b3	78 	x 
	ld a,(bc)			;19b4	0a 	. 
	ld d,007h		;19b5	16 07 	. . 
	inc de			;19b7	13 	. 
	rlca			;19b8	07 	. 
	ld b,a			;19b9	47 	G 
	ex af,af'			;19ba	08 	. 
	and d			;19bb	a2 	. 
	ex af,af'			;19bc	08 	. 
	inc c			;19bd	0c 	. 
	ld a,(bc)			;19be	0a 	. 
	jp nc,0c70bh		;19bf	d2 0b c7 	. . . 
	dec bc			;19c2	0b 	. 
	jp p,0900bh		;19c3	f2 0b 90 	. . . 
	inc h			;19c6	24 	$ 
	add hl,sp			;19c7	39 	9 
	ld a,(bc)			;19c8	0a 	. 
	ld c,(hl)			;19c9	4e 	N 
	ld b,(hl)			;19ca	46 	F 
	ld d,e			;19cb	53 	S 
	ld c,(hl)			;19cc	4e 	N 
	ld d,d			;19cd	52 	R 
	ld b,a			;19ce	47 	G 
	ld c,a			;19cf	4f 	O 
	ld b,h			;19d0	44 	D 
	ld b,(hl)			;19d1	46 	F 
	ld b,e			;19d2	43 	C 
	ld c,a			;19d3	4f 	O 
	ld d,(hl)			;19d4	56 	V 
	ld c,a			;19d5	4f 	O 
	ld c,l			;19d6	4d 	M 
	ld d,l			;19d7	55 	U 
	ld c,h			;19d8	4c 	L 
	ld b,d			;19d9	42 	B 
	ld d,e			;19da	53 	S 
	ld b,h			;19db	44 	D 
	ld b,h			;19dc	44 	D 
	cpl			;19dd	2f 	/ 
	jr nc,$+75		;19de	30 49 	0 I 
	ld b,h			;19e0	44 	D 
	ld d,h			;19e1	54 	T 
	ld c,l			;19e2	4d 	M 
	ld c,a			;19e3	4f 	O 
	ld d,e			;19e4	53 	S 
	ld c,h			;19e5	4c 	L 
	ld d,e			;19e6	53 	S 
	ld d,e			;19e7	53 	S 
	ld d,h			;19e8	54 	T 
	ld b,e			;19e9	43 	C 
	ld c,(hl)			;19ea	4e 	N 
	ld c,(hl)			;19eb	4e 	N 
	ld d,d			;19ec	52 	R 
	ld d,d			;19ed	52 	R 
	ld d,a			;19ee	57 	W 
	ld d,l			;19ef	55 	U 
	ld b,l			;19f0	45 	E 
	ld c,l			;19f1	4d 	M 
	ld c,a			;19f2	4f 	O 
	ld b,(hl)			;19f3	46 	F 
	ld b,h			;19f4	44 	D 
	ld d,e			;19f5	53 	S 
	ld c,(hl)			;19f6	4e 	N 
	sub 000h		;19f7	d6 00 	. . 
	ld l,a			;19f9	6f 	o 
	ld a,h			;19fa	7c 	| 
	sbc a,000h		;19fb	de 00 	. . 
	ld h,a			;19fd	67 	g 
	ld a,b			;19fe	78 	x 
	sbc a,000h		;19ff	de 00 	. . 
	ld b,a			;1a01	47 	G 
	ld a,000h		;1a02	3e 00 	> . 
	ret			;1a04	c9 	. 
	ld c,d			;1a05	4a 	J 
	ld e,040h		;1a06	1e 40 	. @ 
	and 04dh		;1a08	e6 4d 	. M 
	in a,(000h)		;1a0a	db 00 	. . 
	ret			;1a0c	c9 	. 
	out (000h),a		;1a0d	d3 00 	. . 
	ret			;1a0f	c9 	. 
	nop			;1a10	00 	. 
	nop			;1a11	00 	. 
	nop			;1a12	00 	. 
	nop			;1a13	00 	. 
	ld b,b			;1a14	40 	@ 
	jr nc,$+2		;1a15	30 00 	0 . 
	ld c,h			;1a17	4c 	L 
	ld b,e			;1a18	43 	C 
	cp 0ffh		;1a19	fe ff 	. . 
	jp (hl)			;1a1b	e9 	. 
	ld b,d			;1a1c	42 	B 
	jr nz,$+71		;1a1d	20 45 	  E 
	ld (hl),d			;1a1f	72 	r 
	ld (hl),d			;1a20	72 	r 
	ld l,a			;1a21	6f 	o 
	ld (hl),d			;1a22	72 	r 
	nop			;1a23	00 	. 
	jr nz,$+107		;1a24	20 69 	  i 
	ld l,(hl)			;1a26	6e 	n 
	jr nz,$+2		;1a27	20 00 	  . 
	ld d,d			;1a29	52 	R 
	ld b,l			;1a2a	45 	E 
	ld b,c			;1a2b	41 	A 
	ld b,h			;1a2c	44 	D 
	ld e,c			;1a2d	59 	Y 
	dec c			;1a2e	0d 	. 
	nop			;1a2f	00 	. 
	ld b,d			;1a30	42 	B 
	ld (hl),d			;1a31	72 	r 
	ld h,l			;1a32	65 	e 
	ld h,c			;1a33	61 	a 
	ld l,e			;1a34	6b 	k 
	nop			;1a35	00 	. 
	ld hl,00004h		;1a36	21 04 00 	! . . 
	add hl,sp			;1a39	39 	9 
	ld a,(hl)			;1a3a	7e 	~ 
	inc hl			;1a3b	23 	# 
	cp 081h		;1a3c	fe 81 	. . 
	ret nz			;1a3e	c0 	. 
	ld c,(hl)			;1a3f	4e 	N 
	inc hl			;1a40	23 	# 
	ld b,(hl)			;1a41	46 	F 
	inc hl			;1a42	23 	# 
	push hl			;1a43	e5 	. 
	ld l,c			;1a44	69 	i 
	ld h,b			;1a45	60 	` 
	ld a,d			;1a46	7a 	z 
	or e			;1a47	b3 	. 
	ex de,hl			;1a48	eb 	. 
	jr z,$+4		;1a49	28 02 	( . 
	ex de,hl			;1a4b	eb 	. 
	rst 18h			;1a4c	df 	. 
	ld bc,0000eh		;1a4d	01 0e 00 	. . . 
	pop hl			;1a50	e1 	. 
	ret z			;1a51	c8 	. 
	add hl,bc			;1a52	09 	. 
	jr $-25		;1a53	18 e5 	. . 
	call 0196ch		;1a55	cd 6c 19 	. l . 
	push bc			;1a58	c5 	. 
	ex (sp),hl			;1a59	e3 	. 
	pop bc			;1a5a	c1 	. 
	rst 18h			;1a5b	df 	. 
	ld a,(hl)			;1a5c	7e 	~ 
	ld (bc),a			;1a5d	02 	. 
	ret z			;1a5e	c8 	. 
	dec bc			;1a5f	0b 	. 
	dec hl			;1a60	2b 	+ 
	jr $-6		;1a61	18 f8 	. . 
	push hl			;1a63	e5 	. 
	ld hl,(040fdh)		;1a64	2a fd 40 	* . @ 
	ld b,000h		;1a67	06 00 	. . 
	add hl,bc			;1a69	09 	. 
	add hl,bc			;1a6a	09 	. 
	ld a,0e5h		;1a6b	3e e5 	> . 
	ld a,0c6h		;1a6d	3e c6 	> . 
	sub l			;1a6f	95 	. 
	ld l,a			;1a70	6f 	o 
	ld a,0ffh		;1a71	3e ff 	> . 
	sbc a,h			;1a73	9c 	. 
	jr c,$+6		;1a74	38 04 	8 . 
	ld h,a			;1a76	67 	g 
	add hl,sp			;1a77	39 	9 
	pop hl			;1a78	e1 	. 
	ret c			;1a79	d8 	. 
	ld e,00ch		;1a7a	1e 0c 	. . 
	jr $+38		;1a7c	18 24 	. $ 
	ld hl,(040a2h)		;1a7e	2a a2 40 	* . @ 
	ld a,h			;1a81	7c 	| 
	and l			;1a82	a5 	. 
	inc a			;1a83	3c 	< 
	jr z,$+10		;1a84	28 08 	( . 
	ld a,(040f2h)		;1a86	3a f2 40 	: . @ 
	or a			;1a89	b7 	. 
	ld e,022h		;1a8a	1e 22 	. " 
	jr nz,$+22		;1a8c	20 14 	  . 
	jp 01dc1h		;1a8e	c3 c1 1d 	. . . 
	ld hl,(040dah)		;1a91	2a da 40 	* . @ 
	ld (040a2h),hl		;1a94	22 a2 40 	" . @ 
	ld e,002h		;1a97	1e 02 	. . 
	ld bc,0141eh		;1a99	01 1e 14 	. . . 
	ld bc,0001eh		;1a9c	01 1e 00 	. . . 
	ld bc,0241eh		;1a9f	01 1e 24 	. . $ 
	ld hl,(040a2h)		;1aa2	2a a2 40 	* . @ 
	ld (040eah),hl		;1aa5	22 ea 40 	" . @ 
	ld (040ech),hl		;1aa8	22 ec 40 	" . @ 
	ld bc,019b4h		;1aab	01 b4 19 	. . . 
	ld hl,(040e8h)		;1aae	2a e8 40 	* . @ 
	jp 01b9ah		;1ab1	c3 9a 1b 	. . . 
	pop bc			;1ab4	c1 	. 
	ld a,e			;1ab5	7b 	{ 
	ld c,e			;1ab6	4b 	K 
	ld (0409ah),a		;1ab7	32 9a 40 	2 . @ 
	ld hl,(040e6h)		;1aba	2a e6 40 	* . @ 
	ld (040eeh),hl		;1abd	22 ee 40 	" . @ 
	ex de,hl			;1ac0	eb 	. 
	ld hl,(040eah)		;1ac1	2a ea 40 	* . @ 
	ld a,h			;1ac4	7c 	| 
	and l			;1ac5	a5 	. 
	inc a			;1ac6	3c 	< 
	jr z,$+9		;1ac7	28 07 	( . 
	ld (040f5h),hl		;1ac9	22 f5 40 	" . @ 
	ex de,hl			;1acc	eb 	. 
	ld (040f7h),hl		;1acd	22 f7 40 	" . @ 
	ld hl,(040f0h)		;1ad0	2a f0 40 	* . @ 
	ld a,h			;1ad3	7c 	| 
	or l			;1ad4	b5 	. 
	ex de,hl			;1ad5	eb 	. 
	ld hl,040f2h		;1ad6	21 f2 40 	! . @ 
	jr z,$+10		;1ad9	28 08 	( . 
	and (hl)			;1adb	a6 	. 
	jr nz,$+7		;1adc	20 05 	  . 
	dec (hl)			;1ade	35 	5 
	ex de,hl			;1adf	eb 	. 
	jp 01d36h		;1ae0	c3 36 1d 	. 6 . 
	xor a			;1ae3	af 	. 
	ld (hl),a			;1ae4	77 	w 
	ld e,c			;1ae5	59 	Y 
	call 020f9h		;1ae6	cd f9 20 	. .   
	ld hl,018c9h		;1ae9	21 c9 18 	! . . 
	call 041a6h		;1aec	cd a6 41 	. . A 
	ld d,a			;1aef	57 	W 
	ld a,03fh		;1af0	3e 3f 	> ? 
	call 0032ah		;1af2	cd 2a 03 	. * . 
	add hl,de			;1af5	19 	. 
	ld a,(hl)			;1af6	7e 	~ 
	call 0032ah		;1af7	cd 2a 03 	. * . 
	rst 10h			;1afa	d7 	. 
	call 0032ah		;1afb	cd 2a 03 	. * . 
	ld hl,0191dh		;1afe	21 1d 19 	! . . 
	push hl			;1b01	e5 	. 
	ld hl,(040eah)		;1b02	2a ea 40 	* . @ 
	ex (sp),hl			;1b05	e3 	. 
	call 028a7h		;1b06	cd a7 28 	. . ( 
	pop hl			;1b09	e1 	. 
	ld de,0fffeh		;1b0a	11 fe ff 	. . . 
	rst 18h			;1b0d	df 	. 
	jp z,00674h		;1b0e	ca 74 06 	. t . 
	ld a,h			;1b11	7c 	| 
	and l			;1b12	a5 	. 
	inc a			;1b13	3c 	< 
	call nz,00fa7h		;1b14	c4 a7 0f 	. . . 
	ld a,0c1h		;1b17	3e c1 	> . 
	call 0038bh		;1b19	cd 8b 03 	. . . 
	call 041ach		;1b1c	cd ac 41 	. . A 
	call 001f8h		;1b1f	cd f8 01 	. . . 
	call 020f9h		;1b22	cd f9 20 	. .   
	ld hl,01929h		;1b25	21 29 19 	! ) . 
	call 028a7h		;1b28	cd a7 28 	. . ( 
	ld a,(0409ah)		;1b2b	3a 9a 40 	: . @ 
	sub 002h		;1b2e	d6 02 	. . 
	call z,02e53h		;1b30	cc 53 2e 	. S . 
	ld hl,0ffffh		;1b33	21 ff ff 	! . . 
	ld (040a2h),hl		;1b36	22 a2 40 	" . @ 
	ld a,(040e1h)		;1b39	3a e1 40 	: . @ 
	or a			;1b3c	b7 	. 
	jr z,$+57		;1b3d	28 37 	( 7 
	ld hl,(040e2h)		;1b3f	2a e2 40 	* . @ 
	push hl			;1b42	e5 	. 
	call 00fafh		;1b43	cd af 0f 	. . . 
	pop de			;1b46	d1 	. 
	push de			;1b47	d5 	. 
	call 01b2ch		;1b48	cd 2c 1b 	. , . 
	ld a,02ah		;1b4b	3e 2a 	> * 
	jr c,$+4		;1b4d	38 02 	8 . 
	ld a,020h		;1b4f	3e 20 	>   
	call 0032ah		;1b51	cd 2a 03 	. * . 
	call 00361h		;1b54	cd 61 03 	. a . 
	pop de			;1b57	d1 	. 
	jr nc,$+8		;1b58	30 06 	0 . 
	xor a			;1b5a	af 	. 
	ld (040e1h),a		;1b5b	32 e1 40 	2 . @ 
	jr $-69		;1b5e	18 b9 	. . 
	ld hl,(040e4h)		;1b60	2a e4 40 	* . @ 
	add hl,de			;1b63	19 	. 
	jr c,$-10		;1b64	38 f4 	8 . 
	push de			;1b66	d5 	. 
	ld de,0fff9h		;1b67	11 f9 ff 	. . . 
	rst 18h			;1b6a	df 	. 
	pop de			;1b6b	d1 	. 
	jr nc,$-18		;1b6c	30 ec 	0 . 
	ld (040e2h),hl		;1b6e	22 e2 40 	" . @ 
	or 0ffh		;1b71	f6 ff 	. . 
	jp 02febh		;1b73	c3 eb 2f 	. . / 
	ld a,03eh		;1b76	3e 3e 	> > 
	call 0032ah		;1b78	cd 2a 03 	. * . 
	call 00361h		;1b7b	cd 61 03 	. a . 
	jp c,01a33h		;1b7e	da 33 1a 	. 3 . 
	rst 10h			;1b81	d7 	. 
	inc a			;1b82	3c 	< 
	dec a			;1b83	3d 	= 
	jp z,01a33h		;1b84	ca 33 1a 	. 3 . 
	push af			;1b87	f5 	. 
	call 01e5ah		;1b88	cd 5a 1e 	. Z . 
	dec hl			;1b8b	2b 	+ 
	ld a,(hl)			;1b8c	7e 	~ 
	cp 020h		;1b8d	fe 20 	.   
	jr z,$-4		;1b8f	28 fa 	( . 
	inc hl			;1b91	23 	# 
	ld a,(hl)			;1b92	7e 	~ 
	cp 020h		;1b93	fe 20 	.   
	call z,009c9h		;1b95	cc c9 09 	. . . 
	push de			;1b98	d5 	. 
	call 01bc0h		;1b99	cd c0 1b 	. . . 
	pop de			;1b9c	d1 	. 
	pop af			;1b9d	f1 	. 
	ld (040e6h),hl		;1b9e	22 e6 40 	" . @ 
	call 041b2h		;1ba1	cd b2 41 	. . A 
	jp nc,01d5ah		;1ba4	d2 5a 1d 	. Z . 
	push de			;1ba7	d5 	. 
	push bc			;1ba8	c5 	. 
	xor a			;1ba9	af 	. 
	ld (040ddh),a		;1baa	32 dd 40 	2 . @ 
	rst 10h			;1bad	d7 	. 
	or a			;1bae	b7 	. 
	push af			;1baf	f5 	. 
	ex de,hl			;1bb0	eb 	. 
	ld (040ech),hl		;1bb1	22 ec 40 	" . @ 
	ex de,hl			;1bb4	eb 	. 
	call 01b2ch		;1bb5	cd 2c 1b 	. , . 
	push bc			;1bb8	c5 	. 
	call c,02be4h		;1bb9	dc e4 2b 	. . + 
	pop de			;1bbc	d1 	. 
	pop af			;1bbd	f1 	. 
	push de			;1bbe	d5 	. 
	jr z,$+41		;1bbf	28 27 	( ' 
	pop de			;1bc1	d1 	. 
	ld hl,(040f9h)		;1bc2	2a f9 40 	* . @ 
	ex (sp),hl			;1bc5	e3 	. 
	pop bc			;1bc6	c1 	. 
	add hl,bc			;1bc7	09 	. 
	push hl			;1bc8	e5 	. 
	call 01955h		;1bc9	cd 55 19 	. U . 
	pop hl			;1bcc	e1 	. 
	ld (040f9h),hl		;1bcd	22 f9 40 	" . @ 
	ex de,hl			;1bd0	eb 	. 
	ld (hl),h			;1bd1	74 	t 
	pop de			;1bd2	d1 	. 
	push hl			;1bd3	e5 	. 
	inc hl			;1bd4	23 	# 
	inc hl			;1bd5	23 	# 
	ld (hl),e			;1bd6	73 	s 
	inc hl			;1bd7	23 	# 
	ld (hl),d			;1bd8	72 	r 
	inc hl			;1bd9	23 	# 
	ex de,hl			;1bda	eb 	. 
	ld hl,(040a7h)		;1bdb	2a a7 40 	* . @ 
	ex de,hl			;1bde	eb 	. 
	dec de			;1bdf	1b 	. 
	dec de			;1be0	1b 	. 
	ld a,(de)			;1be1	1a 	. 
	ld (hl),a			;1be2	77 	w 
	inc hl			;1be3	23 	# 
	inc de			;1be4	13 	. 
	or a			;1be5	b7 	. 
	jr nz,$-5		;1be6	20 f9 	  . 
	pop de			;1be8	d1 	. 
	call 01afch		;1be9	cd fc 1a 	. . . 
	call 041b5h		;1bec	cd b5 41 	. . A 
	call 01b5dh		;1bef	cd 5d 1b 	. ] . 
	call 041b8h		;1bf2	cd b8 41 	. . A 
	jp 01a33h		;1bf5	c3 33 1a 	. 3 . 
	ld hl,(040a4h)		;1bf8	2a a4 40 	* . @ 
	ex de,hl			;1bfb	eb 	. 
	ld h,d			;1bfc	62 	b 
	ld l,e			;1bfd	6b 	k 
	ld a,(hl)			;1bfe	7e 	~ 
	inc hl			;1bff	23 	# 
	or (hl)			;1c00	b6 	. 
	ret z			;1c01	c8 	. 
	inc hl			;1c02	23 	# 
	inc hl			;1c03	23 	# 
	inc hl			;1c04	23 	# 
	xor a			;1c05	af 	. 
	cp (hl)			;1c06	be 	. 
	inc hl			;1c07	23 	# 
	jr nz,$-2		;1c08	20 fc 	  . 
	ex de,hl			;1c0a	eb 	. 
	ld (hl),e			;1c0b	73 	s 
	inc hl			;1c0c	23 	# 
	ld (hl),d			;1c0d	72 	r 
	jr $-18		;1c0e	18 ec 	. . 
	ld de,00000h		;1c10	11 00 00 	. . . 
	push de			;1c13	d5 	. 
	jr z,$+11		;1c14	28 09 	( . 
	pop de			;1c16	d1 	. 
	call 01e4fh		;1c17	cd 4f 1e 	. O . 
	push de			;1c1a	d5 	. 
	jr z,$+13		;1c1b	28 0b 	( . 
	rst 8			;1c1d	cf 	. 
	adc a,011h		;1c1e	ce 11 	. . 
	jp m,0c4ffh		;1c20	fa ff c4 	. . . 
	ld c,a			;1c23	4f 	O 
	ld e,0c2h		;1c24	1e c2 	. . 
	sub a			;1c26	97 	. 
	add hl,de			;1c27	19 	. 
	ex de,hl			;1c28	eb 	. 
	pop de			;1c29	d1 	. 
	ex (sp),hl			;1c2a	e3 	. 
	push hl			;1c2b	e5 	. 
	ld hl,(040a4h)		;1c2c	2a a4 40 	* . @ 
	ld b,h			;1c2f	44 	D 
	ld c,l			;1c30	4d 	M 
	ld a,(hl)			;1c31	7e 	~ 
	inc hl			;1c32	23 	# 
	or (hl)			;1c33	b6 	. 
	dec hl			;1c34	2b 	+ 
	ret z			;1c35	c8 	. 
	inc hl			;1c36	23 	# 
	inc hl			;1c37	23 	# 
	ld a,(hl)			;1c38	7e 	~ 
	inc hl			;1c39	23 	# 
	ld h,(hl)			;1c3a	66 	f 
	ld l,a			;1c3b	6f 	o 
	rst 18h			;1c3c	df 	. 
	ld h,b			;1c3d	60 	` 
	ld l,c			;1c3e	69 	i 
	ld a,(hl)			;1c3f	7e 	~ 
	inc hl			;1c40	23 	# 
	ld h,(hl)			;1c41	66 	f 
	ld l,a			;1c42	6f 	o 
	ccf			;1c43	3f 	? 
	ret z			;1c44	c8 	. 
	ccf			;1c45	3f 	? 
	ret nc			;1c46	d0 	. 
	jr $-24		;1c47	18 e6 	. . 
	ret nz			;1c49	c0 	. 
	call 001c9h		;1c4a	cd c9 01 	. . . 
	ld hl,(040a4h)		;1c4d	2a a4 40 	* . @ 
	call 01df8h		;1c50	cd f8 1d 	. . . 
	ld (040e1h),a		;1c53	32 e1 40 	2 . @ 
	ld (hl),a			;1c56	77 	w 
	inc hl			;1c57	23 	# 
	ld (hl),a			;1c58	77 	w 
	inc hl			;1c59	23 	# 
	ld (040f9h),hl		;1c5a	22 f9 40 	" . @ 
	ld hl,(040a4h)		;1c5d	2a a4 40 	* . @ 
	dec hl			;1c60	2b 	+ 
	ld (040dfh),hl		;1c61	22 df 40 	" . @ 
	ld b,01ah		;1c64	06 1a 	. . 
	ld hl,04101h		;1c66	21 01 41 	! . A 
	ld (hl),004h		;1c69	36 04 	6 . 
	inc hl			;1c6b	23 	# 
	djnz $-3		;1c6c	10 fb 	. . 
	xor a			;1c6e	af 	. 
	ld (040f2h),a		;1c6f	32 f2 40 	2 . @ 
	ld l,a			;1c72	6f 	o 
	ld h,a			;1c73	67 	g 
	ld (040f0h),hl		;1c74	22 f0 40 	" . @ 
	ld (040f7h),hl		;1c77	22 f7 40 	" . @ 
	ld hl,(040b1h)		;1c7a	2a b1 40 	* . @ 
	ld (040d6h),hl		;1c7d	22 d6 40 	" . @ 
	call 01d91h		;1c80	cd 91 1d 	. . . 
	ld hl,(040f9h)		;1c83	2a f9 40 	* . @ 
	ld (040fbh),hl		;1c86	22 fb 40 	" . @ 
	ld (040fdh),hl		;1c89	22 fd 40 	" . @ 
	call 041bbh		;1c8c	cd bb 41 	. . A 
	pop bc			;1c8f	c1 	. 
	ld hl,(040a0h)		;1c90	2a a0 40 	* . @ 
	dec hl			;1c93	2b 	+ 
	dec hl			;1c94	2b 	+ 
	ld (040e8h),hl		;1c95	22 e8 40 	" . @ 
	inc hl			;1c98	23 	# 
	inc hl			;1c99	23 	# 
	ld sp,hl			;1c9a	f9 	. 
	ld hl,040b5h		;1c9b	21 b5 40 	! . @ 
	ld (040b3h),hl		;1c9e	22 b3 40 	" . @ 
	call 0038bh		;1ca1	cd 8b 03 	. . . 
	call 02169h		;1ca4	cd 69 21 	. i ! 
	xor a			;1ca7	af 	. 
	ld h,a			;1ca8	67 	g 
	ld l,a			;1ca9	6f 	o 
	ld (040dch),a		;1caa	32 dc 40 	2 . @ 
	push hl			;1cad	e5 	. 
	push bc			;1cae	c5 	. 
	ld hl,(040dfh)		;1caf	2a df 40 	* . @ 
	ret			;1cb2	c9 	. 
	ld a,03fh		;1cb3	3e 3f 	> ? 
	call 0032ah		;1cb5	cd 2a 03 	. * . 
	ld a,020h		;1cb8	3e 20 	>   
	call 0032ah		;1cba	cd 2a 03 	. * . 
	jp 00361h		;1cbd	c3 61 03 	. a . 
	xor a			;1cc0	af 	. 
	ld (040b0h),a		;1cc1	32 b0 40 	2 . @ 
	ld c,a			;1cc4	4f 	O 
	ex de,hl			;1cc5	eb 	. 
	ld hl,(040a7h)		;1cc6	2a a7 40 	* . @ 
	dec hl			;1cc9	2b 	+ 
	dec hl			;1cca	2b 	+ 
	ex de,hl			;1ccb	eb 	. 
	ld a,(hl)			;1ccc	7e 	~ 
	cp 020h		;1ccd	fe 20 	.   
	jp z,01c5bh		;1ccf	ca 5b 1c 	. [ . 
	ld b,a			;1cd2	47 	G 
	cp 022h		;1cd3	fe 22 	. " 
	jp z,01c77h		;1cd5	ca 77 1c 	. w . 
	or a			;1cd8	b7 	. 
	jp z,01c7dh		;1cd9	ca 7d 1c 	. } . 
	ld a,(040b0h)		;1cdc	3a b0 40 	: . @ 
	or a			;1cdf	b7 	. 
	ld a,(hl)			;1ce0	7e 	~ 
	jp nz,01c5bh		;1ce1	c2 5b 1c 	. [ . 
	cp 03fh		;1ce4	fe 3f 	. ? 
	ld a,0b2h		;1ce6	3e b2 	> . 
	jp z,01c5bh		;1ce8	ca 5b 1c 	. [ . 
	ld a,(hl)			;1ceb	7e 	~ 
	cp 030h		;1cec	fe 30 	. 0 
	jr c,$+7		;1cee	38 05 	8 . 
	cp 03ch		;1cf0	fe 3c 	. < 
	jp c,01c5bh		;1cf2	da 5b 1c 	. [ . 
	push de			;1cf5	d5 	. 
	ld de,0164fh		;1cf6	11 4f 16 	. O . 
	push bc			;1cf9	c5 	. 
	ld bc,01c3dh		;1cfa	01 3d 1c 	. = . 
	push bc			;1cfd	c5 	. 
	ld b,07fh		;1cfe	06 7f 	.  
	ld a,(hl)			;1d00	7e 	~ 
	cp 061h		;1d01	fe 61 	. a 
	jr c,$+9		;1d03	38 07 	8 . 
	cp 07bh		;1d05	fe 7b 	. { 
	jr nc,$+5		;1d07	30 03 	0 . 
	and 05fh		;1d09	e6 5f 	. _ 
	ld (hl),a			;1d0b	77 	w 
	ld c,(hl)			;1d0c	4e 	N 
	ex de,hl			;1d0d	eb 	. 
	inc hl			;1d0e	23 	# 
	or (hl)			;1d0f	b6 	. 
	jp p,01c0eh		;1d10	f2 0e 1c 	. . . 
	inc b			;1d13	04 	. 
	ld a,(hl)			;1d14	7e 	~ 
	and 07fh		;1d15	e6 7f 	.  
	ret z			;1d17	c8 	. 
	cp c			;1d18	b9 	. 
	jr nz,$-11		;1d19	20 f3 	  . 
	ex de,hl			;1d1b	eb 	. 
	push hl			;1d1c	e5 	. 
	inc de			;1d1d	13 	. 
	ld a,(de)			;1d1e	1a 	. 
	or a			;1d1f	b7 	. 
	jp m,01c39h		;1d20	fa 39 1c 	. 9 . 
	ld c,a			;1d23	4f 	O 
	ld a,b			;1d24	78 	x 
	cp 08dh		;1d25	fe 8d 	. . 
	jr nz,$+4		;1d27	20 02 	  . 
	rst 10h			;1d29	d7 	. 
	dec hl			;1d2a	2b 	+ 
	inc hl			;1d2b	23 	# 
	ld a,(hl)			;1d2c	7e 	~ 
	cp 061h		;1d2d	fe 61 	. a 
	jr c,$+4		;1d2f	38 02 	8 . 
	and 05fh		;1d31	e6 5f 	. _ 
	cp c			;1d33	b9 	. 
	jr z,$-23		;1d34	28 e7 	( . 
	pop hl			;1d36	e1 	. 
	jr $-43		;1d37	18 d3 	. . 
	ld c,b			;1d39	48 	H 
	pop af			;1d3a	f1 	. 
	ex de,hl			;1d3b	eb 	. 
	ret			;1d3c	c9 	. 
	ex de,hl			;1d3d	eb 	. 
	ld a,c			;1d3e	79 	y 
	pop bc			;1d3f	c1 	. 
	pop de			;1d40	d1 	. 
	ex de,hl			;1d41	eb 	. 
	cp 095h		;1d42	fe 95 	. . 
	ld (hl),03ah		;1d44	36 3a 	6 : 
	jr nz,$+4		;1d46	20 02 	  . 
	inc c			;1d48	0c 	. 
	inc hl			;1d49	23 	# 
	cp 0fbh		;1d4a	fe fb 	. . 
	jr nz,$+14		;1d4c	20 0c 	  . 
	ld (hl),03ah		;1d4e	36 3a 	6 : 
	inc hl			;1d50	23 	# 
	ld b,093h		;1d51	06 93 	. . 
	ld (hl),b			;1d53	70 	p 
	inc hl			;1d54	23 	# 
	ex de,hl			;1d55	eb 	. 
	inc c			;1d56	0c 	. 
	inc c			;1d57	0c 	. 
	jr $+31		;1d58	18 1d 	. . 
	ex de,hl			;1d5a	eb 	. 
	inc hl			;1d5b	23 	# 
	ld (de),a			;1d5c	12 	. 
	inc de			;1d5d	13 	. 
	inc c			;1d5e	0c 	. 
	sub 03ah		;1d5f	d6 3a 	. : 
	jr z,$+6		;1d61	28 04 	( . 
	cp 04eh		;1d63	fe 4e 	. N 
	jr nz,$+5		;1d65	20 03 	  . 
	ld (040b0h),a		;1d67	32 b0 40 	2 . @ 
	sub 059h		;1d6a	d6 59 	. Y 
	jp nz,01bcch		;1d6c	c2 cc 1b 	. . . 
	ld b,a			;1d6f	47 	G 
	ld a,(hl)			;1d70	7e 	~ 
	or a			;1d71	b7 	. 
	jr z,$+11		;1d72	28 09 	( . 
	cp b			;1d74	b8 	. 
	jr z,$-26		;1d75	28 e4 	( . 
	inc hl			;1d77	23 	# 
	ld (de),a			;1d78	12 	. 
	inc c			;1d79	0c 	. 
	inc de			;1d7a	13 	. 
	jr $-11		;1d7b	18 f3 	. . 
	ld hl,00005h		;1d7d	21 05 00 	! . . 
	ld b,h			;1d80	44 	D 
	add hl,bc			;1d81	09 	. 
	ld b,h			;1d82	44 	D 
	ld c,l			;1d83	4d 	M 
	ld hl,(040a7h)		;1d84	2a a7 40 	* . @ 
	dec hl			;1d87	2b 	+ 
	dec hl			;1d88	2b 	+ 
	dec hl			;1d89	2b 	+ 
	ld (de),a			;1d8a	12 	. 
	inc de			;1d8b	13 	. 
	ld (de),a			;1d8c	12 	. 
	inc de			;1d8d	13 	. 
	ld (de),a			;1d8e	12 	. 
	ret			;1d8f	c9 	. 
	ld a,h			;1d90	7c 	| 
	sub d			;1d91	92 	. 
	ret nz			;1d92	c0 	. 
	ld a,l			;1d93	7d 	} 
	sub e			;1d94	93 	. 
	ret			;1d95	c9 	. 
	ld a,(hl)			;1d96	7e 	~ 
	ex (sp),hl			;1d97	e3 	. 
	cp (hl)			;1d98	be 	. 
	inc hl			;1d99	23 	# 
	ex (sp),hl			;1d9a	e3 	. 
	jp z,01d78h		;1d9b	ca 78 1d 	. x . 
	jp 01997h		;1d9e	c3 97 19 	. . . 
	ld a,064h		;1da1	3e 64 	> d 
	ld (040dch),a		;1da3	32 dc 40 	2 . @ 
	call 01f21h		;1da6	cd 21 1f 	. ! . 
	ex (sp),hl			;1da9	e3 	. 
	call 01936h		;1daa	cd 36 19 	. 6 . 
	pop de			;1dad	d1 	. 
	jr nz,$+7		;1dae	20 05 	  . 
	add hl,bc			;1db0	09 	. 
	ld sp,hl			;1db1	f9 	. 
	ld (040e8h),hl		;1db2	22 e8 40 	" . @ 
	ex de,hl			;1db5	eb 	. 
	ld c,008h		;1db6	0e 08 	. . 
	call 01963h		;1db8	cd 63 19 	. c . 
	push hl			;1dbb	e5 	. 
	call 01f05h		;1dbc	cd 05 1f 	. . . 
	ex (sp),hl			;1dbf	e3 	. 
	push hl			;1dc0	e5 	. 
	ld hl,(040a2h)		;1dc1	2a a2 40 	* . @ 
	ex (sp),hl			;1dc4	e3 	. 
	rst 8			;1dc5	cf 	. 
	cp l			;1dc6	bd 	. 
	rst 20h			;1dc7	e7 	. 
	jp z,00af6h		;1dc8	ca f6 0a 	. . . 
	jp nc,00af6h		;1dcb	d2 f6 0a 	. . . 
	push af			;1dce	f5 	. 
	call 02337h		;1dcf	cd 37 23 	. 7 # 
	pop af			;1dd2	f1 	. 
	push hl			;1dd3	e5 	. 
	jp p,01cech		;1dd4	f2 ec 1c 	. . . 
	call 00a7fh		;1dd7	cd 7f 0a 	.  . 
	ex (sp),hl			;1dda	e3 	. 
	ld de,00001h		;1ddb	11 01 00 	. . . 
	ld a,(hl)			;1dde	7e 	~ 
	cp 0cch		;1ddf	fe cc 	. . 
	call z,02b01h		;1de1	cc 01 2b 	. . + 
	push de			;1de4	d5 	. 
	push hl			;1de5	e5 	. 
	ex de,hl			;1de6	eb 	. 
	call 0099eh		;1de7	cd 9e 09 	. . . 
	jr $+36		;1dea	18 22 	. " 
	call 00ab1h		;1dec	cd b1 0a 	. . . 
	call 009bfh		;1def	cd bf 09 	. . . 
	pop hl			;1df2	e1 	. 
	push bc			;1df3	c5 	. 
	push de			;1df4	d5 	. 
	ld bc,08100h		;1df5	01 00 81 	. . . 
	ld d,c			;1df8	51 	Q 
	ld e,d			;1df9	5a 	Z 
	ld a,(hl)			;1dfa	7e 	~ 
	cp 0cch		;1dfb	fe cc 	. . 
	ld a,001h		;1dfd	3e 01 	> . 
	jr nz,$+16		;1dff	20 0e 	  . 
	call 02338h		;1e01	cd 38 23 	. 8 # 
	push hl			;1e04	e5 	. 
	call 00ab1h		;1e05	cd b1 0a 	. . . 
	call 009bfh		;1e08	cd bf 09 	. . . 
	call 00955h		;1e0b	cd 55 09 	. U . 
	pop hl			;1e0e	e1 	. 
	push bc			;1e0f	c5 	. 
	push de			;1e10	d5 	. 
	ld c,a			;1e11	4f 	O 
	rst 20h			;1e12	e7 	. 
	ld b,a			;1e13	47 	G 
	push bc			;1e14	c5 	. 
	push hl			;1e15	e5 	. 
	ld hl,(040dfh)		;1e16	2a df 40 	* . @ 
	ex (sp),hl			;1e19	e3 	. 
	ld b,081h		;1e1a	06 81 	. . 
	push bc			;1e1c	c5 	. 
	inc sp			;1e1d	33 	3 
	call 00358h		;1e1e	cd 58 03 	. X . 
	or a			;1e21	b7 	. 
	call nz,01da0h		;1e22	c4 a0 1d 	. . . 
	ld (040e6h),hl		;1e25	22 e6 40 	" . @ 
	ld (040e8h),sp		;1e28	ed 73 e8 40 	. s . @ 
	ld a,(hl)			;1e2c	7e 	~ 
	cp 03ah		;1e2d	fe 3a 	. : 
	jr z,$+43		;1e2f	28 29 	( ) 
	or a			;1e31	b7 	. 
	jp nz,01997h		;1e32	c2 97 19 	. . . 
	inc hl			;1e35	23 	# 
	ld a,(hl)			;1e36	7e 	~ 
	inc hl			;1e37	23 	# 
	or (hl)			;1e38	b6 	. 
	jp z,0197eh		;1e39	ca 7e 19 	. ~ . 
	inc hl			;1e3c	23 	# 
	ld e,(hl)			;1e3d	5e 	^ 
	inc hl			;1e3e	23 	# 
	ld d,(hl)			;1e3f	56 	V 
	ex de,hl			;1e40	eb 	. 
	ld (040a2h),hl		;1e41	22 a2 40 	" . @ 
	ld a,(0411bh)		;1e44	3a 1b 41 	: . A 
	or a			;1e47	b7 	. 
	jr z,$+17		;1e48	28 0f 	( . 
	push de			;1e4a	d5 	. 
	ld a,03ch		;1e4b	3e 3c 	> < 
	call 0032ah		;1e4d	cd 2a 03 	. * . 
	call 00fafh		;1e50	cd af 0f 	. . . 
	ld a,03eh		;1e53	3e 3e 	> > 
	call 0032ah		;1e55	cd 2a 03 	. * . 
	pop de			;1e58	d1 	. 
	ex de,hl			;1e59	eb 	. 
	rst 10h			;1e5a	d7 	. 
	ld de,01d1eh		;1e5b	11 1e 1d 	. . . 
	push de			;1e5e	d5 	. 
	ret z			;1e5f	c8 	. 
	sub 080h		;1e60	d6 80 	. . 
	jp c,01f21h		;1e62	da 21 1f 	. ! . 
	cp 03ch		;1e65	fe 3c 	. < 
	jp nc,02ae7h		;1e67	d2 e7 2a 	. . * 
	rlca			;1e6a	07 	. 
	ld c,a			;1e6b	4f 	O 
	ld b,000h		;1e6c	06 00 	. . 
	ex de,hl			;1e6e	eb 	. 
	ld hl,01822h		;1e6f	21 22 18 	! " . 
	add hl,bc			;1e72	09 	. 
	ld c,(hl)			;1e73	4e 	N 
	inc hl			;1e74	23 	# 
	ld b,(hl)			;1e75	46 	F 
	push bc			;1e76	c5 	. 
	ex de,hl			;1e77	eb 	. 
	inc hl			;1e78	23 	# 
	ld a,(hl)			;1e79	7e 	~ 
	cp 03ah		;1e7a	fe 3a 	. : 
	ret nc			;1e7c	d0 	. 
	cp 020h		;1e7d	fe 20 	.   
	jp z,01d78h		;1e7f	ca 78 1d 	. x . 
	cp 00bh		;1e82	fe 0b 	. . 
	jr nc,$+7		;1e84	30 05 	0 . 
	cp 009h		;1e86	fe 09 	. . 
	jp nc,01d78h		;1e88	d2 78 1d 	. x . 
	cp 030h		;1e8b	fe 30 	. 0 
	ccf			;1e8d	3f 	? 
	inc a			;1e8e	3c 	< 
	dec a			;1e8f	3d 	= 
	ret			;1e90	c9 	. 
	ex de,hl			;1e91	eb 	. 
	ld hl,(040a4h)		;1e92	2a a4 40 	* . @ 
	dec hl			;1e95	2b 	+ 
	ld (040ffh),hl		;1e96	22 ff 40 	" . @ 
	ex de,hl			;1e99	eb 	. 
	ret			;1e9a	c9 	. 
	call 00358h		;1e9b	cd 58 03 	. X . 
	or a			;1e9e	b7 	. 
	ret z			;1e9f	c8 	. 
	cp 060h		;1ea0	fe 60 	. ` 
	call z,00384h		;1ea2	cc 84 03 	. . . 
	ld (04099h),a		;1ea5	32 99 40 	2 . @ 
	dec a			;1ea8	3d 	= 
	ret nz			;1ea9	c0 	. 
	inc a			;1eaa	3c 	< 
	jp 01db4h		;1eab	c3 b4 1d 	. . . 
	ret nz			;1eae	c0 	. 
	push af			;1eaf	f5 	. 
	call z,041bbh		;1eb0	cc bb 41 	. . A 
	pop af			;1eb3	f1 	. 
	ld (040e6h),hl		;1eb4	22 e6 40 	" . @ 
	ld hl,040b5h		;1eb7	21 b5 40 	! . @ 
	ld (040b3h),hl		;1eba	22 b3 40 	" . @ 
	ld hl,0fff6h		;1ebd	21 f6 ff 	! . . 
	pop bc			;1ec0	c1 	. 
	ld hl,(040a2h)		;1ec1	2a a2 40 	* . @ 
	push hl			;1ec4	e5 	. 
	push af			;1ec5	f5 	. 
	ld a,l			;1ec6	7d 	} 
	and h			;1ec7	a4 	. 
	inc a			;1ec8	3c 	< 
	jr z,$+11		;1ec9	28 09 	( . 
	ld (040f5h),hl		;1ecb	22 f5 40 	" . @ 
	ld hl,(040e6h)		;1ece	2a e6 40 	* . @ 
	ld (040f7h),hl		;1ed1	22 f7 40 	" . @ 
	call 0038bh		;1ed4	cd 8b 03 	. . . 
	call 020f9h		;1ed7	cd f9 20 	. .   
	pop af			;1eda	f1 	. 
	ld hl,01930h		;1edb	21 30 19 	! 0 . 
	jp nz,01a06h		;1ede	c2 06 1a 	. . . 
	jp 01a18h		;1ee1	c3 18 1a 	. . . 
	ld hl,(040f7h)		;1ee4	2a f7 40 	* . @ 
	ld a,h			;1ee7	7c 	| 
	or l			;1ee8	b5 	. 
	ld e,020h		;1ee9	1e 20 	.   
	jp z,019a2h		;1eeb	ca a2 19 	. . . 
	ex de,hl			;1eee	eb 	. 
	ld hl,(040f5h)		;1eef	2a f5 40 	* . @ 
	ld (040a2h),hl		;1ef2	22 a2 40 	" . @ 
	ex de,hl			;1ef5	eb 	. 
	ret			;1ef6	c9 	. 
	ld a,0afh		;1ef7	3e af 	> . 
	ld (0411bh),a		;1ef9	32 1b 41 	2 . A 
	ret			;1efc	c9 	. 
	pop af			;1efd	f1 	. 
	pop hl			;1efe	e1 	. 
	ret			;1eff	c9 	. 
	ld e,003h		;1f00	1e 03 	. . 
	ld bc,0021eh		;1f02	01 1e 02 	. . . 
	ld bc,0041eh		;1f05	01 1e 04 	. . . 
	ld bc,0081eh		;1f08	01 1e 08 	. . . 
	call 01e3dh		;1f0b	cd 3d 1e 	. = . 
	ld bc,01997h		;1f0e	01 97 19 	. . . 
	push bc			;1f11	c5 	. 
	ret c			;1f12	d8 	. 
	sub 041h		;1f13	d6 41 	. A 
	ld c,a			;1f15	4f 	O 
	ld b,a			;1f16	47 	G 
	rst 10h			;1f17	d7 	. 
	cp 0ceh		;1f18	fe ce 	. . 
	jr nz,$+11		;1f1a	20 09 	  . 
	rst 10h			;1f1c	d7 	. 
	call 01e3dh		;1f1d	cd 3d 1e 	. = . 
	ret c			;1f20	d8 	. 
	sub 041h		;1f21	d6 41 	. A 
	ld b,a			;1f23	47 	G 
	rst 10h			;1f24	d7 	. 
	ld a,b			;1f25	78 	x 
	sub c			;1f26	91 	. 
	ret c			;1f27	d8 	. 
	inc a			;1f28	3c 	< 
	ex (sp),hl			;1f29	e3 	. 
	ld hl,04101h		;1f2a	21 01 41 	! . A 
	ld b,000h		;1f2d	06 00 	. . 
	add hl,bc			;1f2f	09 	. 
	ld (hl),e			;1f30	73 	s 
	inc hl			;1f31	23 	# 
	dec a			;1f32	3d 	= 
	jr nz,$-3		;1f33	20 fb 	  . 
	pop hl			;1f35	e1 	. 
	ld a,(hl)			;1f36	7e 	~ 
	cp 02ch		;1f37	fe 2c 	. , 
	ret nz			;1f39	c0 	. 
	rst 10h			;1f3a	d7 	. 
	jr $-48		;1f3b	18 ce 	. . 
	ld a,(hl)			;1f3d	7e 	~ 
	cp 041h		;1f3e	fe 41 	. A 
	ret c			;1f40	d8 	. 
	cp 05bh		;1f41	fe 5b 	. [ 
	ccf			;1f43	3f 	? 
	ret			;1f44	c9 	. 
	rst 10h			;1f45	d7 	. 
	call 02b02h		;1f46	cd 02 2b 	. . + 
	ret p			;1f49	f0 	. 
	ld e,008h		;1f4a	1e 08 	. . 
	jp 019a2h		;1f4c	c3 a2 19 	. . . 
	ld a,(hl)			;1f4f	7e 	~ 
	cp 02eh		;1f50	fe 2e 	. . 
	ex de,hl			;1f52	eb 	. 
	ld hl,(040ech)		;1f53	2a ec 40 	* . @ 
	ex de,hl			;1f56	eb 	. 
	jp z,01d78h		;1f57	ca 78 1d 	. x . 
	dec hl			;1f5a	2b 	+ 
	ld de,00000h		;1f5b	11 00 00 	. . . 
	rst 10h			;1f5e	d7 	. 
	ret nc			;1f5f	d0 	. 
	push hl			;1f60	e5 	. 
	push af			;1f61	f5 	. 
	ld hl,01998h		;1f62	21 98 19 	! . . 
	rst 18h			;1f65	df 	. 
	jp c,01997h		;1f66	da 97 19 	. . . 
	ld h,d			;1f69	62 	b 
	ld l,e			;1f6a	6b 	k 
	add hl,de			;1f6b	19 	. 
	add hl,hl			;1f6c	29 	) 
	add hl,de			;1f6d	19 	. 
	add hl,hl			;1f6e	29 	) 
	pop af			;1f6f	f1 	. 
	sub 030h		;1f70	d6 30 	. 0 
	ld e,a			;1f72	5f 	_ 
	ld d,000h		;1f73	16 00 	. . 
	add hl,de			;1f75	19 	. 
	ex de,hl			;1f76	eb 	. 
	pop hl			;1f77	e1 	. 
	jr $-26		;1f78	18 e4 	. . 
	jp z,01b61h		;1f7a	ca 61 1b 	. a . 
	call 01e46h		;1f7d	cd 46 1e 	. F . 
	dec hl			;1f80	2b 	+ 
	rst 10h			;1f81	d7 	. 
	ret nz			;1f82	c0 	. 
	push hl			;1f83	e5 	. 
	ld hl,(040b1h)		;1f84	2a b1 40 	* . @ 
	ld a,l			;1f87	7d 	} 
	sub e			;1f88	93 	. 
	ld e,a			;1f89	5f 	_ 
	ld a,h			;1f8a	7c 	| 
	sbc a,d			;1f8b	9a 	. 
	ld d,a			;1f8c	57 	W 
	jp c,0197ah		;1f8d	da 7a 19 	. z . 
	ld hl,(040f9h)		;1f90	2a f9 40 	* . @ 
	ld bc,00028h		;1f93	01 28 00 	. ( . 
	add hl,bc			;1f96	09 	. 
	rst 18h			;1f97	df 	. 
	jp nc,0197ah		;1f98	d2 7a 19 	. z . 
	ex de,hl			;1f9b	eb 	. 
	ld (040a0h),hl		;1f9c	22 a0 40 	" . @ 
	pop hl			;1f9f	e1 	. 
	jp 01b61h		;1fa0	c3 61 1b 	. a . 
	jp z,01b5dh		;1fa3	ca 5d 1b 	. ] . 
	call 041c7h		;1fa6	cd c7 41 	. . A 
	call 01b61h		;1fa9	cd 61 1b 	. a . 
	ld bc,01d1eh		;1fac	01 1e 1d 	. . . 
	jr $+18		;1faf	18 10 	. . 
	ld c,003h		;1fb1	0e 03 	. . 
	call 01963h		;1fb3	cd 63 19 	. c . 
	pop bc			;1fb6	c1 	. 
	push hl			;1fb7	e5 	. 
	push hl			;1fb8	e5 	. 
	ld hl,(040a2h)		;1fb9	2a a2 40 	* . @ 
	ex (sp),hl			;1fbc	e3 	. 
	ld a,091h		;1fbd	3e 91 	> . 
	push af			;1fbf	f5 	. 
	inc sp			;1fc0	33 	3 
	push bc			;1fc1	c5 	. 
	call 01e5ah		;1fc2	cd 5a 1e 	. Z . 
	call 01f07h		;1fc5	cd 07 1f 	. . . 
	push hl			;1fc8	e5 	. 
	ld hl,(040a2h)		;1fc9	2a a2 40 	* . @ 
	rst 18h			;1fcc	df 	. 
	pop hl			;1fcd	e1 	. 
	inc hl			;1fce	23 	# 
	call c,01b2fh		;1fcf	dc 2f 1b 	. / . 
	call nc,01b2ch		;1fd2	d4 2c 1b 	. , . 
	ld h,b			;1fd5	60 	` 
	ld l,c			;1fd6	69 	i 
	dec hl			;1fd7	2b 	+ 
	ret c			;1fd8	d8 	. 
	ld e,00eh		;1fd9	1e 0e 	. . 
	jp 019a2h		;1fdb	c3 a2 19 	. . . 
	ret nz			;1fde	c0 	. 
	ld d,0ffh		;1fdf	16 ff 	. . 
	call 01936h		;1fe1	cd 36 19 	. 6 . 
	ld sp,hl			;1fe4	f9 	. 
	ld (040e8h),hl		;1fe5	22 e8 40 	" . @ 
	cp 091h		;1fe8	fe 91 	. . 
	ld e,004h		;1fea	1e 04 	. . 
	jp nz,019a2h		;1fec	c2 a2 19 	. . . 
	pop hl			;1fef	e1 	. 
	ld (040a2h),hl		;1ff0	22 a2 40 	" . @ 
	inc hl			;1ff3	23 	# 
	ld a,h			;1ff4	7c 	| 
	or l			;1ff5	b5 	. 
	jr nz,$+9		;1ff6	20 07 	  . 
	ld a,(040ddh)		;1ff8	3a dd 40 	: . @ 
	or a			;1ffb	b7 	. 
	jp nz,01a18h		;1ffc	c2 18 1a 	. . . 
	ld hl,01d1eh		;1fff	21 1e 1d 	! . . 
	ex (sp),hl			;2002	e3 	. 
	ld a,0e1h		;2003	3e e1 	> . 
	ld bc,00e3ah		;2005	01 3a 0e 	. : . 
	nop			;2008	00 	. 
	ld b,000h		;2009	06 00 	. . 
	ld a,c			;200b	79 	y 
	ld c,b			;200c	48 	H 
	ld b,a			;200d	47 	G 
	ld a,(hl)			;200e	7e 	~ 
	or a			;200f	b7 	. 
	ret z			;2010	c8 	. 
	cp b			;2011	b8 	. 
	ret z			;2012	c8 	. 
	inc hl			;2013	23 	# 
	cp 022h		;2014	fe 22 	. " 
	jr z,$-11		;2016	28 f3 	( . 
	sub 08fh		;2018	d6 8f 	. . 
	jr nz,$-12		;201a	20 f2 	  . 
	cp b			;201c	b8 	. 
	adc a,d			;201d	8a 	. 
	ld d,a			;201e	57 	W 
	jr $-17		;201f	18 ed 	. . 
	call 0260dh		;2021	cd 0d 26 	. . & 
	rst 8			;2024	cf 	. 
	push de			;2025	d5 	. 
	ex de,hl			;2026	eb 	. 
	ld (040dfh),hl		;2027	22 df 40 	" . @ 
	ex de,hl			;202a	eb 	. 
	push de			;202b	d5 	. 
	rst 20h			;202c	e7 	. 
	push af			;202d	f5 	. 
	call 02337h		;202e	cd 37 23 	. 7 # 
	pop af			;2031	f1 	. 
	ex (sp),hl			;2032	e3 	. 
	add a,003h		;2033	c6 03 	. . 
	call 02819h		;2035	cd 19 28 	. . ( 
	call 00a03h		;2038	cd 03 0a 	. . . 
	push hl			;203b	e5 	. 
	jr nz,$+42		;203c	20 28 	  ( 
	ld hl,(04121h)		;203e	2a 21 41 	* ! A 
	push hl			;2041	e5 	. 
	inc hl			;2042	23 	# 
	ld e,(hl)			;2043	5e 	^ 
	inc hl			;2044	23 	# 
	ld d,(hl)			;2045	56 	V 
	ld hl,(040a4h)		;2046	2a a4 40 	* . @ 
	rst 18h			;2049	df 	. 
	jr nc,$+16		;204a	30 0e 	0 . 
	ld hl,(040a0h)		;204c	2a a0 40 	* . @ 
	rst 18h			;204f	df 	. 
	pop de			;2050	d1 	. 
	jr nc,$+17		;2051	30 0f 	0 . 
	ld hl,(040f9h)		;2053	2a f9 40 	* . @ 
	rst 18h			;2056	df 	. 
	jr nc,$+11		;2057	30 09 	0 . 
	ld a,0d1h		;2059	3e d1 	> . 
	call 029f5h		;205b	cd f5 29 	. . ) 
	ex de,hl			;205e	eb 	. 
	call 02843h		;205f	cd 43 28 	. C ( 
	call 029f5h		;2062	cd f5 29 	. . ) 
	ex (sp),hl			;2065	e3 	. 
	call 009d3h		;2066	cd d3 09 	. . . 
	pop de			;2069	d1 	. 
	pop hl			;206a	e1 	. 
	ret			;206b	c9 	. 
	cp 09eh		;206c	fe 9e 	. . 
	jr nz,$+39		;206e	20 25 	  % 
	rst 10h			;2070	d7 	. 
	rst 8			;2071	cf 	. 
	adc a,l			;2072	8d 	. 
	call 01e5ah		;2073	cd 5a 1e 	. Z . 
	ld a,d			;2076	7a 	z 
	or e			;2077	b3 	. 
	jr z,$+11		;2078	28 09 	( . 
	call 01b2ah		;207a	cd 2a 1b 	. * . 
	ld d,b			;207d	50 	P 
	ld e,c			;207e	59 	Y 
	pop hl			;207f	e1 	. 
	jp nc,01ed9h		;2080	d2 d9 1e 	. . . 
	ex de,hl			;2083	eb 	. 
	ld (040f0h),hl		;2084	22 f0 40 	" . @ 
	ex de,hl			;2087	eb 	. 
	ret c			;2088	d8 	. 
	ld a,(040f2h)		;2089	3a f2 40 	: . @ 
	or a			;208c	b7 	. 
	ret z			;208d	c8 	. 
	ld a,(0409ah)		;208e	3a 9a 40 	: . @ 
	ld e,a			;2091	5f 	_ 
	jp 019abh		;2092	c3 ab 19 	. . . 
	call 02b1ch		;2095	cd 1c 2b 	. . + 
	ld a,(hl)			;2098	7e 	~ 
	ld b,a			;2099	47 	G 
	cp 091h		;209a	fe 91 	. . 
	jr z,$+5		;209c	28 03 	( . 
	rst 8			;209e	cf 	. 
	adc a,l			;209f	8d 	. 
	dec hl			;20a0	2b 	+ 
	ld c,e			;20a1	4b 	K 
	dec c			;20a2	0d 	. 
	ld a,b			;20a3	78 	x 
	jp z,01d60h		;20a4	ca 60 1d 	. ` . 
	call 01e5bh		;20a7	cd 5b 1e 	. [ . 
	cp 02ch		;20aa	fe 2c 	. , 
	ret nz			;20ac	c0 	. 
	jr $-11		;20ad	18 f3 	. . 
	ld de,040f2h		;20af	11 f2 40 	. . @ 
	ld a,(de)			;20b2	1a 	. 
	or a			;20b3	b7 	. 
	jp z,019a0h		;20b4	ca a0 19 	. . . 
	inc a			;20b7	3c 	< 
	ld (0409ah),a		;20b8	32 9a 40 	2 . @ 
	ld (de),a			;20bb	12 	. 
	ld a,(hl)			;20bc	7e 	~ 
	cp 087h		;20bd	fe 87 	. . 
	jr z,$+14		;20bf	28 0c 	( . 
	call 01e5ah		;20c1	cd 5a 1e 	. Z . 
	ret nz			;20c4	c0 	. 
	ld a,d			;20c5	7a 	z 
	or e			;20c6	b3 	. 
	jp nz,01ec5h		;20c7	c2 c5 1e 	. . . 
	inc a			;20ca	3c 	< 
	jr $+4		;20cb	18 02 	. . 
	rst 10h			;20cd	d7 	. 
	ret nz			;20ce	c0 	. 
	ld hl,(040eeh)		;20cf	2a ee 40 	* . @ 
	ex de,hl			;20d2	eb 	. 
	ld hl,(040eah)		;20d3	2a ea 40 	* . @ 
	ld (040a2h),hl		;20d6	22 a2 40 	" . @ 
	ex de,hl			;20d9	eb 	. 
	ret nz			;20da	c0 	. 
	ld a,(hl)			;20db	7e 	~ 
	or a			;20dc	b7 	. 
	jr nz,$+6		;20dd	20 04 	  . 
	inc hl			;20df	23 	# 
	inc hl			;20e0	23 	# 
	inc hl			;20e1	23 	# 
	inc hl			;20e2	23 	# 
	inc hl			;20e3	23 	# 
	ld a,d			;20e4	7a 	z 
	and e			;20e5	a3 	. 
	inc a			;20e6	3c 	< 
	jp nz,01f05h		;20e7	c2 05 1f 	. . . 
	ld a,(040ddh)		;20ea	3a dd 40 	: . @ 
	dec a			;20ed	3d 	= 
	jp z,01dbeh		;20ee	ca be 1d 	. . . 
	jp 01f05h		;20f1	c3 05 1f 	. . . 
	call 02b1ch		;20f4	cd 1c 2b 	. . + 
	ret nz			;20f7	c0 	. 
	or a			;20f8	b7 	. 
	jp z,01e4ah		;20f9	ca 4a 1e 	. J . 
	dec a			;20fc	3d 	= 
	add a,a			;20fd	87 	. 
	ld e,a			;20fe	5f 	_ 
	cp 02dh		;20ff	fe 2d 	. - 
	jr c,$+4		;2101	38 02 	8 . 
	ld e,026h		;2103	1e 26 	. & 
	jp 019a2h		;2105	c3 a2 19 	. . . 
	ld de,0000ah		;2108	11 0a 00 	. . . 
	push de			;210b	d5 	. 
	jr z,$+25		;210c	28 17 	( . 
	call 01e4fh		;210e	cd 4f 1e 	. O . 
	ex de,hl			;2111	eb 	. 
	ex (sp),hl			;2112	e3 	. 
	jr z,$+19		;2113	28 11 	( . 
	ex de,hl			;2115	eb 	. 
	rst 8			;2116	cf 	. 
	inc l			;2117	2c 	, 
	ex de,hl			;2118	eb 	. 
	ld hl,(040e4h)		;2119	2a e4 40 	* . @ 
	ex de,hl			;211c	eb 	. 
	jr z,$+8		;211d	28 06 	( . 
	call 01e5ah		;211f	cd 5a 1e 	. Z . 
	jp nz,01997h		;2122	c2 97 19 	. . . 
	ex de,hl			;2125	eb 	. 
	ld a,h			;2126	7c 	| 
	or l			;2127	b5 	. 
	jp z,01e4ah		;2128	ca 4a 1e 	. J . 
	ld (040e4h),hl		;212b	22 e4 40 	" . @ 
	ld (040e1h),a		;212e	32 e1 40 	2 . @ 
	pop hl			;2131	e1 	. 
	ld (040e2h),hl		;2132	22 e2 40 	" . @ 
	pop bc			;2135	c1 	. 
	jp 01a33h		;2136	c3 33 1a 	. 3 . 
	call 02337h		;2139	cd 37 23 	. 7 # 
	ld a,(hl)			;213c	7e 	~ 
	cp 02ch		;213d	fe 2c 	. , 
	call z,01d78h		;213f	cc 78 1d 	. x . 
	cp 0cah		;2142	fe ca 	. . 
	call z,01d78h		;2144	cc 78 1d 	. x . 
	dec hl			;2147	2b 	+ 
	push hl			;2148	e5 	. 
	call 00994h		;2149	cd 94 09 	. . . 
	pop hl			;214c	e1 	. 
	jr z,$+9		;214d	28 07 	( . 
	rst 10h			;214f	d7 	. 
	jp c,01ec2h		;2150	da c2 1e 	. . . 
	jp 01d5fh		;2153	c3 5f 1d 	. _ . 
	ld d,001h		;2156	16 01 	. . 
	call 01f05h		;2158	cd 05 1f 	. . . 
	or a			;215b	b7 	. 
	ret z			;215c	c8 	. 
	rst 10h			;215d	d7 	. 
	cp 095h		;215e	fe 95 	. . 
	jr nz,$-8		;2160	20 f6 	  . 
	dec d			;2162	15 	. 
	jr nz,$-11		;2163	20 f3 	  . 
	jr $-22		;2165	18 e8 	. . 
	ld a,001h		;2167	3e 01 	> . 
	ld (0409ch),a		;2169	32 9c 40 	2 . @ 
	jp 0209bh		;216c	c3 9b 20 	. .   
	call 041cah		;216f	cd ca 41 	. . A 
	cp 040h		;2172	fe 40 	. @ 
	jr nz,$+27		;2174	20 19 	  . 
	call 02b01h		;2176	cd 01 2b 	. . + 
	cp 004h		;2179	fe 04 	. . 
	jp nc,01e4ah		;217b	d2 4a 1e 	. J . 
	push hl			;217e	e5 	. 
	ld hl,03c00h		;217f	21 00 3c 	! . < 
	add hl,de			;2182	19 	. 
	ld (04020h),hl		;2183	22 20 40 	"   @ 
	ld a,e			;2186	7b 	{ 
	and 03fh		;2187	e6 3f 	. ? 
	ld (040a6h),a		;2189	32 a6 40 	2 . @ 
	pop hl			;218c	e1 	. 
	rst 8			;218d	cf 	. 
	inc l			;218e	2c 	, 
	cp 023h		;218f	fe 23 	. # 
	jr nz,$+10		;2191	20 08 	  . 
	call 00284h		;2193	cd 84 02 	. . . 
	ld a,080h		;2196	3e 80 	> . 
	ld (0409ch),a		;2198	32 9c 40 	2 . @ 
	dec hl			;219b	2b 	+ 
	rst 10h			;219c	d7 	. 
	call z,020feh		;219d	cc fe 20 	. .   
	jp z,02169h		;21a0	ca 69 21 	. i ! 
	cp 0bfh		;21a3	fe bf 	. . 
	jp z,02cbdh		;21a5	ca bd 2c 	. . , 
	cp 0bch		;21a8	fe bc 	. . 
	jp z,02137h		;21aa	ca 37 21 	. 7 ! 
	push hl			;21ad	e5 	. 
	cp 02ch		;21ae	fe 2c 	. , 
	jp z,02108h		;21b0	ca 08 21 	. . ! 
	cp 03bh		;21b3	fe 3b 	. ; 
	jp z,02164h		;21b5	ca 64 21 	. d ! 
	pop bc			;21b8	c1 	. 
	call 02337h		;21b9	cd 37 23 	. 7 # 
	push hl			;21bc	e5 	. 
	rst 20h			;21bd	e7 	. 
	jr z,$+52		;21be	28 32 	( 2 
	call 00fbdh		;21c0	cd bd 0f 	. . . 
	call 02865h		;21c3	cd 65 28 	. e ( 
	call 041cdh		;21c6	cd cd 41 	. . A 
	ld hl,(04121h)		;21c9	2a 21 41 	* ! A 
	ld a,(0409ch)		;21cc	3a 9c 40 	: . @ 
	or a			;21cf	b7 	. 
	jp m,020e9h		;21d0	fa e9 20 	. .   
	jr z,$+10		;21d3	28 08 	( . 
	ld a,(0409bh)		;21d5	3a 9b 40 	: . @ 
	add a,(hl)			;21d8	86 	. 
	cp 084h		;21d9	fe 84 	. . 
	jr $+11		;21db	18 09 	. . 
	ld a,(0409dh)		;21dd	3a 9d 40 	: . @ 
	ld b,a			;21e0	47 	G 
	ld a,(040a6h)		;21e1	3a a6 40 	: . @ 
	add a,(hl)			;21e4	86 	. 
	cp b			;21e5	b8 	. 
	call nc,020feh		;21e6	d4 fe 20 	. .   
	call 028aah		;21e9	cd aa 28 	. . ( 
	ld a,020h		;21ec	3e 20 	>   
	call 0032ah		;21ee	cd 2a 03 	. * . 
	or a			;21f1	b7 	. 
	call z,028aah		;21f2	cc aa 28 	. . ( 
	pop hl			;21f5	e1 	. 
	jp 0209bh		;21f6	c3 9b 20 	. .   
	ld a,(040a6h)		;21f9	3a a6 40 	: . @ 
	or a			;21fc	b7 	. 
	ret z			;21fd	c8 	. 
	ld a,00dh		;21fe	3e 0d 	> . 
	call 0032ah		;2200	cd 2a 03 	. * . 
	call 041d0h		;2203	cd d0 41 	. . A 
	xor a			;2206	af 	. 
	ret			;2207	c9 	. 
	call 041d3h		;2208	cd d3 41 	. . A 
	ld a,(0409ch)		;220b	3a 9c 40 	: . @ 
	or a			;220e	b7 	. 
	jp p,02119h		;220f	f2 19 21 	. . ! 
	ld a,02ch		;2212	3e 2c 	> , 
	call 0032ah		;2214	cd 2a 03 	. * . 
	jr $+77		;2217	18 4b 	. K 
	jr z,$+10		;2219	28 08 	( . 
	ld a,(0409bh)		;221b	3a 9b 40 	: . @ 
	cp 070h		;221e	fe 70 	. p 
	jp 0212bh		;2220	c3 2b 21 	. + ! 
	ld a,(0409eh)		;2223	3a 9e 40 	: . @ 
	ld b,a			;2226	47 	G 
	ld a,(040a6h)		;2227	3a a6 40 	: . @ 
	cp b			;222a	b8 	. 
	call nc,020feh		;222b	d4 fe 20 	. .   
	jr nc,$+54		;222e	30 34 	0 4 
	sub 010h		;2230	d6 10 	. . 
	jr nc,$-2		;2232	30 fc 	0 . 
	cpl			;2234	2f 	/ 
	jr $+37		;2235	18 23 	. # 
	call 02b1bh		;2237	cd 1b 2b 	. . + 
	and 03fh		;223a	e6 3f 	. ? 
	ld e,a			;223c	5f 	_ 
	rst 8			;223d	cf 	. 
	add hl,hl			;223e	29 	) 
	dec hl			;223f	2b 	+ 
	push hl			;2240	e5 	. 
	call 041d3h		;2241	cd d3 41 	. . A 
	ld a,(0409ch)		;2244	3a 9c 40 	: . @ 
	or a			;2247	b7 	. 
	jp m,01e4ah		;2248	fa 4a 1e 	. J . 
	jp z,02153h		;224b	ca 53 21 	. S ! 
	ld a,(0409bh)		;224e	3a 9b 40 	: . @ 
	jr $+5		;2251	18 03 	. . 
	ld a,(040a6h)		;2253	3a a6 40 	: . @ 
	cpl			;2256	2f 	/ 
	add a,e			;2257	83 	. 
	jr nc,$+12		;2258	30 0a 	0 . 
	inc a			;225a	3c 	< 
	ld b,a			;225b	47 	G 
	ld a,020h		;225c	3e 20 	>   
	call 0032ah		;225e	cd 2a 03 	. * . 
	dec b			;2261	05 	. 
	jr nz,$-4		;2262	20 fa 	  . 
	pop hl			;2264	e1 	. 
	rst 10h			;2265	d7 	. 
	jp 020a0h		;2266	c3 a0 20 	. .   
	ld a,(0409ch)		;2269	3a 9c 40 	: . @ 
	or a			;226c	b7 	. 
	call m,001f8h		;226d	fc f8 01 	. . . 
	xor a			;2270	af 	. 
	ld (0409ch),a		;2271	32 9c 40 	2 . @ 
	call 041beh		;2274	cd be 41 	. . A 
	ret			;2277	c9 	. 
	ccf			;2278	3f 	? 
	ld d,d			;2279	52 	R 
	ld b,l			;227a	45 	E 
	ld b,h			;227b	44 	D 
	ld c,a			;227c	4f 	O 
	dec c			;227d	0d 	. 
	nop			;227e	00 	. 
	ld a,(040deh)		;227f	3a de 40 	: . @ 
	or a			;2282	b7 	. 
	jp nz,01991h		;2283	c2 91 19 	. . . 
	ld a,(040a9h)		;2286	3a a9 40 	: . @ 
	or a			;2289	b7 	. 
	ld e,02ah		;228a	1e 2a 	. * 
	jp z,019a2h		;228c	ca a2 19 	. . . 
	pop bc			;228f	c1 	. 
	ld hl,02178h		;2290	21 78 21 	! x ! 
	call 028a7h		;2293	cd a7 28 	. . ( 
	ld hl,(040e6h)		;2296	2a e6 40 	* . @ 
	ret			;2299	c9 	. 
	call 02828h		;229a	cd 28 28 	. ( ( 
	ld a,(hl)			;229d	7e 	~ 
	call 041d6h		;229e	cd d6 41 	. . A 
	sub 023h		;22a1	d6 23 	. # 
	ld (040a9h),a		;22a3	32 a9 40 	2 . @ 
	ld a,(hl)			;22a6	7e 	~ 
	jr nz,$+34		;22a7	20 20 	    
	call 00293h		;22a9	cd 93 02 	. . . 
	push hl			;22ac	e5 	. 
	ld b,0fah		;22ad	06 fa 	. . 
	ld hl,(040a7h)		;22af	2a a7 40 	* . @ 
	call 00235h		;22b2	cd 35 02 	. 5 . 
	ld (hl),a			;22b5	77 	w 
	inc hl			;22b6	23 	# 
	cp 00dh		;22b7	fe 0d 	. . 
	jr z,$+4		;22b9	28 02 	( . 
	djnz $-9		;22bb	10 f5 	. . 
	dec hl			;22bd	2b 	+ 
	ld (hl),000h		;22be	36 00 	6 . 
	call 001f8h		;22c0	cd f8 01 	. . . 
	ld hl,(040a7h)		;22c3	2a a7 40 	* . @ 
	dec hl			;22c6	2b 	+ 
	jr $+36		;22c7	18 22 	. " 
	ld bc,021dbh		;22c9	01 db 21 	. . ! 
	push bc			;22cc	c5 	. 
	cp 022h		;22cd	fe 22 	. " 
	ret nz			;22cf	c0 	. 
	call 02866h		;22d0	cd 66 28 	. f ( 
	rst 8			;22d3	cf 	. 
	dec sp			;22d4	3b 	; 
	push hl			;22d5	e5 	. 
	call 028aah		;22d6	cd aa 28 	. . ( 
	pop hl			;22d9	e1 	. 
	ret			;22da	c9 	. 
	push hl			;22db	e5 	. 
	call 01bb3h		;22dc	cd b3 1b 	. . . 
	pop bc			;22df	c1 	. 
	jp c,01dbeh		;22e0	da be 1d 	. . . 
	inc hl			;22e3	23 	# 
	ld a,(hl)			;22e4	7e 	~ 
	or a			;22e5	b7 	. 
	dec hl			;22e6	2b 	+ 
	push bc			;22e7	c5 	. 
	jp z,01f04h		;22e8	ca 04 1f 	. . . 
	ld (hl),02ch		;22eb	36 2c 	6 , 
	jr $+7		;22ed	18 05 	. . 
	push hl			;22ef	e5 	. 
	ld hl,(040ffh)		;22f0	2a ff 40 	* . @ 
	or 0afh		;22f3	f6 af 	. . 
	ld (040deh),a		;22f5	32 de 40 	2 . @ 
	ex (sp),hl			;22f8	e3 	. 
	jr $+4		;22f9	18 02 	. . 
	rst 8			;22fb	cf 	. 
	inc l			;22fc	2c 	, 
	call 0260dh		;22fd	cd 0d 26 	. . & 
	ex (sp),hl			;2300	e3 	. 
	push de			;2301	d5 	. 
	ld a,(hl)			;2302	7e 	~ 
	cp 02ch		;2303	fe 2c 	. , 
	jr z,$+40		;2305	28 26 	( & 
	ld a,(040deh)		;2307	3a de 40 	: . @ 
	or a			;230a	b7 	. 
	jp nz,02296h		;230b	c2 96 22 	. . " 
	ld a,(040a9h)		;230e	3a a9 40 	: . @ 
	or a			;2311	b7 	. 
	ld e,006h		;2312	1e 06 	. . 
	jp z,019a2h		;2314	ca a2 19 	. . . 
	ld a,03fh		;2317	3e 3f 	> ? 
	call 0032ah		;2319	cd 2a 03 	. * . 
	call 01bb3h		;231c	cd b3 1b 	. . . 
	pop de			;231f	d1 	. 
	pop bc			;2320	c1 	. 
	jp c,01dbeh		;2321	da be 1d 	. . . 
	inc hl			;2324	23 	# 
	ld a,(hl)			;2325	7e 	~ 
	or a			;2326	b7 	. 
	dec hl			;2327	2b 	+ 
	push bc			;2328	c5 	. 
	jp z,01f04h		;2329	ca 04 1f 	. . . 
	push de			;232c	d5 	. 
	call 041dch		;232d	cd dc 41 	. . A 
	rst 20h			;2330	e7 	. 
	push af			;2331	f5 	. 
	jr nz,$+27		;2332	20 19 	  . 
	rst 10h			;2334	d7 	. 
	ld d,a			;2335	57 	W 
	ld b,a			;2336	47 	G 
	cp 022h		;2337	fe 22 	. " 
	jr z,$+7		;2339	28 05 	( . 
	ld d,03ah		;233b	16 3a 	. : 
	ld b,02ch		;233d	06 2c 	. , 
	dec hl			;233f	2b 	+ 
	call 02869h		;2340	cd 69 28 	. i ( 
	pop af			;2343	f1 	. 
	ex de,hl			;2344	eb 	. 
	ld hl,0225ah		;2345	21 5a 22 	! Z " 
	ex (sp),hl			;2348	e3 	. 
	push de			;2349	d5 	. 
	jp 01f33h		;234a	c3 33 1f 	. 3 . 
	rst 10h			;234d	d7 	. 
	pop af			;234e	f1 	. 
	push af			;234f	f5 	. 
	ld bc,02243h		;2350	01 43 22 	. C " 
	push bc			;2353	c5 	. 
	jp c,00e6ch		;2354	da 6c 0e 	. l . 
	jp nc,00e65h		;2357	d2 65 0e 	. e . 
	dec hl			;235a	2b 	+ 
	rst 10h			;235b	d7 	. 
	jr z,$+7		;235c	28 05 	( . 
	cp 02ch		;235e	fe 2c 	. , 
	jp nz,0217fh		;2360	c2 7f 21 	.  ! 
	ex (sp),hl			;2363	e3 	. 
	dec hl			;2364	2b 	+ 
	rst 10h			;2365	d7 	. 
	jp nz,021fbh		;2366	c2 fb 21 	. . ! 
	pop de			;2369	d1 	. 
	nop			;236a	00 	. 
	nop			;236b	00 	. 
	nop			;236c	00 	. 
	nop			;236d	00 	. 
	nop			;236e	00 	. 
	ld a,(040deh)		;236f	3a de 40 	: . @ 
	or a			;2372	b7 	. 
	ex de,hl			;2373	eb 	. 
	jp nz,01d96h		;2374	c2 96 1d 	. . . 
	push de			;2377	d5 	. 
	call 041dfh		;2378	cd df 41 	. . A 
	or (hl)			;237b	b6 	. 
	ld hl,02286h		;237c	21 86 22 	! . " 
	call nz,028a7h		;237f	c4 a7 28 	. . ( 
	pop hl			;2382	e1 	. 
	jp 02169h		;2383	c3 69 21 	. i ! 
	ccf			;2386	3f 	? 
	ld b,l			;2387	45 	E 
	ld a,b			;2388	78 	x 
	ld (hl),h			;2389	74 	t 
	ld (hl),d			;238a	72 	r 
	ld h,c			;238b	61 	a 
	jr nz,$+107		;238c	20 69 	  i 
	ld h,a			;238e	67 	g 
	ld l,(hl)			;238f	6e 	n 
	ld l,a			;2390	6f 	o 
	ld (hl),d			;2391	72 	r 
	ld h,l			;2392	65 	e 
	ld h,h			;2393	64 	d 
	dec c			;2394	0d 	. 
	nop			;2395	00 	. 
	call 01f05h		;2396	cd 05 1f 	. . . 
	or a			;2399	b7 	. 
	jr nz,$+20		;239a	20 12 	  . 
	inc hl			;239c	23 	# 
	ld a,(hl)			;239d	7e 	~ 
	inc hl			;239e	23 	# 
	or (hl)			;239f	b6 	. 
	ld e,006h		;23a0	1e 06 	. . 
	jp z,019a2h		;23a2	ca a2 19 	. . . 
	inc hl			;23a5	23 	# 
	ld e,(hl)			;23a6	5e 	^ 
	inc hl			;23a7	23 	# 
	ld d,(hl)			;23a8	56 	V 
	ex de,hl			;23a9	eb 	. 
	ld (040dah),hl		;23aa	22 da 40 	" . @ 
	ex de,hl			;23ad	eb 	. 
	rst 10h			;23ae	d7 	. 
	cp 088h		;23af	fe 88 	. . 
	jr nz,$-27		;23b1	20 e3 	  . 
	jp 0222dh		;23b3	c3 2d 22 	. - " 
	ld de,00000h		;23b6	11 00 00 	. . . 
	call nz,0260dh		;23b9	c4 0d 26 	. . & 
	ld (040dfh),hl		;23bc	22 df 40 	" . @ 
	call 01936h		;23bf	cd 36 19 	. 6 . 
	jp nz,0199dh		;23c2	c2 9d 19 	. . . 
	ld sp,hl			;23c5	f9 	. 
	ld (040e8h),hl		;23c6	22 e8 40 	" . @ 
	push de			;23c9	d5 	. 
	ld a,(hl)			;23ca	7e 	~ 
	inc hl			;23cb	23 	# 
	push af			;23cc	f5 	. 
	push de			;23cd	d5 	. 
	ld a,(hl)			;23ce	7e 	~ 
	inc hl			;23cf	23 	# 
	or a			;23d0	b7 	. 
	jp m,022eah		;23d1	fa ea 22 	. . " 
	call 009b1h		;23d4	cd b1 09 	. . . 
	ex (sp),hl			;23d7	e3 	. 
	push hl			;23d8	e5 	. 
	call 0070bh		;23d9	cd 0b 07 	. . . 
	pop hl			;23dc	e1 	. 
	call 009cbh		;23dd	cd cb 09 	. . . 
	pop hl			;23e0	e1 	. 
	call 009c2h		;23e1	cd c2 09 	. . . 
	push hl			;23e4	e5 	. 
	call 00a0ch		;23e5	cd 0c 0a 	. . . 
	jr $+43		;23e8	18 29 	. ) 
	inc hl			;23ea	23 	# 
	inc hl			;23eb	23 	# 
	inc hl			;23ec	23 	# 
	inc hl			;23ed	23 	# 
	ld c,(hl)			;23ee	4e 	N 
	inc hl			;23ef	23 	# 
	ld b,(hl)			;23f0	46 	F 
	inc hl			;23f1	23 	# 
	ex (sp),hl			;23f2	e3 	. 
	ld e,(hl)			;23f3	5e 	^ 
	inc hl			;23f4	23 	# 
	ld d,(hl)			;23f5	56 	V 
	push hl			;23f6	e5 	. 
	ld l,c			;23f7	69 	i 
	ld h,b			;23f8	60 	` 
	call 00bd2h		;23f9	cd d2 0b 	. . . 
	ld a,(040afh)		;23fc	3a af 40 	: . @ 
	cp 004h		;23ff	fe 04 	. . 
	jp z,007b2h		;2401	ca b2 07 	. . . 
	ex de,hl			;2404	eb 	. 
	pop hl			;2405	e1 	. 
	ld (hl),d			;2406	72 	r 
	dec hl			;2407	2b 	+ 
	ld (hl),e			;2408	73 	s 
	pop hl			;2409	e1 	. 
	push de			;240a	d5 	. 
	ld e,(hl)			;240b	5e 	^ 
	inc hl			;240c	23 	# 
	ld d,(hl)			;240d	56 	V 
	inc hl			;240e	23 	# 
	ex (sp),hl			;240f	e3 	. 
	call 00a39h		;2410	cd 39 0a 	. 9 . 
	pop hl			;2413	e1 	. 
	pop bc			;2414	c1 	. 
	sub b			;2415	90 	. 
	call 009c2h		;2416	cd c2 09 	. . . 
	jr z,$+11		;2419	28 09 	( . 
	ex de,hl			;241b	eb 	. 
	ld (040a2h),hl		;241c	22 a2 40 	" . @ 
	ld l,c			;241f	69 	i 
	ld h,b			;2420	60 	` 
	jp 01d1ah		;2421	c3 1a 1d 	. . . 
	ld sp,hl			;2424	f9 	. 
	ld (040e8h),hl		;2425	22 e8 40 	" . @ 
	ld hl,(040dfh)		;2428	2a df 40 	* . @ 
	ld a,(hl)			;242b	7e 	~ 
	cp 02ch		;242c	fe 2c 	. , 
	jp nz,01d1eh		;242e	c2 1e 1d 	. . . 
	rst 10h			;2431	d7 	. 
	call 022b9h		;2432	cd b9 22 	. . " 
	rst 8			;2435	cf 	. 
	jr z,$+45		;2436	28 2b 	( + 
	ld d,000h		;2438	16 00 	. . 
	push de			;243a	d5 	. 
	ld c,001h		;243b	0e 01 	. . 
	call 01963h		;243d	cd 63 19 	. c . 
	call 0249fh		;2440	cd 9f 24 	. . $ 
	ld (040f3h),hl		;2443	22 f3 40 	" . @ 
	ld hl,(040f3h)		;2446	2a f3 40 	* . @ 
	pop bc			;2449	c1 	. 
	ld a,(hl)			;244a	7e 	~ 
	ld d,000h		;244b	16 00 	. . 
	sub 0d4h		;244d	d6 d4 	. . 
	jr c,$+21		;244f	38 13 	8 . 
	cp 003h		;2451	fe 03 	. . 
	jr nc,$+17		;2453	30 0f 	0 . 
	cp 001h		;2455	fe 01 	. . 
	rla			;2457	17 	. 
	xor d			;2458	aa 	. 
	cp d			;2459	ba 	. 
	ld d,a			;245a	57 	W 
	jp c,01997h		;245b	da 97 19 	. . . 
	ld (040d8h),hl		;245e	22 d8 40 	" . @ 
	rst 10h			;2461	d7 	. 
	jr $-21		;2462	18 e9 	. . 
	ld a,d			;2464	7a 	z 
	or a			;2465	b7 	. 
	jp nz,023ech		;2466	c2 ec 23 	. . # 
	ld a,(hl)			;2469	7e 	~ 
	ld (040d8h),hl		;246a	22 d8 40 	" . @ 
	sub 0cdh		;246d	d6 cd 	. . 
	ret c			;246f	d8 	. 
	cp 007h		;2470	fe 07 	. . 
	ret nc			;2472	d0 	. 
	ld e,a			;2473	5f 	_ 
	ld a,(040afh)		;2474	3a af 40 	: . @ 
	sub 003h		;2477	d6 03 	. . 
	or e			;2479	b3 	. 
	jp z,0298fh		;247a	ca 8f 29 	. . ) 
	ld hl,0189ah		;247d	21 9a 18 	! . . 
	add hl,de			;2480	19 	. 
	ld a,b			;2481	78 	x 
	ld d,(hl)			;2482	56 	V 
	cp d			;2483	ba 	. 
	ret nc			;2484	d0 	. 
	push bc			;2485	c5 	. 
	ld bc,02346h		;2486	01 46 23 	. F # 
	push bc			;2489	c5 	. 
	ld a,d			;248a	7a 	z 
	cp 07fh		;248b	fe 7f 	.  
	jp z,023d4h		;248d	ca d4 23 	. . # 
	cp 051h		;2490	fe 51 	. Q 
	jp c,023e1h		;2492	da e1 23 	. . # 
	ld hl,04121h		;2495	21 21 41 	! ! A 
	or a			;2498	b7 	. 
	ld a,(040afh)		;2499	3a af 40 	: . @ 
	dec a			;249c	3d 	= 
	dec a			;249d	3d 	= 
	dec a			;249e	3d 	= 
	jp z,00af6h		;249f	ca f6 0a 	. . . 
	ld c,(hl)			;24a2	4e 	N 
	inc hl			;24a3	23 	# 
	ld b,(hl)			;24a4	46 	F 
	push bc			;24a5	c5 	. 
	jp m,023c5h		;24a6	fa c5 23 	. . # 
	inc hl			;24a9	23 	# 
	ld c,(hl)			;24aa	4e 	N 
	inc hl			;24ab	23 	# 
	ld b,(hl)			;24ac	46 	F 
	push bc			;24ad	c5 	. 
	push af			;24ae	f5 	. 
	or a			;24af	b7 	. 
	jp po,023c4h		;24b0	e2 c4 23 	. . # 
	pop af			;24b3	f1 	. 
	inc hl			;24b4	23 	# 
	jr c,$+5		;24b5	38 03 	8 . 
	ld hl,0411dh		;24b7	21 1d 41 	! . A 
	ld c,(hl)			;24ba	4e 	N 
	inc hl			;24bb	23 	# 
	ld b,(hl)			;24bc	46 	F 
	inc hl			;24bd	23 	# 
	push bc			;24be	c5 	. 
	ld c,(hl)			;24bf	4e 	N 
	inc hl			;24c0	23 	# 
	ld b,(hl)			;24c1	46 	F 
	push bc			;24c2	c5 	. 
	ld b,0f1h		;24c3	06 f1 	. . 
	add a,003h		;24c5	c6 03 	. . 
	ld c,e			;24c7	4b 	K 
	ld b,a			;24c8	47 	G 
	push bc			;24c9	c5 	. 
	ld bc,02406h		;24ca	01 06 24 	. . $ 
	push bc			;24cd	c5 	. 
	ld hl,(040d8h)		;24ce	2a d8 40 	* . @ 
	jp 0233ah		;24d1	c3 3a 23 	. : # 
	call 00ab1h		;24d4	cd b1 0a 	. . . 
	call 009a4h		;24d7	cd a4 09 	. . . 
	ld bc,013f2h		;24da	01 f2 13 	. . . 
	ld d,07fh		;24dd	16 7f 	.  
	jr $-18		;24df	18 ec 	. . 
	push de			;24e1	d5 	. 
	call 00a7fh		;24e2	cd 7f 0a 	.  . 
	pop de			;24e5	d1 	. 
	push hl			;24e6	e5 	. 
	ld bc,025e9h		;24e7	01 e9 25 	. . % 
	jr $-29		;24ea	18 e1 	. . 
	ld a,b			;24ec	78 	x 
	cp 064h		;24ed	fe 64 	. d 
	ret nc			;24ef	d0 	. 
	push bc			;24f0	c5 	. 
	push de			;24f1	d5 	. 
	ld de,06404h		;24f2	11 04 64 	. . d 
	ld hl,025b8h		;24f5	21 b8 25 	! . % 
	push hl			;24f8	e5 	. 
	rst 20h			;24f9	e7 	. 
	jp nz,02395h		;24fa	c2 95 23 	. . # 
	ld hl,(04121h)		;24fd	2a 21 41 	* ! A 
	push hl			;2500	e5 	. 
	ld bc,0258ch		;2501	01 8c 25 	. . % 
	jr $-55		;2504	18 c7 	. . 
	pop bc			;2506	c1 	. 
	ld a,c			;2507	79 	y 
	ld (040b0h),a		;2508	32 b0 40 	2 . @ 
	ld a,b			;250b	78 	x 
	cp 008h		;250c	fe 08 	. . 
	jr z,$+42		;250e	28 28 	( ( 
	ld a,(040afh)		;2510	3a af 40 	: . @ 
	cp 008h		;2513	fe 08 	. . 
	jp z,02460h		;2515	ca 60 24 	. ` $ 
	ld d,a			;2518	57 	W 
	ld a,b			;2519	78 	x 
	cp 004h		;251a	fe 04 	. . 
	jp z,02472h		;251c	ca 72 24 	. r $ 
	ld a,d			;251f	7a 	z 
	cp 003h		;2520	fe 03 	. . 
	jp z,00af6h		;2522	ca f6 0a 	. . . 
	jp nc,0247ch		;2525	d2 7c 24 	. | $ 
	ld hl,018bfh		;2528	21 bf 18 	! . . 
	ld b,000h		;252b	06 00 	. . 
	add hl,bc			;252d	09 	. 
	add hl,bc			;252e	09 	. 
	ld c,(hl)			;252f	4e 	N 
	inc hl			;2530	23 	# 
	ld b,(hl)			;2531	46 	F 
	pop de			;2532	d1 	. 
	ld hl,(04121h)		;2533	2a 21 41 	* ! A 
	push bc			;2536	c5 	. 
	ret			;2537	c9 	. 
	call 00adbh		;2538	cd db 0a 	. . . 
	call 009fch		;253b	cd fc 09 	. . . 
	pop hl			;253e	e1 	. 
	ld (0411fh),hl		;253f	22 1f 41 	" . A 
	pop hl			;2542	e1 	. 
	ld (0411dh),hl		;2543	22 1d 41 	" . A 
	pop bc			;2546	c1 	. 
	pop de			;2547	d1 	. 
	call 009b4h		;2548	cd b4 09 	. . . 
	call 00adbh		;254b	cd db 0a 	. . . 
	ld hl,018abh		;254e	21 ab 18 	! . . 
	ld a,(040b0h)		;2551	3a b0 40 	: . @ 
	rlca			;2554	07 	. 
	push bc			;2555	c5 	. 
	ld c,a			;2556	4f 	O 
	ld b,000h		;2557	06 00 	. . 
	add hl,bc			;2559	09 	. 
	pop bc			;255a	c1 	. 
	ld a,(hl)			;255b	7e 	~ 
	inc hl			;255c	23 	# 
	ld h,(hl)			;255d	66 	f 
	ld l,a			;255e	6f 	o 
	jp (hl)			;255f	e9 	. 
	push bc			;2560	c5 	. 
	call 009fch		;2561	cd fc 09 	. . . 
	pop af			;2564	f1 	. 
	ld (040afh),a		;2565	32 af 40 	2 . @ 
	cp 004h		;2568	fe 04 	. . 
	jr z,$-36		;256a	28 da 	( . 
	pop hl			;256c	e1 	. 
	ld (04121h),hl		;256d	22 21 41 	" ! A 
	jr $-37		;2570	18 d9 	. . 
	call 00ab1h		;2572	cd b1 0a 	. . . 
	pop bc			;2575	c1 	. 
	pop de			;2576	d1 	. 
	ld hl,018b5h		;2577	21 b5 18 	! . . 
	jr $-41		;257a	18 d5 	. . 
	pop hl			;257c	e1 	. 
	call 009a4h		;257d	cd a4 09 	. . . 
	call 00acfh		;2580	cd cf 0a 	. . . 
	call 009bfh		;2583	cd bf 09 	. . . 
	pop hl			;2586	e1 	. 
	ld (04123h),hl		;2587	22 23 41 	" # A 
	pop hl			;258a	e1 	. 
	ld (04121h),hl		;258b	22 21 41 	" ! A 
	jr $-23		;258e	18 e7 	. . 
	push hl			;2590	e5 	. 
	ex de,hl			;2591	eb 	. 
	call 00acfh		;2592	cd cf 0a 	. . . 
	pop hl			;2595	e1 	. 
	call 009a4h		;2596	cd a4 09 	. . . 
	call 00acfh		;2599	cd cf 0a 	. . . 
	jp 008a0h		;259c	c3 a0 08 	. . . 
	rst 10h			;259f	d7 	. 
	ld e,028h		;25a0	1e 28 	. ( 
	jp z,019a2h		;25a2	ca a2 19 	. . . 
	jp c,00e6ch		;25a5	da 6c 0e 	. l . 
	call 01e3dh		;25a8	cd 3d 1e 	. = . 
	jp nc,02540h		;25ab	d2 40 25 	. @ % 
	cp 0cdh		;25ae	fe cd 	. . 
	jr z,$-17		;25b0	28 ed 	( . 
	cp 02eh		;25b2	fe 2e 	. . 
	jp z,00e6ch		;25b4	ca 6c 0e 	. l . 
	cp 0ceh		;25b7	fe ce 	. . 
	jp z,02532h		;25b9	ca 32 25 	. 2 % 
	cp 022h		;25bc	fe 22 	. " 
	jp z,02866h		;25be	ca 66 28 	. f ( 
	cp 0cbh		;25c1	fe cb 	. . 
	jp z,025c4h		;25c3	ca c4 25 	. . % 
	cp 026h		;25c6	fe 26 	. & 
	jp z,04194h		;25c8	ca 94 41 	. . A 
	cp 0c3h		;25cb	fe c3 	. . 
	jr nz,$+12		;25cd	20 0a 	  . 
	rst 10h			;25cf	d7 	. 
	ld a,(0409ah)		;25d0	3a 9a 40 	: . @ 
	push hl			;25d3	e5 	. 
	call 027f8h		;25d4	cd f8 27 	. . ' 
	pop hl			;25d7	e1 	. 
	ret			;25d8	c9 	. 
	cp 0c2h		;25d9	fe c2 	. . 
	jr nz,$+12		;25db	20 0a 	  . 
	rst 10h			;25dd	d7 	. 
	push hl			;25de	e5 	. 
	ld hl,(040eah)		;25df	2a ea 40 	* . @ 
	call 00c66h		;25e2	cd 66 0c 	. f . 
	pop hl			;25e5	e1 	. 
	ret			;25e6	c9 	. 
	cp 0c0h		;25e7	fe c0 	. . 
	jr nz,$+22		;25e9	20 14 	  . 
	rst 10h			;25eb	d7 	. 
	rst 8			;25ec	cf 	. 
	jr z,$-49		;25ed	28 cd 	( . 
	dec c			;25ef	0d 	. 
	ld h,0cfh		;25f0	26 cf 	& . 
	add hl,hl			;25f2	29 	) 
	push hl			;25f3	e5 	. 
	ex de,hl			;25f4	eb 	. 
	ld a,h			;25f5	7c 	| 
	or l			;25f6	b5 	. 
	jp z,01e4ah		;25f7	ca 4a 1e 	. J . 
	call 00a9ah		;25fa	cd 9a 0a 	. . . 
	pop hl			;25fd	e1 	. 
	ret			;25fe	c9 	. 
	cp 0c1h		;25ff	fe c1 	. . 
	jp z,027feh		;2601	ca fe 27 	. . ' 
	cp 0c5h		;2604	fe c5 	. . 
	jp z,0419dh		;2606	ca 9d 41 	. . A 
	cp 0c8h		;2609	fe c8 	. . 
	jp z,027c9h		;260b	ca c9 27 	. . ' 
	cp 0c7h		;260e	fe c7 	. . 
	jp z,04176h		;2610	ca 76 41 	. v A 
	cp 0c6h		;2613	fe c6 	. . 
	jp z,00132h		;2615	ca 32 01 	. 2 . 
	cp 0c9h		;2618	fe c9 	. . 
	jp z,0019dh		;261a	ca 9d 01 	. . . 
	cp 0c4h		;261d	fe c4 	. . 
	jp z,02a2fh		;261f	ca 2f 2a 	. / * 
	cp 0beh		;2622	fe be 	. . 
	jp z,04155h		;2624	ca 55 41 	. U A 
	sub 0d7h		;2627	d6 d7 	. . 
	jp nc,0254eh		;2629	d2 4e 25 	. N % 
	call 02335h		;262c	cd 35 23 	. 5 # 
	rst 8			;262f	cf 	. 
	add hl,hl			;2630	29 	) 
	ret			;2631	c9 	. 
	ld d,07dh		;2632	16 7d 	. } 
	call 0233ah		;2634	cd 3a 23 	. : # 
	ld hl,(040f3h)		;2637	2a f3 40 	* . @ 
	push hl			;263a	e5 	. 
	call 0097bh		;263b	cd 7b 09 	. { . 
	pop hl			;263e	e1 	. 
	ret			;263f	c9 	. 
	call 0260dh		;2640	cd 0d 26 	. . & 
	push hl			;2643	e5 	. 
	ex de,hl			;2644	eb 	. 
	ld (04121h),hl		;2645	22 21 41 	" ! A 
	rst 20h			;2648	e7 	. 
	call nz,009f7h		;2649	c4 f7 09 	. . . 
	pop hl			;264c	e1 	. 
	ret			;264d	c9 	. 
	ld b,000h		;264e	06 00 	. . 
	rlca			;2650	07 	. 
	ld c,a			;2651	4f 	O 
	push bc			;2652	c5 	. 
	rst 10h			;2653	d7 	. 
	ld a,c			;2654	79 	y 
	cp 041h		;2655	fe 41 	. A 
	jr c,$+24		;2657	38 16 	8 . 
	call 02335h		;2659	cd 35 23 	. 5 # 
	rst 8			;265c	cf 	. 
	inc l			;265d	2c 	, 
	call 00af4h		;265e	cd f4 0a 	. . . 
	ex de,hl			;2661	eb 	. 
	ld hl,(04121h)		;2662	2a 21 41 	* ! A 
	ex (sp),hl			;2665	e3 	. 
	push hl			;2666	e5 	. 
	ex de,hl			;2667	eb 	. 
	call 02b1ch		;2668	cd 1c 2b 	. . + 
	ex de,hl			;266b	eb 	. 
	ex (sp),hl			;266c	e3 	. 
	jr $+22		;266d	18 14 	. . 
	call 0252ch		;266f	cd 2c 25 	. , % 
	ex (sp),hl			;2672	e3 	. 
	ld a,l			;2673	7d 	} 
	cp 00ch		;2674	fe 0c 	. . 
	jr c,$+9		;2676	38 07 	8 . 
	cp 01bh		;2678	fe 1b 	. . 
	push hl			;267a	e5 	. 
	call c,00ab1h		;267b	dc b1 0a 	. . . 
	pop hl			;267e	e1 	. 
	ld de,0253eh		;267f	11 3e 25 	. > % 
	push de			;2682	d5 	. 
	ld bc,01608h		;2683	01 08 16 	. . . 
	add hl,bc			;2686	09 	. 
	ld c,(hl)			;2687	4e 	N 
	inc hl			;2688	23 	# 
	ld h,(hl)			;2689	66 	f 
	ld l,c			;268a	69 	i 
	jp (hl)			;268b	e9 	. 
	call 029d7h		;268c	cd d7 29 	. . ) 
	ld a,(hl)			;268f	7e 	~ 
	inc hl			;2690	23 	# 
	ld c,(hl)			;2691	4e 	N 
	inc hl			;2692	23 	# 
	ld b,(hl)			;2693	46 	F 
	pop de			;2694	d1 	. 
	push bc			;2695	c5 	. 
	push af			;2696	f5 	. 
	call 029deh		;2697	cd de 29 	. . ) 
	pop de			;269a	d1 	. 
	ld e,(hl)			;269b	5e 	^ 
	inc hl			;269c	23 	# 
	ld c,(hl)			;269d	4e 	N 
	inc hl			;269e	23 	# 
	ld b,(hl)			;269f	46 	F 
	pop hl			;26a0	e1 	. 
	ld a,e			;26a1	7b 	{ 
	or d			;26a2	b2 	. 
	ret z			;26a3	c8 	. 
	ld a,d			;26a4	7a 	z 
	sub 001h		;26a5	d6 01 	. . 
	ret c			;26a7	d8 	. 
	xor a			;26a8	af 	. 
	cp e			;26a9	bb 	. 
	inc a			;26aa	3c 	< 
	ret nc			;26ab	d0 	. 
	dec d			;26ac	15 	. 
	dec e			;26ad	1d 	. 
	ld a,(bc)			;26ae	0a 	. 
	cp (hl)			;26af	be 	. 
	inc hl			;26b0	23 	# 
	inc bc			;26b1	03 	. 
	jr z,$-17		;26b2	28 ed 	( . 
	ccf			;26b4	3f 	? 
	jp 00960h		;26b5	c3 60 09 	. ` . 
	inc a			;26b8	3c 	< 
	adc a,a			;26b9	8f 	. 
	pop bc			;26ba	c1 	. 
	and b			;26bb	a0 	. 
	add a,0ffh		;26bc	c6 ff 	. . 
	sbc a,a			;26be	9f 	. 
	call 0098dh		;26bf	cd 8d 09 	. . . 
	jr $+20		;26c2	18 12 	. . 
	ld d,05ah		;26c4	16 5a 	. Z 
	call 0233ah		;26c6	cd 3a 23 	. : # 
	call 00a7fh		;26c9	cd 7f 0a 	.  . 
	ld a,l			;26cc	7d 	} 
	cpl			;26cd	2f 	/ 
	ld l,a			;26ce	6f 	o 
	ld a,h			;26cf	7c 	| 
	cpl			;26d0	2f 	/ 
	ld h,a			;26d1	67 	g 
	ld (04121h),hl		;26d2	22 21 41 	" ! A 
	pop bc			;26d5	c1 	. 
	jp 02346h		;26d6	c3 46 23 	. F # 
	ld a,(040afh)		;26d9	3a af 40 	: . @ 
	cp 008h		;26dc	fe 08 	. . 
	jr nc,$+7		;26de	30 05 	0 . 
	sub 003h		;26e0	d6 03 	. . 
	or a			;26e2	b7 	. 
	scf			;26e3	37 	7 
	ret			;26e4	c9 	. 
	sub 003h		;26e5	d6 03 	. . 
	or a			;26e7	b7 	. 
	ret			;26e8	c9 	. 
	push bc			;26e9	c5 	. 
	call 00a7fh		;26ea	cd 7f 0a 	.  . 
	pop af			;26ed	f1 	. 
	pop de			;26ee	d1 	. 
	ld bc,027fah		;26ef	01 fa 27 	. . ' 
	push bc			;26f2	c5 	. 
	cp 046h		;26f3	fe 46 	. F 
	jr nz,$+8		;26f5	20 06 	  . 
	ld a,e			;26f7	7b 	{ 
	or l			;26f8	b5 	. 
	ld l,a			;26f9	6f 	o 
	ld a,h			;26fa	7c 	| 
	or d			;26fb	b2 	. 
	ret			;26fc	c9 	. 
	ld a,e			;26fd	7b 	{ 
	and l			;26fe	a5 	. 
	ld l,a			;26ff	6f 	o 
	ld a,h			;2700	7c 	| 
	and d			;2701	a2 	. 
	ret			;2702	c9 	. 
	dec hl			;2703	2b 	+ 
	rst 10h			;2704	d7 	. 
	ret z			;2705	c8 	. 
	rst 8			;2706	cf 	. 
	inc l			;2707	2c 	, 
	ld bc,02603h		;2708	01 03 26 	. . & 
	push bc			;270b	c5 	. 
	or 0afh		;270c	f6 af 	. . 
	ld (040aeh),a		;270e	32 ae 40 	2 . @ 
	ld b,(hl)			;2711	46 	F 
	call 01e3dh		;2712	cd 3d 1e 	. = . 
	jp c,01997h		;2715	da 97 19 	. . . 
	xor a			;2718	af 	. 
	ld c,a			;2719	4f 	O 
	rst 10h			;271a	d7 	. 
	jr c,$+7		;271b	38 05 	8 . 
	call 01e3dh		;271d	cd 3d 1e 	. = . 
	jr c,$+11		;2720	38 09 	8 . 
	ld c,a			;2722	4f 	O 
	rst 10h			;2723	d7 	. 
	jr c,$-1		;2724	38 fd 	8 . 
	call 01e3dh		;2726	cd 3d 1e 	. = . 
	jr nc,$-6		;2729	30 f8 	0 . 
	ld de,02652h		;272b	11 52 26 	. R & 
	push de			;272e	d5 	. 
	ld d,002h		;272f	16 02 	. . 
	cp 025h		;2731	fe 25 	. % 
	ret z			;2733	c8 	. 
	inc d			;2734	14 	. 
	cp 024h		;2735	fe 24 	. $ 
	ret z			;2737	c8 	. 
	inc d			;2738	14 	. 
	cp 021h		;2739	fe 21 	. ! 
	ret z			;273b	c8 	. 
	ld d,008h		;273c	16 08 	. . 
	cp 023h		;273e	fe 23 	. # 
	ret z			;2740	c8 	. 
	ld a,b			;2741	78 	x 
	sub 041h		;2742	d6 41 	. A 
	and 07fh		;2744	e6 7f 	.  
	ld e,a			;2746	5f 	_ 
	ld d,000h		;2747	16 00 	. . 
	push hl			;2749	e5 	. 
	ld hl,04101h		;274a	21 01 41 	! . A 
	add hl,de			;274d	19 	. 
	ld d,(hl)			;274e	56 	V 
	pop hl			;274f	e1 	. 
	dec hl			;2750	2b 	+ 
	ret			;2751	c9 	. 
	ld a,d			;2752	7a 	z 
	ld (040afh),a		;2753	32 af 40 	2 . @ 
	rst 10h			;2756	d7 	. 
	ld a,(040dch)		;2757	3a dc 40 	: . @ 
	or a			;275a	b7 	. 
	jp nz,02664h		;275b	c2 64 26 	. d & 
	ld a,(hl)			;275e	7e 	~ 
	sub 028h		;275f	d6 28 	. ( 
	jp z,026e9h		;2761	ca e9 26 	. . & 
	xor a			;2764	af 	. 
	ld (040dch),a		;2765	32 dc 40 	2 . @ 
	push hl			;2768	e5 	. 
	push de			;2769	d5 	. 
	ld hl,(040f9h)		;276a	2a f9 40 	* . @ 
	ex de,hl			;276d	eb 	. 
	ld hl,(040fbh)		;276e	2a fb 40 	* . @ 
	rst 18h			;2771	df 	. 
	pop hl			;2772	e1 	. 
	jr z,$+27		;2773	28 19 	( . 
	ld a,(de)			;2775	1a 	. 
	ld l,a			;2776	6f 	o 
	cp h			;2777	bc 	. 
	inc de			;2778	13 	. 
	jr nz,$+13		;2779	20 0b 	  . 
	ld a,(de)			;277b	1a 	. 
	cp c			;277c	b9 	. 
	jr nz,$+9		;277d	20 07 	  . 
	inc de			;277f	13 	. 
	ld a,(de)			;2780	1a 	. 
	cp b			;2781	b8 	. 
	jp z,026cch		;2782	ca cc 26 	. . & 
	ld a,013h		;2785	3e 13 	> . 
	inc de			;2787	13 	. 
	push hl			;2788	e5 	. 
	ld h,000h		;2789	26 00 	& . 
	add hl,de			;278b	19 	. 
	jr $-31		;278c	18 df 	. . 
	ld a,h			;278e	7c 	| 
	pop hl			;278f	e1 	. 
	ex (sp),hl			;2790	e3 	. 
	push af			;2791	f5 	. 
	push de			;2792	d5 	. 
	ld de,024f1h		;2793	11 f1 24 	. . $ 
	rst 18h			;2796	df 	. 
	jr z,$+56		;2797	28 36 	( 6 
	ld de,02543h		;2799	11 43 25 	. C % 
	rst 18h			;279c	df 	. 
	pop de			;279d	d1 	. 
	jr z,$+55		;279e	28 35 	( 5 
	pop af			;27a0	f1 	. 
	ex (sp),hl			;27a1	e3 	. 
	push hl			;27a2	e5 	. 
	push bc			;27a3	c5 	. 
	ld c,a			;27a4	4f 	O 
	ld b,000h		;27a5	06 00 	. . 
	push bc			;27a7	c5 	. 
	inc bc			;27a8	03 	. 
	inc bc			;27a9	03 	. 
	inc bc			;27aa	03 	. 
	ld hl,(040fdh)		;27ab	2a fd 40 	* . @ 
	push hl			;27ae	e5 	. 
	add hl,bc			;27af	09 	. 
	pop bc			;27b0	c1 	. 
	push hl			;27b1	e5 	. 
	call 01955h		;27b2	cd 55 19 	. U . 
	pop hl			;27b5	e1 	. 
	ld (040fdh),hl		;27b6	22 fd 40 	" . @ 
	ld h,b			;27b9	60 	` 
	ld l,c			;27ba	69 	i 
	ld (040fbh),hl		;27bb	22 fb 40 	" . @ 
	dec hl			;27be	2b 	+ 
	ld (hl),000h		;27bf	36 00 	6 . 
	rst 18h			;27c1	df 	. 
	jr nz,$-4		;27c2	20 fa 	  . 
	pop de			;27c4	d1 	. 
	ld (hl),e			;27c5	73 	s 
	inc hl			;27c6	23 	# 
	pop de			;27c7	d1 	. 
	ld (hl),e			;27c8	73 	s 
	inc hl			;27c9	23 	# 
	ld (hl),d			;27ca	72 	r 
	ex de,hl			;27cb	eb 	. 
	inc de			;27cc	13 	. 
	pop hl			;27cd	e1 	. 
	ret			;27ce	c9 	. 
	ld d,a			;27cf	57 	W 
	ld e,a			;27d0	5f 	_ 
	pop af			;27d1	f1 	. 
	pop af			;27d2	f1 	. 
	ex (sp),hl			;27d3	e3 	. 
	ret			;27d4	c9 	. 
	ld (04124h),a		;27d5	32 24 41 	2 $ A 
	pop bc			;27d8	c1 	. 
	ld h,a			;27d9	67 	g 
	ld l,a			;27da	6f 	o 
	ld (04121h),hl		;27db	22 21 41 	" ! A 
	rst 20h			;27de	e7 	. 
	jr nz,$+8		;27df	20 06 	  . 
	ld hl,01928h		;27e1	21 28 19 	! ( . 
	ld (04121h),hl		;27e4	22 21 41 	" ! A 
	pop hl			;27e7	e1 	. 
	ret			;27e8	c9 	. 
	push hl			;27e9	e5 	. 
	ld hl,(040aeh)		;27ea	2a ae 40 	* . @ 
	ex (sp),hl			;27ed	e3 	. 
	ld d,a			;27ee	57 	W 
	push de			;27ef	d5 	. 
	push bc			;27f0	c5 	. 
	call 01e45h		;27f1	cd 45 1e 	. E . 
	pop bc			;27f4	c1 	. 
	pop af			;27f5	f1 	. 
	ex de,hl			;27f6	eb 	. 
	ex (sp),hl			;27f7	e3 	. 
	push hl			;27f8	e5 	. 
	ex de,hl			;27f9	eb 	. 
	inc a			;27fa	3c 	< 
	ld d,a			;27fb	57 	W 
	ld a,(hl)			;27fc	7e 	~ 
	cp 02ch		;27fd	fe 2c 	. , 
	jr z,$-16		;27ff	28 ee 	( . 
	rst 8			;2801	cf 	. 
	add hl,hl			;2802	29 	) 
	ld (040f3h),hl		;2803	22 f3 40 	" . @ 
	pop hl			;2806	e1 	. 
	ld (040aeh),hl		;2807	22 ae 40 	" . @ 
	push de			;280a	d5 	. 
	ld hl,(040fbh)		;280b	2a fb 40 	* . @ 
	ld a,019h		;280e	3e 19 	> . 
	ex de,hl			;2810	eb 	. 
	ld hl,(040fdh)		;2811	2a fd 40 	* . @ 
	ex de,hl			;2814	eb 	. 
	rst 18h			;2815	df 	. 
	ld a,(040afh)		;2816	3a af 40 	: . @ 
	jr z,$+41		;2819	28 27 	( ' 
	cp (hl)			;281b	be 	. 
	inc hl			;281c	23 	# 
	jr nz,$+10		;281d	20 08 	  . 
	ld a,(hl)			;281f	7e 	~ 
	cp c			;2820	b9 	. 
	inc hl			;2821	23 	# 
	jr nz,$+6		;2822	20 04 	  . 
	ld a,(hl)			;2824	7e 	~ 
	cp b			;2825	b8 	. 
	ld a,023h		;2826	3e 23 	> # 
	inc hl			;2828	23 	# 
	ld e,(hl)			;2829	5e 	^ 
	inc hl			;282a	23 	# 
	ld d,(hl)			;282b	56 	V 
	inc hl			;282c	23 	# 
	jr nz,$-30		;282d	20 e0 	  . 
	ld a,(040aeh)		;282f	3a ae 40 	: . @ 
	or a			;2832	b7 	. 
	ld e,012h		;2833	1e 12 	. . 
	jp nz,019a2h		;2835	c2 a2 19 	. . . 
	pop af			;2838	f1 	. 
	sub (hl)			;2839	96 	. 
	jp z,02795h		;283a	ca 95 27 	. . ' 
	ld e,010h		;283d	1e 10 	. . 
	jp 019a2h		;283f	c3 a2 19 	. . . 
	ld (hl),a			;2842	77 	w 
	inc hl			;2843	23 	# 
	ld e,a			;2844	5f 	_ 
	ld d,000h		;2845	16 00 	. . 
	pop af			;2847	f1 	. 
	ld (hl),c			;2848	71 	q 
	inc hl			;2849	23 	# 
	ld (hl),b			;284a	70 	p 
	inc hl			;284b	23 	# 
	ld c,a			;284c	4f 	O 
	call 01963h		;284d	cd 63 19 	. c . 
	inc hl			;2850	23 	# 
	inc hl			;2851	23 	# 
	ld (040d8h),hl		;2852	22 d8 40 	" . @ 
	ld (hl),c			;2855	71 	q 
	inc hl			;2856	23 	# 
	ld a,(040aeh)		;2857	3a ae 40 	: . @ 
	rla			;285a	17 	. 
	ld a,c			;285b	79 	y 
	ld bc,0000bh		;285c	01 0b 00 	. . . 
	jr nc,$+4		;285f	30 02 	0 . 
	pop bc			;2861	c1 	. 
	inc bc			;2862	03 	. 
	ld (hl),c			;2863	71 	q 
	inc hl			;2864	23 	# 
	ld (hl),b			;2865	70 	p 
	inc hl			;2866	23 	# 
	push af			;2867	f5 	. 
	call 00baah		;2868	cd aa 0b 	. . . 
	pop af			;286b	f1 	. 
	dec a			;286c	3d 	= 
	jr nz,$-17		;286d	20 ed 	  . 
	push af			;286f	f5 	. 
	ld b,d			;2870	42 	B 
	ld c,e			;2871	4b 	K 
	ex de,hl			;2872	eb 	. 
	add hl,de			;2873	19 	. 
	jr c,$-55		;2874	38 c7 	8 . 
	call 0196ch		;2876	cd 6c 19 	. l . 
	ld (040fdh),hl		;2879	22 fd 40 	" . @ 
	dec hl			;287c	2b 	+ 
	ld (hl),000h		;287d	36 00 	6 . 
	rst 18h			;287f	df 	. 
	jr nz,$-4		;2880	20 fa 	  . 
	inc bc			;2882	03 	. 
	ld d,a			;2883	57 	W 
	ld hl,(040d8h)		;2884	2a d8 40 	* . @ 
	ld e,(hl)			;2887	5e 	^ 
	ex de,hl			;2888	eb 	. 
	add hl,hl			;2889	29 	) 
	add hl,bc			;288a	09 	. 
	ex de,hl			;288b	eb 	. 
	dec hl			;288c	2b 	+ 
	dec hl			;288d	2b 	+ 
	ld (hl),e			;288e	73 	s 
	inc hl			;288f	23 	# 
	ld (hl),d			;2890	72 	r 
	inc hl			;2891	23 	# 
	pop af			;2892	f1 	. 
	jr c,$+50		;2893	38 30 	8 0 
	ld b,a			;2895	47 	G 
	ld c,a			;2896	4f 	O 
	ld a,(hl)			;2897	7e 	~ 
	inc hl			;2898	23 	# 
	ld d,0e1h		;2899	16 e1 	. . 
	ld e,(hl)			;289b	5e 	^ 
	inc hl			;289c	23 	# 
	ld d,(hl)			;289d	56 	V 
	inc hl			;289e	23 	# 
	ex (sp),hl			;289f	e3 	. 
	push af			;28a0	f5 	. 
	rst 18h			;28a1	df 	. 
	jp nc,0273dh		;28a2	d2 3d 27 	. = ' 
	call 00baah		;28a5	cd aa 0b 	. . . 
	add hl,de			;28a8	19 	. 
	pop af			;28a9	f1 	. 
	dec a			;28aa	3d 	= 
	ld b,h			;28ab	44 	D 
	ld c,l			;28ac	4d 	M 
	jr nz,$-19		;28ad	20 eb 	  . 
	ld a,(040afh)		;28af	3a af 40 	: . @ 
	ld b,h			;28b2	44 	D 
	ld c,l			;28b3	4d 	M 
	add hl,hl			;28b4	29 	) 
	sub 004h		;28b5	d6 04 	. . 
	jr c,$+6		;28b7	38 04 	8 . 
	add hl,hl			;28b9	29 	) 
	jr z,$+8		;28ba	28 06 	( . 
	add hl,hl			;28bc	29 	) 
	or a			;28bd	b7 	. 
	jp po,027c2h		;28be	e2 c2 27 	. . ' 
	add hl,bc			;28c1	09 	. 
	pop bc			;28c2	c1 	. 
	add hl,bc			;28c3	09 	. 
	ex de,hl			;28c4	eb 	. 
	ld hl,(040f3h)		;28c5	2a f3 40 	* . @ 
	ret			;28c8	c9 	. 
	xor a			;28c9	af 	. 
	push hl			;28ca	e5 	. 
	ld (040afh),a		;28cb	32 af 40 	2 . @ 
	call 027d4h		;28ce	cd d4 27 	. . ' 
	pop hl			;28d1	e1 	. 
	rst 10h			;28d2	d7 	. 
	ret			;28d3	c9 	. 
	ld hl,(040fdh)		;28d4	2a fd 40 	* . @ 
	ex de,hl			;28d7	eb 	. 
	ld hl,00000h		;28d8	21 00 00 	! . . 
	add hl,sp			;28db	39 	9 
	rst 20h			;28dc	e7 	. 
	jr nz,$+15		;28dd	20 0d 	  . 
	call 029dah		;28df	cd da 29 	. . ) 
	call 028e6h		;28e2	cd e6 28 	. . ( 
	ld hl,(040a0h)		;28e5	2a a0 40 	* . @ 
	ex de,hl			;28e8	eb 	. 
	ld hl,(040d6h)		;28e9	2a d6 40 	* . @ 
	ld a,l			;28ec	7d 	} 
	sub e			;28ed	93 	. 
	ld l,a			;28ee	6f 	o 
	ld a,h			;28ef	7c 	| 
	sbc a,d			;28f0	9a 	. 
	ld h,a			;28f1	67 	g 
	jp 00c66h		;28f2	c3 66 0c 	. f . 
	ld a,(040a6h)		;28f5	3a a6 40 	: . @ 
	ld l,a			;28f8	6f 	o 
	xor a			;28f9	af 	. 
	ld h,a			;28fa	67 	g 
	jp 00a9ah		;28fb	c3 9a 0a 	. . . 
	call 041a9h		;28fe	cd a9 41 	. . A 
	rst 10h			;2901	d7 	. 
	call 0252ch		;2902	cd 2c 25 	. , % 
	push hl			;2905	e5 	. 
	ld hl,00890h		;2906	21 90 08 	! . . 
	push hl			;2909	e5 	. 
	ld a,(040afh)		;290a	3a af 40 	: . @ 
	push af			;290d	f5 	. 
	cp 003h		;290e	fe 03 	. . 
	call z,029dah		;2910	cc da 29 	. . ) 
	pop af			;2913	f1 	. 
	ex de,hl			;2914	eb 	. 
	ld hl,(0408eh)		;2915	2a 8e 40 	* . @ 
	jp (hl)			;2918	e9 	. 
	push hl			;2919	e5 	. 
	and 007h		;291a	e6 07 	. . 
	ld hl,018a1h		;291c	21 a1 18 	! . . 
	ld c,a			;291f	4f 	O 
	ld b,000h		;2920	06 00 	. . 
	add hl,bc			;2922	09 	. 
	call 02586h		;2923	cd 86 25 	. . % 
	pop hl			;2926	e1 	. 
	ret			;2927	c9 	. 
	push hl			;2928	e5 	. 
	ld hl,(040a2h)		;2929	2a a2 40 	* . @ 
	inc hl			;292c	23 	# 
	ld a,h			;292d	7c 	| 
	or l			;292e	b5 	. 
	pop hl			;292f	e1 	. 
	ret nz			;2930	c0 	. 
	ld e,016h		;2931	1e 16 	. . 
	jp 019a2h		;2933	c3 a2 19 	. . . 
	call 00fbdh		;2936	cd bd 0f 	. . . 
	call 02865h		;2939	cd 65 28 	. e ( 
	call 029dah		;293c	cd da 29 	. . ) 
	ld bc,02a2bh		;293f	01 2b 2a 	. + * 
	push bc			;2942	c5 	. 
	ld a,(hl)			;2943	7e 	~ 
	inc hl			;2944	23 	# 
	push hl			;2945	e5 	. 
	call 028bfh		;2946	cd bf 28 	. . ( 
	pop hl			;2949	e1 	. 
	ld c,(hl)			;294a	4e 	N 
	inc hl			;294b	23 	# 
	ld b,(hl)			;294c	46 	F 
	call 0285ah		;294d	cd 5a 28 	. Z ( 
	push hl			;2950	e5 	. 
	ld l,a			;2951	6f 	o 
	call 029ceh		;2952	cd ce 29 	. . ) 
	pop de			;2955	d1 	. 
	ret			;2956	c9 	. 
	call 028bfh		;2957	cd bf 28 	. . ( 
	ld hl,040d3h		;295a	21 d3 40 	! . @ 
	push hl			;295d	e5 	. 
	ld (hl),a			;295e	77 	w 
	inc hl			;295f	23 	# 
	ld (hl),e			;2960	73 	s 
	inc hl			;2961	23 	# 
	ld (hl),d			;2962	72 	r 
	pop hl			;2963	e1 	. 
	ret			;2964	c9 	. 
	dec hl			;2965	2b 	+ 
	ld b,022h		;2966	06 22 	. " 
	ld d,b			;2968	50 	P 
	push hl			;2969	e5 	. 
	ld c,0ffh		;296a	0e ff 	. . 
	inc hl			;296c	23 	# 
	ld a,(hl)			;296d	7e 	~ 
	inc c			;296e	0c 	. 
	or a			;296f	b7 	. 
	jr z,$+8		;2970	28 06 	( . 
	cp d			;2972	ba 	. 
	jr z,$+5		;2973	28 03 	( . 
	cp b			;2975	b8 	. 
	jr nz,$-10		;2976	20 f4 	  . 
	cp 022h		;2978	fe 22 	. " 
	call z,01d78h		;297a	cc 78 1d 	. x . 
	ex (sp),hl			;297d	e3 	. 
	inc hl			;297e	23 	# 
	ex de,hl			;297f	eb 	. 
	ld a,c			;2980	79 	y 
	call 0285ah		;2981	cd 5a 28 	. Z ( 
	ld de,040d3h		;2984	11 d3 40 	. . @ 
	ld a,0d5h		;2987	3e d5 	> . 
	ld hl,(040b3h)		;2989	2a b3 40 	* . @ 
	ld (04121h),hl		;298c	22 21 41 	" ! A 
	ld a,003h		;298f	3e 03 	> . 
	ld (040afh),a		;2991	32 af 40 	2 . @ 
	call 009d3h		;2994	cd d3 09 	. . . 
	ld de,040d6h		;2997	11 d6 40 	. . @ 
	rst 18h			;299a	df 	. 
	ld (040b3h),hl		;299b	22 b3 40 	" . @ 
	pop hl			;299e	e1 	. 
	ld a,(hl)			;299f	7e 	~ 
	ret nz			;29a0	c0 	. 
	ld e,01eh		;29a1	1e 1e 	. . 
	jp 019a2h		;29a3	c3 a2 19 	. . . 
	inc hl			;29a6	23 	# 
	call 02865h		;29a7	cd 65 28 	. e ( 
	call 029dah		;29aa	cd da 29 	. . ) 
	call 009c4h		;29ad	cd c4 09 	. . . 
	inc d			;29b0	14 	. 
	dec d			;29b1	15 	. 
	ret z			;29b2	c8 	. 
	ld a,(bc)			;29b3	0a 	. 
	call 0032ah		;29b4	cd 2a 03 	. * . 
	cp 00dh		;29b7	fe 0d 	. . 
	call z,02103h		;29b9	cc 03 21 	. . ! 
	inc bc			;29bc	03 	. 
	jr $-12		;29bd	18 f2 	. . 
	or a			;29bf	b7 	. 
	ld c,0f1h		;29c0	0e f1 	. . 
	push af			;29c2	f5 	. 
	ld hl,(040a0h)		;29c3	2a a0 40 	* . @ 
	ex de,hl			;29c6	eb 	. 
	ld hl,(040d6h)		;29c7	2a d6 40 	* . @ 
	cpl			;29ca	2f 	/ 
	ld c,a			;29cb	4f 	O 
	ld b,0ffh		;29cc	06 ff 	. . 
	add hl,bc			;29ce	09 	. 
	inc hl			;29cf	23 	# 
	rst 18h			;29d0	df 	. 
	jr c,$+9		;29d1	38 07 	8 . 
	ld (040d6h),hl		;29d3	22 d6 40 	" . @ 
	inc hl			;29d6	23 	# 
	ex de,hl			;29d7	eb 	. 
	pop af			;29d8	f1 	. 
	ret			;29d9	c9 	. 
	pop af			;29da	f1 	. 
	ld e,01ah		;29db	1e 1a 	. . 
	jp z,019a2h		;29dd	ca a2 19 	. . . 
	cp a			;29e0	bf 	. 
	push af			;29e1	f5 	. 
	ld bc,028c1h		;29e2	01 c1 28 	. . ( 
	push bc			;29e5	c5 	. 
	ld hl,(040b1h)		;29e6	2a b1 40 	* . @ 
	ld (040d6h),hl		;29e9	22 d6 40 	" . @ 
	ld hl,00000h		;29ec	21 00 00 	! . . 
	push hl			;29ef	e5 	. 
	ld hl,(040a0h)		;29f0	2a a0 40 	* . @ 
	push hl			;29f3	e5 	. 
	ld hl,040b5h		;29f4	21 b5 40 	! . @ 
	ex de,hl			;29f7	eb 	. 
	ld hl,(040b3h)		;29f8	2a b3 40 	* . @ 
	ex de,hl			;29fb	eb 	. 
	rst 18h			;29fc	df 	. 
	ld bc,028f7h		;29fd	01 f7 28 	. . ( 
	jp nz,0294ah		;2a00	c2 4a 29 	. J ) 
	ld hl,(040f9h)		;2a03	2a f9 40 	* . @ 
	ex de,hl			;2a06	eb 	. 
	ld hl,(040fbh)		;2a07	2a fb 40 	* . @ 
	ex de,hl			;2a0a	eb 	. 
	rst 18h			;2a0b	df 	. 
	jr z,$+21		;2a0c	28 13 	( . 
	ld a,(hl)			;2a0e	7e 	~ 
	inc hl			;2a0f	23 	# 
	inc hl			;2a10	23 	# 
	inc hl			;2a11	23 	# 
	cp 003h		;2a12	fe 03 	. . 
	jr nz,$+6		;2a14	20 04 	  . 
	call 0294bh		;2a16	cd 4b 29 	. K ) 
	xor a			;2a19	af 	. 
	ld e,a			;2a1a	5f 	_ 
	ld d,000h		;2a1b	16 00 	. . 
	add hl,de			;2a1d	19 	. 
	jr $-24		;2a1e	18 e6 	. . 
	pop bc			;2a20	c1 	. 
	ex de,hl			;2a21	eb 	. 
	ld hl,(040fdh)		;2a22	2a fd 40 	* . @ 
	ex de,hl			;2a25	eb 	. 
	rst 18h			;2a26	df 	. 
	jp z,0296bh		;2a27	ca 6b 29 	. k ) 
	ld a,(hl)			;2a2a	7e 	~ 
	inc hl			;2a2b	23 	# 
	call 009c2h		;2a2c	cd c2 09 	. . . 
	push hl			;2a2f	e5 	. 
	add hl,bc			;2a30	09 	. 
	cp 003h		;2a31	fe 03 	. . 
	jr nz,$-19		;2a33	20 eb 	  . 
	ld (040d8h),hl		;2a35	22 d8 40 	" . @ 
	pop hl			;2a38	e1 	. 
	ld c,(hl)			;2a39	4e 	N 
	ld b,000h		;2a3a	06 00 	. . 
	add hl,bc			;2a3c	09 	. 
	add hl,bc			;2a3d	09 	. 
	inc hl			;2a3e	23 	# 
	ex de,hl			;2a3f	eb 	. 
	ld hl,(040d8h)		;2a40	2a d8 40 	* . @ 
	ex de,hl			;2a43	eb 	. 
	rst 18h			;2a44	df 	. 
	jr z,$-36		;2a45	28 da 	( . 
	ld bc,0293fh		;2a47	01 3f 29 	. ? ) 
	push bc			;2a4a	c5 	. 
	xor a			;2a4b	af 	. 
	or (hl)			;2a4c	b6 	. 
	inc hl			;2a4d	23 	# 
	ld e,(hl)			;2a4e	5e 	^ 
	inc hl			;2a4f	23 	# 
	ld d,(hl)			;2a50	56 	V 
	inc hl			;2a51	23 	# 
	ret z			;2a52	c8 	. 
	ld b,h			;2a53	44 	D 
	ld c,l			;2a54	4d 	M 
	ld hl,(040d6h)		;2a55	2a d6 40 	* . @ 
	rst 18h			;2a58	df 	. 
	ld h,b			;2a59	60 	` 
	ld l,c			;2a5a	69 	i 
	ret c			;2a5b	d8 	. 
	pop hl			;2a5c	e1 	. 
	ex (sp),hl			;2a5d	e3 	. 
	rst 18h			;2a5e	df 	. 
	ex (sp),hl			;2a5f	e3 	. 
	push hl			;2a60	e5 	. 
	ld h,b			;2a61	60 	` 
	ld l,c			;2a62	69 	i 
	ret nc			;2a63	d0 	. 
	pop bc			;2a64	c1 	. 
	pop af			;2a65	f1 	. 
	pop af			;2a66	f1 	. 
	push hl			;2a67	e5 	. 
	push de			;2a68	d5 	. 
	push bc			;2a69	c5 	. 
	ret			;2a6a	c9 	. 
	pop de			;2a6b	d1 	. 
	pop hl			;2a6c	e1 	. 
	ld a,l			;2a6d	7d 	} 
	or h			;2a6e	b4 	. 
	ret z			;2a6f	c8 	. 
	dec hl			;2a70	2b 	+ 
	ld b,(hl)			;2a71	46 	F 
	dec hl			;2a72	2b 	+ 
	ld c,(hl)			;2a73	4e 	N 
	push hl			;2a74	e5 	. 
	dec hl			;2a75	2b 	+ 
	ld l,(hl)			;2a76	6e 	n 
	ld h,000h		;2a77	26 00 	& . 
	add hl,bc			;2a79	09 	. 
	ld d,b			;2a7a	50 	P 
	ld e,c			;2a7b	59 	Y 
	dec hl			;2a7c	2b 	+ 
	ld b,h			;2a7d	44 	D 
	ld c,l			;2a7e	4d 	M 
	ld hl,(040d6h)		;2a7f	2a d6 40 	* . @ 
	call 01958h		;2a82	cd 58 19 	. X . 
	pop hl			;2a85	e1 	. 
	ld (hl),c			;2a86	71 	q 
	inc hl			;2a87	23 	# 
	ld (hl),b			;2a88	70 	p 
	ld l,c			;2a89	69 	i 
	ld h,b			;2a8a	60 	` 
	dec hl			;2a8b	2b 	+ 
	jp 028e9h		;2a8c	c3 e9 28 	. . ( 
	push bc			;2a8f	c5 	. 
	push hl			;2a90	e5 	. 
	ld hl,(04121h)		;2a91	2a 21 41 	* ! A 
	ex (sp),hl			;2a94	e3 	. 
	call 0249fh		;2a95	cd 9f 24 	. . $ 
	ex (sp),hl			;2a98	e3 	. 
	call 00af4h		;2a99	cd f4 0a 	. . . 
	ld a,(hl)			;2a9c	7e 	~ 
	push hl			;2a9d	e5 	. 
	ld hl,(04121h)		;2a9e	2a 21 41 	* ! A 
	push hl			;2aa1	e5 	. 
	add a,(hl)			;2aa2	86 	. 
	ld e,01ch		;2aa3	1e 1c 	. . 
	jp c,019a2h		;2aa5	da a2 19 	. . . 
	call 02857h		;2aa8	cd 57 28 	. W ( 
	pop de			;2aab	d1 	. 
	call 029deh		;2aac	cd de 29 	. . ) 
	ex (sp),hl			;2aaf	e3 	. 
	call 029ddh		;2ab0	cd dd 29 	. . ) 
	push hl			;2ab3	e5 	. 
	ld hl,(040d4h)		;2ab4	2a d4 40 	* . @ 
	ex de,hl			;2ab7	eb 	. 
	call 029c6h		;2ab8	cd c6 29 	. . ) 
	call 029c6h		;2abb	cd c6 29 	. . ) 
	ld hl,02349h		;2abe	21 49 23 	! I # 
	ex (sp),hl			;2ac1	e3 	. 
	push hl			;2ac2	e5 	. 
	jp 02884h		;2ac3	c3 84 28 	. . ( 
	pop hl			;2ac6	e1 	. 
	ex (sp),hl			;2ac7	e3 	. 
	ld a,(hl)			;2ac8	7e 	~ 
	inc hl			;2ac9	23 	# 
	ld c,(hl)			;2aca	4e 	N 
	inc hl			;2acb	23 	# 
	ld b,(hl)			;2acc	46 	F 
	ld l,a			;2acd	6f 	o 
	inc l			;2ace	2c 	, 
	dec l			;2acf	2d 	- 
	ret z			;2ad0	c8 	. 
	ld a,(bc)			;2ad1	0a 	. 
	ld (de),a			;2ad2	12 	. 
	inc bc			;2ad3	03 	. 
	inc de			;2ad4	13 	. 
	jr $-6		;2ad5	18 f8 	. . 
	call 00af4h		;2ad7	cd f4 0a 	. . . 
	ld hl,(04121h)		;2ada	2a 21 41 	* ! A 
	ex de,hl			;2add	eb 	. 
	call 029f5h		;2ade	cd f5 29 	. . ) 
	ex de,hl			;2ae1	eb 	. 
	ret nz			;2ae2	c0 	. 
	push de			;2ae3	d5 	. 
	ld d,b			;2ae4	50 	P 
	ld e,c			;2ae5	59 	Y 
	dec de			;2ae6	1b 	. 
	ld c,(hl)			;2ae7	4e 	N 
	ld hl,(040d6h)		;2ae8	2a d6 40 	* . @ 
	rst 18h			;2aeb	df 	. 
	jr nz,$+7		;2aec	20 05 	  . 
	ld b,a			;2aee	47 	G 
	add hl,bc			;2aef	09 	. 
	ld (040d6h),hl		;2af0	22 d6 40 	" . @ 
	pop hl			;2af3	e1 	. 
	ret			;2af4	c9 	. 
	ld hl,(040b3h)		;2af5	2a b3 40 	* . @ 
	dec hl			;2af8	2b 	+ 
	ld b,(hl)			;2af9	46 	F 
	dec hl			;2afa	2b 	+ 
	ld c,(hl)			;2afb	4e 	N 
	dec hl			;2afc	2b 	+ 
	rst 18h			;2afd	df 	. 
	ret nz			;2afe	c0 	. 
	ld (040b3h),hl		;2aff	22 b3 40 	" . @ 
	ret			;2b02	c9 	. 
	ld bc,027f8h		;2b03	01 f8 27 	. . ' 
	push bc			;2b06	c5 	. 
	call 029d7h		;2b07	cd d7 29 	. . ) 
	xor a			;2b0a	af 	. 
	ld d,a			;2b0b	57 	W 
	ld a,(hl)			;2b0c	7e 	~ 
	or a			;2b0d	b7 	. 
	ret			;2b0e	c9 	. 
	ld bc,027f8h		;2b0f	01 f8 27 	. . ' 
	push bc			;2b12	c5 	. 
	call 02a07h		;2b13	cd 07 2a 	. . * 
	jp z,01e4ah		;2b16	ca 4a 1e 	. J . 
	inc hl			;2b19	23 	# 
	ld e,(hl)			;2b1a	5e 	^ 
	inc hl			;2b1b	23 	# 
	ld d,(hl)			;2b1c	56 	V 
	ld a,(de)			;2b1d	1a 	. 
	ret			;2b1e	c9 	. 
	ld a,001h		;2b1f	3e 01 	> . 
	call 02857h		;2b21	cd 57 28 	. W ( 
	call 02b1fh		;2b24	cd 1f 2b 	. . + 
	ld hl,(040d4h)		;2b27	2a d4 40 	* . @ 
	ld (hl),e			;2b2a	73 	s 
	pop bc			;2b2b	c1 	. 
	jp 02884h		;2b2c	c3 84 28 	. . ( 
	rst 10h			;2b2f	d7 	. 
	rst 8			;2b30	cf 	. 
	jr z,$-49		;2b31	28 cd 	( . 
	inc e			;2b33	1c 	. 
	dec hl			;2b34	2b 	+ 
	push de			;2b35	d5 	. 
	rst 8			;2b36	cf 	. 
	inc l			;2b37	2c 	, 
	call 02337h		;2b38	cd 37 23 	. 7 # 
	rst 8			;2b3b	cf 	. 
	add hl,hl			;2b3c	29 	) 
	ex (sp),hl			;2b3d	e3 	. 
	push hl			;2b3e	e5 	. 
	rst 20h			;2b3f	e7 	. 
	jr z,$+7		;2b40	28 05 	( . 
	call 02b1fh		;2b42	cd 1f 2b 	. . + 
	jr $+5		;2b45	18 03 	. . 
	call 02a13h		;2b47	cd 13 2a 	. . * 
	pop de			;2b4a	d1 	. 
	push af			;2b4b	f5 	. 
	push af			;2b4c	f5 	. 
	ld a,e			;2b4d	7b 	{ 
	call 02857h		;2b4e	cd 57 28 	. W ( 
	ld e,a			;2b51	5f 	_ 
	pop af			;2b52	f1 	. 
	inc e			;2b53	1c 	. 
	dec e			;2b54	1d 	. 
	jr z,$-42		;2b55	28 d4 	( . 
	ld hl,(040d4h)		;2b57	2a d4 40 	* . @ 
	ld (hl),a			;2b5a	77 	w 
	inc hl			;2b5b	23 	# 
	dec e			;2b5c	1d 	. 
	jr nz,$-3		;2b5d	20 fb 	  . 
	jr $-52		;2b5f	18 ca 	. . 
	call 02adfh		;2b61	cd df 2a 	. . * 
	xor a			;2b64	af 	. 
	ex (sp),hl			;2b65	e3 	. 
	ld c,a			;2b66	4f 	O 
	ld a,0e5h		;2b67	3e e5 	> . 
	push hl			;2b69	e5 	. 
	ld a,(hl)			;2b6a	7e 	~ 
	cp b			;2b6b	b8 	. 
	jr c,$+4		;2b6c	38 02 	8 . 
	ld a,b			;2b6e	78 	x 
	ld de,0000eh		;2b6f	11 0e 00 	. . . 
	push bc			;2b72	c5 	. 
	call 028bfh		;2b73	cd bf 28 	. . ( 
	pop bc			;2b76	c1 	. 
	pop hl			;2b77	e1 	. 
	push hl			;2b78	e5 	. 
	inc hl			;2b79	23 	# 
	ld b,(hl)			;2b7a	46 	F 
	inc hl			;2b7b	23 	# 
	ld h,(hl)			;2b7c	66 	f 
	ld l,b			;2b7d	68 	h 
	ld b,000h		;2b7e	06 00 	. . 
	add hl,bc			;2b80	09 	. 
	ld b,h			;2b81	44 	D 
	ld c,l			;2b82	4d 	M 
	call 0285ah		;2b83	cd 5a 28 	. Z ( 
	ld l,a			;2b86	6f 	o 
	call 029ceh		;2b87	cd ce 29 	. . ) 
	pop de			;2b8a	d1 	. 
	call 029deh		;2b8b	cd de 29 	. . ) 
	jp 02884h		;2b8e	c3 84 28 	. . ( 
	call 02adfh		;2b91	cd df 2a 	. . * 
	pop de			;2b94	d1 	. 
	push de			;2b95	d5 	. 
	ld a,(de)			;2b96	1a 	. 
	sub b			;2b97	90 	. 
	jr $-51		;2b98	18 cb 	. . 
	ex de,hl			;2b9a	eb 	. 
	ld a,(hl)			;2b9b	7e 	~ 
	call 02ae2h		;2b9c	cd e2 2a 	. . * 
	inc b			;2b9f	04 	. 
	dec b			;2ba0	05 	. 
	jp z,01e4ah		;2ba1	ca 4a 1e 	. J . 
	push bc			;2ba4	c5 	. 
	ld e,0ffh		;2ba5	1e ff 	. . 
	cp 029h		;2ba7	fe 29 	. ) 
	jr z,$+7		;2ba9	28 05 	( . 
	rst 8			;2bab	cf 	. 
	inc l			;2bac	2c 	, 
	call 02b1ch		;2bad	cd 1c 2b 	. . + 
	rst 8			;2bb0	cf 	. 
	add hl,hl			;2bb1	29 	) 
	pop af			;2bb2	f1 	. 
	ex (sp),hl			;2bb3	e3 	. 
	ld bc,02a69h		;2bb4	01 69 2a 	. i * 
	push bc			;2bb7	c5 	. 
	dec a			;2bb8	3d 	= 
	cp (hl)			;2bb9	be 	. 
	ld b,000h		;2bba	06 00 	. . 
	ret nc			;2bbc	d0 	. 
	ld c,a			;2bbd	4f 	O 
	ld a,(hl)			;2bbe	7e 	~ 
	sub c			;2bbf	91 	. 
	cp e			;2bc0	bb 	. 
	ld b,a			;2bc1	47 	G 
	ret c			;2bc2	d8 	. 
	ld b,e			;2bc3	43 	C 
	ret			;2bc4	c9 	. 
	call 02a07h		;2bc5	cd 07 2a 	. . * 
	jp z,027f8h		;2bc8	ca f8 27 	. . ' 
	ld e,a			;2bcb	5f 	_ 
	inc hl			;2bcc	23 	# 
	ld a,(hl)			;2bcd	7e 	~ 
	inc hl			;2bce	23 	# 
	ld h,(hl)			;2bcf	66 	f 
	ld l,a			;2bd0	6f 	o 
	push hl			;2bd1	e5 	. 
	add hl,de			;2bd2	19 	. 
	ld b,(hl)			;2bd3	46 	F 
	ld (hl),d			;2bd4	72 	r 
	ex (sp),hl			;2bd5	e3 	. 
	push bc			;2bd6	c5 	. 
	ld a,(hl)			;2bd7	7e 	~ 
	call 00e65h		;2bd8	cd 65 0e 	. e . 
	pop bc			;2bdb	c1 	. 
	pop hl			;2bdc	e1 	. 
	ld (hl),b			;2bdd	70 	p 
	ret			;2bde	c9 	. 
	ex de,hl			;2bdf	eb 	. 
	rst 8			;2be0	cf 	. 
	add hl,hl			;2be1	29 	) 
	pop bc			;2be2	c1 	. 
	pop de			;2be3	d1 	. 
	push bc			;2be4	c5 	. 
	ld b,e			;2be5	43 	C 
	ret			;2be6	c9 	. 
	cp 07ah		;2be7	fe 7a 	. z 
	jp nz,01997h		;2be9	c2 97 19 	. . . 
	jp 041d9h		;2bec	c3 d9 41 	. . A 
	call 02b1fh		;2bef	cd 1f 2b 	. . + 
	ld (04094h),a		;2bf2	32 94 40 	2 . @ 
	call 04093h		;2bf5	cd 93 40 	. . @ 
	jp 027f8h		;2bf8	c3 f8 27 	. . ' 
	call 02b0eh		;2bfb	cd 0e 2b 	. . + 
	jp 04096h		;2bfe	c3 96 40 	. . @ 
	rst 10h			;2c01	d7 	. 
	call 02337h		;2c02	cd 37 23 	. 7 # 
	push hl			;2c05	e5 	. 
	call 00a7fh		;2c06	cd 7f 0a 	.  . 
	ex de,hl			;2c09	eb 	. 
	pop hl			;2c0a	e1 	. 
	ld a,d			;2c0b	7a 	z 
	or a			;2c0c	b7 	. 
	ret			;2c0d	c9 	. 
	call 02b1ch		;2c0e	cd 1c 2b 	. . + 
	ld (04094h),a		;2c11	32 94 40 	2 . @ 
	ld (04097h),a		;2c14	32 97 40 	2 . @ 
	rst 8			;2c17	cf 	. 
	inc l			;2c18	2c 	, 
	jr $+3		;2c19	18 01 	. . 
	rst 10h			;2c1b	d7 	. 
	call 02337h		;2c1c	cd 37 23 	. 7 # 
	call 02b05h		;2c1f	cd 05 2b 	. . + 
	jp nz,01e4ah		;2c22	c2 4a 1e 	. J . 
	dec hl			;2c25	2b 	+ 
	rst 10h			;2c26	d7 	. 
	ld a,e			;2c27	7b 	{ 
	ret			;2c28	c9 	. 
	ld a,001h		;2c29	3e 01 	> . 
	ld (0409ch),a		;2c2b	32 9c 40 	2 . @ 
	pop bc			;2c2e	c1 	. 
	call 01b10h		;2c2f	cd 10 1b 	. . . 
	push bc			;2c32	c5 	. 
	ld hl,0ffffh		;2c33	21 ff ff 	! . . 
	ld (040a2h),hl		;2c36	22 a2 40 	" . @ 
	pop hl			;2c39	e1 	. 
	pop de			;2c3a	d1 	. 
	ld c,(hl)			;2c3b	4e 	N 
	inc hl			;2c3c	23 	# 
	ld b,(hl)			;2c3d	46 	F 
	inc hl			;2c3e	23 	# 
	ld a,b			;2c3f	78 	x 
	or c			;2c40	b1 	. 
	jp z,01a19h		;2c41	ca 19 1a 	. . . 
	call 041dfh		;2c44	cd df 41 	. . A 
	call 01d9bh		;2c47	cd 9b 1d 	. . . 
	push bc			;2c4a	c5 	. 
	ld c,(hl)			;2c4b	4e 	N 
	inc hl			;2c4c	23 	# 
	ld b,(hl)			;2c4d	46 	F 
	inc hl			;2c4e	23 	# 
	push bc			;2c4f	c5 	. 
	ex (sp),hl			;2c50	e3 	. 
	ex de,hl			;2c51	eb 	. 
	rst 18h			;2c52	df 	. 
	pop bc			;2c53	c1 	. 
	jp c,01a18h		;2c54	da 18 1a 	. . . 
	ex (sp),hl			;2c57	e3 	. 
	push hl			;2c58	e5 	. 
	push bc			;2c59	c5 	. 
	ex de,hl			;2c5a	eb 	. 
	ld (040ech),hl		;2c5b	22 ec 40 	" . @ 
	call 00fafh		;2c5e	cd af 0f 	. . . 
	ld a,020h		;2c61	3e 20 	>   
	pop hl			;2c63	e1 	. 
	call 0032ah		;2c64	cd 2a 03 	. * . 
	call 02b7eh		;2c67	cd 7e 2b 	. ~ + 
	ld hl,(040a7h)		;2c6a	2a a7 40 	* . @ 
	call 02b75h		;2c6d	cd 75 2b 	. u + 
	call 020feh		;2c70	cd fe 20 	. .   
	jr $-64		;2c73	18 be 	. . 
	ld a,(hl)			;2c75	7e 	~ 
	or a			;2c76	b7 	. 
	ret z			;2c77	c8 	. 
	call 0032ah		;2c78	cd 2a 03 	. * . 
	inc hl			;2c7b	23 	# 
	jr $-7		;2c7c	18 f7 	. . 
	push hl			;2c7e	e5 	. 
	ld hl,(040a7h)		;2c7f	2a a7 40 	* . @ 
	ld b,h			;2c82	44 	D 
	ld c,l			;2c83	4d 	M 
	pop hl			;2c84	e1 	. 
	ld d,0ffh		;2c85	16 ff 	. . 
	jr $+5		;2c87	18 03 	. . 
	inc bc			;2c89	03 	. 
	dec d			;2c8a	15 	. 
	ret z			;2c8b	c8 	. 
	ld a,(hl)			;2c8c	7e 	~ 
	or a			;2c8d	b7 	. 
	inc hl			;2c8e	23 	# 
	ld (bc),a			;2c8f	02 	. 
	ret z			;2c90	c8 	. 
	jp p,02b89h		;2c91	f2 89 2b 	. . + 
	cp 0fbh		;2c94	fe fb 	. . 
	jr nz,$+10		;2c96	20 08 	  . 
	dec bc			;2c98	0b 	. 
	dec bc			;2c99	0b 	. 
	dec bc			;2c9a	0b 	. 
	dec bc			;2c9b	0b 	. 
	inc d			;2c9c	14 	. 
	inc d			;2c9d	14 	. 
	inc d			;2c9e	14 	. 
	inc d			;2c9f	14 	. 
	cp 095h		;2ca0	fe 95 	. . 
	call z,00b24h		;2ca2	cc 24 0b 	. $ . 
	sub 07fh		;2ca5	d6 7f 	.  
	push hl			;2ca7	e5 	. 
	ld e,a			;2ca8	5f 	_ 
	ld hl,01650h		;2ca9	21 50 16 	! P . 
	ld a,(hl)			;2cac	7e 	~ 
	or a			;2cad	b7 	. 
	inc hl			;2cae	23 	# 
	jp p,02bach		;2caf	f2 ac 2b 	. . + 
	dec e			;2cb2	1d 	. 
	jr nz,$-7		;2cb3	20 f7 	  . 
	and 07fh		;2cb5	e6 7f 	.  
	ld (bc),a			;2cb7	02 	. 
	inc bc			;2cb8	03 	. 
	dec d			;2cb9	15 	. 
	jp z,028d8h		;2cba	ca d8 28 	. . ( 
	ld a,(hl)			;2cbd	7e 	~ 
	inc hl			;2cbe	23 	# 
	or a			;2cbf	b7 	. 
	jp p,02bb7h		;2cc0	f2 b7 2b 	. . + 
	pop hl			;2cc3	e1 	. 
	jr $-56		;2cc4	18 c6 	. . 
	call 01b10h		;2cc6	cd 10 1b 	. . . 
	pop de			;2cc9	d1 	. 
	push bc			;2cca	c5 	. 
	push bc			;2ccb	c5 	. 
	call 01b2ch		;2ccc	cd 2c 1b 	. , . 
	jr nc,$+7		;2ccf	30 05 	0 . 
	ld d,h			;2cd1	54 	T 
	ld e,l			;2cd2	5d 	] 
	ex (sp),hl			;2cd3	e3 	. 
	push hl			;2cd4	e5 	. 
	rst 18h			;2cd5	df 	. 
	jp nc,01e4ah		;2cd6	d2 4a 1e 	. J . 
	ld hl,01929h		;2cd9	21 29 19 	! ) . 
	call 028a7h		;2cdc	cd a7 28 	. . ( 
	pop bc			;2cdf	c1 	. 
	ld hl,01ae8h		;2ce0	21 e8 1a 	! . . 
	ex (sp),hl			;2ce3	e3 	. 
	ex de,hl			;2ce4	eb 	. 
	ld hl,(040f9h)		;2ce5	2a f9 40 	* . @ 
	ld a,(de)			;2ce8	1a 	. 
	ld (bc),a			;2ce9	02 	. 
	inc bc			;2cea	03 	. 
	inc de			;2ceb	13 	. 
	rst 18h			;2cec	df 	. 
	jr nz,$-5		;2ced	20 f9 	  . 
	ld h,b			;2cef	60 	` 
	ld l,c			;2cf0	69 	i 
	ld (040f9h),hl		;2cf1	22 f9 40 	" . @ 
	ret			;2cf4	c9 	. 
	call 00284h		;2cf5	cd 84 02 	. . . 
	call 02337h		;2cf8	cd 37 23 	. 7 # 
	push hl			;2cfb	e5 	. 
	call 02a13h		;2cfc	cd 13 2a 	. . * 
	ld a,0d3h		;2cff	3e d3 	> . 
	call 00264h		;2d01	cd 64 02 	. d . 
	call 00261h		;2d04	cd 61 02 	. a . 
	ld a,(de)			;2d07	1a 	. 
	call 00264h		;2d08	cd 64 02 	. d . 
	ld hl,(040a4h)		;2d0b	2a a4 40 	* . @ 
	ex de,hl			;2d0e	eb 	. 
	ld hl,(040f9h)		;2d0f	2a f9 40 	* . @ 
	ld a,(de)			;2d12	1a 	. 
	inc de			;2d13	13 	. 
	call 00264h		;2d14	cd 64 02 	. d . 
	rst 18h			;2d17	df 	. 
	jr nz,$-6		;2d18	20 f8 	  . 
	call 001f8h		;2d1a	cd f8 01 	. . . 
	pop hl			;2d1d	e1 	. 
	ret			;2d1e	c9 	. 
	call 00293h		;2d1f	cd 93 02 	. . . 
	ld a,(hl)			;2d22	7e 	~ 
	sub 0b2h		;2d23	d6 b2 	. . 
	jr z,$+4		;2d25	28 02 	( . 
	xor a			;2d27	af 	. 
	ld bc,0232fh		;2d28	01 2f 23 	. / # 
	push af			;2d2b	f5 	. 
	dec hl			;2d2c	2b 	+ 
	rst 10h			;2d2d	d7 	. 
	ld a,000h		;2d2e	3e 00 	> . 
	jr z,$+9		;2d30	28 07 	( . 
	call 02337h		;2d32	cd 37 23 	. 7 # 
	call 02a13h		;2d35	cd 13 2a 	. . * 
	ld a,(de)			;2d38	1a 	. 
	ld l,a			;2d39	6f 	o 
	pop af			;2d3a	f1 	. 
	or a			;2d3b	b7 	. 
	ld h,a			;2d3c	67 	g 
	ld (04121h),hl		;2d3d	22 21 41 	" ! A 
	call z,01b4dh		;2d40	cc 4d 1b 	. M . 
	ld hl,(04121h)		;2d43	2a 21 41 	* ! A 
	ex de,hl			;2d46	eb 	. 
	ld b,003h		;2d47	06 03 	. . 
	call 00235h		;2d49	cd 35 02 	. 5 . 
	sub 0d3h		;2d4c	d6 d3 	. . 
	jr nz,$-7		;2d4e	20 f7 	  . 
	djnz $-7		;2d50	10 f7 	. . 
	call 00235h		;2d52	cd 35 02 	. 5 . 
	inc e			;2d55	1c 	. 
	dec e			;2d56	1d 	. 
	jr z,$+5		;2d57	28 03 	( . 
	cp e			;2d59	bb 	. 
	jr nz,$+57		;2d5a	20 37 	  7 
	ld hl,(040a4h)		;2d5c	2a a4 40 	* . @ 
	ld b,003h		;2d5f	06 03 	. . 
	call 00235h		;2d61	cd 35 02 	. 5 . 
	ld e,a			;2d64	5f 	_ 
	sub (hl)			;2d65	96 	. 
	and d			;2d66	a2 	. 
	jr nz,$+35		;2d67	20 21 	  ! 
	ld (hl),e			;2d69	73 	s 
	call 0196ch		;2d6a	cd 6c 19 	. l . 
	ld a,(hl)			;2d6d	7e 	~ 
	or a			;2d6e	b7 	. 
	inc hl			;2d6f	23 	# 
	jr nz,$-17		;2d70	20 ed 	  . 
	call 0022ch		;2d72	cd 2c 02 	. , . 
	djnz $-20		;2d75	10 ea 	. . 
	ld (040f9h),hl		;2d77	22 f9 40 	" . @ 
	ld hl,01929h		;2d7a	21 29 19 	! ) . 
	call 028a7h		;2d7d	cd a7 28 	. . ( 
	call 001f8h		;2d80	cd f8 01 	. . . 
	ld hl,(040a4h)		;2d83	2a a4 40 	* . @ 
	push hl			;2d86	e5 	. 
	jp 01ae8h		;2d87	c3 e8 1a 	. . . 
	ld hl,02ca5h		;2d8a	21 a5 2c 	! . , 
	call 028a7h		;2d8d	cd a7 28 	. . ( 
	jp 01a18h		;2d90	c3 18 1a 	. . . 
	ld (03c3eh),a		;2d93	32 3e 3c 	2 > < 
	ld b,003h		;2d96	06 03 	. . 
	call 00235h		;2d98	cd 35 02 	. 5 . 
	or a			;2d9b	b7 	. 
	jr nz,$-6		;2d9c	20 f8 	  . 
	djnz $-6		;2d9e	10 f8 	. . 
	call 00296h		;2da0	cd 96 02 	. . . 
	jr $-92		;2da3	18 a2 	. . 
	ld b,d			;2da5	42 	B 
	ld b,c			;2da6	41 	A 
	ld b,h			;2da7	44 	D 
	dec c			;2da8	0d 	. 
	nop			;2da9	00 	. 
	call 00a7fh		;2daa	cd 7f 0a 	.  . 
	ld a,(hl)			;2dad	7e 	~ 
	jp 027f8h		;2dae	c3 f8 27 	. . ' 
	call 02b02h		;2db1	cd 02 2b 	. . + 
	push de			;2db4	d5 	. 
	rst 8			;2db5	cf 	. 
	inc l			;2db6	2c 	, 
	call 02b1ch		;2db7	cd 1c 2b 	. . + 
	pop de			;2dba	d1 	. 
	ld (de),a			;2dbb	12 	. 
	ret			;2dbc	c9 	. 
	call 02338h		;2dbd	cd 38 23 	. 8 # 
	call 00af4h		;2dc0	cd f4 0a 	. . . 
	rst 8			;2dc3	cf 	. 
	dec sp			;2dc4	3b 	; 
	ex de,hl			;2dc5	eb 	. 
	ld hl,(04121h)		;2dc6	2a 21 41 	* ! A 
	jr $+10		;2dc9	18 08 	. . 
	ld a,(040deh)		;2dcb	3a de 40 	: . @ 
	or a			;2dce	b7 	. 
	jr z,$+14		;2dcf	28 0c 	( . 
	pop de			;2dd1	d1 	. 
	ex de,hl			;2dd2	eb 	. 
	push hl			;2dd3	e5 	. 
	xor a			;2dd4	af 	. 
	ld (040deh),a		;2dd5	32 de 40 	2 . @ 
	cp d			;2dd8	ba 	. 
	push af			;2dd9	f5 	. 
	push de			;2dda	d5 	. 
	ld b,(hl)			;2ddb	46 	F 
	or b			;2ddc	b0 	. 
	jp z,01e4ah		;2ddd	ca 4a 1e 	. J . 
	inc hl			;2de0	23 	# 
	ld c,(hl)			;2de1	4e 	N 
	inc hl			;2de2	23 	# 
	ld h,(hl)			;2de3	66 	f 
	ld l,c			;2de4	69 	i 
	jr $+30		;2de5	18 1c 	. . 
	ld e,b			;2de7	58 	X 
	push hl			;2de8	e5 	. 
	ld c,002h		;2de9	0e 02 	. . 
	ld a,(hl)			;2deb	7e 	~ 
	inc hl			;2dec	23 	# 
	cp 025h		;2ded	fe 25 	. % 
	jp z,02e17h		;2def	ca 17 2e 	. . . 
	cp 020h		;2df2	fe 20 	.   
	jr nz,$+5		;2df4	20 03 	  . 
	inc c			;2df6	0c 	. 
	djnz $-12		;2df7	10 f2 	. . 
	pop hl			;2df9	e1 	. 
	ld b,e			;2dfa	43 	C 
	ld a,025h		;2dfb	3e 25 	> % 
	call 02e49h		;2dfd	cd 49 2e 	. I . 
	call 0032ah		;2e00	cd 2a 03 	. * . 
	xor a			;2e03	af 	. 
	ld e,a			;2e04	5f 	_ 
	ld d,a			;2e05	57 	W 
	call 02e49h		;2e06	cd 49 2e 	. I . 
	ld d,a			;2e09	57 	W 
	ld a,(hl)			;2e0a	7e 	~ 
	inc hl			;2e0b	23 	# 
	cp 021h		;2e0c	fe 21 	. ! 
	jp z,02e14h		;2e0e	ca 14 2e 	. . . 
	cp 023h		;2e11	fe 23 	. # 
	jr z,$+57		;2e13	28 37 	( 7 
	dec b			;2e15	05 	. 
	jp z,02dfeh		;2e16	ca fe 2d 	. . - 
	cp 02bh		;2e19	fe 2b 	. + 
	ld a,008h		;2e1b	3e 08 	> . 
	jr z,$-23		;2e1d	28 e7 	( . 
	dec hl			;2e1f	2b 	+ 
	ld a,(hl)			;2e20	7e 	~ 
	inc hl			;2e21	23 	# 
	cp 02eh		;2e22	fe 2e 	. . 
	jr z,$+66		;2e24	28 40 	( @ 
	cp 025h		;2e26	fe 25 	. % 
	jr z,$-65		;2e28	28 bd 	( . 
	cp (hl)			;2e2a	be 	. 
	jr nz,$-46		;2e2b	20 d0 	  . 
	cp 024h		;2e2d	fe 24 	. $ 
	jr z,$+22		;2e2f	28 14 	( . 
	cp 02ah		;2e31	fe 2a 	. * 
	jr nz,$-54		;2e33	20 c8 	  . 
	ld a,b			;2e35	78 	x 
	cp 002h		;2e36	fe 02 	. . 
	inc hl			;2e38	23 	# 
	jr c,$+5		;2e39	38 03 	8 . 
	ld a,(hl)			;2e3b	7e 	~ 
	cp 024h		;2e3c	fe 24 	. $ 
	ld a,020h		;2e3e	3e 20 	>   
	jr nz,$+9		;2e40	20 07 	  . 
	dec b			;2e42	05 	. 
	inc e			;2e43	1c 	. 
	cp 0afh		;2e44	fe af 	. . 
	add a,010h		;2e46	c6 10 	. . 
	inc hl			;2e48	23 	# 
	inc e			;2e49	1c 	. 
	add a,d			;2e4a	82 	. 
	ld d,a			;2e4b	57 	W 
	inc e			;2e4c	1c 	. 
	ld c,000h		;2e4d	0e 00 	. . 
	dec b			;2e4f	05 	. 
	jr z,$+73		;2e50	28 47 	( G 
	ld a,(hl)			;2e52	7e 	~ 
	inc hl			;2e53	23 	# 
	cp 02eh		;2e54	fe 2e 	. . 
	jr z,$+26		;2e56	28 18 	( . 
	cp 023h		;2e58	fe 23 	. # 
	jr z,$-14		;2e5a	28 f0 	( . 
	cp 02ch		;2e5c	fe 2c 	. , 
	jr nz,$+28		;2e5e	20 1a 	  . 
	ld a,d			;2e60	7a 	z 
	or 040h		;2e61	f6 40 	. @ 
	ld d,a			;2e63	57 	W 
	jr $-24		;2e64	18 e6 	. . 
	ld a,(hl)			;2e66	7e 	~ 
	cp 023h		;2e67	fe 23 	. # 
	ld a,02eh		;2e69	3e 2e 	> . 
	jr nz,$-110		;2e6b	20 90 	  . 
	ld c,001h		;2e6d	0e 01 	. . 
	inc hl			;2e6f	23 	# 
	inc c			;2e70	0c 	. 
	dec b			;2e71	05 	. 
	jr z,$+39		;2e72	28 25 	( % 
	ld a,(hl)			;2e74	7e 	~ 
	inc hl			;2e75	23 	# 
	cp 023h		;2e76	fe 23 	. # 
	jr z,$-8		;2e78	28 f6 	( . 
	push de			;2e7a	d5 	. 
	ld de,02d97h		;2e7b	11 97 2d 	. . - 
	push de			;2e7e	d5 	. 
	ld d,h			;2e7f	54 	T 
	ld e,l			;2e80	5d 	] 
	cp 05bh		;2e81	fe 5b 	. [ 
	ret nz			;2e83	c0 	. 
	cp (hl)			;2e84	be 	. 
	ret nz			;2e85	c0 	. 
	inc hl			;2e86	23 	# 
	cp (hl)			;2e87	be 	. 
	ret nz			;2e88	c0 	. 
	inc hl			;2e89	23 	# 
	cp (hl)			;2e8a	be 	. 
	ret nz			;2e8b	c0 	. 
	inc hl			;2e8c	23 	# 
	ld a,b			;2e8d	78 	x 
	sub 004h		;2e8e	d6 04 	. . 
	ret c			;2e90	d8 	. 
	pop de			;2e91	d1 	. 
	pop de			;2e92	d1 	. 
	ld b,a			;2e93	47 	G 
	inc d			;2e94	14 	. 
	inc hl			;2e95	23 	# 
	jp z,0d1ebh		;2e96	ca eb d1 	. . . 
	ld a,d			;2e99	7a 	z 
	dec hl			;2e9a	2b 	+ 
	inc e			;2e9b	1c 	. 
	and 008h		;2e9c	e6 08 	. . 
	jr nz,$+23		;2e9e	20 15 	  . 
	dec e			;2ea0	1d 	. 
	ld a,b			;2ea1	78 	x 
	or a			;2ea2	b7 	. 
	jr z,$+18		;2ea3	28 10 	( . 
	ld a,(hl)			;2ea5	7e 	~ 
	sub 02dh		;2ea6	d6 2d 	. - 
	jr z,$+8		;2ea8	28 06 	( . 
	cp 0feh		;2eaa	fe fe 	. . 
	jr nz,$+9		;2eac	20 07 	  . 
	ld a,008h		;2eae	3e 08 	> . 
	add a,004h		;2eb0	c6 04 	. . 
	add a,d			;2eb2	82 	. 
	ld d,a			;2eb3	57 	W 
	dec b			;2eb4	05 	. 
	pop hl			;2eb5	e1 	. 
	pop af			;2eb6	f1 	. 
	jr z,$+82		;2eb7	28 50 	( P 
	push bc			;2eb9	c5 	. 
	push de			;2eba	d5 	. 
	call 02337h		;2ebb	cd 37 23 	. 7 # 
	pop de			;2ebe	d1 	. 
	pop bc			;2ebf	c1 	. 
	push bc			;2ec0	c5 	. 
	push hl			;2ec1	e5 	. 
	ld b,e			;2ec2	43 	C 
	ld a,b			;2ec3	78 	x 
	add a,c			;2ec4	81 	. 
	cp 019h		;2ec5	fe 19 	. . 
	jp nc,01e4ah		;2ec7	d2 4a 1e 	. J . 
	ld a,d			;2eca	7a 	z 
	or 080h		;2ecb	f6 80 	. . 
	call 00fbeh		;2ecd	cd be 0f 	. . . 
	call 028a7h		;2ed0	cd a7 28 	. . ( 
	pop hl			;2ed3	e1 	. 
	dec hl			;2ed4	2b 	+ 
	rst 10h			;2ed5	d7 	. 
	scf			;2ed6	37 	7 
	jr z,$+15		;2ed7	28 0d 	( . 
	ld (040deh),a		;2ed9	32 de 40 	2 . @ 
	cp 03bh		;2edc	fe 3b 	. ; 
	jr z,$+7		;2ede	28 05 	( . 
	cp 02ch		;2ee0	fe 2c 	. , 
	jp nz,01997h		;2ee2	c2 97 19 	. . . 
	rst 10h			;2ee5	d7 	. 
	pop bc			;2ee6	c1 	. 
	ex de,hl			;2ee7	eb 	. 
	pop hl			;2ee8	e1 	. 
	push hl			;2ee9	e5 	. 
	push af			;2eea	f5 	. 
	push de			;2eeb	d5 	. 
	ld a,(hl)			;2eec	7e 	~ 
	sub b			;2eed	90 	. 
	inc hl			;2eee	23 	# 
	ld c,(hl)			;2eef	4e 	N 
	inc hl			;2ef0	23 	# 
	ld h,(hl)			;2ef1	66 	f 
	ld l,c			;2ef2	69 	i 
	ld d,000h		;2ef3	16 00 	. . 
	ld e,a			;2ef5	5f 	_ 
	add hl,de			;2ef6	19 	. 
	ld a,b			;2ef7	78 	x 
	or a			;2ef8	b7 	. 
	jp nz,02d03h		;2ef9	c2 03 2d 	. . - 
	jr $+8		;2efc	18 06 	. . 
	call 02e49h		;2efe	cd 49 2e 	. I . 
	call 0032ah		;2f01	cd 2a 03 	. * . 
	pop hl			;2f04	e1 	. 
	pop af			;2f05	f1 	. 
	jp nz,02ccbh		;2f06	c2 cb 2c 	. . , 
	call c,020feh		;2f09	dc fe 20 	. .   
	ex (sp),hl			;2f0c	e3 	. 
	call 029ddh		;2f0d	cd dd 29 	. . ) 
	pop hl			;2f10	e1 	. 
	jp 02169h		;2f11	c3 69 21 	. i ! 
	ld c,001h		;2f14	0e 01 	. . 
	ld a,0f1h		;2f16	3e f1 	> . 
	dec b			;2f18	05 	. 
	call 02e49h		;2f19	cd 49 2e 	. I . 
	pop hl			;2f1c	e1 	. 
	pop af			;2f1d	f1 	. 
	jr z,$-21		;2f1e	28 e9 	( . 
	push bc			;2f20	c5 	. 
	call 02337h		;2f21	cd 37 23 	. 7 # 
	call 00af4h		;2f24	cd f4 0a 	. . . 
	pop bc			;2f27	c1 	. 
	push bc			;2f28	c5 	. 
	push hl			;2f29	e5 	. 
	ld hl,(04121h)		;2f2a	2a 21 41 	* ! A 
	ld b,c			;2f2d	41 	A 
	ld c,000h		;2f2e	0e 00 	. . 
	push bc			;2f30	c5 	. 
	call 02a68h		;2f31	cd 68 2a 	. h * 
	call 028aah		;2f34	cd aa 28 	. . ( 
	ld hl,(04121h)		;2f37	2a 21 41 	* ! A 
	pop af			;2f3a	f1 	. 
	sub (hl)			;2f3b	96 	. 
	ld b,a			;2f3c	47 	G 
	ld a,020h		;2f3d	3e 20 	>   
	inc b			;2f3f	04 	. 
	dec b			;2f40	05 	. 
	jp z,02dd3h		;2f41	ca d3 2d 	. . - 
	call 0032ah		;2f44	cd 2a 03 	. * . 
	jr $-7		;2f47	18 f7 	. . 
	push af			;2f49	f5 	. 
	ld a,d			;2f4a	7a 	z 
	or a			;2f4b	b7 	. 
	ld a,02bh		;2f4c	3e 2b 	> + 
	call nz,0032ah		;2f4e	c4 2a 03 	. * . 
	pop af			;2f51	f1 	. 
	ret			;2f52	c9 	. 
	ld (0409ah),a		;2f53	32 9a 40 	2 . @ 
	ld hl,(040eah)		;2f56	2a ea 40 	* . @ 
	or h			;2f59	b4 	. 
	and l			;2f5a	a5 	. 
	inc a			;2f5b	3c 	< 
	ex de,hl			;2f5c	eb 	. 
	ret z			;2f5d	c8 	. 
	jr $+6		;2f5e	18 04 	. . 
	call 01e4fh		;2f60	cd 4f 1e 	. O . 
	ret nz			;2f63	c0 	. 
	pop hl			;2f64	e1 	. 
	ex de,hl			;2f65	eb 	. 
	ld (040ech),hl		;2f66	22 ec 40 	" . @ 
	ex de,hl			;2f69	eb 	. 
	call 01b2ch		;2f6a	cd 2c 1b 	. , . 
	jp nc,01ed9h		;2f6d	d2 d9 1e 	. . . 
	ld h,b			;2f70	60 	` 
	ld l,c			;2f71	69 	i 
	inc hl			;2f72	23 	# 
	inc hl			;2f73	23 	# 
	ld c,(hl)			;2f74	4e 	N 
	inc hl			;2f75	23 	# 
	ld b,(hl)			;2f76	46 	F 
	inc hl			;2f77	23 	# 
	push bc			;2f78	c5 	. 
	call 02b7eh		;2f79	cd 7e 2b 	. ~ + 
	pop hl			;2f7c	e1 	. 
	push hl			;2f7d	e5 	. 
	call 00fafh		;2f7e	cd af 0f 	. . . 
	ld a,020h		;2f81	3e 20 	>   
	call 0032ah		;2f83	cd 2a 03 	. * . 
	ld hl,(040a7h)		;2f86	2a a7 40 	* . @ 
	ld a,00eh		;2f89	3e 0e 	> . 
	call 0032ah		;2f8b	cd 2a 03 	. * . 
	push hl			;2f8e	e5 	. 
	ld c,0ffh		;2f8f	0e ff 	. . 
	inc c			;2f91	0c 	. 
	ld a,(hl)			;2f92	7e 	~ 
	or a			;2f93	b7 	. 
	inc hl			;2f94	23 	# 
	jr nz,$-4		;2f95	20 fa 	  . 
	pop hl			;2f97	e1 	. 
	ld b,a			;2f98	47 	G 
	ld d,000h		;2f99	16 00 	. . 
	call 00384h		;2f9b	cd 84 03 	. . . 
	sub 030h		;2f9e	d6 30 	. 0 
	jr c,$+16		;2fa0	38 0e 	8 . 
	cp 00ah		;2fa2	fe 0a 	. . 
	jr nc,$+12		;2fa4	30 0a 	0 . 
	ld e,a			;2fa6	5f 	_ 
	ld a,d			;2fa7	7a 	z 
	rlca			;2fa8	07 	. 
	rlca			;2fa9	07 	. 
	add a,d			;2faa	82 	. 
	rlca			;2fab	07 	. 
	add a,e			;2fac	83 	. 
	ld d,a			;2fad	57 	W 
	jr $-19		;2fae	18 eb 	. . 
	push hl			;2fb0	e5 	. 
	ld hl,02e99h		;2fb1	21 99 2e 	! . . 
	ex (sp),hl			;2fb4	e3 	. 
	dec d			;2fb5	15 	. 
	inc d			;2fb6	14 	. 
	jp nz,02ebbh		;2fb7	c2 bb 2e 	. . . 
	inc d			;2fba	14 	. 
	cp 0d8h		;2fbb	fe d8 	. . 
	jp z,02fd2h		;2fbd	ca d2 2f 	. . / 
	cp 0ddh		;2fc0	fe dd 	. . 
	jp z,02fe0h		;2fc2	ca e0 2f 	. . / 
	cp 0f0h		;2fc5	fe f0 	. . 
	jr z,$+67		;2fc7	28 41 	( A 
	cp 031h		;2fc9	fe 31 	. 1 
	jr c,$+4		;2fcb	38 02 	8 . 
	sub 020h		;2fcd	d6 20 	.   
	cp 021h		;2fcf	fe 21 	. ! 
	jp z,02ff6h		;2fd1	ca f6 2f 	. . / 
	cp 01ch		;2fd4	fe 1c 	. . 
	jp z,02f40h		;2fd6	ca 40 2f 	. @ / 
	cp 023h		;2fd9	fe 23 	. # 
	jr z,$+65		;2fdb	28 3f 	( ? 
	cp 019h		;2fdd	fe 19 	. . 
	jp z,02f7dh		;2fdf	ca 7d 2f 	. } / 
	cp 014h		;2fe2	fe 14 	. . 
	jp z,02f4ah		;2fe4	ca 4a 2f 	. J / 
	cp 013h		;2fe7	fe 13 	. . 
	jp z,02f65h		;2fe9	ca 65 2f 	. e / 
	cp 015h		;2fec	fe 15 	. . 
	jp z,02fe3h		;2fee	ca e3 2f 	. . / 
	cp 028h		;2ff1	fe 28 	. ( 
	jp z,02f78h		;2ff3	ca 78 2f 	. x / 
	cp 01bh		;2ff6	fe 1b 	. . 
	jr z,$+30		;2ff8	28 1c 	( . 
	cp 018h		;2ffa	fe 18 	. . 
	jp z,02f75h		;2ffc	ca 75 2f 	. u / 
	cp 011h		;2fff	fe 11 	. . 
	ret nz			;3001	c0 	. 
	pop bc			;3002	c1 	. 
	pop de			;3003	d1 	. 
	call 020feh		;3004	cd fe 20 	. .   
	jp 02e65h		;3007	c3 65 2e 	. e . 
	ld a,(hl)			;300a	7e 	~ 
	or a			;300b	b7 	. 
	ret z			;300c	c8 	. 
	inc b			;300d	04 	. 
	call 0032ah		;300e	cd 2a 03 	. * . 
	inc hl			;3011	23 	# 
	dec d			;3012	15 	. 
	jr nz,$-9		;3013	20 f5 	  . 
	ret			;3015	c9 	. 
	push hl			;3016	e5 	. 
	ld hl,02f5fh		;3017	21 5f 2f 	! _ / 
	ex (sp),hl			;301a	e3 	. 
	scf			;301b	37 	7 
	push af			;301c	f5 	. 
	call 00384h		;301d	cd 84 03 	. . . 
	ld e,a			;3020	5f 	_ 
	pop af			;3021	f1 	. 
	push af			;3022	f5 	. 
	call c,02f5fh		;3023	dc 5f 2f 	. _ / 
	ld a,(hl)			;3026	7e 	~ 
	or a			;3027	b7 	. 
	jp z,02f3eh		;3028	ca 3e 2f 	. > / 
	call 0032ah		;302b	cd 2a 03 	. * . 
	pop af			;302e	f1 	. 
	push af			;302f	f5 	. 
	call c,02fa1h		;3030	dc a1 2f 	. . / 
	jr c,$+4		;3033	38 02 	8 . 
	inc hl			;3035	23 	# 
	inc b			;3036	04 	. 
	ld a,(hl)			;3037	7e 	~ 
	cp e			;3038	bb 	. 
	jr nz,$-19		;3039	20 eb 	  . 
	dec d			;303b	15 	. 
	jr nz,$-22		;303c	20 e8 	  . 
	pop af			;303e	f1 	. 
	ret			;303f	c9 	. 
	call 02b75h		;3040	cd 75 2b 	. u + 
	call 020feh		;3043	cd fe 20 	. .   
	pop bc			;3046	c1 	. 
	jp 02e7ch		;3047	c3 7c 2e 	. | . 
	ld a,(hl)			;304a	7e 	~ 
	or a			;304b	b7 	. 
	ret z			;304c	c8 	. 
	ld a,021h		;304d	3e 21 	> ! 
	call 0032ah		;304f	cd 2a 03 	. * . 
	ld a,(hl)			;3052	7e 	~ 
	or a			;3053	b7 	. 
	jr z,$+11		;3054	28 09 	( . 
	call 0032ah		;3056	cd 2a 03 	. * . 
	call 02fa1h		;3059	cd a1 2f 	. . / 
	dec d			;305c	15 	. 
	jr nz,$-11		;305d	20 f3 	  . 
	ld a,021h		;305f	3e 21 	> ! 
	call 0032ah		;3061	cd 2a 03 	. * . 
	ret			;3064	c9 	. 
	ld a,(hl)			;3065	7e 	~ 
	or a			;3066	b7 	. 
	ret z			;3067	c8 	. 
	call 00384h		;3068	cd 84 03 	. . . 
	ld (hl),a			;306b	77 	w 
	call 0032ah		;306c	cd 2a 03 	. * . 
	inc hl			;306f	23 	# 
	inc b			;3070	04 	. 
	dec d			;3071	15 	. 
	jr nz,$-13		;3072	20 f1 	  . 
	ret			;3074	c9 	. 
	ld (hl),000h		;3075	36 00 	6 . 
	ld c,b			;3077	48 	H 
	ld d,0ffh		;3078	16 ff 	. . 
	call 02f0ah		;307a	cd 0a 2f 	. . / 
	call 00384h		;307d	cd 84 03 	. . . 
	or a			;3080	b7 	. 
	jp z,02f7dh		;3081	ca 7d 2f 	. } / 
	cp 008h		;3084	fe 08 	. . 
	jr z,$+12		;3086	28 0a 	( . 
	cp 00dh		;3088	fe 0d 	. . 
	jp z,02fe0h		;308a	ca e0 2f 	. . / 
	cp 01bh		;308d	fe 1b 	. . 
	ret z			;308f	c8 	. 
	jr nz,$+32		;3090	20 1e 	  . 
	ld a,008h		;3092	3e 08 	> . 
	dec b			;3094	05 	. 
	inc b			;3095	04 	. 
	jr z,$+33		;3096	28 1f 	( . 
	call 0032ah		;3098	cd 2a 03 	. * . 
	dec hl			;309b	2b 	+ 
	dec b			;309c	05 	. 
	ld de,02f7dh		;309d	11 7d 2f 	. } / 
	push de			;30a0	d5 	. 
	push hl			;30a1	e5 	. 
	dec c			;30a2	0d 	. 
	ld a,(hl)			;30a3	7e 	~ 
	or a			;30a4	b7 	. 
	scf			;30a5	37 	7 
	jp z,00890h		;30a6	ca 90 08 	. . . 
	inc hl			;30a9	23 	# 
	ld a,(hl)			;30aa	7e 	~ 
	dec hl			;30ab	2b 	+ 
	ld (hl),a			;30ac	77 	w 
	inc hl			;30ad	23 	# 
	jr $-11		;30ae	18 f3 	. . 
	push af			;30b0	f5 	. 
	ld a,c			;30b1	79 	y 
	cp 0ffh		;30b2	fe ff 	. . 
	jr c,$+5		;30b4	38 03 	8 . 
	pop af			;30b6	f1 	. 
	jr $-58		;30b7	18 c4 	. . 
	sub b			;30b9	90 	. 
	inc c			;30ba	0c 	. 
	inc b			;30bb	04 	. 
	push bc			;30bc	c5 	. 
	ex de,hl			;30bd	eb 	. 
	ld l,a			;30be	6f 	o 
	ld h,000h		;30bf	26 00 	& . 
	add hl,de			;30c1	19 	. 
	ld b,h			;30c2	44 	D 
	ld c,l			;30c3	4d 	M 
	inc hl			;30c4	23 	# 
	call 01958h		;30c5	cd 58 19 	. X . 
	pop bc			;30c8	c1 	. 
	pop af			;30c9	f1 	. 
	ld (hl),a			;30ca	77 	w 
	call 0032ah		;30cb	cd 2a 03 	. * . 
	inc hl			;30ce	23 	# 
	jp 02f7dh		;30cf	c3 7d 2f 	. } / 
	ld a,b			;30d2	78 	x 
	or a			;30d3	b7 	. 
	ret z			;30d4	c8 	. 
	dec b			;30d5	05 	. 
	dec hl			;30d6	2b 	+ 
	ld a,008h		;30d7	3e 08 	> . 
	call 0032ah		;30d9	cd 2a 03 	. * . 
	dec d			;30dc	15 	. 
	jr nz,$-11		;30dd	20 f3 	  . 
	ret			;30df	c9 	. 
	call 02b75h		;30e0	cd 75 2b 	. u + 
	call 020feh		;30e3	cd fe 20 	. .   
	pop bc			;30e6	c1 	. 
	pop de			;30e7	d1 	. 
	ld a,d			;30e8	7a 	z 
	and e			;30e9	a3 	. 
	inc a			;30ea	3c 	< 
	ld hl,(040a7h)		;30eb	2a a7 40 	* . @ 
	dec hl			;30ee	2b 	+ 
	ret z			;30ef	c8 	. 
	scf			;30f0	37 	7 
	inc hl			;30f1	23 	# 
	push af			;30f2	f5 	. 
	jp 01a98h		;30f3	c3 98 1a 	. . . 
	pop bc			;30f6	c1 	. 
	pop de			;30f7	d1 	. 
	jp 01a19h		;30f8	c3 19 1a 	. . . 
	sbc a,0c3h		;30fb	de c3 	. . 
	jp 0b244h		;30fd	c3 44 b2 	. D . 
	call 0305ch		;3100	cd 5c 30 	. \ 0 
	jp 03021h		;3103	c3 21 30 	. ! 0 
	ld hl,03147h		;3106	21 47 31 	! G 1 
	jr $+9		;3109	18 07 	. . 
	call 0305ch		;310b	cd 5c 30 	. \ 0 
	ld a,010h		;310e	3e 10 	> . 
	jr $+18		;3110	18 10 	. . 
	ld (0401eh),hl		;3112	22 1e 40 	" . @ 
	ld hl,033d4h		;3115	21 d4 33 	! . 3 
	ld (04004h),hl		;3118	22 04 40 	" . @ 
	call 01b61h		;311b	cd 61 1b 	. a . 
	jp 01a19h		;311e	c3 19 1a 	. . . 
	xor a			;3121	af 	. 
	ld (iy+006h),a		;3122	fd 77 06 	. w . 
	push iy		;3125	fd e5 	. . 
	pop hl			;3127	e1 	. 
	ld b,005h		;3128	06 05 	. . 
	xor a			;312a	af 	. 
	inc hl			;312b	23 	# 
	ld (hl),a			;312c	77 	w 
	djnz $-2		;312d	10 fc 	. . 
	ld hl,03040h		;312f	21 40 30 	! @ 0 
	call 001c9h		;3132	cd c9 01 	. . . 
	call 028a7h		;3135	cd a7 28 	. . ( 
	ld hl,03078h		;3138	21 78 30 	! x 0 
	ld (04016h),hl		;313b	22 16 40 	" . @ 
	jr $-56		;313e	18 c6 	. . 
	ld c,(hl)			;3140	4e 	N 
	ld b,l			;3141	45 	E 
	ld d,a			;3142	57 	W 
	jr nz,$+77		;3143	20 4b 	  K 
	ld b,l			;3145	45 	E 
	ld e,c			;3146	59 	Y 
	ld b,d			;3147	42 	B 
	ld c,a			;3148	4f 	O 
	ld b,c			;3149	41 	A 
	ld d,d			;314a	52 	R 
	ld b,h			;314b	44 	D 
	jr nz,$+84		;314c	20 52 	  R 
	ld c,a			;314e	4f 	O 
	ld d,l			;314f	55 	U 
	ld d,h			;3150	54 	T 
	ld c,c			;3151	49 	I 
	ld c,(hl)			;3152	4e 	N 
	ld b,l			;3153	45 	E 
	jr nz,$+71		;3154	20 45 	  E 
	ld c,(hl)			;3156	4e 	N 
	ld b,c			;3157	41 	A 
	ld b,d			;3158	42 	B 
	ld c,h			;3159	4c 	L 
	ld b,l			;315a	45 	E 
	nop			;315b	00 	. 
	ld hl,(040b1h)		;315c	2a b1 40 	* . @ 
	ld de,0fffah		;315f	11 fa ff 	. . . 
	add hl,de			;3162	19 	. 
	ld (040b1h),hl		;3163	22 b1 40 	" . @ 
	ld (04049h),hl		;3166	22 49 40 	" I @ 
	ld (0401bh),hl		;3169	22 1b 40 	" . @ 
	ld de,0ffceh		;316c	11 ce ff 	. . . 
	add hl,de			;316f	19 	. 
	ld (040a0h),hl		;3170	22 a0 40 	" . @ 
	ld iy,(0401bh)		;3173	fd 2a 1b 40 	. * . @ 
	ret			;3177	c9 	. 
	push iy		;3178	fd e5 	. . 
	call 03080h		;317a	cd 80 30 	. . 0 
	pop iy		;317d	fd e1 	. . 
	ret			;317f	c9 	. 
	ld iy,(0401bh)		;3180	fd 2a 1b 40 	. * . @ 
	ld hl,04036h		;3184	21 36 40 	! 6 @ 
	ld bc,03880h		;3187	01 80 38 	. . 8 
	ld a,(bc)			;318a	0a 	. 
	and 001h		;318b	e6 01 	. . 
	jr z,$+22		;318d	28 14 	( . 
	ld c,040h		;318f	0e 40 	. @ 
	ld a,(bc)			;3191	0a 	. 
	and 004h		;3192	e6 04 	. . 
	jr z,$+15		;3194	28 0d 	( . 
	ld a,(bc)			;3196	0a 	. 
	and 004h		;3197	e6 04 	. . 
	jr nz,$-3		;3199	20 fb 	  . 
	ld a,(iy+006h)		;319b	fd 7e 06 	. ~ . 
	xor 010h		;319e	ee 10 	. . 
	ld (iy+006h),a		;31a0	fd 77 06 	. w . 
	ld a,(iy+005h)		;31a3	fd 7e 05 	. ~ . 
	and a			;31a6	a7 	. 
	jr z,$+10		;31a7	28 08 	( . 
	ld e,a			;31a9	5f 	_ 
	ld c,(iy+003h)		;31aa	fd 4e 03 	. N . 
	ld a,(bc)			;31ad	0a 	. 
	and e			;31ae	a3 	. 
	jr nz,$+73		;31af	20 47 	  G 
	ld a,(04022h)		;31b1	3a 22 40 	: " @ 
	and a			;31b4	a7 	. 
	jr z,$+21		;31b5	28 13 	( . 
	ld a,(iy+006h)		;31b7	fd 7e 06 	. ~ . 
	and a			;31ba	a7 	. 
	jr nz,$+15		;31bb	20 0d 	  . 
	inc (iy+002h)		;31bd	fd 34 02 	. 4 . 
	jr nz,$+10		;31c0	20 08 	  . 
	ld de,(04020h)		;31c2	ed 5b 20 40 	. [   @ 
	ld a,(de)			;31c6	1a 	. 
	xor 0d0h		;31c7	ee d0 	. . 
	ld (de),a			;31c9	12 	. 
	xor a			;31ca	af 	. 
	ld (iy+005h),a		;31cb	fd 77 05 	. w . 
	ld c,001h		;31ce	0e 01 	. . 
	ld d,000h		;31d0	16 00 	. . 
	ld a,(bc)			;31d2	0a 	. 
	ld e,a			;31d3	5f 	_ 
	xor (hl)			;31d4	ae 	. 
	ld (hl),e			;31d5	73 	s 
	and e			;31d6	a3 	. 
	jr nz,$+10		;31d7	20 08 	  . 
	inc d			;31d9	14 	. 
	inc l			;31da	2c 	, 
	rlc c		;31db	cb 01 	. . 
	jp p,030d2h		;31dd	f2 d2 30 	. . 0 
	ret			;31e0	c9 	. 
	ld e,a			;31e1	5f 	_ 
	push bc			;31e2	c5 	. 
	ld bc,00600h		;31e3	01 00 06 	. . . 
	call 00060h		;31e6	cd 60 00 	. ` . 
	pop bc			;31e9	c1 	. 
	ld a,(bc)			;31ea	0a 	. 
	and e			;31eb	a3 	. 
	ret z			;31ec	c8 	. 
	ld (iy+005h),a		;31ed	fd 77 05 	. w . 
	ld (iy+003h),c		;31f0	fd 71 03 	. q . 
	ld (iy+004h),b		;31f3	fd 70 04 	. p . 
	jr $+111		;31f6	18 6d 	. m 
	ld a,(iy+004h)		;31f8	fd 7e 04 	. ~ . 
	and a			;31fb	a7 	. 
	jr nz,$+16		;31fc	20 0e 	  . 
	push bc			;31fe	c5 	. 
	ld bc,00a00h		;31ff	01 00 0a 	. . . 
	call 00060h		;3202	cd 60 00 	. ` . 
	pop bc			;3205	c1 	. 
	ld a,(bc)			;3206	0a 	. 
	and e			;3207	a3 	. 
	jr z,$-62		;3208	28 c0 	( . 
	jr $+42		;320a	18 28 	. ( 
	ld hl,04c00h		;320c	21 00 4c 	! . L 
	push hl			;320f	e5 	. 
	push bc			;3210	c5 	. 
	ld hl,04036h		;3211	21 36 40 	! 6 @ 
	ld c,001h		;3214	0e 01 	. . 
	ld a,(bc)			;3216	0a 	. 
	ld e,a			;3217	5f 	_ 
	xor (hl)			;3218	ae 	. 
	and e			;3219	a3 	. 
	jr nz,$+37		;321a	20 23 	  # 
	inc l			;321c	2c 	, 
	rlc c		;321d	cb 01 	. . 
	jp p,03116h		;321f	f2 16 31 	. . 1 
	pop bc			;3222	c1 	. 
	ld e,(iy+005h)		;3223	fd 5e 05 	. ^ . 
	ld a,(bc)			;3226	0a 	. 
	and e			;3227	a3 	. 
	jr z,$+24		;3228	28 16 	( . 
	pop hl			;322a	e1 	. 
	dec hl			;322b	2b 	+ 
	bit 6,h		;322c	cb 74 	. t 
	jr nz,$-31		;322e	20 df 	  . 
	xor a			;3230	af 	. 
	ld (iy+004h),a		;3231	fd 77 04 	. w . 
	ld d,000h		;3234	16 00 	. . 
	bit 0,c		;3236	cb 41 	. A 
	jr nz,$+45		;3238	20 2b 	  + 
	rr c		;323a	cb 19 	. . 
	inc d			;323c	14 	. 
	jr $-7		;323d	18 f7 	. . 
	pop bc			;323f	c1 	. 
	pop hl			;3240	e1 	. 
	ld hl,04036h		;3241	21 36 40 	! 6 @ 
	jp 030cah		;3244	c3 ca 30 	. . 0 
	ld l,(ix+003h)		;3247	dd 6e 03 	. n . 
	ld h,(ix+004h)		;324a	dd 66 04 	. f . 
	jp c,0049ah		;324d	da 9a 04 	. . . 
	ld a,(ix+005h)		;3250	dd 7e 05 	. ~ . 
	or a			;3253	b7 	. 
	jr z,$+3		;3254	28 01 	( . 
	ld (hl),a			;3256	77 	w 
	ld a,c			;3257	79 	y 
	cp 020h		;3258	fe 20 	.   
	jp c,00506h		;325a	da 06 05 	. . . 
	cp 080h		;325d	fe 80 	. . 
	jp nc,004a6h		;325f	d2 a6 04 	. . . 
	jp 0047dh		;3262	c3 7d 04 	. } . 
	push hl			;3265	e5 	. 
	ld hl,0316dh		;3266	21 6d 31 	! m 1 
	ex (sp),hl			;3269	e3 	. 
	jp 003fbh		;326a	c3 fb 03 	. . . 
	cp 010h		;326d	fe 10 	. . 
	jr z,$+3		;326f	28 01 	( . 
	ret			;3271	c9 	. 
	in a,(0fdh)		;3272	db fd 	. . 
	and 0f0h		;3274	e6 f0 	. . 
	cp 030h		;3276	fe 30 	. 0 
	jr nz,$+44		;3278	20 2a 	  * 
	ld hl,03c00h		;327a	21 00 3c 	! . < 
	ld a,l			;327d	7d 	} 
	and 03fh		;327e	e6 3f 	. ? 
	ld a,00dh		;3280	3e 0d 	> . 
	call z,0003bh		;3282	cc 3b 00 	. ; . 
	ld a,(hl)			;3285	7e 	~ 
	bit 7,a		;3286	cb 7f 	.  
	jr z,$+4		;3288	28 02 	( . 
	and 0bfh		;328a	e6 bf 	. . 
	bit 6,h		;328c	cb 74 	. t 
	inc hl			;328e	23 	# 
	jr nz,$+7		;328f	20 05 	  . 
	call 0003bh		;3291	cd 3b 00 	. ; . 
	jr $-23		;3294	18 e7 	. . 
	ld b,006h		;3296	06 06 	. . 
	ld a,020h		;3298	3e 20 	>   
	call 0003bh		;329a	cd 3b 00 	. ; . 
	ld a,00dh		;329d	3e 0d 	> . 
	call 0003bh		;329f	cd 3b 00 	. ; . 
	djnz $-10		;32a2	10 f4 	. . 
	xor a			;32a4	af 	. 
	ret			;32a5	c9 	. 
	ex (sp),hl			;32a6	e3 	. 
	ld (041feh),hl		;32a7	22 fe 41 	" . A 
	ex (sp),hl			;32aa	e3 	. 
	ld (041fch),sp		;32ab	ed 73 fc 41 	. s . A 
	ld sp,041fch		;32af	31 fc 41 	1 . A 
	ex af,af'			;32b2	08 	. 
	exx			;32b3	d9 	. 
	push hl			;32b4	e5 	. 
	push de			;32b5	d5 	. 
	push bc			;32b6	c5 	. 
	push af			;32b7	f5 	. 
	ex af,af'			;32b8	08 	. 
	exx			;32b9	d9 	. 
	push hl			;32ba	e5 	. 
	push de			;32bb	d5 	. 
	push bc			;32bc	c5 	. 
	push af			;32bd	f5 	. 
	push ix		;32be	dd e5 	. . 
	push iy		;32c0	fd e5 	. . 
	ld sp,(041fch)		;32c2	ed 7b fc 41 	. { . A 
	call 001c9h		;32c6	cd c9 01 	. . . 
	call 03234h		;32c9	cd 34 32 	. 4 2 
	call 00049h		;32cc	cd 49 00 	. I . 
	call 0033ah		;32cf	cd 3a 03 	. : . 
	cp 044h		;32d2	fe 44 	. D 
	jr z,$+27		;32d4	28 19 	( . 
	cp 04dh		;32d6	fe 4d 	. M 
	jr z,$+79		;32d8	28 4d 	( M 
	cp 052h		;32da	fe 52 	. R 
	jr z,$+80		;32dc	28 4e 	( N 
	cp 042h		;32de	fe 42 	. B 
	jr nz,$+8		;32e0	20 06 	  . 
	call 01b61h		;32e2	cd 61 1b 	. a . 
	jp 01a19h		;32e5	c3 19 1a 	. . . 
	cp 047h		;32e8	fe 47 	. G 
	call z,032ebh		;32ea	cc eb 32 	. . 2 
	jr $-39		;32ed	18 d7 	. . 
	call 03392h		;32ef	cd 92 33 	. . 3 
	cp 058h		;32f2	fe 58 	. X 
	jr z,$-46		;32f4	28 d0 	( . 
	call 001c9h		;32f6	cd c9 01 	. . . 
	call 03269h		;32f9	cd 69 32 	. i 2 
	ld a,03eh		;32fc	3e 3e 	> > 
	call 0033ah		;32fe	cd 3a 03 	. : . 
	ld b,010h		;3301	06 10 	. . 
	ld a,(hl)			;3303	7e 	~ 
	call 03373h		;3304	cd 73 33 	. s 3 
	ld a,020h		;3307	3e 20 	>   
	call 0033ah		;3309	cd 3a 03 	. : . 
	inc hl			;330c	23 	# 
	djnz $-10		;330d	10 f4 	. . 
	ld a,00dh		;330f	3e 0d 	> . 
	call 0033ah		;3311	cd 3a 03 	. : . 
	call 00049h		;3314	cd 49 00 	. I . 
	cp 00ah		;3317	fe 0a 	. . 
	jr z,$-32		;3319	28 de 	( . 
	cp 05bh		;331b	fe 5b 	. [ 
	jr nz,$-87		;331d	20 a7 	  . 
	ld de,00020h		;331f	11 20 00 	.   . 
	or a			;3322	b7 	. 
	sbc hl,de		;3323	ed 52 	. R 
	jr $-44		;3325	18 d2 	. . 
	call 03272h		;3327	cd 72 32 	. r 2 
	jr $-100		;332a	18 9a 	. . 
	call 001c9h		;332c	cd c9 01 	. . . 
	call 032bdh		;332f	cd bd 32 	. . 2 
	jr $-108		;3332	18 92 	. . 
	ld iy,041e8h		;3334	fd 21 e8 41 	. ! . A 
	ld hl,03298h		;3338	21 98 32 	! . 2 
	ld b,00ch		;333b	06 0c 	. . 
	push bc			;333d	c5 	. 
	call 0324eh		;333e	cd 4e 32 	. N 2 
	ld a,00dh		;3341	3e 0d 	> . 
	call 0033ah		;3343	cd 3a 03 	. : . 
	pop bc			;3346	c1 	. 
	inc iy		;3347	fd 23 	. # 
	inc iy		;3349	fd 23 	. # 
	djnz $-14		;334b	10 f0 	. . 
	ret			;334d	c9 	. 
	ld b,003h		;334e	06 03 	. . 
	ld a,(hl)			;3350	7e 	~ 
	call 0033ah		;3351	cd 3a 03 	. : . 
	inc hl			;3354	23 	# 
	djnz $-5		;3355	10 f9 	. . 
	ld a,03dh		;3357	3e 3d 	> = 
	call 0033ah		;3359	cd 3a 03 	. : . 
	ld a,(iy+001h)		;335c	fd 7e 01 	. ~ . 
	call 03373h		;335f	cd 73 33 	. s 3 
	ld a,(iy+000h)		;3362	fd 7e 00 	. ~ . 
	call 03373h		;3365	cd 73 33 	. s 3 
	ret			;3368	c9 	. 
	ld a,h			;3369	7c 	| 
	call 03373h		;336a	cd 73 33 	. s 3 
	ld a,l			;336d	7d 	} 
	call 03373h		;336e	cd 73 33 	. s 3 
	ret			;3371	c9 	. 
	call 03392h		;3372	cd 92 33 	. . 3 
	cp 058h		;3375	fe 58 	. X 
	ret z			;3377	c8 	. 
	call 001c9h		;3378	cd c9 01 	. . . 
	call 03269h		;337b	cd 69 32 	. i 2 
	ld a,03eh		;337e	3e 3e 	> > 
	call 0033ah		;3380	cd 3a 03 	. : . 
	ld a,(hl)			;3383	7e 	~ 
	call 03373h		;3384	cd 73 33 	. s 3 
	ld a,02dh		;3387	3e 2d 	> - 
	call 0033ah		;3389	cd 3a 03 	. : . 
	call 0339bh		;338c	cd 9b 33 	. . 3 
	ld (hl),b			;338f	70 	p 
	ld a,00dh		;3390	3e 0d 	> . 
	call 0033ah		;3392	cd 3a 03 	. : . 
	inc hl			;3395	23 	# 
	jr $-27		;3396	18 e3 	. . 
	ld c,c			;3398	49 	I 
	ld e,c			;3399	59 	Y 
	jr nz,$+75		;339a	20 49 	  I 
	ld e,b			;339c	58 	X 
	jr nz,$+67		;339d	20 41 	  A 
	ld b,(hl)			;339f	46 	F 
	jr nz,$+68		;33a0	20 42 	  B 
	ld b,e			;33a2	43 	C 
	jr nz,$+70		;33a3	20 44 	  D 
	ld b,l			;33a5	45 	E 
	jr nz,$+74		;33a6	20 48 	  H 
	ld c,h			;33a8	4c 	L 
	jr nz,$+67		;33a9	20 41 	  A 
	ld b,(hl)			;33ab	46 	F 
	daa			;33ac	27 	' 
	ld b,d			;33ad	42 	B 
	ld b,e			;33ae	43 	C 
	daa			;33af	27 	' 
	ld b,h			;33b0	44 	D 
	ld b,l			;33b1	45 	E 
	daa			;33b2	27 	' 
	ld c,b			;33b3	48 	H 
	ld c,h			;33b4	4c 	L 
	daa			;33b5	27 	' 
	ld d,e			;33b6	53 	S 
	ld d,b			;33b7	50 	P 
	jr nz,$+82		;33b8	20 50 	  P 
	ld b,e			;33ba	43 	C 
	jr nz,$+2		;33bb	20 00 	  . 
	ld hl,03298h		;33bd	21 98 32 	! . 2 
	ld iy,041e8h		;33c0	fd 21 e8 41 	. ! . A 
	ld b,00ch		;33c4	06 0c 	. . 
	push bc			;33c6	c5 	. 
	call 0324eh		;33c7	cd 4e 32 	. N 2 
	ld a,02fh		;33ca	3e 2f 	> / 
	call 0033ah		;33cc	cd 3a 03 	. : . 
	push hl			;33cf	e5 	. 
	call 03392h		;33d0	cd 92 33 	. . 3 
	cp 058h		;33d3	fe 58 	. X 
	jr z,$+8		;33d5	28 06 	( . 
	ld (iy+000h),l		;33d7	fd 75 00 	. u . 
	ld (iy+001h),h		;33da	fd 74 01 	. t . 
	inc iy		;33dd	fd 23 	. # 
	inc iy		;33df	fd 23 	. # 
	pop hl			;33e1	e1 	. 
	ld a,00dh		;33e2	3e 0d 	> . 
	call 0033ah		;33e4	cd 3a 03 	. : . 
	pop bc			;33e7	c1 	. 
	djnz $-34		;33e8	10 dc 	. . 
	ret			;33ea	c9 	. 
	call 0339bh		;33eb	cd 9b 33 	. . 3 
	ld h,b			;33ee	60 	` 
	call 0339bh		;33ef	cd 9b 33 	. . 3 
	ld l,b			;33f2	68 	h 
	ld (041feh),hl		;33f3	22 fe 41 	" . A 
	call 00049h		;33f6	cd 49 00 	. I . 
	cp 02ch		;33f9	fe 2c 	. , 
	jr z,$+11		;33fb	28 09 	( . 
	cp 00dh		;33fd	fe 0d 	. . 
	jr z,$+36		;33ff	28 22 	( " 
	cp 058h		;3401	fe 58 	. X 
	ret z			;3403	c8 	. 
	jr $-14		;3404	18 f0 	. . 
	call 0033ah		;3406	cd 3a 03 	. : . 
	call 03392h		;3409	cd 92 33 	. . 3 
	cp 058h		;340c	fe 58 	. X 
	ret z			;340e	c8 	. 
	push hl			;340f	e5 	. 
	ld de,04200h		;3410	11 00 42 	. . B 
	ld bc,00003h		;3413	01 03 00 	. . . 
	ldir		;3416	ed b0 	. . 
	pop hl			;3418	e1 	. 
	ld de,03347h		;3419	11 47 33 	. G 3 
	ld a,0cdh		;341c	3e cd 	> . 
	ld (hl),a			;341e	77 	w 
	inc hl			;341f	23 	# 
	ld (hl),e			;3420	73 	s 
	inc hl			;3421	23 	# 
	ld (hl),d			;3422	72 	r 
	ld sp,(041fch)		;3423	ed 7b fc 41 	. { . A 
	ld hl,(041feh)		;3427	2a fe 41 	* . A 
	push hl			;342a	e5 	. 
	ld (041fch),sp		;342b	ed 73 fc 41 	. s . A 
	ld sp,041e8h		;342f	31 e8 41 	1 . A 
	pop iy		;3432	fd e1 	. . 
	pop ix		;3434	dd e1 	. . 
	pop af			;3436	f1 	. 
	pop bc			;3437	c1 	. 
	pop de			;3438	d1 	. 
	pop hl			;3439	e1 	. 
	ex af,af'			;343a	08 	. 
	exx			;343b	d9 	. 
	pop af			;343c	f1 	. 
	pop bc			;343d	c1 	. 
	pop de			;343e	d1 	. 
	pop hl			;343f	e1 	. 
	ex af,af'			;3440	08 	. 
	exx			;3441	d9 	. 
	ld sp,(041fch)		;3442	ed 7b fc 41 	. { . A 
	ret			;3446	c9 	. 
	ex (sp),hl			;3447	e3 	. 
	dec hl			;3448	2b 	+ 
	dec hl			;3449	2b 	+ 
	dec hl			;344a	2b 	+ 
	ld (041feh),hl		;344b	22 fe 41 	" . A 
	ld (04203h),a		;344e	32 03 42 	2 . B 
	ld (04204h),de		;3451	ed 53 04 42 	. S . B 
	ld a,b			;3455	78 	x 
	ld (04206h),a		;3456	32 06 42 	2 . B 
	ld de,04200h		;3459	11 00 42 	. . B 
	ex de,hl			;345c	eb 	. 
	ld bc,00003h		;345d	01 03 00 	. . . 
	ldir		;3460	ed b0 	. . 
	ex de,hl			;3462	eb 	. 
	ld de,(04204h)		;3463	ed 5b 04 42 	. [ . B 
	ld a,(04206h)		;3467	3a 06 42 	: . B 
	ld b,a			;346a	47 	G 
	ld a,(04203h)		;346b	3a 03 42 	: . B 
	ld hl,031abh		;346e	21 ab 31 	! . 1 
	ex (sp),hl			;3471	e3 	. 
	ret			;3472	c9 	. 
	ld c,a			;3473	4f 	O 
	srl a		;3474	cb 3f 	. ? 
	srl a		;3476	cb 3f 	. ? 
	srl a		;3478	cb 3f 	. ? 
	srl a		;347a	cb 3f 	. ? 
	call 03386h		;347c	cd 86 33 	. . 3 
	ld a,c			;347f	79 	y 
	and 00fh		;3480	e6 0f 	. . 
	call 03386h		;3482	cd 86 33 	. . 3 
	ret			;3485	c9 	. 
	add a,030h		;3486	c6 30 	. 0 
	cp 03ah		;3488	fe 3a 	. : 
	jr c,$+4		;348a	38 02 	8 . 
	add a,007h		;348c	c6 07 	. . 
	call 0033ah		;348e	cd 3a 03 	. : . 
	ret			;3491	c9 	. 
	call 0339bh		;3492	cd 9b 33 	. . 3 
	ld h,b			;3495	60 	` 
	call 0339bh		;3496	cd 9b 33 	. . 3 
	ld l,b			;3499	68 	h 
	ret			;349a	c9 	. 
	call 033b5h		;349b	cd b5 33 	. . 3 
	sla a		;349e	cb 27 	. ' 
	sla a		;34a0	cb 27 	. ' 
	sla a		;34a2	cb 27 	. ' 
	sla a		;34a4	cb 27 	. ' 
	ld b,a			;34a6	47 	G 
	ld a,c			;34a7	79 	y 
	call 0033ah		;34a8	cd 3a 03 	. : . 
	call 033b5h		;34ab	cd b5 33 	. . 3 
	add a,b			;34ae	80 	. 
	ld b,a			;34af	47 	G 
	ld a,c			;34b0	79 	y 
	call 0033ah		;34b1	cd 3a 03 	. : . 
	ret			;34b4	c9 	. 
	call 00049h		;34b5	cd 49 00 	. I . 
	cp 058h		;34b8	fe 58 	. X 
	jr nz,$+7		;34ba	20 05 	  . 
	ex (sp),hl			;34bc	e3 	. 
	pop hl			;34bd	e1 	. 
	ex (sp),hl			;34be	e3 	. 
	pop hl			;34bf	e1 	. 
	ret			;34c0	c9 	. 
	ld c,a			;34c1	4f 	O 
	sub 030h		;34c2	d6 30 	. 0 
	jr c,$-15		;34c4	38 ef 	8 . 
	cp 00ah		;34c6	fe 0a 	. . 
	ret c			;34c8	d8 	. 
	sub 011h		;34c9	d6 11 	. . 
	jr c,$-22		;34cb	38 e8 	8 . 
	add a,00ah		;34cd	c6 0a 	. . 
	cp 010h		;34cf	fe 10 	. . 
	ret c			;34d1	d8 	. 
	jr $-29		;34d2	18 e1 	. . 
	ex (sp),hl			;34d4	e3 	. 
	ld a,01dh		;34d5	3e 1d 	> . 
	cp h			;34d7	bc 	. 
	jr nz,$+5		;34d8	20 03 	  . 
	ld a,05bh		;34da	3e 5b 	> [ 
	cp l			;34dc	bd 	. 
	ex (sp),hl			;34dd	e3 	. 
	jp nz,01d78h		;34de	c2 78 1d 	. x . 
	call 01d78h		;34e1	cd 78 1d 	. x . 
	push af			;34e4	f5 	. 
	push hl			;34e5	e5 	. 
	cp 052h		;34e6	fe 52 	. R 
	jr nz,$+9		;34e8	20 07 	  . 
	inc hl			;34ea	23 	# 
	ld a,(hl)			;34eb	7e 	~ 
	cp 045h		;34ec	fe 45 	. E 
	jp z,0346dh		;34ee	ca 6d 34 	. m 4 
	pop hl			;34f1	e1 	. 
	pop af			;34f2	f1 	. 
	ret			;34f3	c9 	. 
	push de			;34f4	d5 	. 
	ld (04121h),hl		;34f5	22 21 41 	" ! A 
	ld bc,00000h		;34f8	01 00 00 	. . . 
	ld hl,(040a7h)		;34fb	2a a7 40 	* . @ 
	push hl			;34fe	e5 	. 
	call 0132fh		;34ff	cd 2f 13 	. / . 
	pop hl			;3502	e1 	. 
	ld b,005h		;3503	06 05 	. . 
	ld a,(hl)			;3505	7e 	~ 
	sub 030h		;3506	d6 30 	. 0 
	jr nz,$+7		;3508	20 05 	  . 
	inc hl			;350a	23 	# 
	djnz $-6		;350b	10 f8 	. . 
	dec hl			;350d	2b 	+ 
	inc b			;350e	04 	. 
	pop de			;350f	d1 	. 
	ret			;3510	c9 	. 
	inc iy		;3511	fd 23 	. # 
	inc iy		;3513	fd 23 	. # 
	inc iy		;3515	fd 23 	. # 
	inc iy		;3517	fd 23 	. # 
	ret			;3519	c9 	. 
	inc hl			;351a	23 	# 
	ld a,(hl)			;351b	7e 	~ 
	or a			;351c	b7 	. 
	ret z			;351d	c8 	. 
	cp 08dh		;351e	fe 8d 	. . 
	jr z,$+14		;3520	28 0c 	( . 
	cp 091h		;3522	fe 91 	. . 
	jr z,$+10		;3524	28 08 	( . 
	cp 0cah		;3526	fe ca 	. . 
	jr z,$+6		;3528	28 04 	( . 
	cp 095h		;352a	fe 95 	. . 
	jr nz,$-18		;352c	20 ec 	  . 
	and a			;352e	a7 	. 
	ret			;352f	c9 	. 
	ld de,(040a7h)		;3530	ed 5b a7 40 	. [ . @ 
	push de			;3534	d5 	. 
	ld b,000h		;3535	06 00 	. . 
	ld a,(hl)			;3537	7e 	~ 
	cp 020h		;3538	fe 20 	.   
	jr z,$+13		;353a	28 0b 	( . 
	cp 030h		;353c	fe 30 	. 0 
	jr c,$+12		;353e	38 0a 	8 . 
	cp 03ah		;3540	fe 3a 	. : 
	jr nc,$+8		;3542	30 06 	0 . 
	inc b			;3544	04 	. 
	ld (de),a			;3545	12 	. 
	inc de			;3546	13 	. 
	inc hl			;3547	23 	# 
	jr $-17		;3548	18 ed 	. . 
	xor a			;354a	af 	. 
	ld (de),a			;354b	12 	. 
	pop de			;354c	d1 	. 
	inc b			;354d	04 	. 
	dec b			;354e	05 	. 
	ret			;354f	c9 	. 
	push bc			;3550	c5 	. 
	ld a,b			;3551	78 	x 
	sbc a,c			;3552	99 	. 
	jr z,$+18		;3553	28 10 	( . 
	dec b			;3555	05 	. 
	jr z,$+10		;3556	28 08 	( . 
	dec c			;3558	0d 	. 
	jr nz,$-8		;3559	20 f6 	  . 
	call 035cdh		;355b	cd cd 35 	. . 5 
	jr $+7		;355e	18 05 	. . 
	ld b,c			;3560	41 	A 
	dec b			;3561	05 	. 
	call 035ach		;3562	cd ac 35 	. . 5 
	pop bc			;3565	c1 	. 
	ld a,(de)			;3566	1a 	. 
	ld (hl),a			;3567	77 	w 
	inc de			;3568	13 	. 
	inc hl			;3569	23 	# 
	djnz $-4		;356a	10 fa 	. . 
	ret			;356c	c9 	. 
	inc hl			;356d	23 	# 
	ld de,0000ah		;356e	11 0a 00 	. . . 
	ld (040e2h),de		;3571	ed 53 e2 40 	. S . @ 
	ld (040e4h),de		;3575	ed 53 e4 40 	. S . @ 
	ld a,(hl)			;3579	7e 	~ 
	and a			;357a	a7 	. 
	jr z,$+36		;357b	28 22 	( " 
	cp 02ch		;357d	fe 2c 	. , 
	jr z,$+19		;357f	28 11 	( . 
	call 01e5ah		;3581	cd 5a 1e 	. Z . 
	ld c,a			;3584	4f 	O 
	ld a,d			;3585	7a 	z 
	or e			;3586	b3 	. 
	jr z,$+21		;3587	28 13 	( . 
	ld a,c			;3589	79 	y 
	ld (040e2h),de		;358a	ed 53 e2 40 	. S . @ 
	cp 02ch		;358e	fe 2c 	. , 
	jr nz,$+15		;3590	20 0d 	  . 
	inc hl			;3592	23 	# 
	call 01e5ah		;3593	cd 5a 1e 	. Z . 
	ld (040e4h),de		;3596	ed 53 e4 40 	. S . @ 
	ld a,d			;359a	7a 	z 
	or e			;359b	b3 	. 
	jp z,01997h		;359c	ca 97 19 	. . . 
	ld iy,(040f9h)		;359f	fd 2a f9 40 	. * . @ 
	ld de,00100h		;35a3	11 00 01 	. . . 
	add iy,de		;35a6	fd 19 	. . 
	push iy		;35a8	fd e5 	. . 
	ld hl,(040a4h)		;35aa	2a a4 40 	* . @ 
	push hl			;35ad	e5 	. 
	ld a,(hl)			;35ae	7e 	~ 
	inc hl			;35af	23 	# 
	or (hl)			;35b0	b6 	. 
	jp z,034feh		;35b1	ca fe 34 	. . 4 
	inc hl			;35b4	23 	# 
	inc hl			;35b5	23 	# 
	call 0341ah		;35b6	cd 1a 34 	. . 4 
	inc hl			;35b9	23 	# 
	jr z,$-12		;35ba	28 f2 	( . 
	call 03430h		;35bc	cd 30 34 	. 0 4 
	dec hl			;35bf	2b 	+ 
	jr z,$-10		;35c0	28 f4 	( . 
	inc hl			;35c2	23 	# 
	push hl			;35c3	e5 	. 
	push de			;35c4	d5 	. 
	push iy		;35c5	fd e5 	. . 
	pop de			;35c7	d1 	. 
	ld hl,(040b1h)		;35c8	2a b1 40 	* . @ 
	sbc hl,de		;35cb	ed 52 	. R 
	jp c,0197ah		;35cd	da 7a 19 	. z . 
	ld de,00004h		;35d0	11 04 00 	. . . 
	sbc hl,de		;35d3	ed 52 	. R 
	jp c,0197ah		;35d5	da 7a 19 	. z . 
	ld (iy+000h),b		;35d8	fd 70 00 	. p . 
	pop hl			;35db	e1 	. 
	call 01e5ah		;35dc	cd 5a 1e 	. Z . 
	ld (iy+001h),e		;35df	fd 73 01 	. s . 
	ld (iy+002h),d		;35e2	fd 72 02 	. r . 
	ld (iy+003h),000h		;35e5	fd 36 03 00 	. 6 . . 
	call 03411h		;35e9	cd 11 34 	. . 4 
	pop hl			;35ec	e1 	. 
	dec hl			;35ed	2b 	+ 
	inc hl			;35ee	23 	# 
	ld a,(hl)			;35ef	7e 	~ 
	cp 020h		;35f0	fe 20 	.   
	jr z,$-4		;35f2	28 fa 	( . 
	cp 02ch		;35f4	fe 2c 	. , 
	jr z,$+5		;35f6	28 03 	( . 
	dec hl			;35f8	2b 	+ 
	jr $-67		;35f9	18 bb 	. . 
	inc hl			;35fb	23 	# 
	jr $-64		;35fc	18 be 	. . 
	ld (iy+000h),0ffh		;35fe	fd 36 00 ff 	. 6 . . 
	pop hl			;3602	e1 	. 
	pop iy		;3603	fd e1 	. . 
	ld de,(040e2h)		;3605	ed 5b e2 40 	. [ . @ 
	push de			;3609	d5 	. 
	push iy		;360a	fd e5 	. . 
	push hl			;360c	e5 	. 
	push de			;360d	d5 	. 
	call 009c2h		;360e	cd c2 09 	. . . 
	ld a,d			;3611	7a 	z 
	or e			;3612	b3 	. 
	jr z,$+67		;3613	28 41 	( A 
	ex de,hl			;3615	eb 	. 
	pop de			;3616	d1 	. 
	push iy		;3617	fd e5 	. . 
	ld a,(iy+000h)		;3619	fd 7e 00 	. ~ . 
	inc a			;361c	3c 	< 
	jr z,$+35		;361d	28 21 	( ! 
	ld a,(iy+003h)		;361f	fd 7e 03 	. ~ . 
	or a			;3622	b7 	. 
	jr nz,$+24		;3623	20 16 	  . 
	ld a,(iy+001h)		;3625	fd 7e 01 	. ~ . 
	cp c			;3628	b9 	. 
	jr nz,$+18		;3629	20 10 	  . 
	ld a,(iy+002h)		;362b	fd 7e 02 	. ~ . 
	cp b			;362e	b8 	. 
	jr nz,$+12		;362f	20 0a 	  . 
	ld (iy+001h),e		;3631	fd 73 01 	. s . 
	ld (iy+002h),d		;3634	fd 72 02 	. r . 
	ld (iy+003h),001h		;3637	fd 36 03 01 	. 6 . . 
	call 03411h		;363b	cd 11 34 	. . 4 
	jr $-37		;363e	18 d9 	. . 
	pop iy		;3640	fd e1 	. . 
	push hl			;3642	e5 	. 
	ld hl,(040e4h)		;3643	2a e4 40 	* . @ 
	add hl,de			;3646	19 	. 
	jp c,0197ah		;3647	da 7a 19 	. z . 
	ex de,hl			;364a	eb 	. 
	ld hl,0fff8h		;364b	21 f8 ff 	! . . 
	sbc hl,de		;364e	ed 52 	. R 
	jp c,0197ah		;3650	da 7a 19 	. z . 
	pop hl			;3653	e1 	. 
	jr $-71		;3654	18 b7 	. . 
	pop de			;3656	d1 	. 
	pop hl			;3657	e1 	. 
	pop iy		;3658	fd e1 	. . 
	pop de			;365a	d1 	. 
	ld a,(hl)			;365b	7e 	~ 
	inc hl			;365c	23 	# 
	or (hl)			;365d	b6 	. 
	jp z,02c83h		;365e	ca 83 2c 	. . , 
	inc hl			;3661	23 	# 
	ld (hl),e			;3662	73 	s 
	inc hl			;3663	23 	# 
	ld (hl),d			;3664	72 	r 
	call 0341ah		;3665	cd 1a 34 	. . 4 
	inc hl			;3668	23 	# 
	jr nz,$+11		;3669	20 09 	  . 
	push hl			;366b	e5 	. 
	ld hl,(040e4h)		;366c	2a e4 40 	* . @ 
	add hl,de			;366f	19 	. 
	ex de,hl			;3670	eb 	. 
	pop hl			;3671	e1 	. 
	jr $-23		;3672	18 e7 	. . 
	push hl			;3674	e5 	. 
	push de			;3675	d5 	. 
	call 03430h		;3676	cd 30 34 	. 0 4 
	pop de			;3679	d1 	. 
	pop hl			;367a	e1 	. 
	dec hl			;367b	2b 	+ 
	jr z,$-23		;367c	28 e7 	( . 
	inc hl			;367e	23 	# 
	ld a,(hl)			;367f	7e 	~ 
	cp 020h		;3680	fe 20 	.   
	jr z,$-4		;3682	28 fa 	( . 
	push de			;3684	d5 	. 
	push hl			;3685	e5 	. 
	ld l,(iy+001h)		;3686	fd 6e 01 	. n . 
	ld h,(iy+002h)		;3689	fd 66 02 	. f . 
	call 033f4h		;368c	cd f4 33 	. . 3 
	ld c,(iy+000h)		;368f	fd 4e 00 	. N . 
	call 03411h		;3692	cd 11 34 	. . 4 
	ex de,hl			;3695	eb 	. 
	pop hl			;3696	e1 	. 
	call 03450h		;3697	cd 50 34 	. P 4 
	pop de			;369a	d1 	. 
	dec hl			;369b	2b 	+ 
	inc hl			;369c	23 	# 
	ld a,(hl)			;369d	7e 	~ 
	cp 020h		;369e	fe 20 	.   
	jr z,$-4		;36a0	28 fa 	( . 
	cp 02ch		;36a2	fe 2c 	. , 
	jr z,$+5		;36a4	28 03 	( . 
	dec hl			;36a6	2b 	+ 
	jr $-66		;36a7	18 bc 	. . 
	inc hl			;36a9	23 	# 
	jr $-54		;36aa	18 c8 	. . 
	push de			;36ac	d5 	. 
	push bc			;36ad	c5 	. 
	push hl			;36ae	e5 	. 
	push hl			;36af	e5 	. 
	pop de			;36b0	d1 	. 
	push de			;36b1	d5 	. 
	push de			;36b2	d5 	. 
	ld hl,(040f9h)		;36b3	2a f9 40 	* . @ 
	push hl			;36b6	e5 	. 
	dec hl			;36b7	2b 	+ 
	inc de			;36b8	13 	. 
	djnz $-2		;36b9	10 fc 	. . 
	ld (040f9h),hl		;36bb	22 f9 40 	" . @ 
	pop hl			;36be	e1 	. 
	pop bc			;36bf	c1 	. 
	sbc hl,bc		;36c0	ed 42 	. B 
	inc hl			;36c2	23 	# 
	push hl			;36c3	e5 	. 
	pop bc			;36c4	c1 	. 
	pop hl			;36c5	e1 	. 
	ex de,hl			;36c6	eb 	. 
	ldir		;36c7	ed b0 	. . 
	pop hl			;36c9	e1 	. 
	pop bc			;36ca	c1 	. 
	pop de			;36cb	d1 	. 
	ret			;36cc	c9 	. 
	push de			;36cd	d5 	. 
	push bc			;36ce	c5 	. 
	push hl			;36cf	e5 	. 
	ld hl,(040f9h)		;36d0	2a f9 40 	* . @ 
	push hl			;36d3	e5 	. 
	pop de			;36d4	d1 	. 
	inc hl			;36d5	23 	# 
	djnz $-1		;36d6	10 fd 	. . 
	ld (040f9h),hl		;36d8	22 f9 40 	" . @ 
	pop bc			;36db	c1 	. 
	push bc			;36dc	c5 	. 
	push hl			;36dd	e5 	. 
	or a			;36de	b7 	. 
	sbc hl,bc		;36df	ed 42 	. B 
	push hl			;36e1	e5 	. 
	pop bc			;36e2	c1 	. 
	inc bc			;36e3	03 	. 
	pop hl			;36e4	e1 	. 
	ex de,hl			;36e5	eb 	. 
	lddr		;36e6	ed b8 	. . 
	pop hl			;36e8	e1 	. 
	pop bc			;36e9	c1 	. 
	pop de			;36ea	d1 	. 
	ret			;36eb	c9 	. 
	rst 38h			;36ec	ff 	. 
	rst 38h			;36ed	ff 	. 
	rst 38h			;36ee	ff 	. 
	rst 38h			;36ef	ff 	. 
	rst 38h			;36f0	ff 	. 
	rst 38h			;36f1	ff 	. 
	rst 38h			;36f2	ff 	. 
	rst 38h			;36f3	ff 	. 
	rst 38h			;36f4	ff 	. 
	rst 38h			;36f5	ff 	. 
	rst 38h			;36f6	ff 	. 
	rst 38h			;36f7	ff 	. 
	rst 38h			;36f8	ff 	. 
	rst 38h			;36f9	ff 	. 
	rst 38h			;36fa	ff 	. 
	rst 38h			;36fb	ff 	. 
	rst 38h			;36fc	ff 	. 
	rst 38h			;36fd	ff 	. 
	rst 38h			;36fe	ff 	. 
	rst 38h			;36ff	ff 	. 
	rst 38h			;3700	ff 	. 
	rst 38h			;3701	ff 	. 
	rst 38h			;3702	ff 	. 
	rst 38h			;3703	ff 	. 
	rst 38h			;3704	ff 	. 
	rst 38h			;3705	ff 	. 
	rst 38h			;3706	ff 	. 
	rst 38h			;3707	ff 	. 
	rst 38h			;3708	ff 	. 
	rst 38h			;3709	ff 	. 
	rst 38h			;370a	ff 	. 
	rst 38h			;370b	ff 	. 
	rst 38h			;370c	ff 	. 
	rst 38h			;370d	ff 	. 
	rst 38h			;370e	ff 	. 
	rst 38h			;370f	ff 	. 
	rst 38h			;3710	ff 	. 
	rst 38h			;3711	ff 	. 
	rst 38h			;3712	ff 	. 
	rst 38h			;3713	ff 	. 
	rst 38h			;3714	ff 	. 
	rst 38h			;3715	ff 	. 
	rst 38h			;3716	ff 	. 
	rst 38h			;3717	ff 	. 
	rst 38h			;3718	ff 	. 
	rst 38h			;3719	ff 	. 
	rst 38h			;371a	ff 	. 
	rst 38h			;371b	ff 	. 
	rst 38h			;371c	ff 	. 
	rst 38h			;371d	ff 	. 
	rst 38h			;371e	ff 	. 
	rst 38h			;371f	ff 	. 
	rst 38h			;3720	ff 	. 
	rst 38h			;3721	ff 	. 
	rst 38h			;3722	ff 	. 
	rst 38h			;3723	ff 	. 
	rst 38h			;3724	ff 	. 
	rst 38h			;3725	ff 	. 
	rst 38h			;3726	ff 	. 
	rst 38h			;3727	ff 	. 
	rst 38h			;3728	ff 	. 
	rst 38h			;3729	ff 	. 
	rst 38h			;372a	ff 	. 
	rst 38h			;372b	ff 	. 
	rst 38h			;372c	ff 	. 
	rst 38h			;372d	ff 	. 
	rst 38h			;372e	ff 	. 
	rst 38h			;372f	ff 	. 
	rst 38h			;3730	ff 	. 
	rst 38h			;3731	ff 	. 
	rst 38h			;3732	ff 	. 
	rst 38h			;3733	ff 	. 
	rst 38h			;3734	ff 	. 
	rst 38h			;3735	ff 	. 
	rst 38h			;3736	ff 	. 
	rst 38h			;3737	ff 	. 
	rst 38h			;3738	ff 	. 
	rst 38h			;3739	ff 	. 
	rst 38h			;373a	ff 	. 
	rst 38h			;373b	ff 	. 
	rst 38h			;373c	ff 	. 
	rst 38h			;373d	ff 	. 
	rst 38h			;373e	ff 	. 
	rst 38h			;373f	ff 	. 
	rst 38h			;3740	ff 	. 
	rst 38h			;3741	ff 	. 
	rst 38h			;3742	ff 	. 
	rst 38h			;3743	ff 	. 
	rst 38h			;3744	ff 	. 
	rst 38h			;3745	ff 	. 
	rst 38h			;3746	ff 	. 
	rst 38h			;3747	ff 	. 
	rst 38h			;3748	ff 	. 
	rst 38h			;3749	ff 	. 
	rst 38h			;374a	ff 	. 
	rst 38h			;374b	ff 	. 
	rst 38h			;374c	ff 	. 
	rst 38h			;374d	ff 	. 
	rst 38h			;374e	ff 	. 
	rst 38h			;374f	ff 	. 
	rst 38h			;3750	ff 	. 
	rst 38h			;3751	ff 	. 
	rst 38h			;3752	ff 	. 
	rst 38h			;3753	ff 	. 
	rst 38h			;3754	ff 	. 
	rst 38h			;3755	ff 	. 
	rst 38h			;3756	ff 	. 
	rst 38h			;3757	ff 	. 
	rst 38h			;3758	ff 	. 
	rst 38h			;3759	ff 	. 
	rst 38h			;375a	ff 	. 
	rst 38h			;375b	ff 	. 
	rst 38h			;375c	ff 	. 
	rst 38h			;375d	ff 	. 
	rst 38h			;375e	ff 	. 
	rst 38h			;375f	ff 	. 
	rst 38h			;3760	ff 	. 
	rst 38h			;3761	ff 	. 
	rst 38h			;3762	ff 	. 
	rst 38h			;3763	ff 	. 
	rst 38h			;3764	ff 	. 
	rst 38h			;3765	ff 	. 
	rst 38h			;3766	ff 	. 
	rst 38h			;3767	ff 	. 
	rst 38h			;3768	ff 	. 
	rst 38h			;3769	ff 	. 
	rst 38h			;376a	ff 	. 
	rst 38h			;376b	ff 	. 
	rst 38h			;376c	ff 	. 
	rst 38h			;376d	ff 	. 
	rst 38h			;376e	ff 	. 
	rst 38h			;376f	ff 	. 
	rst 38h			;3770	ff 	. 
	rst 38h			;3771	ff 	. 
	rst 38h			;3772	ff 	. 
	rst 38h			;3773	ff 	. 
	rst 38h			;3774	ff 	. 
	rst 38h			;3775	ff 	. 
	rst 38h			;3776	ff 	. 
	rst 38h			;3777	ff 	. 
	rst 38h			;3778	ff 	. 
	rst 38h			;3779	ff 	. 
	rst 38h			;377a	ff 	. 
	rst 38h			;377b	ff 	. 
	rst 38h			;377c	ff 	. 
	rst 38h			;377d	ff 	. 
	rst 38h			;377e	ff 	. 
	rst 38h			;377f	ff 	. 
	rst 38h			;3780	ff 	. 
	rst 38h			;3781	ff 	. 
	rst 38h			;3782	ff 	. 
	rst 38h			;3783	ff 	. 
	rst 38h			;3784	ff 	. 
	rst 38h			;3785	ff 	. 
	rst 38h			;3786	ff 	. 
	rst 38h			;3787	ff 	. 
	rst 38h			;3788	ff 	. 
	rst 38h			;3789	ff 	. 
	rst 38h			;378a	ff 	. 
	rst 38h			;378b	ff 	. 
	rst 38h			;378c	ff 	. 
	rst 38h			;378d	ff 	. 
	rst 38h			;378e	ff 	. 
	rst 38h			;378f	ff 	. 
	rst 38h			;3790	ff 	. 
	rst 38h			;3791	ff 	. 
	rst 38h			;3792	ff 	. 
	rst 38h			;3793	ff 	. 
	rst 38h			;3794	ff 	. 
	rst 38h			;3795	ff 	. 
	rst 38h			;3796	ff 	. 
	rst 38h			;3797	ff 	. 
	rst 38h			;3798	ff 	. 
	rst 38h			;3799	ff 	. 
	rst 38h			;379a	ff 	. 
	rst 38h			;379b	ff 	. 
	rst 38h			;379c	ff 	. 
	rst 38h			;379d	ff 	. 
	rst 38h			;379e	ff 	. 
	rst 38h			;379f	ff 	. 
	rst 38h			;37a0	ff 	. 
	rst 38h			;37a1	ff 	. 
	rst 38h			;37a2	ff 	. 
	rst 38h			;37a3	ff 	. 
	rst 38h			;37a4	ff 	. 
	rst 38h			;37a5	ff 	. 
	rst 38h			;37a6	ff 	. 
	rst 38h			;37a7	ff 	. 
	rst 38h			;37a8	ff 	. 
	rst 38h			;37a9	ff 	. 
	rst 38h			;37aa	ff 	. 
	rst 38h			;37ab	ff 	. 
	rst 38h			;37ac	ff 	. 
	rst 38h			;37ad	ff 	. 
	rst 38h			;37ae	ff 	. 
	rst 38h			;37af	ff 	. 
	rst 38h			;37b0	ff 	. 
	rst 38h			;37b1	ff 	. 
	rst 38h			;37b2	ff 	. 
	rst 38h			;37b3	ff 	. 
	rst 38h			;37b4	ff 	. 
	rst 38h			;37b5	ff 	. 
	rst 38h			;37b6	ff 	. 
	rst 38h			;37b7	ff 	. 
	rst 38h			;37b8	ff 	. 
	rst 38h			;37b9	ff 	. 
	rst 38h			;37ba	ff 	. 
	rst 38h			;37bb	ff 	. 
	rst 38h			;37bc	ff 	. 
	rst 38h			;37bd	ff 	. 
	rst 38h			;37be	ff 	. 
	rst 38h			;37bf	ff 	. 
	rst 38h			;37c0	ff 	. 
	rst 38h			;37c1	ff 	. 
	rst 38h			;37c2	ff 	. 
	rst 38h			;37c3	ff 	. 
	rst 38h			;37c4	ff 	. 
	rst 38h			;37c5	ff 	. 
	rst 38h			;37c6	ff 	. 
	rst 38h			;37c7	ff 	. 
	rst 38h			;37c8	ff 	. 
	rst 38h			;37c9	ff 	. 
	rst 38h			;37ca	ff 	. 
	rst 38h			;37cb	ff 	. 
	rst 38h			;37cc	ff 	. 
	rst 38h			;37cd	ff 	. 
	rst 38h			;37ce	ff 	. 
	rst 38h			;37cf	ff 	. 
	rst 38h			;37d0	ff 	. 
	rst 38h			;37d1	ff 	. 
	rst 38h			;37d2	ff 	. 
	rst 38h			;37d3	ff 	. 
	rst 38h			;37d4	ff 	. 
	rst 38h			;37d5	ff 	. 
	rst 38h			;37d6	ff 	. 
	rst 38h			;37d7	ff 	. 
	rst 38h			;37d8	ff 	. 
	rst 38h			;37d9	ff 	. 
	rst 38h			;37da	ff 	. 
	rst 38h			;37db	ff 	. 
	rst 38h			;37dc	ff 	. 
	rst 38h			;37dd	ff 	. 
	rst 38h			;37de	ff 	. 
	rst 38h			;37df	ff 	. 
	rst 38h			;37e0	ff 	. 
	rst 38h			;37e1	ff 	. 
	rst 38h			;37e2	ff 	. 
	rst 38h			;37e3	ff 	. 
	rst 38h			;37e4	ff 	. 
	rst 38h			;37e5	ff 	. 
	rst 38h			;37e6	ff 	. 
	rst 38h			;37e7	ff 	. 
	rst 38h			;37e8	ff 	. 
	rst 38h			;37e9	ff 	. 
	rst 38h			;37ea	ff 	. 
	rst 38h			;37eb	ff 	. 
	rst 38h			;37ec	ff 	. 
	rst 38h			;37ed	ff 	. 
	rst 38h			;37ee	ff 	. 
	rst 38h			;37ef	ff 	. 
	rst 38h			;37f0	ff 	. 
	rst 38h			;37f1	ff 	. 
	rst 38h			;37f2	ff 	. 
	rst 38h			;37f3	ff 	. 
	rst 38h			;37f4	ff 	. 
	rst 38h			;37f5	ff 	. 
	rst 38h			;37f6	ff 	. 
	rst 38h			;37f7	ff 	. 
	rst 38h			;37f8	ff 	. 
	rst 38h			;37f9	ff 	. 
	rst 38h			;37fa	ff 	. 
	rst 38h			;37fb	ff 	. 
	rst 38h			;37fc	ff 	. 
	rst 38h			;37fd	ff 	. 
	rst 38h			;37fe	ff 	. 
	rst 38h			;37ff	ff 	. 
	rst 38h			;3800	ff 	. 
	rst 38h			;3801	ff 	. 
	rst 38h			;3802	ff 	. 
	rst 38h			;3803	ff 	. 
	rst 38h			;3804	ff 	. 
	rst 38h			;3805	ff 	. 
	rst 38h			;3806	ff 	. 
	rst 38h			;3807	ff 	. 
	rst 38h			;3808	ff 	. 
	rst 38h			;3809	ff 	. 
	rst 38h			;380a	ff 	. 
	rst 38h			;380b	ff 	. 
	rst 38h			;380c	ff 	. 
	rst 38h			;380d	ff 	. 
	rst 38h			;380e	ff 	. 
	rst 38h			;380f	ff 	. 
	rst 38h			;3810	ff 	. 
	rst 38h			;3811	ff 	. 
	rst 38h			;3812	ff 	. 
	rst 38h			;3813	ff 	. 
	rst 38h			;3814	ff 	. 
	rst 38h			;3815	ff 	. 
	rst 38h			;3816	ff 	. 
	rst 38h			;3817	ff 	. 
	rst 38h			;3818	ff 	. 
	rst 38h			;3819	ff 	. 
	rst 38h			;381a	ff 	. 
	rst 38h			;381b	ff 	. 
	rst 38h			;381c	ff 	. 
	rst 38h			;381d	ff 	. 
	rst 38h			;381e	ff 	. 
	rst 38h			;381f	ff 	. 
	rst 38h			;3820	ff 	. 
	rst 38h			;3821	ff 	. 
	rst 38h			;3822	ff 	. 
	rst 38h			;3823	ff 	. 
	rst 38h			;3824	ff 	. 
	rst 38h			;3825	ff 	. 
	rst 38h			;3826	ff 	. 
	rst 38h			;3827	ff 	. 
	rst 38h			;3828	ff 	. 
	rst 38h			;3829	ff 	. 
	rst 38h			;382a	ff 	. 
	rst 38h			;382b	ff 	. 
	rst 38h			;382c	ff 	. 
	rst 38h			;382d	ff 	. 
	rst 38h			;382e	ff 	. 
	rst 38h			;382f	ff 	. 
	rst 38h			;3830	ff 	. 
	rst 38h			;3831	ff 	. 
	rst 38h			;3832	ff 	. 
	rst 38h			;3833	ff 	. 
	rst 38h			;3834	ff 	. 
	rst 38h			;3835	ff 	. 
	rst 38h			;3836	ff 	. 
	rst 38h			;3837	ff 	. 
	rst 38h			;3838	ff 	. 
	rst 38h			;3839	ff 	. 
	rst 38h			;383a	ff 	. 
	rst 38h			;383b	ff 	. 
	rst 38h			;383c	ff 	. 
	rst 38h			;383d	ff 	. 
	rst 38h			;383e	ff 	. 
	rst 38h			;383f	ff 	. 
	rst 38h			;3840	ff 	. 
	rst 38h			;3841	ff 	. 
	rst 38h			;3842	ff 	. 
	rst 38h			;3843	ff 	. 
	rst 38h			;3844	ff 	. 
	rst 38h			;3845	ff 	. 
	rst 38h			;3846	ff 	. 
	rst 38h			;3847	ff 	. 
	rst 38h			;3848	ff 	. 
	rst 38h			;3849	ff 	. 
	rst 38h			;384a	ff 	. 
	rst 38h			;384b	ff 	. 
	rst 38h			;384c	ff 	. 
	rst 38h			;384d	ff 	. 
	rst 38h			;384e	ff 	. 
	rst 38h			;384f	ff 	. 
	rst 38h			;3850	ff 	. 
	rst 38h			;3851	ff 	. 
	rst 38h			;3852	ff 	. 
	rst 38h			;3853	ff 	. 
	rst 38h			;3854	ff 	. 
	rst 38h			;3855	ff 	. 
	rst 38h			;3856	ff 	. 
	rst 38h			;3857	ff 	. 
	rst 38h			;3858	ff 	. 
	rst 38h			;3859	ff 	. 
	rst 38h			;385a	ff 	. 
	rst 38h			;385b	ff 	. 
	rst 38h			;385c	ff 	. 
	rst 38h			;385d	ff 	. 
	rst 38h			;385e	ff 	. 
	rst 38h			;385f	ff 	. 
	rst 38h			;3860	ff 	. 
	rst 38h			;3861	ff 	. 
	rst 38h			;3862	ff 	. 
	rst 38h			;3863	ff 	. 
	rst 38h			;3864	ff 	. 
	rst 38h			;3865	ff 	. 
	rst 38h			;3866	ff 	. 
	rst 38h			;3867	ff 	. 
	rst 38h			;3868	ff 	. 
	rst 38h			;3869	ff 	. 
	rst 38h			;386a	ff 	. 
	rst 38h			;386b	ff 	. 
	rst 38h			;386c	ff 	. 
	rst 38h			;386d	ff 	. 
	rst 38h			;386e	ff 	. 
	rst 38h			;386f	ff 	. 
	rst 38h			;3870	ff 	. 
	rst 38h			;3871	ff 	. 
	rst 38h			;3872	ff 	. 
	rst 38h			;3873	ff 	. 
	rst 38h			;3874	ff 	. 
	rst 38h			;3875	ff 	. 
	rst 38h			;3876	ff 	. 
	rst 38h			;3877	ff 	. 
	rst 38h			;3878	ff 	. 
	rst 38h			;3879	ff 	. 
	rst 38h			;387a	ff 	. 
	rst 38h			;387b	ff 	. 
	rst 38h			;387c	ff 	. 
	rst 38h			;387d	ff 	. 
	rst 38h			;387e	ff 	. 
	rst 38h			;387f	ff 	. 
	rst 38h			;3880	ff 	. 
	rst 38h			;3881	ff 	. 
	rst 38h			;3882	ff 	. 
	rst 38h			;3883	ff 	. 
	rst 38h			;3884	ff 	. 
	rst 38h			;3885	ff 	. 
	rst 38h			;3886	ff 	. 
	rst 38h			;3887	ff 	. 
	rst 38h			;3888	ff 	. 
	rst 38h			;3889	ff 	. 
	rst 38h			;388a	ff 	. 
	rst 38h			;388b	ff 	. 
	rst 38h			;388c	ff 	. 
	rst 38h			;388d	ff 	. 
	rst 38h			;388e	ff 	. 
	rst 38h			;388f	ff 	. 
	rst 38h			;3890	ff 	. 
	rst 38h			;3891	ff 	. 
	rst 38h			;3892	ff 	. 
	rst 38h			;3893	ff 	. 
	rst 38h			;3894	ff 	. 
	rst 38h			;3895	ff 	. 
	rst 38h			;3896	ff 	. 
	rst 38h			;3897	ff 	. 
	rst 38h			;3898	ff 	. 
	rst 38h			;3899	ff 	. 
	rst 38h			;389a	ff 	. 
	rst 38h			;389b	ff 	. 
	rst 38h			;389c	ff 	. 
	rst 38h			;389d	ff 	. 
	rst 38h			;389e	ff 	. 
	rst 38h			;389f	ff 	. 
	rst 38h			;38a0	ff 	. 
	rst 38h			;38a1	ff 	. 
	rst 38h			;38a2	ff 	. 
	rst 38h			;38a3	ff 	. 
	rst 38h			;38a4	ff 	. 
	rst 38h			;38a5	ff 	. 
	rst 38h			;38a6	ff 	. 
	rst 38h			;38a7	ff 	. 
	rst 38h			;38a8	ff 	. 
	rst 38h			;38a9	ff 	. 
	rst 38h			;38aa	ff 	. 
	rst 38h			;38ab	ff 	. 
	rst 38h			;38ac	ff 	. 
	rst 38h			;38ad	ff 	. 
	rst 38h			;38ae	ff 	. 
	rst 38h			;38af	ff 	. 
	rst 38h			;38b0	ff 	. 
	rst 38h			;38b1	ff 	. 
	rst 38h			;38b2	ff 	. 
	rst 38h			;38b3	ff 	. 
	rst 38h			;38b4	ff 	. 
	rst 38h			;38b5	ff 	. 
	rst 38h			;38b6	ff 	. 
	rst 38h			;38b7	ff 	. 
	rst 38h			;38b8	ff 	. 
	rst 38h			;38b9	ff 	. 
	rst 38h			;38ba	ff 	. 
	rst 38h			;38bb	ff 	. 
	rst 38h			;38bc	ff 	. 
	rst 38h			;38bd	ff 	. 
	rst 38h			;38be	ff 	. 
	rst 38h			;38bf	ff 	. 
	rst 38h			;38c0	ff 	. 
	rst 38h			;38c1	ff 	. 
	rst 38h			;38c2	ff 	. 
	rst 38h			;38c3	ff 	. 
	rst 38h			;38c4	ff 	. 
	rst 38h			;38c5	ff 	. 
	rst 38h			;38c6	ff 	. 
	rst 38h			;38c7	ff 	. 
	rst 38h			;38c8	ff 	. 
	rst 38h			;38c9	ff 	. 
	rst 38h			;38ca	ff 	. 
	rst 38h			;38cb	ff 	. 
	rst 38h			;38cc	ff 	. 
	rst 38h			;38cd	ff 	. 
	rst 38h			;38ce	ff 	. 
	rst 38h			;38cf	ff 	. 
	rst 38h			;38d0	ff 	. 
	rst 38h			;38d1	ff 	. 
	rst 38h			;38d2	ff 	. 
	rst 38h			;38d3	ff 	. 
	rst 38h			;38d4	ff 	. 
	rst 38h			;38d5	ff 	. 
	rst 38h			;38d6	ff 	. 
	rst 38h			;38d7	ff 	. 
	rst 38h			;38d8	ff 	. 
	rst 38h			;38d9	ff 	. 
	rst 38h			;38da	ff 	. 
	rst 38h			;38db	ff 	. 
	rst 38h			;38dc	ff 	. 
	rst 38h			;38dd	ff 	. 
	rst 38h			;38de	ff 	. 
	rst 38h			;38df	ff 	. 
	rst 38h			;38e0	ff 	. 
	rst 38h			;38e1	ff 	. 
	rst 38h			;38e2	ff 	. 
	rst 38h			;38e3	ff 	. 
	rst 38h			;38e4	ff 	. 
	rst 38h			;38e5	ff 	. 
	rst 38h			;38e6	ff 	. 
	rst 38h			;38e7	ff 	. 
	rst 38h			;38e8	ff 	. 
	rst 38h			;38e9	ff 	. 
	rst 38h			;38ea	ff 	. 
	rst 38h			;38eb	ff 	. 
	rst 38h			;38ec	ff 	. 
	rst 38h			;38ed	ff 	. 
	rst 38h			;38ee	ff 	. 
	rst 38h			;38ef	ff 	. 
	rst 38h			;38f0	ff 	. 
	rst 38h			;38f1	ff 	. 
	rst 38h			;38f2	ff 	. 
	rst 38h			;38f3	ff 	. 
	rst 38h			;38f4	ff 	. 
	rst 38h			;38f5	ff 	. 
	rst 38h			;38f6	ff 	. 
	rst 38h			;38f7	ff 	. 
	rst 38h			;38f8	ff 	. 
	rst 38h			;38f9	ff 	. 
	rst 38h			;38fa	ff 	. 
	rst 38h			;38fb	ff 	. 
	rst 38h			;38fc	ff 	. 
	rst 38h			;38fd	ff 	. 
	rst 38h			;38fe	ff 	. 
	rst 38h			;38ff	ff 	. 
