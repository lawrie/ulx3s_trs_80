; z80dasm 1.1.5
; command line: z80dasm -a -l -g 0 -t BOOT.ROM

	org	00000h

l0000h:
	di			;0000	f3 	. 
l0001h:
	xor a			;0001	af 	. 
	jp l0674h		;0002	c3 74 06 	. t . 
l0005h:
	jp 04000h		;0005	c3 00 40 	. . @ 
	jp 04000h		;0008	c3 00 40 	. . @ 
l000bh:
	pop hl			;000b	e1 	. 
	jp (hl)			;000c	e9 	. 
	jp l069fh		;000d	c3 9f 06 	. . . 
	jp 04003h		;0010	c3 03 40 	. . @ 
l0013h:
	push bc			;0013	c5 	. 
	ld b,001h		;0014	06 01 	. . 
	jr l0046h		;0016	18 2e 	. . 
	jp 04006h		;0018	c3 06 40 	. . @ 
l001bh:
	push bc			;001b	c5 	. 
	ld b,002h		;001c	06 02 	. . 
l001eh:
	jr l0046h		;001e	18 26 	. & 
l0020h:
	jp 04009h		;0020	c3 09 40 	. . @ 
	push bc			;0023	c5 	. 
	ld b,004h		;0024	06 04 	. . 
	jr l0046h		;0026	18 1e 	. . 
l0028h:
	jp 0400ch		;0028	c3 0c 40 	. . @ 
sub_002bh:
	ld de,04015h		;002b	11 15 40 	. . @ 
	jr l0013h		;002e	18 e3 	. . 
	jp 0400fh		;0030	c3 0f 40 	. . @ 
sub_0033h:
	ld de,0401dh		;0033	11 1d 40 	. . @ 
l0036h:
	jr l001bh		;0036	18 e3 	. . 
	jp 04012h		;0038	c3 12 40 	. . @ 
sub_003bh:
	ld de,04025h		;003b	11 25 40 	. % @ 
	jr l001bh		;003e	18 db 	. . 
l0040h:
	jp l05d9h		;0040	c3 d9 05 	. . . 
	ret			;0043	c9 	. 
	nop			;0044	00 	. 
	nop			;0045	00 	. 
l0046h:
	jp l03c2h		;0046	c3 c2 03 	. . . 
l0049h:
	call sub_002bh		;0049	cd 2b 00 	. + . 
	or a			;004c	b7 	. 
	ret nz			;004d	c0 	. 
	jr l0049h		;004e	18 f9 	. . 
l0050h:
	dec c			;0050	0d 	. 
	dec c			;0051	0d 	. 
	rra			;0052	1f 	. 
	rra			;0053	1f 	. 
	ld bc,05b01h		;0054	01 01 5b 	. . [ 
	dec de			;0057	1b 	. 
	ld a,(bc)			;0058	0a 	. 
	ld a,(de)			;0059	1a 	. 
	ex af,af'			;005a	08 	. 
	jr l0066h		;005b	18 09 	. . 
	add hl,de			;005d	19 	. 
	jr nz,l0080h		;005e	20 20 	    
l0060h:
	dec bc			;0060	0b 	. 
	ld a,b			;0061	78 	x 
	or c			;0062	b1 	. 
	jr nz,l0060h		;0063	20 fb 	  . 
	ret			;0065	c9 	. 
l0066h:
	ld sp,l0600h		;0066	31 00 06 	1 . . 
	ld a,(l37ech)		;0069	3a ec 37 	: . 7 
	inc a			;006c	3c 	< 
	cp 002h		;006d	fe 02 	. . 
	jp nc,l0000h		;006f	d2 00 00 	. . . 
	jp l06cch		;0072	c3 cc 06 	. . . 
l0075h:
	ld de,04080h		;0075	11 80 40 	. . @ 
	ld hl,l18f7h		;0078	21 f7 18 	! . . 
	ld bc,00027h		;007b	01 27 00 	. ' . 
	ldir		;007e	ed b0 	. . 
l0080h:
	ld hl,041e5h		;0080	21 e5 41 	! . A 
	ld (hl),03ah		;0083	36 3a 	6 : 
	inc hl			;0085	23 	# 
	ld (hl),b			;0086	70 	p 
	inc hl			;0087	23 	# 
	ld (hl),02ch		;0088	36 2c 	6 , 
	inc hl			;008a	23 	# 
	ld (040a7h),hl		;008b	22 a7 40 	" . @ 
	ld de,l012dh		;008e	11 2d 01 	. - . 
	ld b,01ch		;0091	06 1c 	. . 
	ld hl,04152h		;0093	21 52 41 	! R A 
l0096h:
	ld (hl),0c3h		;0096	36 c3 	6 . 
	inc hl			;0098	23 	# 
	ld (hl),e			;0099	73 	s 
	inc hl			;009a	23 	# 
	ld (hl),d			;009b	72 	r 
	inc hl			;009c	23 	# 
	djnz l0096h		;009d	10 f7 	. . 
	ld b,015h		;009f	06 15 	. . 
l00a1h:
	ld (hl),0c9h		;00a1	36 c9 	6 . 
	inc hl			;00a3	23 	# 
	inc hl			;00a4	23 	# 
	inc hl			;00a5	23 	# 
	djnz l00a1h		;00a6	10 f9 	. . 
	ld hl,042e8h		;00a8	21 e8 42 	! . B 
	ld (hl),b			;00ab	70 	p 
	ld sp,041f8h		;00ac	31 f8 41 	1 . A 
	call sub_1b8fh		;00af	cd 8f 1b 	. . . 
	call sub_01c9h		;00b2	cd c9 01 	. . . 
l00b5h:
	ld hl,l0105h		;00b5	21 05 01 	! . . 
	call sub_28a7h		;00b8	cd a7 28 	. . ( 
	call sub_1bb3h		;00bb	cd b3 1b 	. . . 
	jr c,l00b5h		;00be	38 f5 	8 . 
	rst 10h			;00c0	d7 	. 
	or a			;00c1	b7 	. 
	jr nz,l00d6h		;00c2	20 12 	  . 
	ld hl,0434ch		;00c4	21 4c 43 	! L C 
l00c7h:
	inc hl			;00c7	23 	# 
	ld a,h			;00c8	7c 	| 
	or l			;00c9	b5 	. 
	jr z,l00e7h		;00ca	28 1b 	( . 
	ld a,(hl)			;00cc	7e 	~ 
	ld b,a			;00cd	47 	G 
	cpl			;00ce	2f 	/ 
	ld (hl),a			;00cf	77 	w 
	cp (hl)			;00d0	be 	. 
	ld (hl),b			;00d1	70 	p 
	jr z,l00c7h		;00d2	28 f3 	( . 
	jr l00e7h		;00d4	18 11 	. . 
l00d6h:
	call sub_1e5ah		;00d6	cd 5a 1e 	. Z . 
	or a			;00d9	b7 	. 
	jp nz,l1997h		;00da	c2 97 19 	. . . 
	ex de,hl			;00dd	eb 	. 
	dec hl			;00de	2b 	+ 
	ld a,08fh		;00df	3e 8f 	> . 
	ld b,(hl)			;00e1	46 	F 
	ld (hl),a			;00e2	77 	w 
	cp (hl)			;00e3	be 	. 
	ld (hl),b			;00e4	70 	p 
	jr nz,l00b5h		;00e5	20 ce 	  . 
l00e7h:
	dec hl			;00e7	2b 	+ 
sub_00e8h:
	ld de,04414h		;00e8	11 14 44 	. . D 
	rst 18h			;00eb	df 	. 
	jp c,l197ah		;00ec	da 7a 19 	. z . 
	ld de,0ffceh		;00ef	11 ce ff 	. . . 
	ld (040b1h),hl		;00f2	22 b1 40 	" . @ 
	add hl,de			;00f5	19 	. 
	ld (040a0h),hl		;00f6	22 a0 40 	" . @ 
	call sub_1b4dh		;00f9	cd 4d 1b 	. M . 
	ld hl,l0111h		;00fc	21 11 01 	! . . 
l00ffh:
	call sub_28a7h		;00ff	cd a7 28 	. . ( 
	jp l1a19h		;0102	c3 19 1a 	. . . 
l0105h:
	ld d,d			;0105	52 	R 
	ld b,l			;0106	45 	E 
	ld b,c			;0107	41 	A 
	ld b,h			;0108	44 	D 
	ld e,c			;0109	59 	Y 
	jr nz,l010ch		;010a	20 00 	  . 
l010ch:
	nop			;010c	00 	. 
	nop			;010d	00 	. 
	nop			;010e	00 	. 
	nop			;010f	00 	. 
	nop			;0110	00 	. 
l0111h:
	dec c			;0111	0d 	. 
	dec c			;0112	0d 	. 
	dec c			;0113	0d 	. 
	dec c			;0114	0d 	. 
	dec c			;0115	0d 	. 
	dec c			;0116	0d 	. 
	dec c			;0117	0d 	. 
	dec c			;0118	0d 	. 
	dec c			;0119	0d 	. 
	dec c			;011a	0d 	. 
	dec c			;011b	0d 	. 
	dec c			;011c	0d 	. 
	dec c			;011d	0d 	. 
	dec c			;011e	0d 	. 
	dec c			;011f	0d 	. 
	dec c			;0120	0d 	. 
	dec c			;0121	0d 	. 
	dec c			;0122	0d 	. 
	dec c			;0123	0d 	. 
	dec c			;0124	0d 	. 
	dec c			;0125	0d 	. 
	dec c			;0126	0d 	. 
	dec c			;0127	0d 	. 
	dec c			;0128	0d 	. 
	dec c			;0129	0d 	. 
	dec c			;012a	0d 	. 
	dec c			;012b	0d 	. 
	nop			;012c	00 	. 
l012dh:
	ld e,02ch		;012d	1e 2c 	. , 
	jp l19a2h		;012f	c3 a2 19 	. . . 
l0132h:
	rst 10h			;0132	d7 	. 
	xor a			;0133	af 	. 
	ld bc,0803eh		;0134	01 3e 80 	. > . 
	ld bc,l013eh		;0137	01 3e 01 	. > . 
	push af			;013a	f5 	. 
	rst 8			;013b	cf 	. 
	jr z,$-49		;013c	28 cd 	( . 
l013eh:
	inc e			;013e	1c 	. 
	dec hl			;013f	2b 	+ 
	cp 080h		;0140	fe 80 	. . 
	jp nc,l1e4ah		;0142	d2 4a 1e 	. J . 
	push af			;0145	f5 	. 
	rst 8			;0146	cf 	. 
	inc l			;0147	2c 	, 
	call sub_2b1ch		;0148	cd 1c 2b 	. . + 
	cp 030h		;014b	fe 30 	. 0 
	jp nc,l1e4ah		;014d	d2 4a 1e 	. J . 
	ld d,0ffh		;0150	16 ff 	. . 
l0152h:
	inc d			;0152	14 	. 
	sub 003h		;0153	d6 03 	. . 
	jr nc,l0152h		;0155	30 fb 	0 . 
	add a,003h		;0157	c6 03 	. . 
	ld c,a			;0159	4f 	O 
	pop af			;015a	f1 	. 
	add a,a			;015b	87 	. 
	ld e,a			;015c	5f 	_ 
	ld b,002h		;015d	06 02 	. . 
l015fh:
	ld a,d			;015f	7a 	z 
	rra			;0160	1f 	. 
	ld d,a			;0161	57 	W 
	ld a,e			;0162	7b 	{ 
	rra			;0163	1f 	. 
	ld e,a			;0164	5f 	_ 
	djnz l015fh		;0165	10 f8 	. . 
	ld a,c			;0167	79 	y 
	adc a,a			;0168	8f 	. 
	inc a			;0169	3c 	< 
	ld b,a			;016a	47 	G 
	xor a			;016b	af 	. 
	scf			;016c	37 	7 
l016dh:
	adc a,a			;016d	8f 	. 
	djnz l016dh		;016e	10 fd 	. . 
	ld c,a			;0170	4f 	O 
	ld a,d			;0171	7a 	z 
	or 03ch		;0172	f6 3c 	. < 
	ld d,a			;0174	57 	W 
	ld a,(de)			;0175	1a 	. 
	or a			;0176	b7 	. 
	jp m,l017ch		;0177	fa 7c 01 	. | . 
	ld a,080h		;017a	3e 80 	> . 
l017ch:
	ld b,a			;017c	47 	G 
	pop af			;017d	f1 	. 
	or a			;017e	b7 	. 
	ld a,b			;017f	78 	x 
	jr z,l0192h		;0180	28 10 	( . 
	ld (de),a			;0182	12 	. 
	jp m,l018fh		;0183	fa 8f 01 	. . . 
	ld a,c			;0186	79 	y 
	cpl			;0187	2f 	/ 
	ld c,a			;0188	4f 	O 
	ld a,(de)			;0189	1a 	. 
	and c			;018a	a1 	. 
l018bh:
	ld (de),a			;018b	12 	. 
l018ch:
	rst 8			;018c	cf 	. 
	add hl,hl			;018d	29 	) 
	ret			;018e	c9 	. 
l018fh:
	or c			;018f	b1 	. 
	jr l018bh		;0190	18 f9 	. . 
l0192h:
	and c			;0192	a1 	. 
	add a,0ffh		;0193	c6 ff 	. . 
	sbc a,a			;0195	9f 	. 
	push hl			;0196	e5 	. 
	call sub_098dh		;0197	cd 8d 09 	. . . 
	pop hl			;019a	e1 	. 
	jr l018ch		;019b	18 ef 	. . 
l019dh:
	rst 10h			;019d	d7 	. 
	push hl			;019e	e5 	. 
	ld a,(04099h)		;019f	3a 99 40 	: . @ 
	or a			;01a2	b7 	. 
	jr nz,l01abh		;01a3	20 06 	  . 
	call sub_0358h		;01a5	cd 58 03 	. X . 
	or a			;01a8	b7 	. 
	jr z,l01bch		;01a9	28 11 	( . 
l01abh:
	push af			;01ab	f5 	. 
	xor a			;01ac	af 	. 
	ld (04099h),a		;01ad	32 99 40 	2 . @ 
	inc a			;01b0	3c 	< 
	call sub_2857h		;01b1	cd 57 28 	. W ( 
	pop af			;01b4	f1 	. 
	ld hl,(040d4h)		;01b5	2a d4 40 	* . @ 
	ld (hl),a			;01b8	77 	w 
	jp l2884h		;01b9	c3 84 28 	. . ( 
l01bch:
	ld hl,01928h		;01bc	21 28 19 	! ( . 
	ld (04121h),hl		;01bf	22 21 41 	" ! A 
	ld a,003h		;01c2	3e 03 	> . 
	ld (040afh),a		;01c4	32 af 40 	2 . @ 
	pop hl			;01c7	e1 	. 
	ret			;01c8	c9 	. 
sub_01c9h:
	ld a,01ch		;01c9	3e 1c 	> . 
	call sub_033ah		;01cb	cd 3a 03 	. : . 
	ld a,01fh		;01ce	3e 1f 	> . 
	jp sub_033ah		;01d0	c3 3a 03 	. : . 
	ld a,r		;01d3	ed 5f 	. _ 
	ld (040abh),a		;01d5	32 ab 40 	2 . @ 
	ret			;01d8	c9 	. 
sub_01d9h:
	ld hl,0fc01h		;01d9	21 01 fc 	! . . 
	call sub_0221h		;01dc	cd 21 02 	. ! . 
	ld b,00bh		;01df	06 0b 	. . 
l01e1h:
	djnz l01e1h		;01e1	10 fe 	. . 
	ld hl,0fc02h		;01e3	21 02 fc 	! . . 
	call sub_0221h		;01e6	cd 21 02 	. ! . 
	ld b,00bh		;01e9	06 0b 	. . 
l01ebh:
	djnz l01ebh		;01eb	10 fe 	. . 
	ld hl,0fc00h		;01ed	21 00 fc 	! . . 
	call sub_0221h		;01f0	cd 21 02 	. ! . 
	ld b,05ch		;01f3	06 5c 	. \ 
l01f5h:
	djnz l01f5h		;01f5	10 fe 	. . 
	ret			;01f7	c9 	. 
cass_on:
sub_01f8h:
	push hl			;01f8	e5 	. 
	ld hl,0fb00h		;01f9	21 00 fb 	! . . 
	jr l0219h		;01fc	18 1b 	. . 
sub_01feh:
	ld a,(hl)			;01fe	7e 	~ 
	sub 023h		;01ff	d6 23 	. # 
	ld a,000h		;0201	3e 00 	> . 
	jr nz,l0212h		;0203	20 0d 	  . 
	call sub_2b01h		;0205	cd 01 2b 	. . + 
	rst 8			;0208	cf 	. 
	inc l			;0209	2c 	, 
	ld a,e			;020a	7b 	{ 
	and d			;020b	a2 	. 
	add a,002h		;020c	c6 02 	. . 
	jp nc,l1e4ah		;020e	d2 4a 1e 	. J . 
	dec a			;0211	3d 	= 
cass_out:
l0212h:
	out (0feh),a		;0212	d3 fe 	. . 
	nop			;0214	00 	. 
	push hl			;0215	e5 	. 
	ld hl,0ff04h		;0216	21 04 ff 	! . . 
l0219h:
	call sub_0221h		;0219	cd 21 02 	. ! . 
	pop hl			;021c	e1 	. 
	ret			;021d	c9 	. 
sub_021eh:
	ld hl,0ff00h		;021e	21 00 ff 	! . . 
sub_0221h:
	ld a,(0403dh)		;0221	3a 3d 40 	: = @ 
	and h			;0224	a4 	. 
	or l			;0225	b5 	. 
	out (0ffh),a		;0226	d3 ff 	. . 
	ld (0403dh),a		;0228	32 3d 40 	2 = @ 
	ret			;022b	c9 	. 
sub_022ch:
	ld a,(03c3fh)		;022c	3a 3f 3c 	: ? < 
	xor 00ah		;022f	ee 0a 	. . 
	ld (03c3fh),a		;0231	32 3f 3c 	2 ? < 
	ret			;0234	c9 	. 
sub_0235h:
	push bc			;0235	c5 	. 
	push hl			;0236	e5 	. 
	in a,(004h)		;0237	db 04 	. . 
	nop			;0239	00 	. 
	nop			;023a	00 	. 
	nop			;023b	00 	. 
	nop			;023c	00 	. 
	nop			;023d	00 	. 
	pop hl			;023e	e1 	. 
	pop bc			;023f	c1 	. 
	ret			;0240	c9 	. 
read_tape_byte:
sub_0241h:
	in a,(004h)		;0241	db 04 	. . 
l0243h:
	ret			;0243	c9 	. 
	rst 38h			;0244	ff 	. 
	rla			;0245	17 	. 
	jr nc,l0243h		;0246	30 fb 	0 . 
	ld b,041h		;0248	06 41 	. A 
l024ah:
	djnz l024ah		;024a	10 fe 	. . 
	call sub_021eh		;024c	cd 1e 02 	. . . 
	ld b,076h		;024f	06 76 	. v 
l0251h:
	djnz l0251h		;0251	10 fe 	. . 
	in a,(0ffh)		;0253	db ff 	. . 
	ld b,a			;0255	47 	G 
	pop af			;0256	f1 	. 
	rl b		;0257	cb 10 	. . 
	rla			;0259	17 	. 
	push af			;025a	f5 	. 
	call sub_021eh		;025b	cd 1e 02 	. . . 
	pop af			;025e	f1 	. 
	pop bc			;025f	c1 	. 
	ret			;0260	c9 	. 
sub_0261h:
	call sub_0264h		;0261	cd 64 02 	. d . 
write_tape:
sub_0264h:
	push hl			;0264	e5 	. 
	push bc			;0265	c5 	. 
	push de			;0266	d5 	. 
	push af			;0267	f5 	. 
	ld c,008h		;0268	0e 08 	. . 
	ld d,a			;026a	57 	W 
l026bh:
	call sub_01d9h		;026b	cd d9 01 	. . . 
	ld a,d			;026e	7a 	z 
	rlca			;026f	07 	. 
	ld d,a			;0270	57 	W 
	jr nc,l027eh		;0271	30 0b 	0 . 
	call sub_01d9h		;0273	cd d9 01 	. . . 
l0276h:
	dec c			;0276	0d 	. 
	jr nz,l026bh		;0277	20 f2 	  . 
	pop af			;0279	f1 	. 
	pop de			;027a	d1 	. 
	pop bc			;027b	c1 	. 
	pop hl			;027c	e1 	. 
	ret			;027d	c9 	. 
l027eh:
	ld b,087h		;027e	06 87 	. . 
l0280h:
	djnz l0280h		;0280	10 fe 	. . 
	jr l0276h		;0282	18 f2 	. . 
sub_0284h:
	call sub_01feh		;0284	cd fe 01 	. . . 
write_header:
	ld b,0ffh		;0287	06 ff 	. . 
	xor a			;0289	af 	. 
l028ah:
	call sub_0264h		;028a	cd 64 02 	. d . 
	djnz l028ah		;028d	10 fb 	. . 
	ld a,0a5h		;028f	3e a5 	> . 
	jr sub_0264h		;0291	18 d1 	. . 
sub_0293h:
        ; turn cassette on
	call sub_01feh		;0293	cd fe 01 	. . . 
read_sync_byte:
sub_0296h:
	push hl			;0296	e5 	. 
	xor a			;0297	af 	. 
l0298h:
        ; read byte
	call sub_0241h		;0298	cd 41 02 	. A . 
        ; check for sync
	cp 0a5h		;029b	fe a5 	. . 
	jr nz,l0298h		;029d	20 f9 	  . 
write_asterisks:
	ld a,02ah		;029f	3e 2a 	> * 
	ld (03c3eh),a		;02a1	32 3e 3c 	2 > < 
	ld (03c3fh),a		;02a4	32 3f 3c 	2 ? < 
	pop hl			;02a7	e1 	. 
	ret			;02a8	c9 	. 
l02a9h:
        ; read entry point
	call sub_0314h		;02a9	cd 14 03 	. . . 
        ; store entry point
	ld (040dfh),hl		;02ac	22 df 40 	" . @ 
	call sub_01f8h		;02af	cd f8 01 	. . . 
l02b2h:
	call 041e2h		;02b2	cd e2 41 	. . A 
system:
	ld sp,04288h		;02b5	31 88 42 	1 . B 
	call sub_20feh		;02b8	cd fe 20 	. .   
	ld a,02ah		;02bb	3e 2a 	> * 
	call sub_032ah		;02bd	cd 2a 03 	. * . 
	call sub_1bb3h		;02c0	cd b3 1b 	. . . 
	jp c,l06cch		;02c3	da cc 06 	. . . 
	rst 10h			;02c6	d7 	. 
	jp z,l1997h		;02c7	ca 97 19 	. . . 
	cp 02fh		;02ca	fe 2f 	. / 
	jr z,l031dh		;02cc	28 4f 	( O 
        ; Wait for sync
	call sub_0293h		;02ce	cd 93 02 	. . . 
l02d1h:
        ; Get 55 byte
	call sub_0235h		;02d1	cd 35 02 	. 5 . 
	cp 055h		;02d4	fe 55 	. U 
	jr nz,l02d1h		;02d6	20 f9 	  . 
        ; compare filename
	ld b,006h		;02d8	06 06 	. . 
l02dah:
	ld a,(hl)			;02da	7e 	~ 
	or a			;02db	b7 	. 
	jr z,l02e7h		;02dc	28 09 	( . 
	call sub_0235h		;02de	cd 35 02 	. 5 . 
	cp (hl)			;02e1	be 	. 
	jr nz,l02d1h		;02e2	20 ed 	  . 
	inc hl			;02e4	23 	# 
	djnz l02dah		;02e5	10 f3 	. . 
l02e7h:
        ; file matches
        ; blink asterisk
	call sub_022ch		;02e7	cd 2c 02 	. , . 
l02eah:
        ; read byte
	call sub_0235h		;02ea	cd 35 02 	. 5 . 
        ; check for eof
	cp 078h		;02ed	fe 78 	. x 
	jr z,l02a9h		;02ef	28 b8 	( . 
        ; skip to 3c
	cp 03ch		;02f1	fe 3c 	. < 
	jr nz,l02eah		;02f3	20 f5 	  . 
	call sub_0235h		;02f5	cd 35 02 	. 5 . 
	ld b,a			;02f8	47 	G 
        ; get start address
	call sub_0314h		;02f9	cd 14 03 	. . . 
	add a,l			;02fc	85 	. 
	ld c,a			;02fd	4f 	O 
l02feh:
	call sub_0235h		;02fe	cd 35 02 	. 5 . 
        ; write byte to memory
	ld (hl),a			;0301	77 	w 
	inc hl			;0302	23 	# 
	add a,c			;0303	81 	. 
	ld c,a			;0304	4f 	O 
	djnz l02feh		;0305	10 f7 	. . 
	call sub_0235h		;0307	cd 35 02 	. 5 . 
	cp c			;030a	b9 	. 
        ; blink asterisk
	jr z,l02e7h		;030b	28 da 	( . 
        ; checksum error ?
	ld a,043h		;030d	3e 43 	> C 
	ld (03c3eh),a		;030f	32 3e 3c 	2 > < 
	jr l02eah		;0312	18 d6 	. . 
read_entry_point;
sub_0314h:
	call sub_0235h		;0314	cd 35 02 	. 5 . 
	ld l,a			;0317	6f 	o 
	call sub_0235h		;0318	cd 35 02 	. 5 . 
	ld h,a			;031b	67 	g 
	ret			;031c	c9 	. 
l031dh:
	ex de,hl			;031d	eb 	. 
	ld hl,(040dfh)		;031e	2a df 40 	* . @ 
	ex de,hl			;0321	eb 	. 
	rst 10h			;0322	d7 	. 
	call nz,sub_1e5ah		;0323	c4 5a 1e 	. Z . 
	jr nz,l02b2h		;0326	20 8a 	  . 
	ex de,hl			;0328	eb 	. 
	jp (hl)			;0329	e9 	. 
write_byte:
sub_032ah:
	push bc			;032a	c5 	. 
	ld c,a			;032b	4f 	O 
	call 041c1h		;032c	cd c1 41 	. . A 
	ld a,(0409ch)		;032f	3a 9c 40 	: . @ 
	or a			;0332	b7 	. 
	ld a,c			;0333	79 	y 
	pop bc			;0334	c1 	. 
	jp m,sub_0264h		;0335	fa 64 02 	. d . 
	jr nz,l039ch		;0338	20 62 	  b 
print:
sub_033ah:
	push de			;033a	d5 	. 
	call sub_0033h		;033b	cd 33 00 	. 3 . 
	push af			;033e	f5 	. 
	call sub_0348h		;033f	cd 48 03 	. H . 
	ld (040a6h),a		;0342	32 a6 40 	2 . @ 
	pop af			;0345	f1 	. 
	pop de			;0346	d1 	. 
	ret			;0347	c9 	. 
sub_0348h:
	ld a,(0403dh)		;0348	3a 3d 40 	: = @ 
	and 008h		;034b	e6 08 	. . 
	ld a,(04020h)		;034d	3a 20 40 	:   @ 
	jr z,l0355h		;0350	28 03 	( . 
	rrca			;0352	0f 	. 
	and 01fh		;0353	e6 1f 	. . 
l0355h:
	and 03fh		;0355	e6 3f 	. ? 
	ret			;0357	c9 	. 
sub_0358h:
	call 041c4h		;0358	cd c4 41 	. . A 
	push de			;035b	d5 	. 
	call sub_002bh		;035c	cd 2b 00 	. + . 
	pop de			;035f	d1 	. 
	ret			;0360	c9 	. 
sub_0361h:
	xor a			;0361	af 	. 
	ld (04099h),a		;0362	32 99 40 	2 . @ 
	ld (040a6h),a		;0365	32 a6 40 	2 . @ 
	call 041afh		;0368	cd af 41 	. . A 
	push bc			;036b	c5 	. 
	ld hl,(040a7h)		;036c	2a a7 40 	* . @ 
	ld b,0f0h		;036f	06 f0 	. . 
	call l05d9h		;0371	cd d9 05 	. . . 
	push af			;0374	f5 	. 
	ld c,b			;0375	48 	H 
	ld b,000h		;0376	06 00 	. . 
	add hl,bc			;0378	09 	. 
	ld (hl),000h		;0379	36 00 	6 . 
	ld hl,(040a7h)		;037b	2a a7 40 	* . @ 
	pop af			;037e	f1 	. 
	pop bc			;037f	c1 	. 
	dec hl			;0380	2b 	+ 
	ret c			;0381	d8 	. 
	xor a			;0382	af 	. 
	ret			;0383	c9 	. 
l0384h:
	call sub_0358h		;0384	cd 58 03 	. X . 
	or a			;0387	b7 	. 
	ret nz			;0388	c0 	. 
	jr l0384h		;0389	18 f9 	. . 
sub_038bh:
	xor a			;038b	af 	. 
	ld (0409ch),a		;038c	32 9c 40 	2 . @ 
	ld a,(0409bh)		;038f	3a 9b 40 	: . @ 
	or a			;0392	b7 	. 
	ret z			;0393	c8 	. 
	ld a,00dh		;0394	3e 0d 	> . 
	push de			;0396	d5 	. 
	call l039ch		;0397	cd 9c 03 	. . . 
	pop de			;039a	d1 	. 
	ret			;039b	c9 	. 
l039ch:
	push af			;039c	f5 	. 
	push de			;039d	d5 	. 
	push bc			;039e	c5 	. 
	ld c,a			;039f	4f 	O 
	ld e,000h		;03a0	1e 00 	. . 
	cp 00ch		;03a2	fe 0c 	. . 
	jr z,l03b6h		;03a4	28 10 	( . 
	cp 00ah		;03a6	fe 0a 	. . 
	jr nz,l03adh		;03a8	20 03 	  . 
	ld a,00dh		;03aa	3e 0d 	> . 
	ld c,a			;03ac	4f 	O 
l03adh:
	cp 00dh		;03ad	fe 0d 	. . 
	jr z,l03b6h		;03af	28 05 	( . 
	ld a,(0409bh)		;03b1	3a 9b 40 	: . @ 
	inc a			;03b4	3c 	< 
	ld e,a			;03b5	5f 	_ 
l03b6h:
	ld a,e			;03b6	7b 	{ 
	ld (0409bh),a		;03b7	32 9b 40 	2 . @ 
	ld a,c			;03ba	79 	y 
	call sub_003bh		;03bb	cd 3b 00 	. ; . 
	pop bc			;03be	c1 	. 
	pop de			;03bf	d1 	. 
l03c0h:
	pop af			;03c0	f1 	. 
	ret			;03c1	c9 	. 
l03c2h:
	push hl			;03c2	e5 	. 
	push ix		;03c3	dd e5 	. . 
	push de			;03c5	d5 	. 
	pop ix		;03c6	dd e1 	. . 
	push de			;03c8	d5 	. 
	ld hl,l03ddh		;03c9	21 dd 03 	! . . 
	push hl			;03cc	e5 	. 
	ld c,a			;03cd	4f 	O 
	ld a,(de)			;03ce	1a 	. 
	and b			;03cf	a0 	. 
	cp b			;03d0	b8 	. 
	jp nz,04033h		;03d1	c2 33 40 	. 3 @ 
	cp 002h		;03d4	fe 02 	. . 
	ld l,(ix+001h)		;03d6	dd 6e 01 	. n . 
	ld h,(ix+002h)		;03d9	dd 66 02 	. f . 
	jp (hl)			;03dc	e9 	. 
l03ddh:
	pop de			;03dd	d1 	. 
	pop ix		;03de	dd e1 	. . 
	pop hl			;03e0	e1 	. 
	pop bc			;03e1	c1 	. 
	ret			;03e2	c9 	. 
keyboard:
l03e3h:
	ld hl,04036h		;03e3	21 36 40 	! 6 @ 
	ld bc,03801h		;03e6	01 01 38 	. . 8 
	ld d,000h		;03e9	16 00 	. . 
l03ebh:
	ld a,(bc)			;03eb	0a 	. 
	ld e,a			;03ec	5f 	_ 
	xor (hl)			;03ed	ae 	. 
	ld (hl),e			;03ee	73 	s 
	and e			;03ef	a3 	. 
	jr nz,l03fah		;03f0	20 08 	  . 
	inc d			;03f2	14 	. 
	inc l			;03f3	2c 	, 
	rlc c		;03f4	cb 01 	. . 
	jp p,l03ebh		;03f6	f2 eb 03 	. . . 
	ret			;03f9	c9 	. 
l03fah:
	ld e,a			;03fa	5f 	_ 
l03fbh:
	ld a,d			;03fb	7a 	z 
	rlca			;03fc	07 	. 
	rlca			;03fd	07 	. 
	rlca			;03fe	07 	. 
	ld d,a			;03ff	57 	W 
	ld c,001h		;0400	0e 01 	. . 
l0402h:
	ld a,c			;0402	79 	y 
	and e			;0403	a3 	. 
	jr nz,l040bh		;0404	20 05 	  . 
	inc d			;0406	14 	. 
	rlc c		;0407	cb 01 	. . 
	jr l0402h		;0409	18 f7 	. . 
l040bh:
	ld a,(03880h)		;040b	3a 80 38 	: . 8 
	ld b,a			;040e	47 	G 
	ld a,d			;040f	7a 	z 
	add a,040h		;0410	c6 40 	. @ 
l0412h:
	cp 060h		;0412	fe 60 	. ` 
	jr nc,l0429h		;0414	30 13 	0 . 
	rrc b		;0416	cb 08 	. . 
	jr nc,l044bh		;0418	30 31 	0 1 
	add a,020h		;041a	c6 20 	.   
	ld d,a			;041c	57 	W 
	ld a,(03840h)		;041d	3a 40 38 	: @ 8 
	and 010h		;0420	e6 10 	. . 
	jr z,l044ch		;0422	28 28 	( ( 
	ld a,d			;0424	7a 	z 
	sub 060h		;0425	d6 60 	. ` 
	jr l044bh		;0427	18 22 	. " 
l0429h:
	sub 070h		;0429	d6 70 	. p 
	jr nc,l043dh		;042b	30 10 	0 . 
	add a,040h		;042d	c6 40 	. @ 
	cp 03ch		;042f	fe 3c 	. < 
	jr c,l0435h		;0431	38 02 	8 . 
	xor 010h		;0433	ee 10 	. . 
l0435h:
	rrc b		;0435	cb 08 	. . 
	jr nc,l044bh		;0437	30 12 	0 . 
	xor 010h		;0439	ee 10 	. . 
	jr l044bh		;043b	18 0e 	. . 
l043dh:
	rlca			;043d	07 	. 
l043eh:
	rrc b		;043e	cb 08 	. . 
	jr nc,l0443h		;0440	30 01 	0 . 
	inc a			;0442	3c 	< 
l0443h:
	ld hl,l0050h		;0443	21 50 00 	! P . 
	ld c,a			;0446	4f 	O 
	ld b,000h		;0447	06 00 	. . 
	add hl,bc			;0449	09 	. 
	ld a,(hl)			;044a	7e 	~ 
l044bh:
	ld d,a			;044b	57 	W 
l044ch:
	ld bc,l0dach		;044c	01 ac 0d 	. . . 
	call l0060h		;044f	cd 60 00 	. ` . 
	ld a,d			;0452	7a 	z 
	cp 001h		;0453	fe 01 	. . 
	ret nz			;0455	c0 	. 
	rst 28h			;0456	ef 	. 
	ret			;0457	c9 	. 
video:
	ld l,(ix+003h)		;0458	dd 6e 03 	. n . 
	ld h,(ix+004h)		;045b	dd 66 04 	. f . 
	jr c,l049ah		;045e	38 3a 	8 : 
	ld a,(ix+005h)		;0460	dd 7e 05 	. ~ . 
	or a			;0463	b7 	. 
	jr z,l0467h		;0464	28 01 	( . 
	ld (hl),a			;0466	77 	w 
l0467h:
	ld a,c			;0467	79 	y 
	cp 020h		;0468	fe 20 	.   
	jp c,l0506h		;046a	da 06 05 	. . . 
	cp 080h		;046d	fe 80 	. . 
	jr nc,l04a6h		;046f	30 35 	0 5 
	cp 040h		;0471	fe 40 	. @ 
	jr c,l047dh		;0473	38 08 	8 . 
	sub 040h		;0475	d6 40 	. @ 
	cp 020h		;0477	fe 20 	.   
	jr c,l047dh		;0479	38 02 	8 . 
	sub 020h		;047b	d6 20 	.   
l047dh:
	call sub_0541h		;047d	cd 41 05 	. A . 
l0480h:
	ld a,h			;0480	7c 	| 
	and 003h		;0481	e6 03 	. . 
	or 03ch		;0483	f6 3c 	. < 
	ld h,a			;0485	67 	g 
	ld d,(hl)			;0486	56 	V 
	ld a,(ix+005h)		;0487	dd 7e 05 	. ~ . 
	or a			;048a	b7 	. 
	jr z,l0492h		;048b	28 05 	( . 
	ld (ix+005h),d		;048d	dd 72 05 	. r . 
	ld (hl),05fh		;0490	36 5f 	6 _ 
l0492h:
	ld (ix+003h),l		;0492	dd 75 03 	. u . 
	ld (ix+004h),h		;0495	dd 74 04 	. t . 
	ld a,c			;0498	79 	y 
	ret			;0499	c9 	. 
l049ah:
	ld a,(ix+005h)		;049a	dd 7e 05 	. ~ . 
	or a			;049d	b7 	. 
	ret nz			;049e	c0 	. 
	ld a,(hl)			;049f	7e 	~ 
	ret			;04a0	c9 	. 
l04a1h:
	ld a,l			;04a1	7d 	} 
	and 0c0h		;04a2	e6 c0 	. . 
	ld l,a			;04a4	6f 	o 
	ret			;04a5	c9 	. 
l04a6h:
	cp 0c0h		;04a6	fe c0 	. . 
	jr c,l047dh		;04a8	38 d3 	8 . 
	sub 0c0h		;04aa	d6 c0 	. . 
	jr z,l0480h		;04ac	28 d2 	( . 
	ld b,a			;04ae	47 	G 
l04afh:
	ld a,020h		;04af	3e 20 	>   
	call sub_0541h		;04b1	cd 41 05 	. A . 
	djnz l04afh		;04b4	10 f9 	. . 
	jr l0480h		;04b6	18 c8 	. . 
l04b8h:
	ld a,(hl)			;04b8	7e 	~ 
l04b9h:
	ld (ix+005h),a		;04b9	dd 77 05 	. w . 
	ret			;04bc	c9 	. 
l04bdh:
	xor a			;04bd	af 	. 
	jr l04b9h		;04be	18 f9 	. . 
l04c0h:
	ld hl,03c00h		;04c0	21 00 3c 	! . < 
	ld a,(0403dh)		;04c3	3a 3d 40 	: = @ 
	and 0f7h		;04c6	e6 f7 	. . 
	ld (0403dh),a		;04c8	32 3d 40 	2 = @ 
	out (0ffh),a		;04cb	d3 ff 	. . 
	ret			;04cd	c9 	. 
l04ceh:
	dec hl			;04ce	2b 	+ 
	ld a,(0403dh)		;04cf	3a 3d 40 	: = @ 
	and 008h		;04d2	e6 08 	. . 
	jr z,l04d7h		;04d4	28 01 	( . 
	dec hl			;04d6	2b 	+ 
l04d7h:
	ld (hl),020h		;04d7	36 20 	6   
	ret			;04d9	c9 	. 
l04dah:
	ld a,(0403dh)		;04da	3a 3d 40 	: = @ 
	and 008h		;04dd	e6 08 	. . 
	call nz,sub_04e2h		;04df	c4 e2 04 	. . . 
sub_04e2h:
	ld a,l			;04e2	7d 	} 
	and 03fh		;04e3	e6 3f 	. ? 
	dec hl			;04e5	2b 	+ 
	ret nz			;04e6	c0 	. 
l04e7h:
	ld de,l0040h		;04e7	11 40 00 	. @ . 
	add hl,de			;04ea	19 	. 
	ret			;04eb	c9 	. 
l04ech:
	inc hl			;04ec	23 	# 
	ld a,l			;04ed	7d 	} 
	and 03fh		;04ee	e6 3f 	. ? 
	ret nz			;04f0	c0 	. 
l04f1h:
	ld de,0ffc0h		;04f1	11 c0 ff 	. . . 
	add hl,de			;04f4	19 	. 
	ret			;04f5	c9 	. 
l04f6h:
	ld a,(0403dh)		;04f6	3a 3d 40 	: = @ 
	or 008h		;04f9	f6 08 	. . 
	ld (0403dh),a		;04fb	32 3d 40 	2 = @ 
	out (0ffh),a		;04fe	d3 ff 	. . 
	inc hl			;0500	23 	# 
	ld a,l			;0501	7d 	} 
	and 0feh		;0502	e6 fe 	. . 
	ld l,a			;0504	6f 	o 
	ret			;0505	c9 	. 
l0506h:
	ld de,l0480h		;0506	11 80 04 	. . . 
	push de			;0509	d5 	. 
	cp 008h		;050a	fe 08 	. . 
	jr z,l04ceh		;050c	28 c0 	( . 
	cp 00ah		;050e	fe 0a 	. . 
	ret c			;0510	d8 	. 
	cp 00eh		;0511	fe 0e 	. . 
	jr c,l0564h		;0513	38 4f 	8 O 
	jr z,l04b8h		;0515	28 a1 	( . 
	cp 00fh		;0517	fe 0f 	. . 
	jr z,l04bdh		;0519	28 a2 	( . 
	cp 017h		;051b	fe 17 	. . 
	jr z,l04f6h		;051d	28 d7 	( . 
	cp 018h		;051f	fe 18 	. . 
	jr z,l04dah		;0521	28 b7 	( . 
	cp 019h		;0523	fe 19 	. . 
	jr z,l04ech		;0525	28 c5 	( . 
	cp 01ah		;0527	fe 1a 	. . 
	jr z,l04e7h		;0529	28 bc 	( . 
	cp 01bh		;052b	fe 1b 	. . 
	jr z,l04f1h		;052d	28 c2 	( . 
	cp 01ch		;052f	fe 1c 	. . 
	jr z,l04c0h		;0531	28 8d 	( . 
	cp 01dh		;0533	fe 1d 	. . 
	jp z,l04a1h		;0535	ca a1 04 	. . . 
	cp 01eh		;0538	fe 1e 	. . 
	jr z,l0573h		;053a	28 37 	( 7 
	cp 01fh		;053c	fe 1f 	. . 
	jr z,l057ch		;053e	28 3c 	( < 
	ret			;0540	c9 	. 
sub_0541h:
	ld (hl),a			;0541	77 	w 
	inc hl			;0542	23 	# 
	ld a,(0403dh)		;0543	3a 3d 40 	: = @ 
	and 008h		;0546	e6 08 	. . 
	jr z,l054bh		;0548	28 01 	( . 
	inc hl			;054a	23 	# 
l054bh:
	ld a,h			;054b	7c 	| 
	cp 040h		;054c	fe 40 	. @ 
	ret nz			;054e	c0 	. 
	ld de,0ffc0h		;054f	11 c0 ff 	. . . 
	add hl,de			;0552	19 	. 
	push hl			;0553	e5 	. 
l0554h:
	ld de,03c00h		;0554	11 00 3c 	. . < 
	ld hl,03c40h		;0557	21 40 3c 	! @ < 
	push bc			;055a	c5 	. 
	ld bc,l03c0h		;055b	01 c0 03 	. . . 
	ldir		;055e	ed b0 	. . 
	pop bc			;0560	c1 	. 
	ex de,hl			;0561	eb 	. 
	jr l057dh		;0562	18 19 	. . 
l0564h:
	ld a,l			;0564	7d 	} 
	and 0c0h		;0565	e6 c0 	. . 
	ld l,a			;0567	6f 	o 
	push hl			;0568	e5 	. 
	ld de,l0040h		;0569	11 40 00 	. @ . 
	add hl,de			;056c	19 	. 
	ld a,h			;056d	7c 	| 
	cp 040h		;056e	fe 40 	. @ 
	jr z,l0554h		;0570	28 e2 	( . 
	pop de			;0572	d1 	. 
l0573h:
	push hl			;0573	e5 	. 
	ld d,h			;0574	54 	T 
	ld a,l			;0575	7d 	} 
	or 03fh		;0576	f6 3f 	. ? 
	ld e,a			;0578	5f 	_ 
	inc de			;0579	13 	. 
	jr l0580h		;057a	18 04 	. . 
l057ch:
	push hl			;057c	e5 	. 
l057dh:
	ld de,04000h		;057d	11 00 40 	. . @ 
l0580h:
	ld (hl),020h		;0580	36 20 	6   
	inc hl			;0582	23 	# 
	ld a,h			;0583	7c 	| 
	cp d			;0584	ba 	. 
	jr nz,l0580h		;0585	20 f9 	  . 
	ld a,l			;0587	7d 	} 
	cp e			;0588	bb 	. 
	jr nz,l0580h		;0589	20 f5 	  . 
	pop hl			;058b	e1 	. 
	ret			;058c	c9 	. 
	ld a,c			;058d	79 	y 
	or a			;058e	b7 	. 
	jr z,l05d1h		;058f	28 40 	( @ 
	cp 00bh		;0591	fe 0b 	. . 
	jr z,l059fh		;0593	28 0a 	( . 
	cp 00ch		;0595	fe 0c 	. . 
	jr nz,l05b4h		;0597	20 1b 	  . 
	xor a			;0599	af 	. 
	or (ix+003h)		;059a	dd b6 03 	. . . 
	jr z,l05b4h		;059d	28 15 	( . 
l059fh:
	ld a,(ix+003h)		;059f	dd 7e 03 	. ~ . 
	sub (ix+004h)		;05a2	dd 96 04 	. . . 
	ld b,a			;05a5	47 	G 
l05a6h:
	call l05d1h		;05a6	cd d1 05 	. . . 
	jr nz,l05a6h		;05a9	20 fb 	  . 
	ld a,00ah		;05ab	3e 0a 	> . 
	nop			;05ad	00 	. 
	out (0fdh),a		;05ae	d3 fd 	. . 
	djnz l05a6h		;05b0	10 f4 	. . 
	jr l05cch		;05b2	18 18 	. . 
l05b4h:
	push af			;05b4	f5 	. 
l05b5h:
	call l05d1h		;05b5	cd d1 05 	. . . 
	jr nz,l05b5h		;05b8	20 fb 	  . 
	pop af			;05ba	f1 	. 
	nop			;05bb	00 	. 
	out (0fdh),a		;05bc	d3 fd 	. . 
	cp 00dh		;05be	fe 0d 	. . 
	ret nz			;05c0	c0 	. 
	inc (ix+004h)		;05c1	dd 34 04 	. 4 . 
	ld a,(ix+004h)		;05c4	dd 7e 04 	. ~ . 
	cp (ix+003h)		;05c7	dd be 03 	. . . 
	ld a,c			;05ca	79 	y 
	ret nz			;05cb	c0 	. 
l05cch:
	ld (ix+004h),000h		;05cc	dd 36 04 00 	. 6 . . 
	ret			;05d0	c9 	. 
l05d1h:
	nop			;05d1	00 	. 
	in a,(0fdh)		;05d2	db fd 	. . 
	and 0f0h		;05d4	e6 f0 	. . 
	cp 030h		;05d6	fe 30 	. 0 
	ret			;05d8	c9 	. 
l05d9h:
	push hl			;05d9	e5 	. 
	ld a,00eh		;05da	3e 0e 	> . 
	call sub_0033h		;05dc	cd 33 00 	. 3 . 
	ld c,b			;05df	48 	H 
l05e0h:
	call l0049h		;05e0	cd 49 00 	. I . 
	cp 020h		;05e3	fe 20 	.   
	jr nc,l060ch		;05e5	30 25 	0 % 
	cp 00dh		;05e7	fe 0d 	. . 
	jp z,l0662h		;05e9	ca 62 06 	. b . 
	cp 01fh		;05ec	fe 1f 	. . 
	jr z,l0619h		;05ee	28 29 	( ) 
	cp 001h		;05f0	fe 01 	. . 
	jr z,l0661h		;05f2	28 6d 	( m 
	ld de,l05e0h		;05f4	11 e0 05 	. . . 
	push de			;05f7	d5 	. 
	cp 008h		;05f8	fe 08 	. . 
	jr z,l0630h		;05fa	28 34 	( 4 
	cp 018h		;05fc	fe 18 	. . 
	jr z,l062bh		;05fe	28 2b 	( + 
l0600h:
	cp 009h		;0600	fe 09 	. . 
	jr z,l0646h		;0602	28 42 	( B 
	cp 019h		;0604	fe 19 	. . 
	jr z,l0641h		;0606	28 39 	( 9 
	cp 00ah		;0608	fe 0a 	. . 
	ret nz			;060a	c0 	. 
	pop de			;060b	d1 	. 
l060ch:
	ld (hl),a			;060c	77 	w 
	ld a,b			;060d	78 	x 
	or a			;060e	b7 	. 
	jr z,l05e0h		;060f	28 cf 	( . 
	ld a,(hl)			;0611	7e 	~ 
	inc hl			;0612	23 	# 
	call sub_0033h		;0613	cd 33 00 	. 3 . 
	dec b			;0616	05 	. 
	jr l05e0h		;0617	18 c7 	. . 
l0619h:
	call sub_01c9h		;0619	cd c9 01 	. . . 
	ld b,c			;061c	41 	A 
	pop hl			;061d	e1 	. 
l061eh:
	push hl			;061e	e5 	. 
	jp l05e0h		;061f	c3 e0 05 	. . . 
l0622h:
	call l0630h		;0622	cd 30 06 	. 0 . 
	dec hl			;0625	2b 	+ 
	ld a,(hl)			;0626	7e 	~ 
	inc hl			;0627	23 	# 
	cp 00ah		;0628	fe 0a 	. . 
	ret z			;062a	c8 	. 
l062bh:
	ld a,b			;062b	78 	x 
	cp c			;062c	b9 	. 
	jr nz,l0622h		;062d	20 f3 	  . 
	ret			;062f	c9 	. 
l0630h:
	ld a,b			;0630	78 	x 
	cp c			;0631	b9 	. 
	ret z			;0632	c8 	. 
	dec hl			;0633	2b 	+ 
	ld a,(hl)			;0634	7e 	~ 
	cp 00ah		;0635	fe 0a 	. . 
	inc hl			;0637	23 	# 
	ret z			;0638	c8 	. 
	dec hl			;0639	2b 	+ 
	ld a,008h		;063a	3e 08 	> . 
	call sub_0033h		;063c	cd 33 00 	. 3 . 
	inc b			;063f	04 	. 
	ret			;0640	c9 	. 
l0641h:
	ld a,017h		;0641	3e 17 	> . 
	jp sub_0033h		;0643	c3 33 00 	. 3 . 
l0646h:
	call sub_0348h		;0646	cd 48 03 	. H . 
	and 007h		;0649	e6 07 	. . 
	cpl			;064b	2f 	/ 
	inc a			;064c	3c 	< 
	add a,008h		;064d	c6 08 	. . 
	ld e,a			;064f	5f 	_ 
l0650h:
	ld a,b			;0650	78 	x 
	or a			;0651	b7 	. 
	ret z			;0652	c8 	. 
	ld a,020h		;0653	3e 20 	>   
	ld (hl),a			;0655	77 	w 
	inc hl			;0656	23 	# 
	push de			;0657	d5 	. 
	call sub_0033h		;0658	cd 33 00 	. 3 . 
	pop de			;065b	d1 	. 
	dec b			;065c	05 	. 
	dec e			;065d	1d 	. 
	ret z			;065e	c8 	. 
	jr l0650h		;065f	18 ef 	. . 
l0661h:
	scf			;0661	37 	7 
l0662h:
	push af			;0662	f5 	. 
	ld a,00dh		;0663	3e 0d 	> . 
	ld (hl),a			;0665	77 	w 
	call sub_0033h		;0666	cd 33 00 	. 3 . 
	ld a,00fh		;0669	3e 0f 	> . 
	call sub_0033h		;066b	cd 33 00 	. 3 . 
	ld a,c			;066e	79 	y 
	sub b			;066f	90 	. 
	ld b,a			;0670	47 	G 
	pop af			;0671	f1 	. 
	pop hl			;0672	e1 	. 
	ret			;0673	c9 	. 
l0674h:
	out (0ffh),a		;0674	d3 ff 	. . 
l0676h:
	ld hl,l06d2h		;0676	21 d2 06 	! . . 
	ld de,04000h		;0679	11 00 40 	. . @ 
	ld bc,l0036h		;067c	01 36 00 	. 6 . 
	ldir		;067f	ed b0 	. . 
	dec a			;0681	3d 	= 
	dec a			;0682	3d 	= 
	jr nz,l0676h		;0683	20 f1 	  . 
	ld b,027h		;0685	06 27 	. ' 
l0687h:
	ld (de),a			;0687	12 	. 
	inc de			;0688	13 	. 
	djnz l0687h		;0689	10 fc 	. . 
	ld a,(03840h)		;068b	3a 40 38 	: @ 8 
	and 004h		;068e	e6 04 	. . 
	jp nz,l0075h		;0690	c2 75 00 	. u . 
	ld sp,0407dh		;0693	31 7d 40 	1 } @ 
	ld a,(l37ech)		;0696	3a ec 37 	: . 7 
	inc a			;0699	3c 	< 
	cp 002h		;069a	fe 02 	. . 
	jp c,l0075h		;069c	da 75 00 	. u . 
l069fh:
	ld a,001h		;069f	3e 01 	> . 
	ld (l37e1h),a		;06a1	32 e1 37 	2 . 7 
	ld hl,l37ech		;06a4	21 ec 37 	! . 7 
	ld de,l37efh		;06a7	11 ef 37 	. . 7 
	ld (hl),003h		;06aa	36 03 	6 . 
	ld bc,l0000h		;06ac	01 00 00 	. . . 
	call l0060h		;06af	cd 60 00 	. ` . 
l06b2h:
	bit 0,(hl)		;06b2	cb 46 	. F 
	jr nz,l06b2h		;06b4	20 fc 	  . 
	xor a			;06b6	af 	. 
	ld (l37eeh),a		;06b7	32 ee 37 	2 . 7 
	ld bc,04200h		;06ba	01 00 42 	. . B 
	ld a,08ch		;06bd	3e 8c 	> . 
	ld (hl),a			;06bf	77 	w 
l06c0h:
	bit 1,(hl)		;06c0	cb 4e 	. N 
	jr z,l06c0h		;06c2	28 fc 	( . 
	ld a,(de)			;06c4	1a 	. 
	ld (bc),a			;06c5	02 	. 
	inc c			;06c6	0c 	. 
	jr nz,l06c0h		;06c7	20 f7 	  . 
	jp 04200h		;06c9	c3 00 42 	. . B 
l06cch:
	ld bc,01a18h		;06cc	01 18 1a 	. . . 
	jp l19aeh		;06cf	c3 ae 19 	. . . 
l06d2h:
	jp l1c96h		;06d2	c3 96 1c 	. . . 
	jp l1d78h		;06d5	c3 78 1d 	. x . 
	jp l1c90h		;06d8	c3 90 1c 	. . . 
	jp l25d9h		;06db	c3 d9 25 	. . % 
	ret			;06de	c9 	. 
	nop			;06df	00 	. 
	nop			;06e0	00 	. 
	ret			;06e1	c9 	. 
	nop			;06e2	00 	. 
	nop			;06e3	00 	. 
	ei			;06e4	fb 	. 
	ret			;06e5	c9 	. 
	nop			;06e6	00 	. 
	ld bc,l03e3h		;06e7	01 e3 03 	. . . 
	nop			;06ea	00 	. 
	nop			;06eb	00 	. 
	nop			;06ec	00 	. 
	ld c,e			;06ed	4b 	K 
	ld c,c			;06ee	49 	I 
	rlca			;06ef	07 	. 
	ld e,b			;06f0	58 	X 
	inc b			;06f1	04 	. 
	nop			;06f2	00 	. 
	inc a			;06f3	3c 	< 
	nop			;06f4	00 	. 
	ld b,h			;06f5	44 	D 
	ld c,a			;06f6	4f 	O 
	ld b,08dh		;06f7	06 8d 	. . 
	dec b			;06f9	05 	. 
	ld b,e			;06fa	43 	C 
	nop			;06fb	00 	. 
	nop			;06fc	00 	. 
	ld d,b			;06fd	50 	P 
	ld d,d			;06fe	52 	R 
	jp 05000h		;06ff	c3 00 50 	. . P 
	rst 0			;0702	c7 	. 
	nop			;0703	00 	. 
	nop			;0704	00 	. 
	ld a,000h		;0705	3e 00 	> . 
	ret			;0707	c9 	. 
sub_0708h:
	ld hl,l1380h		;0708	21 80 13 	! . . 
sub_070bh:
	call sub_09c2h		;070b	cd c2 09 	. . . 
	jr l0716h		;070e	18 06 	. . 
sub_0710h:
	call sub_09c2h		;0710	cd c2 09 	. . . 
sub_0713h:
	call sub_0982h		;0713	cd 82 09 	. . . 
l0716h:
	ld a,b			;0716	78 	x 
	or a			;0717	b7 	. 
	ret z			;0718	c8 	. 
	ld a,(04124h)		;0719	3a 24 41 	: $ A 
	or a			;071c	b7 	. 
	jp z,l09b4h		;071d	ca b4 09 	. . . 
	sub b			;0720	90 	. 
	jr nc,l072fh		;0721	30 0c 	0 . 
	cpl			;0723	2f 	/ 
	inc a			;0724	3c 	< 
	ex de,hl			;0725	eb 	. 
	call sub_09a4h		;0726	cd a4 09 	. . . 
	ex de,hl			;0729	eb 	. 
	call l09b4h		;072a	cd b4 09 	. . . 
	pop bc			;072d	c1 	. 
	pop de			;072e	d1 	. 
l072fh:
	cp 019h		;072f	fe 19 	. . 
	ret nc			;0731	d0 	. 
	push af			;0732	f5 	. 
	call sub_09dfh		;0733	cd df 09 	. . . 
	ld h,a			;0736	67 	g 
	pop af			;0737	f1 	. 
	call sub_07d7h		;0738	cd d7 07 	. . . 
	or h			;073b	b4 	. 
	ld hl,04121h		;073c	21 21 41 	! ! A 
	jp p,l0754h		;073f	f2 54 07 	. T . 
	call sub_07b7h		;0742	cd b7 07 	. . . 
	jp nc,l0796h		;0745	d2 96 07 	. . . 
	inc hl			;0748	23 	# 
	inc (hl)			;0749	34 	4 
	jp z,l07b2h		;074a	ca b2 07 	. . . 
	ld l,001h		;074d	2e 01 	. . 
	call sub_07ebh		;074f	cd eb 07 	. . . 
	jr l0796h		;0752	18 42 	. B 
l0754h:
	xor a			;0754	af 	. 
	sub b			;0755	90 	. 
	ld b,a			;0756	47 	G 
	ld a,(hl)			;0757	7e 	~ 
	sbc a,e			;0758	9b 	. 
	ld e,a			;0759	5f 	_ 
	inc hl			;075a	23 	# 
	ld a,(hl)			;075b	7e 	~ 
	sbc a,d			;075c	9a 	. 
	ld d,a			;075d	57 	W 
	inc hl			;075e	23 	# 
	ld a,(hl)			;075f	7e 	~ 
	sbc a,c			;0760	99 	. 
	ld c,a			;0761	4f 	O 
l0762h:
	call c,sub_07c3h		;0762	dc c3 07 	. . . 
l0765h:
	ld l,b			;0765	68 	h 
	ld h,e			;0766	63 	c 
	xor a			;0767	af 	. 
l0768h:
	ld b,a			;0768	47 	G 
	ld a,c			;0769	79 	y 
	or a			;076a	b7 	. 
	jr nz,l0785h		;076b	20 18 	  . 
	ld c,d			;076d	4a 	J 
	ld d,h			;076e	54 	T 
	ld h,l			;076f	65 	e 
	ld l,a			;0770	6f 	o 
	ld a,b			;0771	78 	x 
	sub 008h		;0772	d6 08 	. . 
	cp 0e0h		;0774	fe e0 	. . 
	jr nz,l0768h		;0776	20 f0 	  . 
l0778h:
	xor a			;0778	af 	. 
l0779h:
	ld (04124h),a		;0779	32 24 41 	2 $ A 
	ret			;077c	c9 	. 
l077dh:
	dec b			;077d	05 	. 
	add hl,hl			;077e	29 	) 
	ld a,d			;077f	7a 	z 
	rla			;0780	17 	. 
	ld d,a			;0781	57 	W 
	ld a,c			;0782	79 	y 
	adc a,a			;0783	8f 	. 
	ld c,a			;0784	4f 	O 
l0785h:
	jp p,l077dh		;0785	f2 7d 07 	. } . 
	ld a,b			;0788	78 	x 
	ld e,h			;0789	5c 	\ 
	ld b,l			;078a	45 	E 
l078bh:
	or a			;078b	b7 	. 
	jr z,l0796h		;078c	28 08 	( . 
	ld hl,04124h		;078e	21 24 41 	! $ A 
	add a,(hl)			;0791	86 	. 
	ld (hl),a			;0792	77 	w 
	jr nc,l0778h		;0793	30 e3 	0 . 
	ret z			;0795	c8 	. 
l0796h:
	ld a,b			;0796	78 	x 
l0797h:
	ld hl,04124h		;0797	21 24 41 	! $ A 
	or a			;079a	b7 	. 
	call m,sub_07a8h		;079b	fc a8 07 	. . . 
	ld b,(hl)			;079e	46 	F 
	inc hl			;079f	23 	# 
	ld a,(hl)			;07a0	7e 	~ 
	and 080h		;07a1	e6 80 	. . 
	xor c			;07a3	a9 	. 
	ld c,a			;07a4	4f 	O 
	jp l09b4h		;07a5	c3 b4 09 	. . . 
sub_07a8h:
	inc e			;07a8	1c 	. 
	ret nz			;07a9	c0 	. 
	inc d			;07aa	14 	. 
	ret nz			;07ab	c0 	. 
	inc c			;07ac	0c 	. 
	ret nz			;07ad	c0 	. 
	ld c,080h		;07ae	0e 80 	. . 
	inc (hl)			;07b0	34 	4 
	ret nz			;07b1	c0 	. 
l07b2h:
	ld e,00ah		;07b2	1e 0a 	. . 
	jp l19a2h		;07b4	c3 a2 19 	. . . 
sub_07b7h:
	ld a,(hl)			;07b7	7e 	~ 
	add a,e			;07b8	83 	. 
	ld e,a			;07b9	5f 	_ 
	inc hl			;07ba	23 	# 
	ld a,(hl)			;07bb	7e 	~ 
	adc a,d			;07bc	8a 	. 
	ld d,a			;07bd	57 	W 
	inc hl			;07be	23 	# 
	ld a,(hl)			;07bf	7e 	~ 
	adc a,c			;07c0	89 	. 
	ld c,a			;07c1	4f 	O 
	ret			;07c2	c9 	. 
sub_07c3h:
	ld hl,04125h		;07c3	21 25 41 	! % A 
	ld a,(hl)			;07c6	7e 	~ 
	cpl			;07c7	2f 	/ 
	ld (hl),a			;07c8	77 	w 
	xor a			;07c9	af 	. 
	ld l,a			;07ca	6f 	o 
	sub b			;07cb	90 	. 
	ld b,a			;07cc	47 	G 
	ld a,l			;07cd	7d 	} 
	sbc a,e			;07ce	9b 	. 
	ld e,a			;07cf	5f 	_ 
	ld a,l			;07d0	7d 	} 
	sbc a,d			;07d1	9a 	. 
	ld d,a			;07d2	57 	W 
	ld a,l			;07d3	7d 	} 
	sbc a,c			;07d4	99 	. 
	ld c,a			;07d5	4f 	O 
	ret			;07d6	c9 	. 
sub_07d7h:
	ld b,000h		;07d7	06 00 	. . 
l07d9h:
	sub 008h		;07d9	d6 08 	. . 
	jr c,l07e4h		;07db	38 07 	8 . 
	ld b,e			;07dd	43 	C 
	ld e,d			;07de	5a 	Z 
	ld d,c			;07df	51 	Q 
	ld c,000h		;07e0	0e 00 	. . 
	jr l07d9h		;07e2	18 f5 	. . 
l07e4h:
	add a,009h		;07e4	c6 09 	. . 
	ld l,a			;07e6	6f 	o 
l07e7h:
	xor a			;07e7	af 	. 
	dec l			;07e8	2d 	- 
	ret z			;07e9	c8 	. 
	ld a,c			;07ea	79 	y 
sub_07ebh:
	rra			;07eb	1f 	. 
	ld c,a			;07ec	4f 	O 
	ld a,d			;07ed	7a 	z 
	rra			;07ee	1f 	. 
	ld d,a			;07ef	57 	W 
	ld a,e			;07f0	7b 	{ 
	rra			;07f1	1f 	. 
	ld e,a			;07f2	5f 	_ 
	ld a,b			;07f3	78 	x 
	rra			;07f4	1f 	. 
	ld b,a			;07f5	47 	G 
	jr l07e7h		;07f6	18 ef 	. . 
l07f8h:
	nop			;07f8	00 	. 
	nop			;07f9	00 	. 
	nop			;07fa	00 	. 
	add a,c			;07fb	81 	. 
l07fch:
	inc bc			;07fc	03 	. 
	xor d			;07fd	aa 	. 
	ld d,(hl)			;07fe	56 	V 
	add hl,de			;07ff	19 	. 
l0800h:
	add a,b			;0800	80 	. 
	pop af			;0801	f1 	. 
	ld (08076h),hl		;0802	22 76 80 	" v . 
	ld b,l			;0805	45 	E 
	xor d			;0806	aa 	. 
	jr c,l078bh		;0807	38 82 	8 . 
sub_0809h:
	call sub_0955h		;0809	cd 55 09 	. U . 
	or a			;080c	b7 	. 
	jp pe,l1e4ah		;080d	ea 4a 1e 	. J . 
	ld hl,04124h		;0810	21 24 41 	! $ A 
	ld a,(hl)			;0813	7e 	~ 
	ld bc,08035h		;0814	01 35 80 	. 5 . 
	ld de,l04f1h+2		;0817	11 f3 04 	. . . 
	sub b			;081a	90 	. 
	push af			;081b	f5 	. 
	ld (hl),b			;081c	70 	p 
	push de			;081d	d5 	. 
l081eh:
	push bc			;081e	c5 	. 
	call l0716h		;081f	cd 16 07 	. . . 
	pop bc			;0822	c1 	. 
	pop de			;0823	d1 	. 
	inc b			;0824	04 	. 
	call sub_08a2h		;0825	cd a2 08 	. . . 
	ld hl,l07f8h		;0828	21 f8 07 	! . . 
	call sub_0710h		;082b	cd 10 07 	. . . 
	ld hl,l07fch		;082e	21 fc 07 	! . . 
	call sub_149ah		;0831	cd 9a 14 	. . . 
	ld bc,08080h		;0834	01 80 80 	. . . 
	ld de,l0000h		;0837	11 00 00 	. . . 
	call l0716h		;083a	cd 16 07 	. . . 
	pop af			;083d	f1 	. 
	call sub_0f89h		;083e	cd 89 0f 	. . . 
sub_0841h:
	ld bc,08031h		;0841	01 31 80 	. 1 . 
	ld de,07218h		;0844	11 18 72 	. . r 
l0847h:
	call sub_0955h		;0847	cd 55 09 	. U . 
	ret z			;084a	c8 	. 
	ld l,000h		;084b	2e 00 	. . 
	call sub_0914h		;084d	cd 14 09 	. . . 
	ld a,c			;0850	79 	y 
	ld (0414fh),a		;0851	32 4f 41 	2 O A 
	ex de,hl			;0854	eb 	. 
	ld (04150h),hl		;0855	22 50 41 	" P A 
	ld bc,l0000h		;0858	01 00 00 	. . . 
	ld d,b			;085b	50 	P 
	ld e,b			;085c	58 	X 
	ld hl,l0765h		;085d	21 65 07 	! e . 
	push hl			;0860	e5 	. 
	ld hl,l0869h		;0861	21 69 08 	! i . 
	push hl			;0864	e5 	. 
	push hl			;0865	e5 	. 
	ld hl,04121h		;0866	21 21 41 	! ! A 
l0869h:
	ld a,(hl)			;0869	7e 	~ 
	inc hl			;086a	23 	# 
	or a			;086b	b7 	. 
	jr z,l0892h		;086c	28 24 	( $ 
	push hl			;086e	e5 	. 
	ld l,008h		;086f	2e 08 	. . 
l0871h:
	rra			;0871	1f 	. 
	ld h,a			;0872	67 	g 
	ld a,c			;0873	79 	y 
	jr nc,l0881h		;0874	30 0b 	0 . 
	push hl			;0876	e5 	. 
	ld hl,(04150h)		;0877	2a 50 41 	* P A 
	add hl,de			;087a	19 	. 
	ex de,hl			;087b	eb 	. 
	pop hl			;087c	e1 	. 
	ld a,(0414fh)		;087d	3a 4f 41 	: O A 
	adc a,c			;0880	89 	. 
l0881h:
	rra			;0881	1f 	. 
	ld c,a			;0882	4f 	O 
	ld a,d			;0883	7a 	z 
	rra			;0884	1f 	. 
	ld d,a			;0885	57 	W 
	ld a,e			;0886	7b 	{ 
	rra			;0887	1f 	. 
	ld e,a			;0888	5f 	_ 
	ld a,b			;0889	78 	x 
	rra			;088a	1f 	. 
	ld b,a			;088b	47 	G 
	dec l			;088c	2d 	- 
	ld a,h			;088d	7c 	| 
	jr nz,l0871h		;088e	20 e1 	  . 
l0890h:
	pop hl			;0890	e1 	. 
	ret			;0891	c9 	. 
l0892h:
	ld b,e			;0892	43 	C 
	ld e,d			;0893	5a 	Z 
	ld d,c			;0894	51 	Q 
	ld c,a			;0895	4f 	O 
	ret			;0896	c9 	. 
sub_0897h:
	call sub_09a4h		;0897	cd a4 09 	. . . 
	ld hl,l0dd8h		;089a	21 d8 0d 	! . . 
	call sub_09b1h		;089d	cd b1 09 	. . . 
l08a0h:
	pop bc			;08a0	c1 	. 
	pop de			;08a1	d1 	. 
sub_08a2h:
	call sub_0955h		;08a2	cd 55 09 	. U . 
	jp z,0199ah		;08a5	ca 9a 19 	. . . 
	ld l,0ffh		;08a8	2e ff 	. . 
	call sub_0914h		;08aa	cd 14 09 	. . . 
	inc (hl)			;08ad	34 	4 
	inc (hl)			;08ae	34 	4 
	dec hl			;08af	2b 	+ 
	ld a,(hl)			;08b0	7e 	~ 
	ld (04089h),a		;08b1	32 89 40 	2 . @ 
	dec hl			;08b4	2b 	+ 
	ld a,(hl)			;08b5	7e 	~ 
	ld (04085h),a		;08b6	32 85 40 	2 . @ 
	dec hl			;08b9	2b 	+ 
	ld a,(hl)			;08ba	7e 	~ 
	ld (04081h),a		;08bb	32 81 40 	2 . @ 
	ld b,c			;08be	41 	A 
	ex de,hl			;08bf	eb 	. 
	xor a			;08c0	af 	. 
	ld c,a			;08c1	4f 	O 
	ld d,a			;08c2	57 	W 
	ld e,a			;08c3	5f 	_ 
	ld (0408ch),a		;08c4	32 8c 40 	2 . @ 
l08c7h:
	push hl			;08c7	e5 	. 
	push bc			;08c8	c5 	. 
	ld a,l			;08c9	7d 	} 
	call 04080h		;08ca	cd 80 40 	. . @ 
	sbc a,000h		;08cd	de 00 	. . 
	ccf			;08cf	3f 	? 
	jr nc,$+9		;08d0	30 07 	0 . 
	ld (0408ch),a		;08d2	32 8c 40 	2 . @ 
	pop af			;08d5	f1 	. 
	pop af			;08d6	f1 	. 
	scf			;08d7	37 	7 
	jp nc,0e1c1h		;08d8	d2 c1 e1 	. . . 
	ld a,c			;08db	79 	y 
	inc a			;08dc	3c 	< 
	dec a			;08dd	3d 	= 
	rra			;08de	1f 	. 
	jp m,l0797h		;08df	fa 97 07 	. . . 
	rla			;08e2	17 	. 
	ld a,e			;08e3	7b 	{ 
	rla			;08e4	17 	. 
	ld e,a			;08e5	5f 	_ 
	ld a,d			;08e6	7a 	z 
	rla			;08e7	17 	. 
	ld d,a			;08e8	57 	W 
	ld a,c			;08e9	79 	y 
	rla			;08ea	17 	. 
	ld c,a			;08eb	4f 	O 
	add hl,hl			;08ec	29 	) 
	ld a,b			;08ed	78 	x 
	rla			;08ee	17 	. 
	ld b,a			;08ef	47 	G 
	ld a,(0408ch)		;08f0	3a 8c 40 	: . @ 
	rla			;08f3	17 	. 
	ld (0408ch),a		;08f4	32 8c 40 	2 . @ 
	ld a,c			;08f7	79 	y 
	or d			;08f8	b2 	. 
	or e			;08f9	b3 	. 
	jr nz,l08c7h		;08fa	20 cb 	  . 
	push hl			;08fc	e5 	. 
	ld hl,04124h		;08fd	21 24 41 	! $ A 
	dec (hl)			;0900	35 	5 
	pop hl			;0901	e1 	. 
	jr nz,l08c7h		;0902	20 c3 	  . 
	jp l07b2h		;0904	c3 b2 07 	. . . 
sub_0907h:
	ld a,0ffh		;0907	3e ff 	> . 
	ld l,0afh		;0909	2e af 	. . 
	ld hl,0412dh		;090b	21 2d 41 	! - A 
	ld c,(hl)			;090e	4e 	N 
	inc hl			;090f	23 	# 
	xor (hl)			;0910	ae 	. 
	ld b,a			;0911	47 	G 
	ld l,000h		;0912	2e 00 	. . 
sub_0914h:
	ld a,b			;0914	78 	x 
	or a			;0915	b7 	. 
	jr z,l0937h		;0916	28 1f 	( . 
	ld a,l			;0918	7d 	} 
	ld hl,04124h		;0919	21 24 41 	! $ A 
	xor (hl)			;091c	ae 	. 
	add a,b			;091d	80 	. 
	ld b,a			;091e	47 	G 
	rra			;091f	1f 	. 
	xor b			;0920	a8 	. 
	ld a,b			;0921	78 	x 
	jp p,l0936h		;0922	f2 36 09 	. 6 . 
	add a,080h		;0925	c6 80 	. . 
	ld (hl),a			;0927	77 	w 
	jp z,l0890h		;0928	ca 90 08 	. . . 
	call sub_09dfh		;092b	cd df 09 	. . . 
	ld (hl),a			;092e	77 	w 
sub_092fh:
	dec hl			;092f	2b 	+ 
	ret			;0930	c9 	. 
l0931h:
	call sub_0955h		;0931	cd 55 09 	. U . 
	cpl			;0934	2f 	/ 
	pop hl			;0935	e1 	. 
l0936h:
	or a			;0936	b7 	. 
l0937h:
	pop hl			;0937	e1 	. 
	jp p,l0778h		;0938	f2 78 07 	. x . 
	jp l07b2h		;093b	c3 b2 07 	. . . 
sub_093eh:
	call sub_09bfh		;093e	cd bf 09 	. . . 
	ld a,b			;0941	78 	x 
	or a			;0942	b7 	. 
	ret z			;0943	c8 	. 
	add a,002h		;0944	c6 02 	. . 
	jp c,l07b2h		;0946	da b2 07 	. . . 
	ld b,a			;0949	47 	G 
	call l0716h		;094a	cd 16 07 	. . . 
	ld hl,04124h		;094d	21 24 41 	! $ A 
	inc (hl)			;0950	34 	4 
	ret nz			;0951	c0 	. 
	jp l07b2h		;0952	c3 b2 07 	. . . 
sub_0955h:
	ld a,(04124h)		;0955	3a 24 41 	: $ A 
	or a			;0958	b7 	. 
	ret z			;0959	c8 	. 
	ld a,(04123h)		;095a	3a 23 41 	: # A 
	cp 02fh		;095d	fe 2f 	. / 
l095fh:
	rla			;095f	17 	. 
l0960h:
	sbc a,a			;0960	9f 	. 
	ret nz			;0961	c0 	. 
	inc a			;0962	3c 	< 
	ret			;0963	c9 	. 
sub_0964h:
	ld b,088h		;0964	06 88 	. . 
	ld de,l0000h		;0966	11 00 00 	. . . 
l0969h:
	ld hl,04124h		;0969	21 24 41 	! $ A 
	ld c,a			;096c	4f 	O 
	ld (hl),b			;096d	70 	p 
	ld b,000h		;096e	06 00 	. . 
	inc hl			;0970	23 	# 
	ld (hl),080h		;0971	36 80 	6 . 
	rla			;0973	17 	. 
	jp l0762h		;0974	c3 62 07 	. b . 
	call sub_0994h		;0977	cd 94 09 	. . . 
	ret p			;097a	f0 	. 
l097bh:
	rst 20h			;097b	e7 	. 
	jp m,l0c5bh		;097c	fa 5b 0c 	. [ . 
	jp z,l0af6h		;097f	ca f6 0a 	. . . 
sub_0982h:
	ld hl,04123h		;0982	21 23 41 	! # A 
	ld a,(hl)			;0985	7e 	~ 
	xor 080h		;0986	ee 80 	. . 
	ld (hl),a			;0988	77 	w 
	ret			;0989	c9 	. 
	call sub_0994h		;098a	cd 94 09 	. . . 
sub_098dh:
	ld l,a			;098d	6f 	o 
	rla			;098e	17 	. 
	sbc a,a			;098f	9f 	. 
	ld h,a			;0990	67 	g 
	jp l0a9ah		;0991	c3 9a 0a 	. . . 
sub_0994h:
	rst 20h			;0994	e7 	. 
	jp z,l0af6h		;0995	ca f6 0a 	. . . 
	jp p,sub_0955h		;0998	f2 55 09 	. U . 
	ld hl,(04121h)		;099b	2a 21 41 	* ! A 
sub_099eh:
	ld a,h			;099e	7c 	| 
	or l			;099f	b5 	. 
	ret z			;09a0	c8 	. 
	ld a,h			;09a1	7c 	| 
	jr l095fh		;09a2	18 bb 	. . 
sub_09a4h:
	ex de,hl			;09a4	eb 	. 
	ld hl,(04121h)		;09a5	2a 21 41 	* ! A 
	ex (sp),hl			;09a8	e3 	. 
	push hl			;09a9	e5 	. 
	ld hl,(04123h)		;09aa	2a 23 41 	* # A 
	ex (sp),hl			;09ad	e3 	. 
	push hl			;09ae	e5 	. 
	ex de,hl			;09af	eb 	. 
	ret			;09b0	c9 	. 
sub_09b1h:
	call sub_09c2h		;09b1	cd c2 09 	. . . 
l09b4h:
	ex de,hl			;09b4	eb 	. 
	ld (04121h),hl		;09b5	22 21 41 	" ! A 
	ld h,b			;09b8	60 	` 
	ld l,c			;09b9	69 	i 
	ld (04123h),hl		;09ba	22 23 41 	" # A 
	ex de,hl			;09bd	eb 	. 
	ret			;09be	c9 	. 
sub_09bfh:
	ld hl,04121h		;09bf	21 21 41 	! ! A 
sub_09c2h:
	ld e,(hl)			;09c2	5e 	^ 
	inc hl			;09c3	23 	# 
sub_09c4h:
	ld d,(hl)			;09c4	56 	V 
	inc hl			;09c5	23 	# 
	ld c,(hl)			;09c6	4e 	N 
	inc hl			;09c7	23 	# 
	ld b,(hl)			;09c8	46 	F 
sub_09c9h:
	inc hl			;09c9	23 	# 
	ret			;09ca	c9 	. 
sub_09cbh:
	ld de,04121h		;09cb	11 21 41 	. ! A 
	ld b,004h		;09ce	06 04 	. . 
	jr l09d7h		;09d0	18 05 	. . 
l09d2h:
	ex de,hl			;09d2	eb 	. 
l09d3h:
	ld a,(040afh)		;09d3	3a af 40 	: . @ 
	ld b,a			;09d6	47 	G 
l09d7h:
	ld a,(de)			;09d7	1a 	. 
	ld (hl),a			;09d8	77 	w 
	inc de			;09d9	13 	. 
	inc hl			;09da	23 	# 
	dec b			;09db	05 	. 
	jr nz,l09d7h		;09dc	20 f9 	  . 
	ret			;09de	c9 	. 
sub_09dfh:
	ld hl,04123h		;09df	21 23 41 	! # A 
	ld a,(hl)			;09e2	7e 	~ 
	rlca			;09e3	07 	. 
	scf			;09e4	37 	7 
	rra			;09e5	1f 	. 
	ld (hl),a			;09e6	77 	w 
	ccf			;09e7	3f 	? 
	rra			;09e8	1f 	. 
	inc hl			;09e9	23 	# 
	inc hl			;09ea	23 	# 
	ld (hl),a			;09eb	77 	w 
	ld a,c			;09ec	79 	y 
	rlca			;09ed	07 	. 
	scf			;09ee	37 	7 
	rra			;09ef	1f 	. 
	ld c,a			;09f0	4f 	O 
	rra			;09f1	1f 	. 
	xor (hl)			;09f2	ae 	. 
	ret			;09f3	c9 	. 
l09f4h:
	ld hl,04127h		;09f4	21 27 41 	! ' A 
sub_09f7h:
	ld de,l09d2h		;09f7	11 d2 09 	. . . 
	jr l0a02h		;09fa	18 06 	. . 
sub_09fch:
	ld hl,04127h		;09fc	21 27 41 	! ' A 
	ld de,l09d3h		;09ff	11 d3 09 	. . . 
l0a02h:
	push de			;0a02	d5 	. 
sub_0a03h:
	ld de,04121h		;0a03	11 21 41 	. ! A 
	rst 20h			;0a06	e7 	. 
	ret c			;0a07	d8 	. 
	ld de,0411dh		;0a08	11 1d 41 	. . A 
	ret			;0a0b	c9 	. 
sub_0a0ch:
	ld a,b			;0a0c	78 	x 
	or a			;0a0d	b7 	. 
	jp z,sub_0955h		;0a0e	ca 55 09 	. U . 
	ld hl,0095eh		;0a11	21 5e 09 	! ^ . 
	push hl			;0a14	e5 	. 
	call sub_0955h		;0a15	cd 55 09 	. U . 
	ld a,c			;0a18	79 	y 
	ret z			;0a19	c8 	. 
	ld hl,04123h		;0a1a	21 23 41 	! # A 
	xor (hl)			;0a1d	ae 	. 
	ld a,c			;0a1e	79 	y 
	ret m			;0a1f	f8 	. 
	call sub_0a26h		;0a20	cd 26 0a 	. & . 
l0a23h:
	rra			;0a23	1f 	. 
	xor c			;0a24	a9 	. 
	ret			;0a25	c9 	. 
sub_0a26h:
	inc hl			;0a26	23 	# 
	ld a,b			;0a27	78 	x 
	cp (hl)			;0a28	be 	. 
	ret nz			;0a29	c0 	. 
	dec hl			;0a2a	2b 	+ 
	ld a,c			;0a2b	79 	y 
	cp (hl)			;0a2c	be 	. 
	ret nz			;0a2d	c0 	. 
	dec hl			;0a2e	2b 	+ 
	ld a,d			;0a2f	7a 	z 
	cp (hl)			;0a30	be 	. 
	ret nz			;0a31	c0 	. 
	dec hl			;0a32	2b 	+ 
	ld a,e			;0a33	7b 	{ 
	sub (hl)			;0a34	96 	. 
	ret nz			;0a35	c0 	. 
	pop hl			;0a36	e1 	. 
	pop hl			;0a37	e1 	. 
	ret			;0a38	c9 	. 
sub_0a39h:
	ld a,d			;0a39	7a 	z 
	xor h			;0a3a	ac 	. 
	ld a,h			;0a3b	7c 	| 
	jp m,l095fh		;0a3c	fa 5f 09 	. _ . 
	cp d			;0a3f	ba 	. 
	jp nz,l0960h		;0a40	c2 60 09 	. ` . 
	ld a,l			;0a43	7d 	} 
	sub e			;0a44	93 	. 
	jp nz,l0960h		;0a45	c2 60 09 	. ` . 
	ret			;0a48	c9 	. 
sub_0a49h:
	ld hl,04127h		;0a49	21 27 41 	! ' A 
	call l09d3h		;0a4c	cd d3 09 	. . . 
sub_0a4fh:
	ld de,0412eh		;0a4f	11 2e 41 	. . A 
	ld a,(de)			;0a52	1a 	. 
	or a			;0a53	b7 	. 
	jp z,sub_0955h		;0a54	ca 55 09 	. U . 
	ld hl,0095eh		;0a57	21 5e 09 	! ^ . 
	push hl			;0a5a	e5 	. 
	call sub_0955h		;0a5b	cd 55 09 	. U . 
	dec de			;0a5e	1b 	. 
	ld a,(de)			;0a5f	1a 	. 
	ld c,a			;0a60	4f 	O 
	ret z			;0a61	c8 	. 
	ld hl,04123h		;0a62	21 23 41 	! # A 
	xor (hl)			;0a65	ae 	. 
	ld a,c			;0a66	79 	y 
	ret m			;0a67	f8 	. 
	inc de			;0a68	13 	. 
	inc hl			;0a69	23 	# 
	ld b,008h		;0a6a	06 08 	. . 
l0a6ch:
	ld a,(de)			;0a6c	1a 	. 
	sub (hl)			;0a6d	96 	. 
	jp nz,l0a23h		;0a6e	c2 23 0a 	. # . 
	dec de			;0a71	1b 	. 
	dec hl			;0a72	2b 	+ 
	dec b			;0a73	05 	. 
	jr nz,l0a6ch		;0a74	20 f6 	  . 
	pop bc			;0a76	c1 	. 
	ret			;0a77	c9 	. 
	call sub_0a4fh		;0a78	cd 4f 0a 	. O . 
	jp nz,0095eh		;0a7b	c2 5e 09 	. ^ . 
	ret			;0a7e	c9 	. 
l0a7fh:
	rst 20h			;0a7f	e7 	. 
	ld hl,(04121h)		;0a80	2a 21 41 	* ! A 
	ret m			;0a83	f8 	. 
	jp z,l0af6h		;0a84	ca f6 0a 	. . . 
	call nc,sub_0ab9h		;0a87	d4 b9 0a 	. . . 
	ld hl,l07b2h		;0a8a	21 b2 07 	! . . 
	push hl			;0a8d	e5 	. 
sub_0a8eh:
	ld a,(04124h)		;0a8e	3a 24 41 	: $ A 
	cp 090h		;0a91	fe 90 	. . 
	jr nc,l0aa3h		;0a93	30 0e 	0 . 
	call sub_0afbh		;0a95	cd fb 0a 	. . . 
	ex de,hl			;0a98	eb 	. 
l0a99h:
	pop de			;0a99	d1 	. 
l0a9ah:
	ld (04121h),hl		;0a9a	22 21 41 	" ! A 
	ld a,002h		;0a9d	3e 02 	> . 
l0a9fh:
	ld (040afh),a		;0a9f	32 af 40 	2 . @ 
	ret			;0aa2	c9 	. 
l0aa3h:
	ld bc,09080h		;0aa3	01 80 90 	. . . 
	ld de,l0000h		;0aa6	11 00 00 	. . . 
	call sub_0a0ch		;0aa9	cd 0c 0a 	. . . 
	ret nz			;0aac	c0 	. 
	ld h,c			;0aad	61 	a 
	ld l,d			;0aae	6a 	j 
	jr l0a99h		;0aaf	18 e8 	. . 
sub_0ab1h:
	rst 20h			;0ab1	e7 	. 
	ret po			;0ab2	e0 	. 
	jp m,l0acch		;0ab3	fa cc 0a 	. . . 
	jp z,l0af6h		;0ab6	ca f6 0a 	. . . 
sub_0ab9h:
	call sub_09bfh		;0ab9	cd bf 09 	. . . 
	call 00aefh		;0abc	cd ef 0a 	. . . 
	ld a,b			;0abf	78 	x 
	or a			;0ac0	b7 	. 
	ret z			;0ac1	c8 	. 
	call sub_09dfh		;0ac2	cd df 09 	. . . 
	ld hl,04120h		;0ac5	21 20 41 	!   A 
	ld b,(hl)			;0ac8	46 	F 
	jp l0796h		;0ac9	c3 96 07 	. . . 
l0acch:
	ld hl,(04121h)		;0acc	2a 21 41 	* ! A 
sub_0acfh:
	call 00aefh		;0acf	cd ef 0a 	. . . 
	ld a,h			;0ad2	7c 	| 
	ld d,l			;0ad3	55 	U 
	ld e,000h		;0ad4	1e 00 	. . 
	ld b,090h		;0ad6	06 90 	. . 
	jp l0969h		;0ad8	c3 69 09 	. i . 
sub_0adbh:
	rst 20h			;0adb	e7 	. 
	ret nc			;0adc	d0 	. 
	jp z,l0af6h		;0add	ca f6 0a 	. . . 
	call m,l0acch		;0ae0	fc cc 0a 	. . . 
sub_0ae3h:
	ld hl,l0000h		;0ae3	21 00 00 	! . . 
	ld (0411dh),hl		;0ae6	22 1d 41 	" . A 
	ld (0411fh),hl		;0ae9	22 1f 41 	" . A 
sub_0aech:
	ld a,008h		;0aec	3e 08 	> . 
	ld bc,l043eh		;0aee	01 3e 04 	. > . 
	jp l0a9fh		;0af1	c3 9f 0a 	. . . 
sub_0af4h:
	rst 20h			;0af4	e7 	. 
	ret z			;0af5	c8 	. 
l0af6h:
	ld e,018h		;0af6	1e 18 	. . 
	jp l19a2h		;0af8	c3 a2 19 	. . . 
sub_0afbh:
	ld b,a			;0afb	47 	G 
	ld c,a			;0afc	4f 	O 
	ld d,a			;0afd	57 	W 
	ld e,a			;0afe	5f 	_ 
	or a			;0aff	b7 	. 
	ret z			;0b00	c8 	. 
	push hl			;0b01	e5 	. 
	call sub_09bfh		;0b02	cd bf 09 	. . . 
	call sub_09dfh		;0b05	cd df 09 	. . . 
	xor (hl)			;0b08	ae 	. 
	ld h,a			;0b09	67 	g 
	call m,sub_0b1fh		;0b0a	fc 1f 0b 	. . . 
	ld a,098h		;0b0d	3e 98 	> . 
	sub b			;0b0f	90 	. 
	call sub_07d7h		;0b10	cd d7 07 	. . . 
	ld a,h			;0b13	7c 	| 
	rla			;0b14	17 	. 
	call c,sub_07a8h		;0b15	dc a8 07 	. . . 
	ld b,000h		;0b18	06 00 	. . 
	call c,sub_07c3h		;0b1a	dc c3 07 	. . . 
	pop hl			;0b1d	e1 	. 
	ret			;0b1e	c9 	. 
sub_0b1fh:
	dec de			;0b1f	1b 	. 
	ld a,d			;0b20	7a 	z 
	and e			;0b21	a3 	. 
	inc a			;0b22	3c 	< 
	ret nz			;0b23	c0 	. 
sub_0b24h:
	dec bc			;0b24	0b 	. 
	ret			;0b25	c9 	. 
	rst 20h			;0b26	e7 	. 
	ret m			;0b27	f8 	. 
	call sub_0955h		;0b28	cd 55 09 	. U . 
	jp p,l0b37h		;0b2b	f2 37 0b 	. 7 . 
	call sub_0982h		;0b2e	cd 82 09 	. . . 
	call l0b37h		;0b31	cd 37 0b 	. 7 . 
	jp l097bh		;0b34	c3 7b 09 	. { . 
l0b37h:
	rst 20h			;0b37	e7 	. 
	ret m			;0b38	f8 	. 
	jr nc,l0b59h		;0b39	30 1e 	0 . 
	jr z,l0af6h		;0b3b	28 b9 	( . 
	call sub_0a8eh		;0b3d	cd 8e 0a 	. . . 
sub_0b40h:
	ld hl,04124h		;0b40	21 24 41 	! $ A 
	ld a,(hl)			;0b43	7e 	~ 
	cp 098h		;0b44	fe 98 	. . 
	ld a,(04121h)		;0b46	3a 21 41 	: ! A 
	ret nc			;0b49	d0 	. 
	ld a,(hl)			;0b4a	7e 	~ 
	call sub_0afbh		;0b4b	cd fb 0a 	. . . 
	ld (hl),098h		;0b4e	36 98 	6 . 
	ld a,e			;0b50	7b 	{ 
	push af			;0b51	f5 	. 
	ld a,c			;0b52	79 	y 
	rla			;0b53	17 	. 
	call l0762h		;0b54	cd 62 07 	. b . 
	pop af			;0b57	f1 	. 
	ret			;0b58	c9 	. 
l0b59h:
	ld hl,04124h		;0b59	21 24 41 	! $ A 
	ld a,(hl)			;0b5c	7e 	~ 
	cp 090h		;0b5d	fe 90 	. . 
	jp c,l0a7fh		;0b5f	da 7f 0a 	.  . 
	jr nz,l0b78h		;0b62	20 14 	  . 
	ld c,a			;0b64	4f 	O 
	dec hl			;0b65	2b 	+ 
	ld a,(hl)			;0b66	7e 	~ 
	xor 080h		;0b67	ee 80 	. . 
	ld b,006h		;0b69	06 06 	. . 
l0b6bh:
	dec hl			;0b6b	2b 	+ 
	or (hl)			;0b6c	b6 	. 
	dec b			;0b6d	05 	. 
	jr nz,l0b6bh		;0b6e	20 fb 	  . 
	or a			;0b70	b7 	. 
	ld hl,08000h		;0b71	21 00 80 	! . . 
	jp z,l0a9ah		;0b74	ca 9a 0a 	. . . 
	ld a,c			;0b77	79 	y 
l0b78h:
	cp 0b8h		;0b78	fe b8 	. . 
	ret nc			;0b7a	d0 	. 
sub_0b7bh:
	push af			;0b7b	f5 	. 
	call sub_09bfh		;0b7c	cd bf 09 	. . . 
	call sub_09dfh		;0b7f	cd df 09 	. . . 
	xor (hl)			;0b82	ae 	. 
	dec hl			;0b83	2b 	+ 
	ld (hl),0b8h		;0b84	36 b8 	6 . 
	push af			;0b86	f5 	. 
	call m,sub_0ba0h		;0b87	fc a0 0b 	. . . 
	ld hl,04123h		;0b8a	21 23 41 	! # A 
	ld a,0b8h		;0b8d	3e b8 	> . 
	sub b			;0b8f	90 	. 
	call sub_0d69h		;0b90	cd 69 0d 	. i . 
	pop af			;0b93	f1 	. 
	call m,sub_0d20h		;0b94	fc 20 0d 	.   . 
	xor a			;0b97	af 	. 
	ld (0411ch),a		;0b98	32 1c 41 	2 . A 
	pop af			;0b9b	f1 	. 
	ret nc			;0b9c	d0 	. 
	jp l0cd8h		;0b9d	c3 d8 0c 	. . . 
sub_0ba0h:
	ld hl,0411dh		;0ba0	21 1d 41 	! . A 
l0ba3h:
	ld a,(hl)			;0ba3	7e 	~ 
	dec (hl)			;0ba4	35 	5 
	or a			;0ba5	b7 	. 
	inc hl			;0ba6	23 	# 
	jr z,l0ba3h		;0ba7	28 fa 	( . 
	ret			;0ba9	c9 	. 
sub_0baah:
	push hl			;0baa	e5 	. 
	ld hl,l0000h		;0bab	21 00 00 	! . . 
	ld a,b			;0bae	78 	x 
	or c			;0baf	b1 	. 
	jr z,l0bc4h		;0bb0	28 12 	( . 
	ld a,010h		;0bb2	3e 10 	> . 
l0bb4h:
	add hl,hl			;0bb4	29 	) 
	jp c,l273dh		;0bb5	da 3d 27 	. = ' 
	ex de,hl			;0bb8	eb 	. 
	add hl,hl			;0bb9	29 	) 
	ex de,hl			;0bba	eb 	. 
	jr nc,l0bc1h		;0bbb	30 04 	0 . 
	add hl,bc			;0bbd	09 	. 
	jp c,l273dh		;0bbe	da 3d 27 	. = ' 
l0bc1h:
	dec a			;0bc1	3d 	= 
	jr nz,l0bb4h		;0bc2	20 f0 	  . 
l0bc4h:
	ex de,hl			;0bc4	eb 	. 
	pop hl			;0bc5	e1 	. 
	ret			;0bc6	c9 	. 
	ld a,h			;0bc7	7c 	| 
	rla			;0bc8	17 	. 
	sbc a,a			;0bc9	9f 	. 
	ld b,a			;0bca	47 	G 
	call sub_0c51h		;0bcb	cd 51 0c 	. Q . 
	ld a,c			;0bce	79 	y 
	sbc a,b			;0bcf	98 	. 
	jr l0bd5h		;0bd0	18 03 	. . 
sub_0bd2h:
	ld a,h			;0bd2	7c 	| 
	rla			;0bd3	17 	. 
	sbc a,a			;0bd4	9f 	. 
l0bd5h:
	ld b,a			;0bd5	47 	G 
	push hl			;0bd6	e5 	. 
	ld a,d			;0bd7	7a 	z 
	rla			;0bd8	17 	. 
	sbc a,a			;0bd9	9f 	. 
	add hl,de			;0bda	19 	. 
	adc a,b			;0bdb	88 	. 
	rrca			;0bdc	0f 	. 
	xor h			;0bdd	ac 	. 
	jp p,l0a99h		;0bde	f2 99 0a 	. . . 
	push bc			;0be1	c5 	. 
	ex de,hl			;0be2	eb 	. 
	call sub_0acfh		;0be3	cd cf 0a 	. . . 
	pop af			;0be6	f1 	. 
	pop hl			;0be7	e1 	. 
	call sub_09a4h		;0be8	cd a4 09 	. . . 
	ex de,hl			;0beb	eb 	. 
	call sub_0c6bh		;0bec	cd 6b 0c 	. k . 
	jp l0f8fh		;0bef	c3 8f 0f 	. . . 
	ld a,h			;0bf2	7c 	| 
	or l			;0bf3	b5 	. 
	jp z,l0a9ah		;0bf4	ca 9a 0a 	. . . 
	push hl			;0bf7	e5 	. 
	push de			;0bf8	d5 	. 
	call sub_0c45h		;0bf9	cd 45 0c 	. E . 
	push bc			;0bfc	c5 	. 
	ld b,h			;0bfd	44 	D 
	ld c,l			;0bfe	4d 	M 
	ld hl,l0000h		;0bff	21 00 00 	! . . 
	ld a,010h		;0c02	3e 10 	> . 
l0c04h:
	add hl,hl			;0c04	29 	) 
	jr c,$+33		;0c05	38 1f 	8 . 
	ex de,hl			;0c07	eb 	. 
	add hl,hl			;0c08	29 	) 
	ex de,hl			;0c09	eb 	. 
	jr nc,l0c10h		;0c0a	30 04 	0 . 
	add hl,bc			;0c0c	09 	. 
	jp c,00c26h		;0c0d	da 26 0c 	. & . 
l0c10h:
	dec a			;0c10	3d 	= 
	jr nz,l0c04h		;0c11	20 f1 	  . 
	pop bc			;0c13	c1 	. 
	pop de			;0c14	d1 	. 
	ld a,h			;0c15	7c 	| 
	or a			;0c16	b7 	. 
	jp m,l0c1fh		;0c17	fa 1f 0c 	. . . 
	pop de			;0c1a	d1 	. 
	ld a,b			;0c1b	78 	x 
	jp l0c4dh		;0c1c	c3 4d 0c 	. M . 
l0c1fh:
	xor 080h		;0c1f	ee 80 	. . 
	or l			;0c21	b5 	. 
	jr z,l0c37h		;0c22	28 13 	( . 
	ex de,hl			;0c24	eb 	. 
	ld bc,0e1c1h		;0c25	01 c1 e1 	. . . 
	call sub_0acfh		;0c28	cd cf 0a 	. . . 
	pop hl			;0c2b	e1 	. 
	call sub_09a4h		;0c2c	cd a4 09 	. . . 
	call sub_0acfh		;0c2f	cd cf 0a 	. . . 
l0c32h:
	pop bc			;0c32	c1 	. 
	pop de			;0c33	d1 	. 
	jp l0847h		;0c34	c3 47 08 	. G . 
l0c37h:
	ld a,b			;0c37	78 	x 
	or a			;0c38	b7 	. 
	pop bc			;0c39	c1 	. 
	jp m,l0a9ah		;0c3a	fa 9a 0a 	. . . 
	push de			;0c3d	d5 	. 
	call sub_0acfh		;0c3e	cd cf 0a 	. . . 
	pop de			;0c41	d1 	. 
	jp sub_0982h		;0c42	c3 82 09 	. . . 
sub_0c45h:
	ld a,h			;0c45	7c 	| 
	xor d			;0c46	aa 	. 
	ld b,a			;0c47	47 	G 
	call sub_0c4ch		;0c48	cd 4c 0c 	. L . 
	ex de,hl			;0c4b	eb 	. 
sub_0c4ch:
	ld a,h			;0c4c	7c 	| 
l0c4dh:
	or a			;0c4d	b7 	. 
	jp p,l0a9ah		;0c4e	f2 9a 0a 	. . . 
sub_0c51h:
	xor a			;0c51	af 	. 
	ld c,a			;0c52	4f 	O 
	sub l			;0c53	95 	. 
	ld l,a			;0c54	6f 	o 
	ld a,c			;0c55	79 	y 
	sbc a,h			;0c56	9c 	. 
	ld h,a			;0c57	67 	g 
	jp l0a9ah		;0c58	c3 9a 0a 	. . . 
l0c5bh:
	ld hl,(04121h)		;0c5b	2a 21 41 	* ! A 
	call sub_0c51h		;0c5e	cd 51 0c 	. Q . 
	ld a,h			;0c61	7c 	| 
	xor 080h		;0c62	ee 80 	. . 
	or l			;0c64	b5 	. 
	ret nz			;0c65	c0 	. 
sub_0c66h:
	ex de,hl			;0c66	eb 	. 
	call 00aefh		;0c67	cd ef 0a 	. . . 
	xor a			;0c6a	af 	. 
sub_0c6bh:
	ld b,098h		;0c6b	06 98 	. . 
	jp l0969h		;0c6d	c3 69 09 	. i . 
	ld hl,0412dh		;0c70	21 2d 41 	! - A 
	ld a,(hl)			;0c73	7e 	~ 
	xor 080h		;0c74	ee 80 	. . 
	ld (hl),a			;0c76	77 	w 
sub_0c77h:
	ld hl,0412eh		;0c77	21 2e 41 	! . A 
	ld a,(hl)			;0c7a	7e 	~ 
	or a			;0c7b	b7 	. 
	ret z			;0c7c	c8 	. 
	ld b,a			;0c7d	47 	G 
	dec hl			;0c7e	2b 	+ 
	ld c,(hl)			;0c7f	4e 	N 
	ld de,04124h		;0c80	11 24 41 	. $ A 
	ld a,(de)			;0c83	1a 	. 
	or a			;0c84	b7 	. 
	jp z,l09f4h		;0c85	ca f4 09 	. . . 
	sub b			;0c88	90 	. 
	jr nc,l0ca1h		;0c89	30 16 	0 . 
	cpl			;0c8b	2f 	/ 
	inc a			;0c8c	3c 	< 
	push af			;0c8d	f5 	. 
	ld c,008h		;0c8e	0e 08 	. . 
	inc hl			;0c90	23 	# 
	push hl			;0c91	e5 	. 
l0c92h:
	ld a,(de)			;0c92	1a 	. 
	ld b,(hl)			;0c93	46 	F 
	ld (hl),a			;0c94	77 	w 
	ld a,b			;0c95	78 	x 
	ld (de),a			;0c96	12 	. 
	dec de			;0c97	1b 	. 
	dec hl			;0c98	2b 	+ 
	dec c			;0c99	0d 	. 
	jr nz,l0c92h		;0c9a	20 f6 	  . 
	pop hl			;0c9c	e1 	. 
	ld b,(hl)			;0c9d	46 	F 
	dec hl			;0c9e	2b 	+ 
	ld c,(hl)			;0c9f	4e 	N 
	pop af			;0ca0	f1 	. 
l0ca1h:
	cp 039h		;0ca1	fe 39 	. 9 
	ret nc			;0ca3	d0 	. 
	push af			;0ca4	f5 	. 
	call sub_09dfh		;0ca5	cd df 09 	. . . 
	inc hl			;0ca8	23 	# 
	ld (hl),000h		;0ca9	36 00 	6 . 
	ld b,a			;0cab	47 	G 
	pop af			;0cac	f1 	. 
	ld hl,0412dh		;0cad	21 2d 41 	! - A 
	call sub_0d69h		;0cb0	cd 69 0d 	. i . 
	ld a,(04126h)		;0cb3	3a 26 41 	: & A 
	ld (0411ch),a		;0cb6	32 1c 41 	2 . A 
	ld a,b			;0cb9	78 	x 
	or a			;0cba	b7 	. 
	jp p,l0ccfh		;0cbb	f2 cf 0c 	. . . 
	call sub_0d33h		;0cbe	cd 33 0d 	. 3 . 
	jp nc,l0d0eh		;0cc1	d2 0e 0d 	. . . 
	ex de,hl			;0cc4	eb 	. 
	inc (hl)			;0cc5	34 	4 
	jp z,l07b2h		;0cc6	ca b2 07 	. . . 
	call sub_0d90h		;0cc9	cd 90 0d 	. . . 
	jp l0d0eh		;0ccc	c3 0e 0d 	. . . 
l0ccfh:
	call sub_0d45h		;0ccf	cd 45 0d 	. E . 
	ld hl,04125h		;0cd2	21 25 41 	! % A 
	call c,sub_0d57h		;0cd5	dc 57 0d 	. W . 
l0cd8h:
	xor a			;0cd8	af 	. 
l0cd9h:
	ld b,a			;0cd9	47 	G 
	ld a,(04123h)		;0cda	3a 23 41 	: # A 
	or a			;0cdd	b7 	. 
	jr nz,l0cfeh		;0cde	20 1e 	  . 
	ld hl,0411ch		;0ce0	21 1c 41 	! . A 
	ld c,008h		;0ce3	0e 08 	. . 
l0ce5h:
	ld d,(hl)			;0ce5	56 	V 
	ld (hl),a			;0ce6	77 	w 
	ld a,d			;0ce7	7a 	z 
	inc hl			;0ce8	23 	# 
	dec c			;0ce9	0d 	. 
	jr nz,l0ce5h		;0cea	20 f9 	  . 
	ld a,b			;0cec	78 	x 
	sub 008h		;0ced	d6 08 	. . 
	cp 0c0h		;0cef	fe c0 	. . 
	jr nz,l0cd9h		;0cf1	20 e6 	  . 
	jp l0778h		;0cf3	c3 78 07 	. x . 
l0cf6h:
	dec b			;0cf6	05 	. 
	ld hl,0411ch		;0cf7	21 1c 41 	! . A 
	call sub_0d97h		;0cfa	cd 97 0d 	. . . 
	or a			;0cfd	b7 	. 
l0cfeh:
	jp p,l0cf6h		;0cfe	f2 f6 0c 	. . . 
	ld a,b			;0d01	78 	x 
	or a			;0d02	b7 	. 
	jr z,l0d0eh		;0d03	28 09 	( . 
	ld hl,04124h		;0d05	21 24 41 	! $ A 
	add a,(hl)			;0d08	86 	. 
	ld (hl),a			;0d09	77 	w 
	jp nc,l0778h		;0d0a	d2 78 07 	. x . 
	ret z			;0d0d	c8 	. 
l0d0eh:
	ld a,(0411ch)		;0d0e	3a 1c 41 	: . A 
l0d11h:
	or a			;0d11	b7 	. 
	call m,sub_0d20h		;0d12	fc 20 0d 	.   . 
	ld hl,04125h		;0d15	21 25 41 	! % A 
	ld a,(hl)			;0d18	7e 	~ 
	and 080h		;0d19	e6 80 	. . 
	dec hl			;0d1b	2b 	+ 
	dec hl			;0d1c	2b 	+ 
	xor (hl)			;0d1d	ae 	. 
	ld (hl),a			;0d1e	77 	w 
	ret			;0d1f	c9 	. 
sub_0d20h:
	ld hl,0411dh		;0d20	21 1d 41 	! . A 
	ld b,007h		;0d23	06 07 	. . 
l0d25h:
	inc (hl)			;0d25	34 	4 
	ret nz			;0d26	c0 	. 
	inc hl			;0d27	23 	# 
	dec b			;0d28	05 	. 
	jr nz,l0d25h		;0d29	20 fa 	  . 
	inc (hl)			;0d2b	34 	4 
	jp z,l07b2h		;0d2c	ca b2 07 	. . . 
	dec hl			;0d2f	2b 	+ 
	ld (hl),080h		;0d30	36 80 	6 . 
	ret			;0d32	c9 	. 
sub_0d33h:
	ld hl,04127h		;0d33	21 27 41 	! ' A 
sub_0d36h:
	ld de,0411dh		;0d36	11 1d 41 	. . A 
sub_0d39h:
	ld c,007h		;0d39	0e 07 	. . 
	xor a			;0d3b	af 	. 
l0d3ch:
	ld a,(de)			;0d3c	1a 	. 
	adc a,(hl)			;0d3d	8e 	. 
	ld (de),a			;0d3e	12 	. 
	inc de			;0d3f	13 	. 
	inc hl			;0d40	23 	# 
	dec c			;0d41	0d 	. 
	jr nz,l0d3ch		;0d42	20 f8 	  . 
	ret			;0d44	c9 	. 
sub_0d45h:
	ld hl,04127h		;0d45	21 27 41 	! ' A 
sub_0d48h:
	ld de,0411dh		;0d48	11 1d 41 	. . A 
sub_0d4bh:
	ld c,007h		;0d4b	0e 07 	. . 
	xor a			;0d4d	af 	. 
l0d4eh:
	ld a,(de)			;0d4e	1a 	. 
	sbc a,(hl)			;0d4f	9e 	. 
	ld (de),a			;0d50	12 	. 
	inc de			;0d51	13 	. 
	inc hl			;0d52	23 	# 
	dec c			;0d53	0d 	. 
	jr nz,l0d4eh		;0d54	20 f8 	  . 
	ret			;0d56	c9 	. 
sub_0d57h:
	ld a,(hl)			;0d57	7e 	~ 
	cpl			;0d58	2f 	/ 
	ld (hl),a			;0d59	77 	w 
	ld hl,0411ch		;0d5a	21 1c 41 	! . A 
	ld b,008h		;0d5d	06 08 	. . 
	xor a			;0d5f	af 	. 
l0d60h:
	ld c,a			;0d60	4f 	O 
l0d61h:
	ld a,c			;0d61	79 	y 
	sbc a,(hl)			;0d62	9e 	. 
	ld (hl),a			;0d63	77 	w 
	inc hl			;0d64	23 	# 
	dec b			;0d65	05 	. 
	jr nz,l0d61h		;0d66	20 f9 	  . 
	ret			;0d68	c9 	. 
sub_0d69h:
	ld (hl),c			;0d69	71 	q 
	push hl			;0d6a	e5 	. 
l0d6bh:
	sub 008h		;0d6b	d6 08 	. . 
	jr c,l0d7dh		;0d6d	38 0e 	8 . 
	pop hl			;0d6f	e1 	. 
sub_0d70h:
	push hl			;0d70	e5 	. 
	ld de,l0800h		;0d71	11 00 08 	. . . 
l0d74h:
	ld c,(hl)			;0d74	4e 	N 
	ld (hl),e			;0d75	73 	s 
	ld e,c			;0d76	59 	Y 
	dec hl			;0d77	2b 	+ 
	dec d			;0d78	15 	. 
	jr nz,l0d74h		;0d79	20 f9 	  . 
	jr l0d6bh		;0d7b	18 ee 	. . 
l0d7dh:
	add a,009h		;0d7d	c6 09 	. . 
	ld d,a			;0d7f	57 	W 
l0d80h:
	xor a			;0d80	af 	. 
	pop hl			;0d81	e1 	. 
	dec d			;0d82	15 	. 
	ret z			;0d83	c8 	. 
l0d84h:
	push hl			;0d84	e5 	. 
	ld e,008h		;0d85	1e 08 	. . 
l0d87h:
	ld a,(hl)			;0d87	7e 	~ 
	rra			;0d88	1f 	. 
	ld (hl),a			;0d89	77 	w 
	dec hl			;0d8a	2b 	+ 
	dec e			;0d8b	1d 	. 
	jr nz,l0d87h		;0d8c	20 f9 	  . 
	jr l0d80h		;0d8e	18 f0 	. . 
sub_0d90h:
	ld hl,04123h		;0d90	21 23 41 	! # A 
	ld d,001h		;0d93	16 01 	. . 
	jr l0d84h		;0d95	18 ed 	. . 
sub_0d97h:
	ld c,008h		;0d97	0e 08 	. . 
l0d99h:
	ld a,(hl)			;0d99	7e 	~ 
	rla			;0d9a	17 	. 
	ld (hl),a			;0d9b	77 	w 
	inc hl			;0d9c	23 	# 
	dec c			;0d9d	0d 	. 
	jr nz,l0d99h		;0d9e	20 f9 	  . 
	ret			;0da0	c9 	. 
sub_0da1h:
	call sub_0955h		;0da1	cd 55 09 	. U . 
	ret z			;0da4	c8 	. 
	call 0090ah		;0da5	cd 0a 09 	. . . 
	call sub_0e39h		;0da8	cd 39 0e 	. 9 . 
	ld (hl),c			;0dab	71 	q 
l0dach:
	inc de			;0dac	13 	. 
	ld b,007h		;0dad	06 07 	. . 
l0dafh:
	ld a,(de)			;0daf	1a 	. 
	inc de			;0db0	13 	. 
	or a			;0db1	b7 	. 
	push de			;0db2	d5 	. 
	jr z,l0dcch		;0db3	28 17 	( . 
	ld c,008h		;0db5	0e 08 	. . 
l0db7h:
	push bc			;0db7	c5 	. 
	rra			;0db8	1f 	. 
	ld b,a			;0db9	47 	G 
	call c,sub_0d33h		;0dba	dc 33 0d 	. 3 . 
	call sub_0d90h		;0dbd	cd 90 0d 	. . . 
	ld a,b			;0dc0	78 	x 
	pop bc			;0dc1	c1 	. 
	dec c			;0dc2	0d 	. 
	jr nz,l0db7h		;0dc3	20 f2 	  . 
l0dc5h:
	pop de			;0dc5	d1 	. 
	dec b			;0dc6	05 	. 
	jr nz,l0dafh		;0dc7	20 e6 	  . 
	jp l0cd8h		;0dc9	c3 d8 0c 	. . . 
l0dcch:
	ld hl,04123h		;0dcc	21 23 41 	! # A 
	call sub_0d70h		;0dcf	cd 70 0d 	. p . 
	jr l0dc5h		;0dd2	18 f1 	. . 
l0dd4h:
	nop			;0dd4	00 	. 
	nop			;0dd5	00 	. 
	nop			;0dd6	00 	. 
	nop			;0dd7	00 	. 
l0dd8h:
	nop			;0dd8	00 	. 
	nop			;0dd9	00 	. 
	jr nz,l0d60h		;0dda	20 84 	  . 
sub_0ddch:
	ld de,l0dd4h		;0ddc	11 d4 0d 	. . . 
	ld hl,04127h		;0ddf	21 27 41 	! ' A 
	call l09d3h		;0de2	cd d3 09 	. . . 
	ld a,(0412eh)		;0de5	3a 2e 41 	: . A 
	or a			;0de8	b7 	. 
	jp z,0199ah		;0de9	ca 9a 19 	. . . 
	call sub_0907h		;0dec	cd 07 09 	. . . 
	inc (hl)			;0def	34 	4 
	inc (hl)			;0df0	34 	4 
	call sub_0e39h		;0df1	cd 39 0e 	. 9 . 
	ld hl,04151h		;0df4	21 51 41 	! Q A 
	ld (hl),c			;0df7	71 	q 
	ld b,c			;0df8	41 	A 
l0df9h:
	ld de,0414ah		;0df9	11 4a 41 	. J A 
	ld hl,04127h		;0dfc	21 27 41 	! ' A 
	call sub_0d4bh		;0dff	cd 4b 0d 	. K . 
	ld a,(de)			;0e02	1a 	. 
	sbc a,c			;0e03	99 	. 
	ccf			;0e04	3f 	? 
	jr c,$+13		;0e05	38 0b 	8 . 
	ld de,0414ah		;0e07	11 4a 41 	. J A 
	ld hl,04127h		;0e0a	21 27 41 	! ' A 
	call sub_0d39h		;0e0d	cd 39 0d 	. 9 . 
	xor a			;0e10	af 	. 
	jp c,l0412h		;0e11	da 12 04 	. . . 
	ld a,(04123h)		;0e14	3a 23 41 	: # A 
	inc a			;0e17	3c 	< 
	dec a			;0e18	3d 	= 
	rra			;0e19	1f 	. 
	jp m,l0d11h		;0e1a	fa 11 0d 	. . . 
	rla			;0e1d	17 	. 
	ld hl,0411dh		;0e1e	21 1d 41 	! . A 
	ld c,007h		;0e21	0e 07 	. . 
	call l0d99h		;0e23	cd 99 0d 	. . . 
	ld hl,0414ah		;0e26	21 4a 41 	! J A 
	call sub_0d97h		;0e29	cd 97 0d 	. . . 
	ld a,b			;0e2c	78 	x 
	or a			;0e2d	b7 	. 
	jr nz,l0df9h		;0e2e	20 c9 	  . 
	ld hl,04124h		;0e30	21 24 41 	! $ A 
	dec (hl)			;0e33	35 	5 
	jr nz,l0df9h		;0e34	20 c3 	  . 
	jp l07b2h		;0e36	c3 b2 07 	. . . 
sub_0e39h:
	ld a,c			;0e39	79 	y 
l0e3ah:
	ld (0412dh),a		;0e3a	32 2d 41 	2 - A 
	dec hl			;0e3d	2b 	+ 
	ld de,04150h		;0e3e	11 50 41 	. P A 
	ld bc,00700h		;0e41	01 00 07 	. . . 
l0e44h:
	ld a,(hl)			;0e44	7e 	~ 
	ld (de),a			;0e45	12 	. 
	ld (hl),c			;0e46	71 	q 
	dec de			;0e47	1b 	. 
	dec hl			;0e48	2b 	+ 
	dec b			;0e49	05 	. 
	jr nz,l0e44h		;0e4a	20 f8 	  . 
	ret			;0e4c	c9 	. 
sub_0e4dh:
	call sub_09fch		;0e4d	cd fc 09 	. . . 
	ex de,hl			;0e50	eb 	. 
	dec hl			;0e51	2b 	+ 
	ld a,(hl)			;0e52	7e 	~ 
	or a			;0e53	b7 	. 
	ret z			;0e54	c8 	. 
	add a,002h		;0e55	c6 02 	. . 
	jp c,l07b2h		;0e57	da b2 07 	. . . 
	ld (hl),a			;0e5a	77 	w 
	push hl			;0e5b	e5 	. 
	call sub_0c77h		;0e5c	cd 77 0c 	. w . 
	pop hl			;0e5f	e1 	. 
	inc (hl)			;0e60	34 	4 
	ret nz			;0e61	c0 	. 
	jp l07b2h		;0e62	c3 b2 07 	. . . 
l0e65h:
	call l0778h		;0e65	cd 78 07 	. x . 
	call sub_0aech		;0e68	cd ec 0a 	. . . 
	or 0afh		;0e6b	f6 af 	. . 
	ex de,hl			;0e6d	eb 	. 
	ld bc,l00ffh		;0e6e	01 ff 00 	. . . 
	ld h,b			;0e71	60 	` 
	ld l,b			;0e72	68 	h 
	call z,l0a9ah		;0e73	cc 9a 0a 	. . . 
	ex de,hl			;0e76	eb 	. 
	ld a,(hl)			;0e77	7e 	~ 
	cp 02dh		;0e78	fe 2d 	. - 
	push af			;0e7a	f5 	. 
	jp z,l0e83h		;0e7b	ca 83 0e 	. . . 
	cp 02bh		;0e7e	fe 2b 	. + 
	jr z,l0e83h		;0e80	28 01 	( . 
	dec hl			;0e82	2b 	+ 
l0e83h:
	rst 10h			;0e83	d7 	. 
	jp c,l0f29h		;0e84	da 29 0f 	. ) . 
	cp 02eh		;0e87	fe 2e 	. . 
	jp z,l0ee4h		;0e89	ca e4 0e 	. . . 
	cp 045h		;0e8c	fe 45 	. E 
	jr z,l0ea4h		;0e8e	28 14 	( . 
	cp 025h		;0e90	fe 25 	. % 
	jp z,l0eeeh		;0e92	ca ee 0e 	. . . 
	cp 023h		;0e95	fe 23 	. # 
	jp z,l0ef5h		;0e97	ca f5 0e 	. . . 
	cp 021h		;0e9a	fe 21 	. ! 
	jp z,l0ef6h		;0e9c	ca f6 0e 	. . . 
	cp 044h		;0e9f	fe 44 	. D 
	jr nz,l0ec7h		;0ea1	20 24 	  $ 
	or a			;0ea3	b7 	. 
l0ea4h:
	call sub_0efbh		;0ea4	cd fb 0e 	. . . 
	push hl			;0ea7	e5 	. 
	ld hl,l0ebdh		;0ea8	21 bd 0e 	! . . 
	ex (sp),hl			;0eab	e3 	. 
	rst 10h			;0eac	d7 	. 
	dec d			;0ead	15 	. 
	cp 0ceh		;0eae	fe ce 	. . 
	ret z			;0eb0	c8 	. 
	cp 02dh		;0eb1	fe 2d 	. - 
	ret z			;0eb3	c8 	. 
	inc d			;0eb4	14 	. 
	cp 0cdh		;0eb5	fe cd 	. . 
	ret z			;0eb7	c8 	. 
	cp 02bh		;0eb8	fe 2b 	. + 
	ret z			;0eba	c8 	. 
	dec hl			;0ebb	2b 	+ 
	pop af			;0ebc	f1 	. 
l0ebdh:
	rst 10h			;0ebd	d7 	. 
	jp c,l0f94h		;0ebe	da 94 0f 	. . . 
	inc d			;0ec1	14 	. 
	jr nz,l0ec7h		;0ec2	20 03 	  . 
	xor a			;0ec4	af 	. 
	sub e			;0ec5	93 	. 
	ld e,a			;0ec6	5f 	_ 
l0ec7h:
	push hl			;0ec7	e5 	. 
	ld a,e			;0ec8	7b 	{ 
	sub b			;0ec9	90 	. 
l0ecah:
	call p,sub_0f0ah		;0eca	f4 0a 0f 	. . . 
	call m,sub_0f18h		;0ecd	fc 18 0f 	. . . 
	jr nz,l0ecah		;0ed0	20 f8 	  . 
	pop hl			;0ed2	e1 	. 
	pop af			;0ed3	f1 	. 
	push hl			;0ed4	e5 	. 
	call z,l097bh		;0ed5	cc 7b 09 	. { . 
	pop hl			;0ed8	e1 	. 
	rst 20h			;0ed9	e7 	. 
	ret pe			;0eda	e8 	. 
	push hl			;0edb	e5 	. 
	ld hl,l0890h		;0edc	21 90 08 	! . . 
	push hl			;0edf	e5 	. 
	call l0aa3h		;0ee0	cd a3 0a 	. . . 
	ret			;0ee3	c9 	. 
l0ee4h:
	rst 20h			;0ee4	e7 	. 
	inc c			;0ee5	0c 	. 
	jr nz,l0ec7h		;0ee6	20 df 	  . 
	call c,sub_0efbh		;0ee8	dc fb 0e 	. . . 
	jp l0e83h		;0eeb	c3 83 0e 	. . . 
l0eeeh:
	rst 20h			;0eee	e7 	. 
	jp p,l1997h		;0eef	f2 97 19 	. . . 
l0ef2h:
	inc hl			;0ef2	23 	# 
	jr l0ec7h		;0ef3	18 d2 	. . 
l0ef5h:
	or a			;0ef5	b7 	. 
l0ef6h:
	call sub_0efbh		;0ef6	cd fb 0e 	. . . 
	jr l0ef2h		;0ef9	18 f7 	. . 
sub_0efbh:
	push hl			;0efb	e5 	. 
	push de			;0efc	d5 	. 
	push bc			;0efd	c5 	. 
	push af			;0efe	f5 	. 
	call z,sub_0ab1h		;0eff	cc b1 0a 	. . . 
	pop af			;0f02	f1 	. 
	call nz,sub_0adbh		;0f03	c4 db 0a 	. . . 
	pop bc			;0f06	c1 	. 
	pop de			;0f07	d1 	. 
	pop hl			;0f08	e1 	. 
	ret			;0f09	c9 	. 
sub_0f0ah:
	ret z			;0f0a	c8 	. 
sub_0f0bh:
	push af			;0f0b	f5 	. 
	rst 20h			;0f0c	e7 	. 
	push af			;0f0d	f5 	. 
	call po,sub_093eh		;0f0e	e4 3e 09 	. > . 
	pop af			;0f11	f1 	. 
	call pe,sub_0e4dh		;0f12	ec 4d 0e 	. M . 
	pop af			;0f15	f1 	. 
sub_0f16h:
	dec a			;0f16	3d 	= 
	ret			;0f17	c9 	. 
sub_0f18h:
	push de			;0f18	d5 	. 
	push hl			;0f19	e5 	. 
	push af			;0f1a	f5 	. 
	rst 20h			;0f1b	e7 	. 
	push af			;0f1c	f5 	. 
	call po,sub_0897h		;0f1d	e4 97 08 	. . . 
	pop af			;0f20	f1 	. 
	call pe,sub_0ddch		;0f21	ec dc 0d 	. . . 
	pop af			;0f24	f1 	. 
	pop hl			;0f25	e1 	. 
	pop de			;0f26	d1 	. 
	inc a			;0f27	3c 	< 
	ret			;0f28	c9 	. 
l0f29h:
	push de			;0f29	d5 	. 
	ld a,b			;0f2a	78 	x 
	adc a,c			;0f2b	89 	. 
	ld b,a			;0f2c	47 	G 
	push bc			;0f2d	c5 	. 
	push hl			;0f2e	e5 	. 
	ld a,(hl)			;0f2f	7e 	~ 
	sub 030h		;0f30	d6 30 	. 0 
	push af			;0f32	f5 	. 
	rst 20h			;0f33	e7 	. 
	jp p,l0f5dh		;0f34	f2 5d 0f 	. ] . 
	ld hl,(04121h)		;0f37	2a 21 41 	* ! A 
	ld de,00ccdh		;0f3a	11 cd 0c 	. . . 
	rst 18h			;0f3d	df 	. 
	jr nc,l0f59h		;0f3e	30 19 	0 . 
	ld d,h			;0f40	54 	T 
	ld e,l			;0f41	5d 	] 
	add hl,hl			;0f42	29 	) 
	add hl,hl			;0f43	29 	) 
	add hl,de			;0f44	19 	. 
	add hl,hl			;0f45	29 	) 
	pop af			;0f46	f1 	. 
	ld c,a			;0f47	4f 	O 
	add hl,bc			;0f48	09 	. 
	ld a,h			;0f49	7c 	| 
	or a			;0f4a	b7 	. 
	jp m,l0f57h		;0f4b	fa 57 0f 	. W . 
	ld (04121h),hl		;0f4e	22 21 41 	" ! A 
l0f51h:
	pop hl			;0f51	e1 	. 
	pop bc			;0f52	c1 	. 
	pop de			;0f53	d1 	. 
	jp l0e83h		;0f54	c3 83 0e 	. . . 
l0f57h:
	ld a,c			;0f57	79 	y 
	push af			;0f58	f5 	. 
l0f59h:
	call l0acch		;0f59	cd cc 0a 	. . . 
	scf			;0f5c	37 	7 
l0f5dh:
	jr nc,l0f77h		;0f5d	30 18 	0 . 
	ld bc,09474h		;0f5f	01 74 94 	. t . 
	ld de,l2400h		;0f62	11 00 24 	. . $ 
	call sub_0a0ch		;0f65	cd 0c 0a 	. . . 
	jp p,l0f74h		;0f68	f2 74 0f 	. t . 
	call sub_093eh		;0f6b	cd 3e 09 	. > . 
	pop af			;0f6e	f1 	. 
	call sub_0f89h		;0f6f	cd 89 0f 	. . . 
	jr l0f51h		;0f72	18 dd 	. . 
l0f74h:
	call sub_0ae3h		;0f74	cd e3 0a 	. . . 
l0f77h:
	call sub_0e4dh		;0f77	cd 4d 0e 	. M . 
	call sub_09fch		;0f7a	cd fc 09 	. . . 
	pop af			;0f7d	f1 	. 
	call sub_0964h		;0f7e	cd 64 09 	. d . 
	call sub_0ae3h		;0f81	cd e3 0a 	. . . 
	call sub_0c77h		;0f84	cd 77 0c 	. w . 
	jr l0f51h		;0f87	18 c8 	. . 
sub_0f89h:
	call sub_09a4h		;0f89	cd a4 09 	. . . 
	call sub_0964h		;0f8c	cd 64 09 	. d . 
l0f8fh:
	pop bc			;0f8f	c1 	. 
	pop de			;0f90	d1 	. 
	jp l0716h		;0f91	c3 16 07 	. . . 
l0f94h:
	ld a,e			;0f94	7b 	{ 
	cp 00ah		;0f95	fe 0a 	. . 
	jr nc,$+11		;0f97	30 09 	0 . 
	rlca			;0f99	07 	. 
	rlca			;0f9a	07 	. 
	add a,e			;0f9b	83 	. 
	rlca			;0f9c	07 	. 
	add a,(hl)			;0f9d	86 	. 
	sub 030h		;0f9e	d6 30 	. 0 
	ld e,a			;0fa0	5f 	_ 
	jp m,0321eh		;0fa1	fa 1e 32 	. . 2 
	jp l0ebdh		;0fa4	c3 bd 0e 	. . . 
sub_0fa7h:
	push hl			;0fa7	e5 	. 
	ld hl,l1924h		;0fa8	21 24 19 	! $ . 
	call sub_28a7h		;0fab	cd a7 28 	. . ( 
	pop hl			;0fae	e1 	. 
sub_0fafh:
	call l0a9ah		;0faf	cd 9a 0a 	. . . 
	xor a			;0fb2	af 	. 
	call sub_1034h		;0fb3	cd 34 10 	. 4 . 
	or (hl)			;0fb6	b6 	. 
	call sub_0fd9h		;0fb7	cd d9 0f 	. . . 
	jp l28a6h		;0fba	c3 a6 28 	. . ( 
sub_0fbdh:
	xor a			;0fbd	af 	. 
sub_0fbeh:
	call sub_1034h		;0fbe	cd 34 10 	. 4 . 
	and 008h		;0fc1	e6 08 	. . 
	jr z,l0fc7h		;0fc3	28 02 	( . 
	ld (hl),02bh		;0fc5	36 2b 	6 + 
l0fc7h:
	ex de,hl			;0fc7	eb 	. 
	call sub_0994h		;0fc8	cd 94 09 	. . . 
	ex de,hl			;0fcb	eb 	. 
	jp p,sub_0fd9h		;0fcc	f2 d9 0f 	. . . 
	ld (hl),02dh		;0fcf	36 2d 	6 - 
	push bc			;0fd1	c5 	. 
	push hl			;0fd2	e5 	. 
	call l097bh		;0fd3	cd 7b 09 	. { . 
	pop hl			;0fd6	e1 	. 
	pop bc			;0fd7	c1 	. 
	or h			;0fd8	b4 	. 
sub_0fd9h:
	inc hl			;0fd9	23 	# 
	ld (hl),030h		;0fda	36 30 	6 0 
	ld a,(040d8h)		;0fdc	3a d8 40 	: . @ 
	ld d,a			;0fdf	57 	W 
	rla			;0fe0	17 	. 
	ld a,(040afh)		;0fe1	3a af 40 	: . @ 
	jp c,l109ah		;0fe4	da 9a 10 	. . . 
	jp z,l1092h		;0fe7	ca 92 10 	. . . 
	cp 004h		;0fea	fe 04 	. . 
	jp nc,l103dh		;0fec	d2 3d 10 	. = . 
	ld bc,l0000h		;0fef	01 00 00 	. . . 
	call sub_132fh		;0ff2	cd 2f 13 	. / . 
sub_0ff5h:
	ld hl,04130h		;0ff5	21 30 41 	! 0 A 
	ld b,(hl)			;0ff8	46 	F 
	ld c,020h		;0ff9	0e 20 	.   
	ld a,(040d8h)		;0ffb	3a d8 40 	: . @ 
	ld e,a			;0ffe	5f 	_ 
	and 020h		;0fff	e6 20 	.   
	jr z,l100ah		;1001	28 07 	( . 
	ld a,b			;1003	78 	x 
	cp c			;1004	b9 	. 
	ld c,02ah		;1005	0e 2a 	. * 
	jr nz,l100ah		;1007	20 01 	  . 
	ld b,c			;1009	41 	A 
l100ah:
	ld (hl),c			;100a	71 	q 
	rst 10h			;100b	d7 	. 
	jr z,l1022h		;100c	28 14 	( . 
	cp 045h		;100e	fe 45 	. E 
	jr z,l1022h		;1010	28 10 	( . 
	cp 044h		;1012	fe 44 	. D 
	jr z,l1022h		;1014	28 0c 	( . 
	cp 030h		;1016	fe 30 	. 0 
	jr z,l100ah		;1018	28 f0 	( . 
	cp 02ch		;101a	fe 2c 	. , 
	jr z,l100ah		;101c	28 ec 	( . 
	cp 02eh		;101e	fe 2e 	. . 
	jr nz,l1025h		;1020	20 03 	  . 
l1022h:
	dec hl			;1022	2b 	+ 
	ld (hl),030h		;1023	36 30 	6 0 
l1025h:
	ld a,e			;1025	7b 	{ 
	and 010h		;1026	e6 10 	. . 
	jr z,l102dh		;1028	28 03 	( . 
	dec hl			;102a	2b 	+ 
	ld (hl),024h		;102b	36 24 	6 $ 
l102dh:
	ld a,e			;102d	7b 	{ 
	and 004h		;102e	e6 04 	. . 
	ret nz			;1030	c0 	. 
	dec hl			;1031	2b 	+ 
	ld (hl),b			;1032	70 	p 
	ret			;1033	c9 	. 
sub_1034h:
	ld (040d8h),a		;1034	32 d8 40 	2 . @ 
	ld hl,04130h		;1037	21 30 41 	! 0 A 
	ld (hl),020h		;103a	36 20 	6   
	ret			;103c	c9 	. 
l103dh:
	cp 005h		;103d	fe 05 	. . 
	push hl			;103f	e5 	. 
	sbc a,000h		;1040	de 00 	. . 
	rla			;1042	17 	. 
	ld d,a			;1043	57 	W 
	inc d			;1044	14 	. 
	call sub_1201h		;1045	cd 01 12 	. . . 
	ld bc,l02feh+2		;1048	01 00 03 	. . . 
	add a,d			;104b	82 	. 
	jp m,l1057h		;104c	fa 57 10 	. W . 
	inc d			;104f	14 	. 
	cp d			;1050	ba 	. 
	jr nc,l1057h		;1051	30 04 	0 . 
	inc a			;1053	3c 	< 
	ld b,a			;1054	47 	G 
	ld a,002h		;1055	3e 02 	> . 
l1057h:
	sub 002h		;1057	d6 02 	. . 
	pop hl			;1059	e1 	. 
	push af			;105a	f5 	. 
	call sub_1291h		;105b	cd 91 12 	. . . 
	ld (hl),030h		;105e	36 30 	6 0 
	call z,sub_09c9h		;1060	cc c9 09 	. . . 
	call sub_12a4h		;1063	cd a4 12 	. . . 
l1066h:
	dec hl			;1066	2b 	+ 
	ld a,(hl)			;1067	7e 	~ 
	cp 030h		;1068	fe 30 	. 0 
	jr z,l1066h		;106a	28 fa 	( . 
	cp 02eh		;106c	fe 2e 	. . 
	call nz,sub_09c9h		;106e	c4 c9 09 	. . . 
	pop af			;1071	f1 	. 
	jr z,l1093h		;1072	28 1f 	( . 
sub_1074h:
	push af			;1074	f5 	. 
	rst 20h			;1075	e7 	. 
	ld a,022h		;1076	3e 22 	> " 
	adc a,a			;1078	8f 	. 
	ld (hl),a			;1079	77 	w 
	inc hl			;107a	23 	# 
	pop af			;107b	f1 	. 
	ld (hl),02bh		;107c	36 2b 	6 + 
	jp p,l1085h		;107e	f2 85 10 	. . . 
	ld (hl),02dh		;1081	36 2d 	6 - 
	cpl			;1083	2f 	/ 
	inc a			;1084	3c 	< 
l1085h:
	ld b,02fh		;1085	06 2f 	. / 
l1087h:
	inc b			;1087	04 	. 
	sub 00ah		;1088	d6 0a 	. . 
	jr nc,l1087h		;108a	30 fb 	0 . 
	add a,03ah		;108c	c6 3a 	. : 
	inc hl			;108e	23 	# 
	ld (hl),b			;108f	70 	p 
	inc hl			;1090	23 	# 
	ld (hl),a			;1091	77 	w 
l1092h:
	inc hl			;1092	23 	# 
l1093h:
	ld (hl),000h		;1093	36 00 	6 . 
	ex de,hl			;1095	eb 	. 
	ld hl,04130h		;1096	21 30 41 	! 0 A 
	ret			;1099	c9 	. 
l109ah:
	inc hl			;109a	23 	# 
	push bc			;109b	c5 	. 
	cp 004h		;109c	fe 04 	. . 
	ld a,d			;109e	7a 	z 
	jp nc,l1109h		;109f	d2 09 11 	. . . 
	rra			;10a2	1f 	. 
	jp c,l11a3h		;10a3	da a3 11 	. . . 
	ld bc,00603h		;10a6	01 03 06 	. . . 
	call sub_1289h		;10a9	cd 89 12 	. . . 
	pop de			;10ac	d1 	. 
	ld a,d			;10ad	7a 	z 
	sub 005h		;10ae	d6 05 	. . 
	call p,sub_1269h		;10b0	f4 69 12 	. i . 
	call sub_132fh		;10b3	cd 2f 13 	. / . 
l10b6h:
	ld a,e			;10b6	7b 	{ 
	or a			;10b7	b7 	. 
	call z,sub_092fh		;10b8	cc 2f 09 	. / . 
	dec a			;10bb	3d 	= 
	call p,sub_1269h		;10bc	f4 69 12 	. i . 
l10bfh:
	push hl			;10bf	e5 	. 
	call sub_0ff5h		;10c0	cd f5 0f 	. . . 
	pop hl			;10c3	e1 	. 
	jr z,l10c8h		;10c4	28 02 	( . 
	ld (hl),b			;10c6	70 	p 
	inc hl			;10c7	23 	# 
l10c8h:
	ld (hl),000h		;10c8	36 00 	6 . 
	ld hl,0412fh		;10ca	21 2f 41 	! / A 
l10cdh:
	inc hl			;10cd	23 	# 
l10ceh:
	ld a,(040f3h)		;10ce	3a f3 40 	: . @ 
	sub l			;10d1	95 	. 
	sub d			;10d2	92 	. 
	ret z			;10d3	c8 	. 
	ld a,(hl)			;10d4	7e 	~ 
	cp 020h		;10d5	fe 20 	.   
	jr z,l10cdh		;10d7	28 f4 	( . 
	cp 02ah		;10d9	fe 2a 	. * 
	jr z,l10cdh		;10db	28 f0 	( . 
	dec hl			;10dd	2b 	+ 
	push hl			;10de	e5 	. 
l10dfh:
	push af			;10df	f5 	. 
	ld bc,l10dfh		;10e0	01 df 10 	. . . 
	push bc			;10e3	c5 	. 
	rst 10h			;10e4	d7 	. 
	cp 02dh		;10e5	fe 2d 	. - 
	ret z			;10e7	c8 	. 
	cp 02bh		;10e8	fe 2b 	. + 
	ret z			;10ea	c8 	. 
	cp 024h		;10eb	fe 24 	. $ 
	ret z			;10ed	c8 	. 
	pop bc			;10ee	c1 	. 
	cp 030h		;10ef	fe 30 	. 0 
	jr nz,l1102h		;10f1	20 0f 	  . 
	inc hl			;10f3	23 	# 
	rst 10h			;10f4	d7 	. 
	jr nc,l1102h		;10f5	30 0b 	0 . 
	dec hl			;10f7	2b 	+ 
	ld bc,0772bh		;10f8	01 2b 77 	. + w 
	pop af			;10fb	f1 	. 
	jr z,$-3		;10fc	28 fb 	( . 
	pop bc			;10fe	c1 	. 
	jp l10ceh		;10ff	c3 ce 10 	. . . 
l1102h:
	pop af			;1102	f1 	. 
	jr z,l1102h		;1103	28 fd 	( . 
	pop hl			;1105	e1 	. 
	ld (hl),025h		;1106	36 25 	6 % 
	ret			;1108	c9 	. 
l1109h:
	push hl			;1109	e5 	. 
	rra			;110a	1f 	. 
	jp c,l11aah		;110b	da aa 11 	. . . 
	jr z,l1124h		;110e	28 14 	( . 
	ld de,l1384h		;1110	11 84 13 	. . . 
	call sub_0a49h		;1113	cd 49 0a 	. I . 
	ld d,010h		;1116	16 10 	. . 
	jp m,l1132h		;1118	fa 32 11 	. 2 . 
l111bh:
	pop hl			;111b	e1 	. 
	pop bc			;111c	c1 	. 
	call sub_0fbdh		;111d	cd bd 0f 	. . . 
	dec hl			;1120	2b 	+ 
	ld (hl),025h		;1121	36 25 	6 % 
	ret			;1123	c9 	. 
l1124h:
	ld bc,0b60eh		;1124	01 0e b6 	. . . 
	ld de,l1bcah		;1127	11 ca 1b 	. . . 
	call sub_0a0ch		;112a	cd 0c 0a 	. . . 
	jp p,l111bh		;112d	f2 1b 11 	. . . 
	ld d,006h		;1130	16 06 	. . 
l1132h:
	call sub_0955h		;1132	cd 55 09 	. U . 
	call nz,sub_1201h		;1135	c4 01 12 	. . . 
	pop hl			;1138	e1 	. 
	pop bc			;1139	c1 	. 
	jp m,l1157h		;113a	fa 57 11 	. W . 
	push bc			;113d	c5 	. 
	ld e,a			;113e	5f 	_ 
	ld a,b			;113f	78 	x 
	sub d			;1140	92 	. 
	sub e			;1141	93 	. 
	call p,sub_1269h		;1142	f4 69 12 	. i . 
	call sub_127dh		;1145	cd 7d 12 	. } . 
	call sub_12a4h		;1148	cd a4 12 	. . . 
	or e			;114b	b3 	. 
	call nz,sub_1277h		;114c	c4 77 12 	. w . 
	or e			;114f	b3 	. 
	call nz,sub_1291h		;1150	c4 91 12 	. . . 
	pop de			;1153	d1 	. 
	jp l10b6h		;1154	c3 b6 10 	. . . 
l1157h:
	ld e,a			;1157	5f 	_ 
	ld a,c			;1158	79 	y 
	or a			;1159	b7 	. 
	call nz,sub_0f16h		;115a	c4 16 0f 	. . . 
	add a,e			;115d	83 	. 
	jp m,l1162h		;115e	fa 62 11 	. b . 
	xor a			;1161	af 	. 
l1162h:
	push bc			;1162	c5 	. 
	push af			;1163	f5 	. 
l1164h:
	call m,sub_0f18h		;1164	fc 18 0f 	. . . 
	jp m,l1164h		;1167	fa 64 11 	. d . 
	pop bc			;116a	c1 	. 
	ld a,e			;116b	7b 	{ 
	sub b			;116c	90 	. 
	pop bc			;116d	c1 	. 
	ld e,a			;116e	5f 	_ 
	add a,d			;116f	82 	. 
	ld a,b			;1170	78 	x 
	jp m,l117fh		;1171	fa 7f 11 	.  . 
	sub d			;1174	92 	. 
	sub e			;1175	93 	. 
	call p,sub_1269h		;1176	f4 69 12 	. i . 
	push bc			;1179	c5 	. 
	call sub_127dh		;117a	cd 7d 12 	. } . 
	jr l1190h		;117d	18 11 	. . 
l117fh:
	call sub_1269h		;117f	cd 69 12 	. i . 
	ld a,c			;1182	79 	y 
	call sub_1294h		;1183	cd 94 12 	. . . 
	ld c,a			;1186	4f 	O 
	xor a			;1187	af 	. 
	sub d			;1188	92 	. 
	sub e			;1189	93 	. 
	call sub_1269h		;118a	cd 69 12 	. i . 
	push bc			;118d	c5 	. 
	ld b,a			;118e	47 	G 
	ld c,a			;118f	4f 	O 
l1190h:
	call sub_12a4h		;1190	cd a4 12 	. . . 
	pop bc			;1193	c1 	. 
	or c			;1194	b1 	. 
	jr nz,l119ah		;1195	20 03 	  . 
	ld hl,(040f3h)		;1197	2a f3 40 	* . @ 
l119ah:
	add a,e			;119a	83 	. 
	dec a			;119b	3d 	= 
	call p,sub_1269h		;119c	f4 69 12 	. i . 
	ld d,b			;119f	50 	P 
	jp l10bfh		;11a0	c3 bf 10 	. . . 
l11a3h:
	push hl			;11a3	e5 	. 
	push de			;11a4	d5 	. 
	call l0acch		;11a5	cd cc 0a 	. . . 
	pop de			;11a8	d1 	. 
	xor a			;11a9	af 	. 
l11aah:
	jp z,011b0h		;11aa	ca b0 11 	. . . 
	ld e,010h		;11ad	1e 10 	. . 
	ld bc,l061eh		;11af	01 1e 06 	. . . 
	call sub_0955h		;11b2	cd 55 09 	. U . 
	scf			;11b5	37 	7 
	call nz,sub_1201h		;11b6	c4 01 12 	. . . 
	pop hl			;11b9	e1 	. 
	pop bc			;11ba	c1 	. 
	push af			;11bb	f5 	. 
	ld a,c			;11bc	79 	y 
	or a			;11bd	b7 	. 
	push af			;11be	f5 	. 
	call nz,sub_0f16h		;11bf	c4 16 0f 	. . . 
	add a,b			;11c2	80 	. 
	ld c,a			;11c3	4f 	O 
	ld a,d			;11c4	7a 	z 
	and 004h		;11c5	e6 04 	. . 
	cp 001h		;11c7	fe 01 	. . 
	sbc a,a			;11c9	9f 	. 
	ld d,a			;11ca	57 	W 
	add a,c			;11cb	81 	. 
	ld c,a			;11cc	4f 	O 
	sub e			;11cd	93 	. 
	push af			;11ce	f5 	. 
	push bc			;11cf	c5 	. 
l11d0h:
	call m,sub_0f18h		;11d0	fc 18 0f 	. . . 
	jp m,l11d0h		;11d3	fa d0 11 	. . . 
	pop bc			;11d6	c1 	. 
	pop af			;11d7	f1 	. 
	push bc			;11d8	c5 	. 
	push af			;11d9	f5 	. 
	jp m,l11deh		;11da	fa de 11 	. . . 
	xor a			;11dd	af 	. 
l11deh:
	cpl			;11de	2f 	/ 
	inc a			;11df	3c 	< 
	add a,b			;11e0	80 	. 
	inc a			;11e1	3c 	< 
	add a,d			;11e2	82 	. 
	ld b,a			;11e3	47 	G 
	ld c,000h		;11e4	0e 00 	. . 
	call sub_12a4h		;11e6	cd a4 12 	. . . 
	pop af			;11e9	f1 	. 
	call p,sub_1271h		;11ea	f4 71 12 	. q . 
	pop bc			;11ed	c1 	. 
	pop af			;11ee	f1 	. 
	call z,sub_092fh		;11ef	cc 2f 09 	. / . 
	pop af			;11f2	f1 	. 
	jr c,l11f8h		;11f3	38 03 	8 . 
	add a,e			;11f5	83 	. 
	sub b			;11f6	90 	. 
	sub d			;11f7	92 	. 
l11f8h:
	push bc			;11f8	c5 	. 
	call sub_1074h		;11f9	cd 74 10 	. t . 
	ex de,hl			;11fc	eb 	. 
	pop de			;11fd	d1 	. 
	jp l10bfh		;11fe	c3 bf 10 	. . . 
sub_1201h:
	push de			;1201	d5 	. 
	xor a			;1202	af 	. 
	push af			;1203	f5 	. 
	rst 20h			;1204	e7 	. 
	jp po,l1222h		;1205	e2 22 12 	. " . 
l1208h:
	ld a,(04124h)		;1208	3a 24 41 	: $ A 
	cp 091h		;120b	fe 91 	. . 
	jp nc,l1222h		;120d	d2 22 12 	. " . 
	ld de,l1364h		;1210	11 64 13 	. d . 
	ld hl,04127h		;1213	21 27 41 	! ' A 
	call l09d3h		;1216	cd d3 09 	. . . 
	call sub_0da1h		;1219	cd a1 0d 	. . . 
	pop af			;121c	f1 	. 
	sub 00ah		;121d	d6 0a 	. . 
	push af			;121f	f5 	. 
	jr l1208h		;1220	18 e6 	. . 
l1222h:
	call sub_124fh		;1222	cd 4f 12 	. O . 
l1225h:
	rst 20h			;1225	e7 	. 
	jr nc,l1233h		;1226	30 0b 	0 . 
	ld bc,09143h		;1228	01 43 91 	. C . 
	ld de,04ff9h		;122b	11 f9 4f 	. . O 
	call sub_0a0ch		;122e	cd 0c 0a 	. . . 
	jr l1239h		;1231	18 06 	. . 
l1233h:
	ld de,l136ch		;1233	11 6c 13 	. l . 
	call sub_0a49h		;1236	cd 49 0a 	. I . 
l1239h:
	jp p,l124bh		;1239	f2 4b 12 	. K . 
	pop af			;123c	f1 	. 
	call sub_0f0bh		;123d	cd 0b 0f 	. . . 
	push af			;1240	f5 	. 
	jr l1225h		;1241	18 e2 	. . 
l1243h:
	pop af			;1243	f1 	. 
	call sub_0f18h		;1244	cd 18 0f 	. . . 
	push af			;1247	f5 	. 
	call sub_124fh		;1248	cd 4f 12 	. O . 
l124bh:
	pop af			;124b	f1 	. 
	or a			;124c	b7 	. 
	pop de			;124d	d1 	. 
	ret			;124e	c9 	. 
sub_124fh:
	rst 20h			;124f	e7 	. 
	jp pe,l125eh		;1250	ea 5e 12 	. ^ . 
	ld bc,09474h		;1253	01 74 94 	. t . 
	ld de,l23f8h		;1256	11 f8 23 	. . # 
	call sub_0a0ch		;1259	cd 0c 0a 	. . . 
	jr l1264h		;125c	18 06 	. . 
l125eh:
	ld de,l1374h		;125e	11 74 13 	. t . 
	call sub_0a49h		;1261	cd 49 0a 	. I . 
l1264h:
	pop hl			;1264	e1 	. 
	jp p,l1243h		;1265	f2 43 12 	. C . 
	jp (hl)			;1268	e9 	. 
sub_1269h:
	or a			;1269	b7 	. 
l126ah:
	ret z			;126a	c8 	. 
	dec a			;126b	3d 	= 
	ld (hl),030h		;126c	36 30 	6 0 
	inc hl			;126e	23 	# 
	jr l126ah		;126f	18 f9 	. . 
sub_1271h:
	jr nz,sub_1277h		;1271	20 04 	  . 
l1273h:
	ret z			;1273	c8 	. 
	call sub_1291h		;1274	cd 91 12 	. . . 
sub_1277h:
	ld (hl),030h		;1277	36 30 	6 0 
	inc hl			;1279	23 	# 
	dec a			;127a	3d 	= 
	jr l1273h		;127b	18 f6 	. . 
sub_127dh:
	ld a,e			;127d	7b 	{ 
	add a,d			;127e	82 	. 
	inc a			;127f	3c 	< 
	ld b,a			;1280	47 	G 
	inc a			;1281	3c 	< 
l1282h:
	sub 003h		;1282	d6 03 	. . 
	jr nc,l1282h		;1284	30 fc 	0 . 
	add a,005h		;1286	c6 05 	. . 
	ld c,a			;1288	4f 	O 
sub_1289h:
	ld a,(040d8h)		;1289	3a d8 40 	: . @ 
	and 040h		;128c	e6 40 	. @ 
	ret nz			;128e	c0 	. 
	ld c,a			;128f	4f 	O 
	ret			;1290	c9 	. 
sub_1291h:
	dec b			;1291	05 	. 
	jr nz,l129ch		;1292	20 08 	  . 
sub_1294h:
	ld (hl),02eh		;1294	36 2e 	6 . 
	ld (040f3h),hl		;1296	22 f3 40 	" . @ 
	inc hl			;1299	23 	# 
	ld c,b			;129a	48 	H 
	ret			;129b	c9 	. 
l129ch:
	dec c			;129c	0d 	. 
	ret nz			;129d	c0 	. 
	ld (hl),02ch		;129e	36 2c 	6 , 
	inc hl			;12a0	23 	# 
	ld c,003h		;12a1	0e 03 	. . 
	ret			;12a3	c9 	. 
sub_12a4h:
	push de			;12a4	d5 	. 
	rst 20h			;12a5	e7 	. 
	jp po,l12eah		;12a6	e2 ea 12 	. . . 
	push bc			;12a9	c5 	. 
	push hl			;12aa	e5 	. 
	call sub_09fch		;12ab	cd fc 09 	. . . 
	ld hl,l137ch		;12ae	21 7c 13 	! | . 
	call sub_09f7h		;12b1	cd f7 09 	. . . 
	call sub_0c77h		;12b4	cd 77 0c 	. w . 
	xor a			;12b7	af 	. 
	call sub_0b7bh		;12b8	cd 7b 0b 	. { . 
	pop hl			;12bb	e1 	. 
	pop bc			;12bc	c1 	. 
	ld de,l138ch		;12bd	11 8c 13 	. . . 
	ld a,00ah		;12c0	3e 0a 	> . 
l12c2h:
	call sub_1291h		;12c2	cd 91 12 	. . . 
	push bc			;12c5	c5 	. 
	push af			;12c6	f5 	. 
	push hl			;12c7	e5 	. 
	push de			;12c8	d5 	. 
	ld b,02fh		;12c9	06 2f 	. / 
l12cbh:
	inc b			;12cb	04 	. 
	pop hl			;12cc	e1 	. 
	push hl			;12cd	e5 	. 
	call sub_0d48h		;12ce	cd 48 0d 	. H . 
	jr nc,l12cbh		;12d1	30 f8 	0 . 
	pop hl			;12d3	e1 	. 
	call sub_0d36h		;12d4	cd 36 0d 	. 6 . 
	ex de,hl			;12d7	eb 	. 
	pop hl			;12d8	e1 	. 
	ld (hl),b			;12d9	70 	p 
	inc hl			;12da	23 	# 
	pop af			;12db	f1 	. 
	pop bc			;12dc	c1 	. 
	dec a			;12dd	3d 	= 
	jr nz,l12c2h		;12de	20 e2 	  . 
	push bc			;12e0	c5 	. 
	push hl			;12e1	e5 	. 
	ld hl,0411dh		;12e2	21 1d 41 	! . A 
	call sub_09b1h		;12e5	cd b1 09 	. . . 
	jr l12f6h		;12e8	18 0c 	. . 
l12eah:
	push bc			;12ea	c5 	. 
	push hl			;12eb	e5 	. 
	call sub_0708h		;12ec	cd 08 07 	. . . 
	inc a			;12ef	3c 	< 
	call sub_0afbh		;12f0	cd fb 0a 	. . . 
	call l09b4h		;12f3	cd b4 09 	. . . 
l12f6h:
	pop hl			;12f6	e1 	. 
	pop bc			;12f7	c1 	. 
	xor a			;12f8	af 	. 
	ld de,l13d2h		;12f9	11 d2 13 	. . . 
l12fch:
	ccf			;12fc	3f 	? 
	call sub_1291h		;12fd	cd 91 12 	. . . 
	push bc			;1300	c5 	. 
	push af			;1301	f5 	. 
	push hl			;1302	e5 	. 
	push de			;1303	d5 	. 
	call sub_09bfh		;1304	cd bf 09 	. . . 
	pop hl			;1307	e1 	. 
	ld b,02fh		;1308	06 2f 	. / 
l130ah:
	inc b			;130a	04 	. 
	ld a,e			;130b	7b 	{ 
	sub (hl)			;130c	96 	. 
	ld e,a			;130d	5f 	_ 
	inc hl			;130e	23 	# 
	ld a,d			;130f	7a 	z 
	sbc a,(hl)			;1310	9e 	. 
	ld d,a			;1311	57 	W 
	inc hl			;1312	23 	# 
	ld a,c			;1313	79 	y 
	sbc a,(hl)			;1314	9e 	. 
	ld c,a			;1315	4f 	O 
	dec hl			;1316	2b 	+ 
	dec hl			;1317	2b 	+ 
	jr nc,l130ah		;1318	30 f0 	0 . 
	call sub_07b7h		;131a	cd b7 07 	. . . 
	inc hl			;131d	23 	# 
	call l09b4h		;131e	cd b4 09 	. . . 
	ex de,hl			;1321	eb 	. 
	pop hl			;1322	e1 	. 
	ld (hl),b			;1323	70 	p 
	inc hl			;1324	23 	# 
	pop af			;1325	f1 	. 
	pop bc			;1326	c1 	. 
	jr c,l12fch		;1327	38 d3 	8 . 
	inc de			;1329	13 	. 
	inc de			;132a	13 	. 
	ld a,004h		;132b	3e 04 	> . 
	jr l1335h		;132d	18 06 	. . 
sub_132fh:
	push de			;132f	d5 	. 
	ld de,l13d8h		;1330	11 d8 13 	. . . 
	ld a,005h		;1333	3e 05 	> . 
l1335h:
	call sub_1291h		;1335	cd 91 12 	. . . 
	push bc			;1338	c5 	. 
	push af			;1339	f5 	. 
	push hl			;133a	e5 	. 
	ex de,hl			;133b	eb 	. 
	ld c,(hl)			;133c	4e 	N 
	inc hl			;133d	23 	# 
	ld b,(hl)			;133e	46 	F 
	push bc			;133f	c5 	. 
	inc hl			;1340	23 	# 
	ex (sp),hl			;1341	e3 	. 
	ex de,hl			;1342	eb 	. 
	ld hl,(04121h)		;1343	2a 21 41 	* ! A 
	ld b,02fh		;1346	06 2f 	. / 
l1348h:
	inc b			;1348	04 	. 
l1349h:
	ld a,l			;1349	7d 	} 
	sub e			;134a	93 	. 
	ld l,a			;134b	6f 	o 
	ld a,h			;134c	7c 	| 
	sbc a,d			;134d	9a 	. 
	ld h,a			;134e	67 	g 
	jr nc,l1348h		;134f	30 f7 	0 . 
	add hl,de			;1351	19 	. 
	ld (04121h),hl		;1352	22 21 41 	" ! A 
	pop de			;1355	d1 	. 
	pop hl			;1356	e1 	. 
	ld (hl),b			;1357	70 	p 
	inc hl			;1358	23 	# 
	pop af			;1359	f1 	. 
	pop bc			;135a	c1 	. 
	dec a			;135b	3d 	= 
	jr nz,l1335h		;135c	20 d7 	  . 
	call sub_1291h		;135e	cd 91 12 	. . . 
	ld (hl),a			;1361	77 	w 
	pop de			;1362	d1 	. 
	ret			;1363	c9 	. 
l1364h:
	nop			;1364	00 	. 
	nop			;1365	00 	. 
	nop			;1366	00 	. 
	nop			;1367	00 	. 
	ld sp,hl			;1368	f9 	. 
	ld (bc),a			;1369	02 	. 
	dec d			;136a	15 	. 
	and d			;136b	a2 	. 
l136ch:
	defb 0fdh,0ffh,09fh	;illegal sequence		;136c	fd ff 9f 	. . . 
	ld sp,05fa9h		;136f	31 a9 5f 	1 . _ 
	ld h,e			;1372	63 	c 
	or d			;1373	b2 	. 
l1374h:
	cp 0ffh		;1374	fe ff 	. . 
	inc bc			;1376	03 	. 
	cp a			;1377	bf 	. 
	ret			;1378	c9 	. 
	dec de			;1379	1b 	. 
	ld c,0b6h		;137a	0e b6 	. . 
l137ch:
	nop			;137c	00 	. 
	nop			;137d	00 	. 
	nop			;137e	00 	. 
	nop			;137f	00 	. 
l1380h:
	nop			;1380	00 	. 
	nop			;1381	00 	. 
	nop			;1382	00 	. 
	add a,b			;1383	80 	. 
l1384h:
	nop			;1384	00 	. 
	nop			;1385	00 	. 
	inc b			;1386	04 	. 
	cp a			;1387	bf 	. 
	ret			;1388	c9 	. 
	dec de			;1389	1b 	. 
	ld c,0b6h		;138a	0e b6 	. . 
l138ch:
	nop			;138c	00 	. 
	add a,b			;138d	80 	. 
	add a,0a4h		;138e	c6 a4 	. . 
	ld a,(hl)			;1390	7e 	~ 
	adc a,l			;1391	8d 	. 
	inc bc			;1392	03 	. 
	nop			;1393	00 	. 
	ld b,b			;1394	40 	@ 
	ld a,d			;1395	7a 	z 
	djnz $-11		;1396	10 f3 	. . 
	ld e,d			;1398	5a 	Z 
	nop			;1399	00 	. 
	nop			;139a	00 	. 
	and b			;139b	a0 	. 
	ld (hl),d			;139c	72 	r 
	ld c,(hl)			;139d	4e 	N 
	jr l13a9h		;139e	18 09 	. . 
	nop			;13a0	00 	. 
	nop			;13a1	00 	. 
	djnz l1349h		;13a2	10 a5 	. . 
	call nc,sub_00e8h		;13a4	d4 e8 00 	. . . 
	nop			;13a7	00 	. 
	nop			;13a8	00 	. 
l13a9h:
	ret pe			;13a9	e8 	. 
	halt			;13aa	76 	v 
	ld c,b			;13ab	48 	H 
	rla			;13ac	17 	. 
	nop			;13ad	00 	. 
	nop			;13ae	00 	. 
	nop			;13af	00 	. 
	call po,0540bh		;13b0	e4 0b 54 	. . T 
	ld (bc),a			;13b3	02 	. 
	nop			;13b4	00 	. 
	nop			;13b5	00 	. 
	nop			;13b6	00 	. 
	jp z,03b9ah		;13b7	ca 9a 3b 	. . ; 
	nop			;13ba	00 	. 
	nop			;13bb	00 	. 
	nop			;13bc	00 	. 
	nop			;13bd	00 	. 
	pop hl			;13be	e1 	. 
	push af			;13bf	f5 	. 
	dec b			;13c0	05 	. 
	nop			;13c1	00 	. 
	nop			;13c2	00 	. 
	nop			;13c3	00 	. 
	add a,b			;13c4	80 	. 
	sub (hl)			;13c5	96 	. 
	sbc a,b			;13c6	98 	. 
	nop			;13c7	00 	. 
	nop			;13c8	00 	. 
	nop			;13c9	00 	. 
	nop			;13ca	00 	. 
	ld b,b			;13cb	40 	@ 
	ld b,d			;13cc	42 	B 
	rrca			;13cd	0f 	. 
	nop			;13ce	00 	. 
	nop			;13cf	00 	. 
	nop			;13d0	00 	. 
	nop			;13d1	00 	. 
l13d2h:
	and b			;13d2	a0 	. 
	add a,(hl)			;13d3	86 	. 
	ld bc,l2710h		;13d4	01 10 27 	. . ' 
	nop			;13d7	00 	. 
l13d8h:
	djnz l1401h		;13d8	10 27 	. ' 
	ret pe			;13da	e8 	. 
	inc bc			;13db	03 	. 
	ld h,h			;13dc	64 	d 
	nop			;13dd	00 	. 
	ld a,(bc)			;13de	0a 	. 
	nop			;13df	00 	. 
	ld bc,l2100h		;13e0	01 00 21 	. . ! 
	add a,d			;13e3	82 	. 
	add hl,bc			;13e4	09 	. 
	ex (sp),hl			;13e5	e3 	. 
	jp (hl)			;13e6	e9 	. 
	call sub_09a4h		;13e7	cd a4 09 	. . . 
	ld hl,l1380h		;13ea	21 80 13 	! . . 
	call sub_09b1h		;13ed	cd b1 09 	. . . 
	jr l13f5h		;13f0	18 03 	. . 
l13f2h:
	call sub_0ab1h		;13f2	cd b1 0a 	. . . 
l13f5h:
	pop bc			;13f5	c1 	. 
	pop de			;13f6	d1 	. 
	call sub_0955h		;13f7	cd 55 09 	. U . 
	ld a,b			;13fa	78 	x 
	jr z,l1439h		;13fb	28 3c 	( < 
	jp p,l1404h		;13fd	f2 04 14 	. . . 
	or a			;1400	b7 	. 
l1401h:
	jp z,0199ah		;1401	ca 9a 19 	. . . 
l1404h:
	or a			;1404	b7 	. 
	jp z,l0779h		;1405	ca 79 07 	. y . 
	push de			;1408	d5 	. 
	push bc			;1409	c5 	. 
	ld a,c			;140a	79 	y 
	or 07fh		;140b	f6 7f 	.  
	call sub_09bfh		;140d	cd bf 09 	. . . 
	jp p,l1421h		;1410	f2 21 14 	. ! . 
	push de			;1413	d5 	. 
	push bc			;1414	c5 	. 
	call sub_0b40h		;1415	cd 40 0b 	. @ . 
	pop bc			;1418	c1 	. 
	pop de			;1419	d1 	. 
	push af			;141a	f5 	. 
	call sub_0a0ch		;141b	cd 0c 0a 	. . . 
l141eh:
	pop hl			;141e	e1 	. 
	ld a,h			;141f	7c 	| 
	rra			;1420	1f 	. 
l1421h:
	pop hl			;1421	e1 	. 
	ld (04123h),hl		;1422	22 23 41 	" # A 
	pop hl			;1425	e1 	. 
	ld (04121h),hl		;1426	22 21 41 	" ! A 
	call c,013e2h		;1429	dc e2 13 	. . . 
	call z,sub_0982h		;142c	cc 82 09 	. . . 
	push de			;142f	d5 	. 
	push bc			;1430	c5 	. 
	call sub_0809h		;1431	cd 09 08 	. . . 
	pop bc			;1434	c1 	. 
	pop de			;1435	d1 	. 
	call l0847h		;1436	cd 47 08 	. G . 
l1439h:
	call sub_09a4h		;1439	cd a4 09 	. . . 
	ld bc,08138h		;143c	01 38 81 	. 8 . 
	ld de,0aa3bh		;143f	11 3b aa 	. ; . 
	call l0847h		;1442	cd 47 08 	. G . 
	ld a,(04124h)		;1445	3a 24 41 	: $ A 
	cp 088h		;1448	fe 88 	. . 
	jp nc,l0931h		;144a	d2 31 09 	. 1 . 
	call sub_0b40h		;144d	cd 40 0b 	. @ . 
	add a,080h		;1450	c6 80 	. . 
	add a,002h		;1452	c6 02 	. . 
	jp c,l0931h		;1454	da 31 09 	. 1 . 
	push af			;1457	f5 	. 
	ld hl,l07f8h		;1458	21 f8 07 	! . . 
	call sub_070bh		;145b	cd 0b 07 	. . . 
	call sub_0841h		;145e	cd 41 08 	. A . 
	pop af			;1461	f1 	. 
	pop bc			;1462	c1 	. 
	pop de			;1463	d1 	. 
	push af			;1464	f5 	. 
	call sub_0713h		;1465	cd 13 07 	. . . 
	call sub_0982h		;1468	cd 82 09 	. . . 
	ld hl,l1479h		;146b	21 79 14 	! y . 
	call sub_14a9h		;146e	cd a9 14 	. . . 
	ld de,l0000h		;1471	11 00 00 	. . . 
	pop bc			;1474	c1 	. 
	ld c,d			;1475	4a 	J 
	jp l0847h		;1476	c3 47 08 	. G . 
l1479h:
	ex af,af'			;1479	08 	. 
	ld b,b			;147a	40 	@ 
	ld l,094h		;147b	2e 94 	. . 
	ld (hl),h			;147d	74 	t 
	ld (hl),b			;147e	70 	p 
	ld c,a			;147f	4f 	O 
	ld l,077h		;1480	2e 77 	. w 
	ld l,(hl)			;1482	6e 	n 
	ld (bc),a			;1483	02 	. 
	adc a,b			;1484	88 	. 
	ld a,d			;1485	7a 	z 
	and 0a0h		;1486	e6 a0 	. . 
	ld hl,(0507ch)		;1488	2a 7c 50 	* | P 
	xor d			;148b	aa 	. 
	xor d			;148c	aa 	. 
	ld a,(hl)			;148d	7e 	~ 
	rst 38h			;148e	ff 	. 
	rst 38h			;148f	ff 	. 
	ld a,a			;1490	7f 	 
	ld a,a			;1491	7f 	 
	nop			;1492	00 	. 
	nop			;1493	00 	. 
	add a,b			;1494	80 	. 
	add a,c			;1495	81 	. 
	nop			;1496	00 	. 
	nop			;1497	00 	. 
	nop			;1498	00 	. 
	add a,c			;1499	81 	. 
sub_149ah:
	call sub_09a4h		;149a	cd a4 09 	. . . 
	ld de,l0c32h		;149d	11 32 0c 	. 2 . 
	push de			;14a0	d5 	. 
	push hl			;14a1	e5 	. 
	call sub_09bfh		;14a2	cd bf 09 	. . . 
	call l0847h		;14a5	cd 47 08 	. G . 
	pop hl			;14a8	e1 	. 
sub_14a9h:
	call sub_09a4h		;14a9	cd a4 09 	. . . 
	ld a,(hl)			;14ac	7e 	~ 
	inc hl			;14ad	23 	# 
	call sub_09b1h		;14ae	cd b1 09 	. . . 
	ld b,0f1h		;14b1	06 f1 	. . 
	pop bc			;14b3	c1 	. 
	pop de			;14b4	d1 	. 
	dec a			;14b5	3d 	= 
	ret z			;14b6	c8 	. 
	push de			;14b7	d5 	. 
	push bc			;14b8	c5 	. 
	push af			;14b9	f5 	. 
	push hl			;14ba	e5 	. 
	call l0847h		;14bb	cd 47 08 	. G . 
	pop hl			;14be	e1 	. 
	call sub_09c2h		;14bf	cd c2 09 	. . . 
	push hl			;14c2	e5 	. 
	call l0716h		;14c3	cd 16 07 	. . . 
	pop hl			;14c6	e1 	. 
	jr $-21		;14c7	18 e9 	. . 
	call l0a7fh		;14c9	cd 7f 0a 	.  . 
	ld a,h			;14cc	7c 	| 
	or a			;14cd	b7 	. 
	jp m,l1e4ah		;14ce	fa 4a 1e 	. J . 
	or l			;14d1	b5 	. 
	jp z,l14f0h		;14d2	ca f0 14 	. . . 
	push hl			;14d5	e5 	. 
	call l14f0h		;14d6	cd f0 14 	. . . 
	call sub_09bfh		;14d9	cd bf 09 	. . . 
	ex de,hl			;14dc	eb 	. 
	ex (sp),hl			;14dd	e3 	. 
	push bc			;14de	c5 	. 
	call sub_0acfh		;14df	cd cf 0a 	. . . 
	pop bc			;14e2	c1 	. 
	pop de			;14e3	d1 	. 
	call l0847h		;14e4	cd 47 08 	. G . 
	ld hl,l07f8h		;14e7	21 f8 07 	! . . 
	call sub_070bh		;14ea	cd 0b 07 	. . . 
	jp sub_0b40h		;14ed	c3 40 0b 	. @ . 
l14f0h:
	ld hl,04090h		;14f0	21 90 40 	! . @ 
	push hl			;14f3	e5 	. 
	ld de,l0000h		;14f4	11 00 00 	. . . 
	ld c,e			;14f7	4b 	K 
	ld h,003h		;14f8	26 03 	& . 
l14fah:
	ld l,008h		;14fa	2e 08 	. . 
l14fch:
	ex de,hl			;14fc	eb 	. 
	add hl,hl			;14fd	29 	) 
	ex de,hl			;14fe	eb 	. 
	ld a,c			;14ff	79 	y 
	rla			;1500	17 	. 
	ld c,a			;1501	4f 	O 
	ex (sp),hl			;1502	e3 	. 
	ld a,(hl)			;1503	7e 	~ 
	rlca			;1504	07 	. 
	ld (hl),a			;1505	77 	w 
	ex (sp),hl			;1506	e3 	. 
	jp nc,l1516h		;1507	d2 16 15 	. . . 
	push hl			;150a	e5 	. 
	ld hl,(040aah)		;150b	2a aa 40 	* . @ 
	add hl,de			;150e	19 	. 
	ex de,hl			;150f	eb 	. 
	ld a,(040ach)		;1510	3a ac 40 	: . @ 
	adc a,c			;1513	89 	. 
	ld c,a			;1514	4f 	O 
	pop hl			;1515	e1 	. 
l1516h:
	dec l			;1516	2d 	- 
	jp nz,l14fch		;1517	c2 fc 14 	. . . 
	ex (sp),hl			;151a	e3 	. 
	inc hl			;151b	23 	# 
	ex (sp),hl			;151c	e3 	. 
	dec h			;151d	25 	% 
	jp nz,l14fah		;151e	c2 fa 14 	. . . 
	pop hl			;1521	e1 	. 
	ld hl,0b065h		;1522	21 65 b0 	! e . 
	add hl,de			;1525	19 	. 
	ld (040aah),hl		;1526	22 aa 40 	" . @ 
	call 00aefh		;1529	cd ef 0a 	. . . 
	ld a,005h		;152c	3e 05 	> . 
	adc a,c			;152e	89 	. 
	ld (040ach),a		;152f	32 ac 40 	2 . @ 
	ex de,hl			;1532	eb 	. 
	ld b,080h		;1533	06 80 	. . 
	ld hl,04125h		;1535	21 25 41 	! % A 
	ld (hl),b			;1538	70 	p 
	dec hl			;1539	2b 	+ 
	ld (hl),b			;153a	70 	p 
	ld c,a			;153b	4f 	O 
	ld b,000h		;153c	06 00 	. . 
	jp l0765h		;153e	c3 65 07 	. e . 
sub_1541h:
	ld hl,l158bh		;1541	21 8b 15 	! . . 
	call sub_070bh		;1544	cd 0b 07 	. . . 
sub_1547h:
	call sub_09a4h		;1547	cd a4 09 	. . . 
	ld bc,08349h		;154a	01 49 83 	. I . 
	ld de,00fdbh		;154d	11 db 0f 	. . . 
	call l09b4h		;1550	cd b4 09 	. . . 
	pop bc			;1553	c1 	. 
	pop de			;1554	d1 	. 
	call sub_08a2h		;1555	cd a2 08 	. . . 
	call sub_09a4h		;1558	cd a4 09 	. . . 
	call sub_0b40h		;155b	cd 40 0b 	. @ . 
	pop bc			;155e	c1 	. 
	pop de			;155f	d1 	. 
	call sub_0713h		;1560	cd 13 07 	. . . 
	ld hl,l158fh		;1563	21 8f 15 	! . . 
	call sub_0710h		;1566	cd 10 07 	. . . 
	call sub_0955h		;1569	cd 55 09 	. U . 
	scf			;156c	37 	7 
	jp p,l1577h		;156d	f2 77 15 	. w . 
	call sub_0708h		;1570	cd 08 07 	. . . 
	call sub_0955h		;1573	cd 55 09 	. U . 
	or a			;1576	b7 	. 
l1577h:
	push af			;1577	f5 	. 
	call p,sub_0982h		;1578	f4 82 09 	. . . 
	ld hl,l158fh		;157b	21 8f 15 	! . . 
	call sub_070bh		;157e	cd 0b 07 	. . . 
	pop af			;1581	f1 	. 
	call nc,sub_0982h		;1582	d4 82 09 	. . . 
	ld hl,l1593h		;1585	21 93 15 	! . . 
	jp sub_149ah		;1588	c3 9a 14 	. . . 
l158bh:
	in a,(00fh)		;158b	db 0f 	. . 
	ld c,c			;158d	49 	I 
	add a,c			;158e	81 	. 
l158fh:
	nop			;158f	00 	. 
	nop			;1590	00 	. 
	nop			;1591	00 	. 
	ld a,a			;1592	7f 	 
l1593h:
	dec b			;1593	05 	. 
	cp d			;1594	ba 	. 
	rst 10h			;1595	d7 	. 
	ld e,086h		;1596	1e 86 	. . 
	ld h,h			;1598	64 	d 
	ld h,099h		;1599	26 99 	& . 
	add a,a			;159b	87 	. 
	ld e,b			;159c	58 	X 
	inc (hl)			;159d	34 	4 
	inc hl			;159e	23 	# 
	add a,a			;159f	87 	. 
	ret po			;15a0	e0 	. 
	ld e,l			;15a1	5d 	] 
	and l			;15a2	a5 	. 
	add a,(hl)			;15a3	86 	. 
	jp c,0490fh		;15a4	da 0f 49 	. . I 
	add a,e			;15a7	83 	. 
	call sub_09a4h		;15a8	cd a4 09 	. . . 
	call sub_1547h		;15ab	cd 47 15 	. G . 
	pop bc			;15ae	c1 	. 
	pop hl			;15af	e1 	. 
	call sub_09a4h		;15b0	cd a4 09 	. . . 
	ex de,hl			;15b3	eb 	. 
	call l09b4h		;15b4	cd b4 09 	. . . 
	call sub_1541h		;15b7	cd 41 15 	. A . 
	jp l08a0h		;15ba	c3 a0 08 	. . . 
	call sub_0955h		;15bd	cd 55 09 	. U . 
	call m,013e2h		;15c0	fc e2 13 	. . . 
	call m,sub_0982h		;15c3	fc 82 09 	. . . 
	ld a,(04124h)		;15c6	3a 24 41 	: $ A 
	cp 081h		;15c9	fe 81 	. . 
	jr c,l15d9h		;15cb	38 0c 	8 . 
	ld bc,08100h		;15cd	01 00 81 	. . . 
	ld d,c			;15d0	51 	Q 
	ld e,c			;15d1	59 	Y 
	call sub_08a2h		;15d2	cd a2 08 	. . . 
	ld hl,sub_0710h		;15d5	21 10 07 	! . . 
	push hl			;15d8	e5 	. 
l15d9h:
	ld hl,l15e3h		;15d9	21 e3 15 	! . . 
	call sub_149ah		;15dc	cd 9a 14 	. . . 
	ld hl,l158bh		;15df	21 8b 15 	! . . 
	ret			;15e2	c9 	. 
l15e3h:
	add hl,bc			;15e3	09 	. 
	ld c,d			;15e4	4a 	J 
	rst 10h			;15e5	d7 	. 
	dec sp			;15e6	3b 	; 
	ld a,b			;15e7	78 	x 
	ld (bc),a			;15e8	02 	. 
	ld l,(hl)			;15e9	6e 	n 
	add a,h			;15ea	84 	. 
	ld a,e			;15eb	7b 	{ 
	cp 0c1h		;15ec	fe c1 	. . 
	cpl			;15ee	2f 	/ 
	ld a,h			;15ef	7c 	| 
	ld (hl),h			;15f0	74 	t 
	ld sp,07d9ah		;15f1	31 9a 7d 	1 . } 
	add a,h			;15f4	84 	. 
	dec a			;15f5	3d 	= 
	ld e,d			;15f6	5a 	Z 
	ld a,l			;15f7	7d 	} 
	ret z			;15f8	c8 	. 
	ld a,a			;15f9	7f 	 
	sub c			;15fa	91 	. 
	ld a,(hl)			;15fb	7e 	~ 
	call po,04cbbh		;15fc	e4 bb 4c 	. . L 
	ld a,(hl)			;15ff	7e 	~ 
	ld l,h			;1600	6c 	l 
	xor d			;1601	aa 	. 
	xor d			;1602	aa 	. 
	ld a,a			;1603	7f 	 
	nop			;1604	00 	. 
	nop			;1605	00 	. 
	nop			;1606	00 	. 
	add a,c			;1607	81 	. 
l1608h:
	adc a,d			;1608	8a 	. 
	add hl,bc			;1609	09 	. 
	scf			;160a	37 	7 
	dec bc			;160b	0b 	. 
	ld (hl),a			;160c	77 	w 
	add hl,bc			;160d	09 	. 
	call nc,0ef27h		;160e	d4 27 ef 	. ' . 
	ld hl,(l27f5h)		;1611	2a f5 27 	* . ' 
	rst 20h			;1614	e7 	. 
	inc de			;1615	13 	. 
	ret			;1616	c9 	. 
	inc d			;1617	14 	. 
	add hl,bc			;1618	09 	. 
	ex af,af'			;1619	08 	. 
	add hl,sp			;161a	39 	9 
	inc d			;161b	14 	. 
	ld b,c			;161c	41 	A 
	dec d			;161d	15 	. 
	ld b,a			;161e	47 	G 
	dec d			;161f	15 	. 
	xor b			;1620	a8 	. 
	dec d			;1621	15 	. 
	cp l			;1622	bd 	. 
	dec d			;1623	15 	. 
	xor d			;1624	aa 	. 
	inc l			;1625	2c 	, 
	ld d,d			;1626	52 	R 
	ld b,c			;1627	41 	A 
	ld e,b			;1628	58 	X 
	ld b,c			;1629	41 	A 
	ld e,(hl)			;162a	5e 	^ 
	ld b,c			;162b	41 	A 
	ld h,c			;162c	61 	a 
	ld b,c			;162d	41 	A 
	ld h,h			;162e	64 	d 
	ld b,c			;162f	41 	A 
	ld h,a			;1630	67 	g 
	ld b,c			;1631	41 	A 
	ld l,d			;1632	6a 	j 
	ld b,c			;1633	41 	A 
	ld l,l			;1634	6d 	m 
	ld b,c			;1635	41 	A 
	ld (hl),b			;1636	70 	p 
	ld b,c			;1637	41 	A 
	ld a,a			;1638	7f 	 
	ld a,(bc)			;1639	0a 	. 
	or c			;163a	b1 	. 
	ld a,(bc)			;163b	0a 	. 
	in a,(00ah)		;163c	db 0a 	. . 
	ld h,00bh		;163e	26 0b 	& . 
	inc bc			;1640	03 	. 
	ld hl,(l2836h)		;1641	2a 36 28 	* 6 ( 
	push bc			;1644	c5 	. 
	ld hl,(l2a0fh)		;1645	2a 0f 2a 	* . * 
	rra			;1648	1f 	. 
	ld hl,(l2a61h)		;1649	2a 61 2a 	* a * 
	sub c			;164c	91 	. 
	ld hl,(l2a9ah)		;164d	2a 9a 2a 	* . * 
l1650h:
	push bc			;1650	c5 	. 
	ld c,(hl)			;1651	4e 	N 
	ld b,h			;1652	44 	D 
	add a,04fh		;1653	c6 4f 	. O 
	ld d,d			;1655	52 	R 
	jp nc,05345h		;1656	d2 45 53 	. E S 
	ld b,l			;1659	45 	E 
	ld d,h			;165a	54 	T 
	out (045h),a		;165b	d3 45 	. E 
	ld d,h			;165d	54 	T 
	jp 0534ch		;165e	c3 4c 53 	. L S 
	jp 0444dh		;1661	c3 4d 44 	. M D 
	jp nc,04e41h		;1664	d2 41 4e 	. A N 
	ld b,h			;1667	44 	D 
	ld c,a			;1668	4f 	O 
	ld c,l			;1669	4d 	M 
	adc a,045h		;166a	ce 45 	. E 
	ld e,b			;166c	58 	X 
	ld d,h			;166d	54 	T 
	call nz,05441h		;166e	c4 41 54 	. A T 
	ld b,c			;1671	41 	A 
	ret			;1672	c9 	. 
	ld c,(hl)			;1673	4e 	N 
	ld d,b			;1674	50 	P 
	ld d,l			;1675	55 	U 
	ld d,h			;1676	54 	T 
	call nz,04d49h		;1677	c4 49 4d 	. I M 
	jp nc,04145h		;167a	d2 45 41 	. E A 
	ld b,h			;167d	44 	D 
	call z,05445h		;167e	cc 45 54 	. E T 
	rst 0			;1681	c7 	. 
	ld c,a			;1682	4f 	O 
	ld d,h			;1683	54 	T 
	ld c,a			;1684	4f 	O 
	jp nc,04e55h		;1685	d2 55 4e 	. U N 
	ret			;1688	c9 	. 
	ld b,(hl)			;1689	46 	F 
	jp nc,05345h		;168a	d2 45 53 	. E S 
	ld d,h			;168d	54 	T 
	ld c,a			;168e	4f 	O 
	ld d,d			;168f	52 	R 
	ld b,l			;1690	45 	E 
	rst 0			;1691	c7 	. 
	ld c,a			;1692	4f 	O 
	ld d,e			;1693	53 	S 
	ld d,l			;1694	55 	U 
	ld b,d			;1695	42 	B 
	jp nc,05445h		;1696	d2 45 54 	. E T 
	ld d,l			;1699	55 	U 
	ld d,d			;169a	52 	R 
	ld c,(hl)			;169b	4e 	N 
	jp nc,04d45h		;169c	d2 45 4d 	. E M 
	out (054h),a		;169f	d3 54 	. T 
	ld c,a			;16a1	4f 	O 
	ld d,b			;16a2	50 	P 
	push bc			;16a3	c5 	. 
	ld c,h			;16a4	4c 	L 
	ld d,e			;16a5	53 	S 
	ld b,l			;16a6	45 	E 
	call nc,04f52h		;16a7	d4 52 4f 	. R O 
	ld c,(hl)			;16aa	4e 	N 
	call nc,04f52h		;16ab	d4 52 4f 	. R O 
	ld b,(hl)			;16ae	46 	F 
	ld b,(hl)			;16af	46 	F 
	call nz,04645h		;16b0	c4 45 46 	. E F 
	ld d,e			;16b3	53 	S 
	ld d,h			;16b4	54 	T 
	ld d,d			;16b5	52 	R 
	call nz,04645h		;16b6	c4 45 46 	. E F 
	ld c,c			;16b9	49 	I 
	ld c,(hl)			;16ba	4e 	N 
	ld d,h			;16bb	54 	T 
	call nz,04645h		;16bc	c4 45 46 	. E F 
	ld d,e			;16bf	53 	S 
	ld c,(hl)			;16c0	4e 	N 
	ld b,a			;16c1	47 	G 
	call nz,04645h		;16c2	c4 45 46 	. E F 
	ld b,h			;16c5	44 	D 
	ld b,d			;16c6	42 	B 
	ld c,h			;16c7	4c 	L 
	call z,04e49h		;16c8	cc 49 4e 	. I N 
	ld b,l			;16cb	45 	E 
	push bc			;16cc	c5 	. 
	ld b,h			;16cd	44 	D 
	ld c,c			;16ce	49 	I 
	ld d,h			;16cf	54 	T 
	push bc			;16d0	c5 	. 
	ld d,d			;16d1	52 	R 
	ld d,d			;16d2	52 	R 
	ld c,a			;16d3	4f 	O 
	ld d,d			;16d4	52 	R 
	jp nc,05345h		;16d5	d2 45 53 	. E S 
	ld d,l			;16d8	55 	U 
	ld c,l			;16d9	4d 	M 
	ld b,l			;16da	45 	E 
	rst 8			;16db	cf 	. 
	ld d,l			;16dc	55 	U 
	ld d,h			;16dd	54 	T 
	rst 8			;16de	cf 	. 
	ld c,(hl)			;16df	4e 	N 
	rst 8			;16e0	cf 	. 
	ld d,b			;16e1	50 	P 
	ld b,l			;16e2	45 	E 
	ld c,(hl)			;16e3	4e 	N 
	add a,049h		;16e4	c6 49 	. I 
	ld b,l			;16e6	45 	E 
	ld c,h			;16e7	4c 	L 
	ld b,h			;16e8	44 	D 
	rst 0			;16e9	c7 	. 
	ld b,l			;16ea	45 	E 
	ld d,h			;16eb	54 	T 
	ret nc			;16ec	d0 	. 
	ld d,l			;16ed	55 	U 
	ld d,h			;16ee	54 	T 
	jp 04f4ch		;16ef	c3 4c 4f 	. L O 
	ld d,e			;16f2	53 	S 
	ld b,l			;16f3	45 	E 
	call z,0414fh		;16f4	cc 4f 41 	. O A 
	ld b,h			;16f7	44 	D 
	call 05245h		;16f8	cd 45 52 	. E R 
	ld b,a			;16fb	47 	G 
	ld b,l			;16fc	45 	E 
	adc a,041h		;16fd	ce 41 	. A 
	ld c,l			;16ff	4d 	M 
	ld b,l			;1700	45 	E 
	bit 1,c		;1701	cb 49 	. I 
	ld c,h			;1703	4c 	L 
	ld c,h			;1704	4c 	L 
	call z,04553h		;1705	cc 53 45 	. S E 
	ld d,h			;1708	54 	T 
	jp nc,04553h		;1709	d2 53 45 	. S E 
	ld d,h			;170c	54 	T 
	out (041h),a		;170d	d3 41 	. A 
	ld d,(hl)			;170f	56 	V 
	ld b,l			;1710	45 	E 
	out (059h),a		;1711	d3 59 	. Y 
	ld d,e			;1713	53 	S 
	ld d,h			;1714	54 	T 
	ld b,l			;1715	45 	E 
	ld c,l			;1716	4d 	M 
	call z,05250h		;1717	cc 50 52 	. P R 
	ld c,c			;171a	49 	I 
	ld c,(hl)			;171b	4e 	N 
	ld d,h			;171c	54 	T 
	call nz,04645h		;171d	c4 45 46 	. E F 
	ret nc			;1720	d0 	. 
	ld c,a			;1721	4f 	O 
	ld c,e			;1722	4b 	K 
	ld b,l			;1723	45 	E 
	ret nc			;1724	d0 	. 
	ld d,d			;1725	52 	R 
	ld c,c			;1726	49 	I 
	ld c,(hl)			;1727	4e 	N 
	ld d,h			;1728	54 	T 
	jp 04e4fh		;1729	c3 4f 4e 	. O N 
	ld d,h			;172c	54 	T 
	call z,05349h		;172d	cc 49 53 	. I S 
	ld d,h			;1730	54 	T 
	call z,0494ch		;1731	cc 4c 49 	. L I 
	ld d,e			;1734	53 	S 
	ld d,h			;1735	54 	T 
	call nz,04c45h		;1736	c4 45 4c 	. E L 
	ld b,l			;1739	45 	E 
	ld d,h			;173a	54 	T 
	ld b,l			;173b	45 	E 
	pop bc			;173c	c1 	. 
	ld d,l			;173d	55 	U 
	ld d,h			;173e	54 	T 
	ld c,a			;173f	4f 	O 
	jp 0454ch		;1740	c3 4c 45 	. L E 
	ld b,c			;1743	41 	A 
	ld d,d			;1744	52 	R 
	jp 04f4ch		;1745	c3 4c 4f 	. L O 
	ld b,c			;1748	41 	A 
	ld b,h			;1749	44 	D 
	jp 04153h		;174a	c3 53 41 	. S A 
	ld d,(hl)			;174d	56 	V 
	ld b,l			;174e	45 	E 
	adc a,045h		;174f	ce 45 	. E 
	ld d,a			;1751	57 	W 
	call nc,04241h		;1752	d4 41 42 	. A B 
	jr z,$-42		;1755	28 d4 	( . 
	ld c,a			;1757	4f 	O 
	add a,04eh		;1758	c6 4e 	. N 
	push de			;175a	d5 	. 
	ld d,e			;175b	53 	S 
	ld c,c			;175c	49 	I 
	ld c,(hl)			;175d	4e 	N 
	ld b,a			;175e	47 	G 
	sub 041h		;175f	d6 41 	. A 
	ld d,d			;1761	52 	R 
	ld d,b			;1762	50 	P 
	ld d,h			;1763	54 	T 
	ld d,d			;1764	52 	R 
	push de			;1765	d5 	. 
	ld d,e			;1766	53 	S 
	ld d,d			;1767	52 	R 
	push bc			;1768	c5 	. 
	ld d,d			;1769	52 	R 
	ld c,h			;176a	4c 	L 
	push bc			;176b	c5 	. 
	ld d,d			;176c	52 	R 
	ld d,d			;176d	52 	R 
	out (054h),a		;176e	d3 54 	. T 
	ld d,d			;1770	52 	R 
	ld c,c			;1771	49 	I 
	ld c,(hl)			;1772	4e 	N 
	ld b,a			;1773	47 	G 
	inc h			;1774	24 	$ 
	ret			;1775	c9 	. 
	ld c,(hl)			;1776	4e 	N 
	ld d,e			;1777	53 	S 
	ld d,h			;1778	54 	T 
	ld d,d			;1779	52 	R 
	ret nc			;177a	d0 	. 
	ld c,a			;177b	4f 	O 
	ld c,c			;177c	49 	I 
	ld c,(hl)			;177d	4e 	N 
	ld d,h			;177e	54 	T 
	call nc,04d49h		;177f	d4 49 4d 	. I M 
	ld b,l			;1782	45 	E 
	inc h			;1783	24 	$ 
	call 04d45h		;1784	cd 45 4d 	. E M 
	ret			;1787	c9 	. 
	ld c,(hl)			;1788	4e 	N 
	ld c,e			;1789	4b 	K 
	ld b,l			;178a	45 	E 
	ld e,c			;178b	59 	Y 
	inc h			;178c	24 	$ 
	call nc,04548h		;178d	d4 48 45 	. H E 
	ld c,(hl)			;1790	4e 	N 
	adc a,04fh		;1791	ce 4f 	. O 
	ld d,h			;1793	54 	T 
	out (054h),a		;1794	d3 54 	. T 
	ld b,l			;1796	45 	E 
	ld d,b			;1797	50 	P 
	xor e			;1798	ab 	. 
	xor l			;1799	ad 	. 
	xor d			;179a	aa 	. 
	xor a			;179b	af 	. 
	in a,(0c1h)		;179c	db c1 	. . 
	ld c,(hl)			;179e	4e 	N 
	ld b,h			;179f	44 	D 
	rst 8			;17a0	cf 	. 
	ld d,d			;17a1	52 	R 
	cp (hl)			;17a2	be 	. 
	cp l			;17a3	bd 	. 
	cp h			;17a4	bc 	. 
	out (047h),a		;17a5	d3 47 	. G 
	ld c,(hl)			;17a7	4e 	N 
	ret			;17a8	c9 	. 
	ld c,(hl)			;17a9	4e 	N 
	ld d,h			;17aa	54 	T 
	pop bc			;17ab	c1 	. 
	ld b,d			;17ac	42 	B 
	ld d,e			;17ad	53 	S 
	add a,052h		;17ae	c6 52 	. R 
	ld b,l			;17b0	45 	E 
	ret			;17b1	c9 	. 
	ld c,(hl)			;17b2	4e 	N 
	ld d,b			;17b3	50 	P 
	ret nc			;17b4	d0 	. 
	ld c,a			;17b5	4f 	O 
	ld d,e			;17b6	53 	S 
	out (051h),a		;17b7	d3 51 	. Q 
	ld d,d			;17b9	52 	R 
	jp nc,0444eh		;17ba	d2 4e 44 	. N D 
	call z,0474fh		;17bd	cc 4f 47 	. O G 
	push bc			;17c0	c5 	. 
	ld e,b			;17c1	58 	X 
	ld d,b			;17c2	50 	P 
	jp 0534fh		;17c3	c3 4f 53 	. O S 
	out (049h),a		;17c6	d3 49 	. I 
	ld c,(hl)			;17c8	4e 	N 
	call nc,04e41h		;17c9	d4 41 4e 	. A N 
	pop bc			;17cc	c1 	. 
	ld d,h			;17cd	54 	T 
	ld c,(hl)			;17ce	4e 	N 
	ret nc			;17cf	d0 	. 
	ld b,l			;17d0	45 	E 
	ld b,l			;17d1	45 	E 
	ld c,e			;17d2	4b 	K 
	jp 04956h		;17d3	c3 56 49 	. V I 
	jp 05356h		;17d6	c3 56 53 	. V S 
	jp 04456h		;17d9	c3 56 44 	. V D 
	push bc			;17dc	c5 	. 
	ld c,a			;17dd	4f 	O 
	ld b,(hl)			;17de	46 	F 
	call z,0434fh		;17df	cc 4f 43 	. O C 
	call z,0464fh		;17e2	cc 4f 46 	. O F 
	call 0494bh		;17e5	cd 4b 49 	. K I 
	inc h			;17e8	24 	$ 
	call 0534bh		;17e9	cd 4b 53 	. K S 
	inc h			;17ec	24 	$ 
	call 0444bh		;17ed	cd 4b 44 	. K D 
	inc h			;17f0	24 	$ 
	jp 04e49h		;17f1	c3 49 4e 	. I N 
	ld d,h			;17f4	54 	T 
	jp 04e53h		;17f5	c3 53 4e 	. S N 
	ld b,a			;17f8	47 	G 
	jp 04244h		;17f9	c3 44 42 	. D B 
	ld c,h			;17fc	4c 	L 
	add a,049h		;17fd	c6 49 	. I 
	ld e,b			;17ff	58 	X 
	call z,04e45h		;1800	cc 45 4e 	. E N 
	out (054h),a		;1803	d3 54 	. T 
	ld d,d			;1805	52 	R 
	inc h			;1806	24 	$ 
	sub 041h		;1807	d6 41 	. A 
	ld c,h			;1809	4c 	L 
	pop bc			;180a	c1 	. 
	ld d,e			;180b	53 	S 
	ld b,e			;180c	43 	C 
	jp 05248h		;180d	c3 48 52 	. H R 
	inc h			;1810	24 	$ 
	call z,04645h		;1811	cc 45 46 	. E F 
	ld d,h			;1814	54 	T 
	inc h			;1815	24 	$ 
	jp nc,04749h		;1816	d2 49 47 	. I G 
	ld c,b			;1819	48 	H 
	ld d,h			;181a	54 	T 
	inc h			;181b	24 	$ 
	call 04449h		;181c	cd 49 44 	. I D 
	inc h			;181f	24 	$ 
	and a			;1820	a7 	. 
	add a,b			;1821	80 	. 
l1822h:
	xor (hl)			;1822	ae 	. 
	dec e			;1823	1d 	. 
	and c			;1824	a1 	. 
	inc e			;1825	1c 	. 
	jr c,l1829h		;1826	38 01 	8 . 
	dec (hl)			;1828	35 	5 
l1829h:
	ld bc,sub_01c9h		;1829	01 c9 01 	. . . 
	ld (hl),e			;182c	73 	s 
	ld b,c			;182d	41 	A 
	out (001h),a		;182e	d3 01 	. . 
	or (hl)			;1830	b6 	. 
	ld (l1f05h),hl		;1831	22 05 1f 	" . . 
	sbc a,d			;1834	9a 	. 
	ld hl,l2608h		;1835	21 08 26 	! . & 
	rst 28h			;1838	ef 	. 
	ld hl,l1f21h		;1839	21 21 1f 	! ! . 
	jp nz,0a31eh		;183c	c2 1e a3 	. . . 
	ld e,039h		;183f	1e 39 	. 9 
	jr nz,$-109		;1841	20 91 	  . 
	dec e			;1843	1d 	. 
	or c			;1844	b1 	. 
	ld e,0deh		;1845	1e de 	. . 
	ld e,007h		;1847	1e 07 	. . 
	rra			;1849	1f 	. 
	xor c			;184a	a9 	. 
	dec e			;184b	1d 	. 
	rlca			;184c	07 	. 
	rra			;184d	1f 	. 
	rst 30h			;184e	f7 	. 
	dec e			;184f	1d 	. 
	ret m			;1850	f8 	. 
	dec e			;1851	1d 	. 
	nop			;1852	00 	. 
	ld e,003h		;1853	1e 03 	. . 
	ld e,006h		;1855	1e 06 	. . 
	ld e,009h		;1857	1e 09 	. . 
	ld e,0a3h		;1859	1e a3 	. . 
	ld b,c			;185b	41 	A 
	ld h,b			;185c	60 	` 
	ld l,0f4h		;185d	2e f4 	. . 
	rra			;185f	1f 	. 
	xor a			;1860	af 	. 
	rra			;1861	1f 	. 
	ei			;1862	fb 	. 
	ld hl,(l1f6ch)		;1863	2a 6c 1f 	* l . 
	ld a,c			;1866	79 	y 
	ld b,c			;1867	41 	A 
	ld a,h			;1868	7c 	| 
	ld b,c			;1869	41 	A 
	ld a,a			;186a	7f 	 
	ld b,c			;186b	41 	A 
	add a,d			;186c	82 	. 
l186dh:
	ld b,c			;186d	41 	A 
	add a,l			;186e	85 	. 
	ld b,c			;186f	41 	A 
	adc a,b			;1870	88 	. 
	ld b,c			;1871	41 	A 
	adc a,e			;1872	8b 	. 
	ld b,c			;1873	41 	A 
	adc a,(hl)			;1874	8e 	. 
	ld b,c			;1875	41 	A 
	sub c			;1876	91 	. 
	ld b,c			;1877	41 	A 
	sub a			;1878	97 	. 
	ld b,c			;1879	41 	A 
	sbc a,d			;187a	9a 	. 
	ld b,c			;187b	41 	A 
	and b			;187c	a0 	. 
	ld b,c			;187d	41 	A 
	or d			;187e	b2 	. 
	ld (bc),a			;187f	02 	. 
	ld h,a			;1880	67 	g 
	jr nz,l18deh		;1881	20 5b 	  [ 
	ld b,c			;1883	41 	A 
	or c			;1884	b1 	. 
	inc l			;1885	2c 	, 
	ld l,a			;1886	6f 	o 
	jr nz,l186dh		;1887	20 e4 	  . 
	dec e			;1889	1d 	. 
	ld l,02bh		;188a	2e 2b 	. + 
	add hl,hl			;188c	29 	) 
	dec hl			;188d	2b 	+ 
	add a,02bh		;188e	c6 2b 	. + 
	ex af,af'			;1890	08 	. 
	jr nz,l190dh		;1891	20 7a 	  z 
	ld e,01fh		;1893	1e 1f 	. . 
	inc l			;1895	2c 	, 
	push af			;1896	f5 	. 
	dec hl			;1897	2b 	+ 
	ld c,c			;1898	49 	I 
	dec de			;1899	1b 	. 
l189ah:
	ld a,c			;189a	79 	y 
	ld a,c			;189b	79 	y 
	ld a,h			;189c	7c 	| 
	ld a,h			;189d	7c 	| 
	ld a,a			;189e	7f 	 
	ld d,b			;189f	50 	P 
	ld b,(hl)			;18a0	46 	F 
l18a1h:
	in a,(00ah)		;18a1	db 0a 	. . 
	nop			;18a3	00 	. 
	nop			;18a4	00 	. 
	ld a,a			;18a5	7f 	 
	ld a,(bc)			;18a6	0a 	. 
	call p,0b10ah		;18a7	f4 0a b1 	. . . 
	ld a,(bc)			;18aa	0a 	. 
l18abh:
	ld (hl),a			;18ab	77 	w 
	inc c			;18ac	0c 	. 
	ld (hl),b			;18ad	70 	p 
	inc c			;18ae	0c 	. 
	and c			;18af	a1 	. 
	dec c			;18b0	0d 	. 
	push hl			;18b1	e5 	. 
	dec c			;18b2	0d 	. 
	ld a,b			;18b3	78 	x 
	ld a,(bc)			;18b4	0a 	. 
l18b5h:
	ld d,007h		;18b5	16 07 	. . 
	inc de			;18b7	13 	. 
	rlca			;18b8	07 	. 
	ld b,a			;18b9	47 	G 
	ex af,af'			;18ba	08 	. 
	and d			;18bb	a2 	. 
	ex af,af'			;18bc	08 	. 
	inc c			;18bd	0c 	. 
	ld a,(bc)			;18be	0a 	. 
l18bfh:
	jp nc,0c70bh		;18bf	d2 0b c7 	. . . 
	dec bc			;18c2	0b 	. 
	jp p,0900bh		;18c3	f2 0b 90 	. . . 
	inc h			;18c6	24 	$ 
	add hl,sp			;18c7	39 	9 
	ld a,(bc)			;18c8	0a 	. 
l18c9h:
	ld c,(hl)			;18c9	4e 	N 
	ld b,(hl)			;18ca	46 	F 
	ld d,e			;18cb	53 	S 
	ld c,(hl)			;18cc	4e 	N 
	ld d,d			;18cd	52 	R 
	ld b,a			;18ce	47 	G 
	ld c,a			;18cf	4f 	O 
	ld b,h			;18d0	44 	D 
	ld b,(hl)			;18d1	46 	F 
	ld b,e			;18d2	43 	C 
	ld c,a			;18d3	4f 	O 
	ld d,(hl)			;18d4	56 	V 
	ld c,a			;18d5	4f 	O 
	ld c,l			;18d6	4d 	M 
	ld d,l			;18d7	55 	U 
	ld c,h			;18d8	4c 	L 
	ld b,d			;18d9	42 	B 
	ld d,e			;18da	53 	S 
	ld b,h			;18db	44 	D 
	ld b,h			;18dc	44 	D 
	cpl			;18dd	2f 	/ 
l18deh:
	jr nc,l1929h		;18de	30 49 	0 I 
	ld b,h			;18e0	44 	D 
	ld d,h			;18e1	54 	T 
	ld c,l			;18e2	4d 	M 
	ld c,a			;18e3	4f 	O 
	ld d,e			;18e4	53 	S 
	ld c,h			;18e5	4c 	L 
	ld d,e			;18e6	53 	S 
	ld d,e			;18e7	53 	S 
	ld d,h			;18e8	54 	T 
	ld b,e			;18e9	43 	C 
	ld c,(hl)			;18ea	4e 	N 
	ld c,(hl)			;18eb	4e 	N 
	ld d,d			;18ec	52 	R 
	ld d,d			;18ed	52 	R 
	ld d,a			;18ee	57 	W 
	ld d,l			;18ef	55 	U 
	ld b,l			;18f0	45 	E 
	ld c,l			;18f1	4d 	M 
	ld c,a			;18f2	4f 	O 
	ld b,(hl)			;18f3	46 	F 
	ld b,h			;18f4	44 	D 
	ld d,e			;18f5	53 	S 
	ld c,(hl)			;18f6	4e 	N 
l18f7h:
	sub 000h		;18f7	d6 00 	. . 
	ld l,a			;18f9	6f 	o 
	ld a,h			;18fa	7c 	| 
	sbc a,000h		;18fb	de 00 	. . 
	ld h,a			;18fd	67 	g 
	ld a,b			;18fe	78 	x 
	sbc a,000h		;18ff	de 00 	. . 
	ld b,a			;1901	47 	G 
	ld a,000h		;1902	3e 00 	> . 
	ret			;1904	c9 	. 
	ld c,d			;1905	4a 	J 
	ld e,040h		;1906	1e 40 	. @ 
	and 04dh		;1908	e6 4d 	. M 
	in a,(000h)		;190a	db 00 	. . 
	ret			;190c	c9 	. 
l190dh:
	out (000h),a		;190d	d3 00 	. . 
	ret			;190f	c9 	. 
	nop			;1910	00 	. 
	nop			;1911	00 	. 
	nop			;1912	00 	. 
	nop			;1913	00 	. 
	ld b,b			;1914	40 	@ 
	jr nc,l1917h		;1915	30 00 	0 . 
l1917h:
	ld c,h			;1917	4c 	L 
	ld b,e			;1918	43 	C 
	cp 0ffh		;1919	fe ff 	. . 
	jp (hl)			;191b	e9 	. 
	ld b,d			;191c	42 	B 
l191dh:
	jr nz,l1964h		;191d	20 45 	  E 
	ld (hl),d			;191f	72 	r 
	ld (hl),d			;1920	72 	r 
	ld l,a			;1921	6f 	o 
	ld (hl),d			;1922	72 	r 
	nop			;1923	00 	. 
l1924h:
	jr nz,$+107		;1924	20 69 	  i 
	ld l,(hl)			;1926	6e 	n 
	jr nz,l1929h		;1927	20 00 	  . 
l1929h:
	ld d,d			;1929	52 	R 
	ld b,l			;192a	45 	E 
	ld b,c			;192b	41 	A 
	ld b,h			;192c	44 	D 
	ld e,c			;192d	59 	Y 
	dec c			;192e	0d 	. 
	nop			;192f	00 	. 
l1930h:
	ld b,d			;1930	42 	B 
	ld (hl),d			;1931	72 	r 
	ld h,l			;1932	65 	e 
	ld h,c			;1933	61 	a 
	ld l,e			;1934	6b 	k 
	nop			;1935	00 	. 
sub_1936h:
	ld hl,00004h		;1936	21 04 00 	! . . 
	add hl,sp			;1939	39 	9 
l193ah:
	ld a,(hl)			;193a	7e 	~ 
	inc hl			;193b	23 	# 
	cp 081h		;193c	fe 81 	. . 
	ret nz			;193e	c0 	. 
	ld c,(hl)			;193f	4e 	N 
	inc hl			;1940	23 	# 
	ld b,(hl)			;1941	46 	F 
	inc hl			;1942	23 	# 
	push hl			;1943	e5 	. 
	ld l,c			;1944	69 	i 
	ld h,b			;1945	60 	` 
	ld a,d			;1946	7a 	z 
	or e			;1947	b3 	. 
	ex de,hl			;1948	eb 	. 
	jr z,l194dh		;1949	28 02 	( . 
	ex de,hl			;194b	eb 	. 
	rst 18h			;194c	df 	. 
l194dh:
	ld bc,0000eh		;194d	01 0e 00 	. . . 
	pop hl			;1950	e1 	. 
	ret z			;1951	c8 	. 
	add hl,bc			;1952	09 	. 
	jr l193ah		;1953	18 e5 	. . 
sub_1955h:
	call 0196ch		;1955	cd 6c 19 	. l . 
sub_1958h:
	push bc			;1958	c5 	. 
	ex (sp),hl			;1959	e3 	. 
	pop bc			;195a	c1 	. 
l195bh:
	rst 18h			;195b	df 	. 
	ld a,(hl)			;195c	7e 	~ 
	ld (bc),a			;195d	02 	. 
	ret z			;195e	c8 	. 
	dec bc			;195f	0b 	. 
	dec hl			;1960	2b 	+ 
	jr l195bh		;1961	18 f8 	. . 
sub_1963h:
	push hl			;1963	e5 	. 
l1964h:
	ld hl,(040fdh)		;1964	2a fd 40 	* . @ 
	ld b,000h		;1967	06 00 	. . 
	add hl,bc			;1969	09 	. 
	add hl,bc			;196a	09 	. 
	ld a,0e5h		;196b	3e e5 	> . 
	ld a,0c6h		;196d	3e c6 	> . 
	sub l			;196f	95 	. 
	ld l,a			;1970	6f 	o 
	ld a,0ffh		;1971	3e ff 	> . 
	sbc a,h			;1973	9c 	. 
	jr c,l197ah		;1974	38 04 	8 . 
	ld h,a			;1976	67 	g 
	add hl,sp			;1977	39 	9 
	pop hl			;1978	e1 	. 
	ret c			;1979	d8 	. 
l197ah:
	ld e,00ch		;197a	1e 0c 	. . 
	jr l19a2h		;197c	18 24 	. $ 
l197eh:
	ld hl,(040a2h)		;197e	2a a2 40 	* . @ 
	ld a,h			;1981	7c 	| 
	and l			;1982	a5 	. 
	inc a			;1983	3c 	< 
	jr z,l198eh		;1984	28 08 	( . 
	ld a,(040f2h)		;1986	3a f2 40 	: . @ 
	or a			;1989	b7 	. 
	ld e,022h		;198a	1e 22 	. " 
	jr nz,l19a2h		;198c	20 14 	  . 
l198eh:
	jp l1dc1h		;198e	c3 c1 1d 	. . . 
l1991h:
	ld hl,(040dah)		;1991	2a da 40 	* . @ 
	ld (040a2h),hl		;1994	22 a2 40 	" . @ 
l1997h:
	ld e,002h		;1997	1e 02 	. . 
	ld bc,l141eh		;1999	01 1e 14 	. . . 
	ld bc,l001eh		;199c	01 1e 00 	. . . 
	ld bc,0241eh		;199f	01 1e 24 	. . $ 
l19a2h:
	ld hl,(040a2h)		;19a2	2a a2 40 	* . @ 
	ld (040eah),hl		;19a5	22 ea 40 	" . @ 
	ld (040ech),hl		;19a8	22 ec 40 	" . @ 
l19abh:
	ld bc,l19b4h		;19ab	01 b4 19 	. . . 
l19aeh:
	ld hl,(040e8h)		;19ae	2a e8 40 	* . @ 
	jp l1b9ah		;19b1	c3 9a 1b 	. . . 
l19b4h:
	pop bc			;19b4	c1 	. 
	ld a,e			;19b5	7b 	{ 
	ld c,e			;19b6	4b 	K 
	ld (0409ah),a		;19b7	32 9a 40 	2 . @ 
	ld hl,(040e6h)		;19ba	2a e6 40 	* . @ 
	ld (040eeh),hl		;19bd	22 ee 40 	" . @ 
	ex de,hl			;19c0	eb 	. 
	ld hl,(040eah)		;19c1	2a ea 40 	* . @ 
	ld a,h			;19c4	7c 	| 
	and l			;19c5	a5 	. 
	inc a			;19c6	3c 	< 
	jr z,l19d0h		;19c7	28 07 	( . 
	ld (040f5h),hl		;19c9	22 f5 40 	" . @ 
	ex de,hl			;19cc	eb 	. 
	ld (040f7h),hl		;19cd	22 f7 40 	" . @ 
l19d0h:
	ld hl,(040f0h)		;19d0	2a f0 40 	* . @ 
	ld a,h			;19d3	7c 	| 
	or l			;19d4	b5 	. 
	ex de,hl			;19d5	eb 	. 
	ld hl,040f2h		;19d6	21 f2 40 	! . @ 
	jr z,l19e3h		;19d9	28 08 	( . 
	and (hl)			;19db	a6 	. 
	jr nz,l19e3h		;19dc	20 05 	  . 
	dec (hl)			;19de	35 	5 
	ex de,hl			;19df	eb 	. 
	jp l1d36h		;19e0	c3 36 1d 	. 6 . 
l19e3h:
	xor a			;19e3	af 	. 
	ld (hl),a			;19e4	77 	w 
	ld e,c			;19e5	59 	Y 
	call sub_20f9h		;19e6	cd f9 20 	. .   
	ld hl,l18c9h		;19e9	21 c9 18 	! . . 
	call 041a6h		;19ec	cd a6 41 	. . A 
	ld d,a			;19ef	57 	W 
	ld a,03fh		;19f0	3e 3f 	> ? 
	call sub_032ah		;19f2	cd 2a 03 	. * . 
	add hl,de			;19f5	19 	. 
	ld a,(hl)			;19f6	7e 	~ 
	call sub_032ah		;19f7	cd 2a 03 	. * . 
	rst 10h			;19fa	d7 	. 
	call sub_032ah		;19fb	cd 2a 03 	. * . 
	ld hl,l191dh		;19fe	21 1d 19 	! . . 
	push hl			;1a01	e5 	. 
	ld hl,(040eah)		;1a02	2a ea 40 	* . @ 
	ex (sp),hl			;1a05	e3 	. 
l1a06h:
	call sub_28a7h		;1a06	cd a7 28 	. . ( 
	pop hl			;1a09	e1 	. 
	ld de,0fffeh		;1a0a	11 fe ff 	. . . 
	rst 18h			;1a0d	df 	. 
	jp z,l0674h		;1a0e	ca 74 06 	. t . 
	ld a,h			;1a11	7c 	| 
	and l			;1a12	a5 	. 
	inc a			;1a13	3c 	< 
	call nz,sub_0fa7h		;1a14	c4 a7 0f 	. . . 
	ld a,0c1h		;1a17	3e c1 	> . 
l1a19h:
	call sub_038bh		;1a19	cd 8b 03 	. . . 
	call 041ach		;1a1c	cd ac 41 	. . A 
	call sub_01f8h		;1a1f	cd f8 01 	. . . 
	call sub_20f9h		;1a22	cd f9 20 	. .   
	ld hl,l1929h		;1a25	21 29 19 	! ) . 
	call sub_28a7h		;1a28	cd a7 28 	. . ( 
	ld a,(0409ah)		;1a2b	3a 9a 40 	: . @ 
	sub 002h		;1a2e	d6 02 	. . 
	call z,sub_2e53h		;1a30	cc 53 2e 	. S . 
l1a33h:
	ld hl,0ffffh		;1a33	21 ff ff 	! . . 
	ld (040a2h),hl		;1a36	22 a2 40 	" . @ 
	ld a,(040e1h)		;1a39	3a e1 40 	: . @ 
	or a			;1a3c	b7 	. 
	jr z,l1a76h		;1a3d	28 37 	( 7 
	ld hl,(040e2h)		;1a3f	2a e2 40 	* . @ 
	push hl			;1a42	e5 	. 
	call sub_0fafh		;1a43	cd af 0f 	. . . 
	pop de			;1a46	d1 	. 
	push de			;1a47	d5 	. 
	call sub_1b2ch		;1a48	cd 2c 1b 	. , . 
	ld a,02ah		;1a4b	3e 2a 	> * 
	jr c,l1a51h		;1a4d	38 02 	8 . 
	ld a,020h		;1a4f	3e 20 	>   
l1a51h:
	call sub_032ah		;1a51	cd 2a 03 	. * . 
	call sub_0361h		;1a54	cd 61 03 	. a . 
	pop de			;1a57	d1 	. 
	jr nc,l1a60h		;1a58	30 06 	0 . 
l1a5ah:
	xor a			;1a5a	af 	. 
	ld (040e1h),a		;1a5b	32 e1 40 	2 . @ 
	jr l1a19h		;1a5e	18 b9 	. . 
l1a60h:
	ld hl,(040e4h)		;1a60	2a e4 40 	* . @ 
	add hl,de			;1a63	19 	. 
	jr c,l1a5ah		;1a64	38 f4 	8 . 
	push de			;1a66	d5 	. 
	ld de,0fff9h		;1a67	11 f9 ff 	. . . 
	rst 18h			;1a6a	df 	. 
	pop de			;1a6b	d1 	. 
	jr nc,l1a5ah		;1a6c	30 ec 	0 . 
	ld (040e2h),hl		;1a6e	22 e2 40 	" . @ 
	or 0ffh		;1a71	f6 ff 	. . 
	jp l2febh		;1a73	c3 eb 2f 	. . / 
l1a76h:
	ld a,03eh		;1a76	3e 3e 	> > 
	call sub_032ah		;1a78	cd 2a 03 	. * . 
	call sub_0361h		;1a7b	cd 61 03 	. a . 
	jp c,l1a33h		;1a7e	da 33 1a 	. 3 . 
	rst 10h			;1a81	d7 	. 
	inc a			;1a82	3c 	< 
	dec a			;1a83	3d 	= 
	jp z,l1a33h		;1a84	ca 33 1a 	. 3 . 
	push af			;1a87	f5 	. 
	call sub_1e5ah		;1a88	cd 5a 1e 	. Z . 
l1a8bh:
	dec hl			;1a8b	2b 	+ 
	ld a,(hl)			;1a8c	7e 	~ 
	cp 020h		;1a8d	fe 20 	.   
	jr z,l1a8bh		;1a8f	28 fa 	( . 
	inc hl			;1a91	23 	# 
	ld a,(hl)			;1a92	7e 	~ 
	cp 020h		;1a93	fe 20 	.   
	call z,sub_09c9h		;1a95	cc c9 09 	. . . 
l1a98h:
	push de			;1a98	d5 	. 
	call sub_1bc0h		;1a99	cd c0 1b 	. . . 
	pop de			;1a9c	d1 	. 
	pop af			;1a9d	f1 	. 
	ld (040e6h),hl		;1a9e	22 e6 40 	" . @ 
	call 041b2h		;1aa1	cd b2 41 	. . A 
	jp nc,l1d5ah		;1aa4	d2 5a 1d 	. Z . 
	push de			;1aa7	d5 	. 
	push bc			;1aa8	c5 	. 
	xor a			;1aa9	af 	. 
	ld (040ddh),a		;1aaa	32 dd 40 	2 . @ 
	rst 10h			;1aad	d7 	. 
	or a			;1aae	b7 	. 
	push af			;1aaf	f5 	. 
	ex de,hl			;1ab0	eb 	. 
	ld (040ech),hl		;1ab1	22 ec 40 	" . @ 
	ex de,hl			;1ab4	eb 	. 
	call sub_1b2ch		;1ab5	cd 2c 1b 	. , . 
	push bc			;1ab8	c5 	. 
	call c,sub_2be4h		;1ab9	dc e4 2b 	. . + 
	pop de			;1abc	d1 	. 
	pop af			;1abd	f1 	. 
	push de			;1abe	d5 	. 
	jr z,l1ae8h		;1abf	28 27 	( ' 
	pop de			;1ac1	d1 	. 
	ld hl,(040f9h)		;1ac2	2a f9 40 	* . @ 
	ex (sp),hl			;1ac5	e3 	. 
	pop bc			;1ac6	c1 	. 
	add hl,bc			;1ac7	09 	. 
	push hl			;1ac8	e5 	. 
	call sub_1955h		;1ac9	cd 55 19 	. U . 
	pop hl			;1acc	e1 	. 
	ld (040f9h),hl		;1acd	22 f9 40 	" . @ 
	ex de,hl			;1ad0	eb 	. 
	ld (hl),h			;1ad1	74 	t 
	pop de			;1ad2	d1 	. 
	push hl			;1ad3	e5 	. 
	inc hl			;1ad4	23 	# 
	inc hl			;1ad5	23 	# 
	ld (hl),e			;1ad6	73 	s 
	inc hl			;1ad7	23 	# 
	ld (hl),d			;1ad8	72 	r 
	inc hl			;1ad9	23 	# 
	ex de,hl			;1ada	eb 	. 
	ld hl,(040a7h)		;1adb	2a a7 40 	* . @ 
	ex de,hl			;1ade	eb 	. 
	dec de			;1adf	1b 	. 
	dec de			;1ae0	1b 	. 
l1ae1h:
	ld a,(de)			;1ae1	1a 	. 
	ld (hl),a			;1ae2	77 	w 
	inc hl			;1ae3	23 	# 
	inc de			;1ae4	13 	. 
	or a			;1ae5	b7 	. 
	jr nz,l1ae1h		;1ae6	20 f9 	  . 
l1ae8h:
	pop de			;1ae8	d1 	. 
	call sub_1afch		;1ae9	cd fc 1a 	. . . 
	call 041b5h		;1aec	cd b5 41 	. . A 
	call sub_1b5dh		;1aef	cd 5d 1b 	. ] . 
	call 041b8h		;1af2	cd b8 41 	. . A 
	jp l1a33h		;1af5	c3 33 1a 	. 3 . 
	ld hl,(040a4h)		;1af8	2a a4 40 	* . @ 
	ex de,hl			;1afb	eb 	. 
sub_1afch:
	ld h,d			;1afc	62 	b 
	ld l,e			;1afd	6b 	k 
	ld a,(hl)			;1afe	7e 	~ 
	inc hl			;1aff	23 	# 
	or (hl)			;1b00	b6 	. 
	ret z			;1b01	c8 	. 
	inc hl			;1b02	23 	# 
	inc hl			;1b03	23 	# 
	inc hl			;1b04	23 	# 
	xor a			;1b05	af 	. 
l1b06h:
	cp (hl)			;1b06	be 	. 
	inc hl			;1b07	23 	# 
	jr nz,l1b06h		;1b08	20 fc 	  . 
	ex de,hl			;1b0a	eb 	. 
	ld (hl),e			;1b0b	73 	s 
	inc hl			;1b0c	23 	# 
	ld (hl),d			;1b0d	72 	r 
	jr sub_1afch		;1b0e	18 ec 	. . 
sub_1b10h:
	ld de,l0000h		;1b10	11 00 00 	. . . 
	push de			;1b13	d5 	. 
	jr z,$+11		;1b14	28 09 	( . 
	pop de			;1b16	d1 	. 
	call sub_1e4fh		;1b17	cd 4f 1e 	. O . 
	push de			;1b1a	d5 	. 
	jr z,l1b28h		;1b1b	28 0b 	( . 
	rst 8			;1b1d	cf 	. 
	adc a,011h		;1b1e	ce 11 	. . 
	jp m,0c4ffh		;1b20	fa ff c4 	. . . 
	ld c,a			;1b23	4f 	O 
	ld e,0c2h		;1b24	1e c2 	. . 
	sub a			;1b26	97 	. 
	add hl,de			;1b27	19 	. 
l1b28h:
	ex de,hl			;1b28	eb 	. 
	pop de			;1b29	d1 	. 
sub_1b2ah:
	ex (sp),hl			;1b2a	e3 	. 
	push hl			;1b2b	e5 	. 
sub_1b2ch:
	ld hl,(040a4h)		;1b2c	2a a4 40 	* . @ 
l1b2fh:
	ld b,h			;1b2f	44 	D 
	ld c,l			;1b30	4d 	M 
	ld a,(hl)			;1b31	7e 	~ 
	inc hl			;1b32	23 	# 
	or (hl)			;1b33	b6 	. 
	dec hl			;1b34	2b 	+ 
	ret z			;1b35	c8 	. 
	inc hl			;1b36	23 	# 
	inc hl			;1b37	23 	# 
	ld a,(hl)			;1b38	7e 	~ 
	inc hl			;1b39	23 	# 
	ld h,(hl)			;1b3a	66 	f 
	ld l,a			;1b3b	6f 	o 
	rst 18h			;1b3c	df 	. 
	ld h,b			;1b3d	60 	` 
	ld l,c			;1b3e	69 	i 
	ld a,(hl)			;1b3f	7e 	~ 
	inc hl			;1b40	23 	# 
	ld h,(hl)			;1b41	66 	f 
	ld l,a			;1b42	6f 	o 
	ccf			;1b43	3f 	? 
	ret z			;1b44	c8 	. 
	ccf			;1b45	3f 	? 
	ret nc			;1b46	d0 	. 
	jr l1b2fh		;1b47	18 e6 	. . 
	ret nz			;1b49	c0 	. 
	call sub_01c9h		;1b4a	cd c9 01 	. . . 
sub_1b4dh:
	ld hl,(040a4h)		;1b4d	2a a4 40 	* . @ 
	call 01df8h		;1b50	cd f8 1d 	. . . 
	ld (040e1h),a		;1b53	32 e1 40 	2 . @ 
	ld (hl),a			;1b56	77 	w 
	inc hl			;1b57	23 	# 
	ld (hl),a			;1b58	77 	w 
	inc hl			;1b59	23 	# 
	ld (040f9h),hl		;1b5a	22 f9 40 	" . @ 
sub_1b5dh:
	ld hl,(040a4h)		;1b5d	2a a4 40 	* . @ 
	dec hl			;1b60	2b 	+ 
l1b61h:
	ld (040dfh),hl		;1b61	22 df 40 	" . @ 
	ld b,01ah		;1b64	06 1a 	. . 
	ld hl,04101h		;1b66	21 01 41 	! . A 
l1b69h:
	ld (hl),004h		;1b69	36 04 	6 . 
	inc hl			;1b6b	23 	# 
	djnz l1b69h		;1b6c	10 fb 	. . 
	xor a			;1b6e	af 	. 
	ld (040f2h),a		;1b6f	32 f2 40 	2 . @ 
	ld l,a			;1b72	6f 	o 
	ld h,a			;1b73	67 	g 
	ld (040f0h),hl		;1b74	22 f0 40 	" . @ 
	ld (040f7h),hl		;1b77	22 f7 40 	" . @ 
	ld hl,(040b1h)		;1b7a	2a b1 40 	* . @ 
	ld (040d6h),hl		;1b7d	22 d6 40 	" . @ 
	call sub_1d91h		;1b80	cd 91 1d 	. . . 
	ld hl,(040f9h)		;1b83	2a f9 40 	* . @ 
	ld (040fbh),hl		;1b86	22 fb 40 	" . @ 
	ld (040fdh),hl		;1b89	22 fd 40 	" . @ 
	call 041bbh		;1b8c	cd bb 41 	. . A 
sub_1b8fh:
	pop bc			;1b8f	c1 	. 
	ld hl,(040a0h)		;1b90	2a a0 40 	* . @ 
	dec hl			;1b93	2b 	+ 
	dec hl			;1b94	2b 	+ 
	ld (040e8h),hl		;1b95	22 e8 40 	" . @ 
	inc hl			;1b98	23 	# 
	inc hl			;1b99	23 	# 
l1b9ah:
	ld sp,hl			;1b9a	f9 	. 
	ld hl,040b5h		;1b9b	21 b5 40 	! . @ 
	ld (040b3h),hl		;1b9e	22 b3 40 	" . @ 
	call sub_038bh		;1ba1	cd 8b 03 	. . . 
	call sub_2169h		;1ba4	cd 69 21 	. i ! 
	xor a			;1ba7	af 	. 
	ld h,a			;1ba8	67 	g 
	ld l,a			;1ba9	6f 	o 
	ld (040dch),a		;1baa	32 dc 40 	2 . @ 
	push hl			;1bad	e5 	. 
	push bc			;1bae	c5 	. 
	ld hl,(040dfh)		;1baf	2a df 40 	* . @ 
	ret			;1bb2	c9 	. 
sub_1bb3h:
	ld a,03fh		;1bb3	3e 3f 	> ? 
	call sub_032ah		;1bb5	cd 2a 03 	. * . 
	ld a,020h		;1bb8	3e 20 	>   
	call sub_032ah		;1bba	cd 2a 03 	. * . 
	jp sub_0361h		;1bbd	c3 61 03 	. a . 
sub_1bc0h:
	xor a			;1bc0	af 	. 
	ld (040b0h),a		;1bc1	32 b0 40 	2 . @ 
	ld c,a			;1bc4	4f 	O 
	ex de,hl			;1bc5	eb 	. 
	ld hl,(040a7h)		;1bc6	2a a7 40 	* . @ 
	dec hl			;1bc9	2b 	+ 
l1bcah:
	dec hl			;1bca	2b 	+ 
	ex de,hl			;1bcb	eb 	. 
l1bcch:
	ld a,(hl)			;1bcc	7e 	~ 
	cp 020h		;1bcd	fe 20 	.   
	jp z,l1c5bh		;1bcf	ca 5b 1c 	. [ . 
	ld b,a			;1bd2	47 	G 
	cp 022h		;1bd3	fe 22 	. " 
	jp z,l1c77h		;1bd5	ca 77 1c 	. w . 
	or a			;1bd8	b7 	. 
	jp z,l1c7dh		;1bd9	ca 7d 1c 	. } . 
	ld a,(040b0h)		;1bdc	3a b0 40 	: . @ 
	or a			;1bdf	b7 	. 
	ld a,(hl)			;1be0	7e 	~ 
	jp nz,l1c5bh		;1be1	c2 5b 1c 	. [ . 
	cp 03fh		;1be4	fe 3f 	. ? 
	ld a,0b2h		;1be6	3e b2 	> . 
	jp z,l1c5bh		;1be8	ca 5b 1c 	. [ . 
	ld a,(hl)			;1beb	7e 	~ 
	cp 030h		;1bec	fe 30 	. 0 
	jr c,l1bf5h		;1bee	38 05 	8 . 
	cp 03ch		;1bf0	fe 3c 	. < 
	jp c,l1c5bh		;1bf2	da 5b 1c 	. [ . 
l1bf5h:
	push de			;1bf5	d5 	. 
	ld de,0164fh		;1bf6	11 4f 16 	. O . 
	push bc			;1bf9	c5 	. 
	ld bc,l1c3dh		;1bfa	01 3d 1c 	. = . 
	push bc			;1bfd	c5 	. 
	ld b,07fh		;1bfe	06 7f 	.  
	ld a,(hl)			;1c00	7e 	~ 
	cp 061h		;1c01	fe 61 	. a 
	jr c,l1c0ch		;1c03	38 07 	8 . 
	cp 07bh		;1c05	fe 7b 	. { 
	jr nc,l1c0ch		;1c07	30 03 	0 . 
	and 05fh		;1c09	e6 5f 	. _ 
	ld (hl),a			;1c0b	77 	w 
l1c0ch:
	ld c,(hl)			;1c0c	4e 	N 
	ex de,hl			;1c0d	eb 	. 
l1c0eh:
	inc hl			;1c0e	23 	# 
	or (hl)			;1c0f	b6 	. 
	jp p,l1c0eh		;1c10	f2 0e 1c 	. . . 
	inc b			;1c13	04 	. 
	ld a,(hl)			;1c14	7e 	~ 
	and 07fh		;1c15	e6 7f 	.  
	ret z			;1c17	c8 	. 
	cp c			;1c18	b9 	. 
	jr nz,l1c0eh		;1c19	20 f3 	  . 
	ex de,hl			;1c1b	eb 	. 
	push hl			;1c1c	e5 	. 
l1c1dh:
	inc de			;1c1d	13 	. 
	ld a,(de)			;1c1e	1a 	. 
	or a			;1c1f	b7 	. 
	jp m,l1c39h		;1c20	fa 39 1c 	. 9 . 
	ld c,a			;1c23	4f 	O 
	ld a,b			;1c24	78 	x 
	cp 08dh		;1c25	fe 8d 	. . 
	jr nz,l1c2bh		;1c27	20 02 	  . 
	rst 10h			;1c29	d7 	. 
	dec hl			;1c2a	2b 	+ 
l1c2bh:
	inc hl			;1c2b	23 	# 
	ld a,(hl)			;1c2c	7e 	~ 
	cp 061h		;1c2d	fe 61 	. a 
	jr c,l1c33h		;1c2f	38 02 	8 . 
	and 05fh		;1c31	e6 5f 	. _ 
l1c33h:
	cp c			;1c33	b9 	. 
	jr z,l1c1dh		;1c34	28 e7 	( . 
	pop hl			;1c36	e1 	. 
	jr l1c0ch		;1c37	18 d3 	. . 
l1c39h:
	ld c,b			;1c39	48 	H 
	pop af			;1c3a	f1 	. 
	ex de,hl			;1c3b	eb 	. 
	ret			;1c3c	c9 	. 
l1c3dh:
	ex de,hl			;1c3d	eb 	. 
	ld a,c			;1c3e	79 	y 
	pop bc			;1c3f	c1 	. 
	pop de			;1c40	d1 	. 
	ex de,hl			;1c41	eb 	. 
	cp 095h		;1c42	fe 95 	. . 
	ld (hl),03ah		;1c44	36 3a 	6 : 
	jr nz,l1c4ah		;1c46	20 02 	  . 
	inc c			;1c48	0c 	. 
	inc hl			;1c49	23 	# 
l1c4ah:
	cp 0fbh		;1c4a	fe fb 	. . 
	jr nz,l1c5ah		;1c4c	20 0c 	  . 
	ld (hl),03ah		;1c4e	36 3a 	6 : 
	inc hl			;1c50	23 	# 
	ld b,093h		;1c51	06 93 	. . 
	ld (hl),b			;1c53	70 	p 
	inc hl			;1c54	23 	# 
	ex de,hl			;1c55	eb 	. 
	inc c			;1c56	0c 	. 
	inc c			;1c57	0c 	. 
	jr l1c77h		;1c58	18 1d 	. . 
l1c5ah:
	ex de,hl			;1c5a	eb 	. 
l1c5bh:
	inc hl			;1c5b	23 	# 
	ld (de),a			;1c5c	12 	. 
	inc de			;1c5d	13 	. 
	inc c			;1c5e	0c 	. 
	sub 03ah		;1c5f	d6 3a 	. : 
	jr z,l1c67h		;1c61	28 04 	( . 
	cp 04eh		;1c63	fe 4e 	. N 
	jr nz,l1c6ah		;1c65	20 03 	  . 
l1c67h:
	ld (040b0h),a		;1c67	32 b0 40 	2 . @ 
l1c6ah:
	sub 059h		;1c6a	d6 59 	. Y 
	jp nz,l1bcch		;1c6c	c2 cc 1b 	. . . 
	ld b,a			;1c6f	47 	G 
l1c70h:
	ld a,(hl)			;1c70	7e 	~ 
	or a			;1c71	b7 	. 
	jr z,l1c7dh		;1c72	28 09 	( . 
	cp b			;1c74	b8 	. 
	jr z,l1c5bh		;1c75	28 e4 	( . 
l1c77h:
	inc hl			;1c77	23 	# 
	ld (de),a			;1c78	12 	. 
	inc c			;1c79	0c 	. 
	inc de			;1c7a	13 	. 
	jr l1c70h		;1c7b	18 f3 	. . 
l1c7dh:
	ld hl,l0005h		;1c7d	21 05 00 	! . . 
	ld b,h			;1c80	44 	D 
	add hl,bc			;1c81	09 	. 
	ld b,h			;1c82	44 	D 
	ld c,l			;1c83	4d 	M 
	ld hl,(040a7h)		;1c84	2a a7 40 	* . @ 
	dec hl			;1c87	2b 	+ 
	dec hl			;1c88	2b 	+ 
	dec hl			;1c89	2b 	+ 
	ld (de),a			;1c8a	12 	. 
	inc de			;1c8b	13 	. 
	ld (de),a			;1c8c	12 	. 
	inc de			;1c8d	13 	. 
	ld (de),a			;1c8e	12 	. 
	ret			;1c8f	c9 	. 
l1c90h:
	ld a,h			;1c90	7c 	| 
	sub d			;1c91	92 	. 
	ret nz			;1c92	c0 	. 
	ld a,l			;1c93	7d 	} 
	sub e			;1c94	93 	. 
	ret			;1c95	c9 	. 
l1c96h:
	ld a,(hl)			;1c96	7e 	~ 
	ex (sp),hl			;1c97	e3 	. 
	cp (hl)			;1c98	be 	. 
	inc hl			;1c99	23 	# 
	ex (sp),hl			;1c9a	e3 	. 
	jp z,l1d78h		;1c9b	ca 78 1d 	. x . 
	jp l1997h		;1c9e	c3 97 19 	. . . 
	ld a,064h		;1ca1	3e 64 	> d 
	ld (040dch),a		;1ca3	32 dc 40 	2 . @ 
	call l1f21h		;1ca6	cd 21 1f 	. ! . 
	ex (sp),hl			;1ca9	e3 	. 
	call sub_1936h		;1caa	cd 36 19 	. 6 . 
	pop de			;1cad	d1 	. 
	jr nz,l1cb5h		;1cae	20 05 	  . 
	add hl,bc			;1cb0	09 	. 
	ld sp,hl			;1cb1	f9 	. 
	ld (040e8h),hl		;1cb2	22 e8 40 	" . @ 
l1cb5h:
	ex de,hl			;1cb5	eb 	. 
	ld c,008h		;1cb6	0e 08 	. . 
	call sub_1963h		;1cb8	cd 63 19 	. c . 
	push hl			;1cbb	e5 	. 
	call l1f05h		;1cbc	cd 05 1f 	. . . 
	ex (sp),hl			;1cbf	e3 	. 
	push hl			;1cc0	e5 	. 
	ld hl,(040a2h)		;1cc1	2a a2 40 	* . @ 
	ex (sp),hl			;1cc4	e3 	. 
	rst 8			;1cc5	cf 	. 
	cp l			;1cc6	bd 	. 
	rst 20h			;1cc7	e7 	. 
	jp z,l0af6h		;1cc8	ca f6 0a 	. . . 
	jp nc,l0af6h		;1ccb	d2 f6 0a 	. . . 
	push af			;1cce	f5 	. 
	call 02337h		;1ccf	cd 37 23 	. 7 # 
	pop af			;1cd2	f1 	. 
	push hl			;1cd3	e5 	. 
	jp p,l1cech		;1cd4	f2 ec 1c 	. . . 
	call l0a7fh		;1cd7	cd 7f 0a 	.  . 
	ex (sp),hl			;1cda	e3 	. 
	ld de,l0001h		;1cdb	11 01 00 	. . . 
	ld a,(hl)			;1cde	7e 	~ 
	cp 0cch		;1cdf	fe cc 	. . 
	call z,sub_2b01h		;1ce1	cc 01 2b 	. . + 
	push de			;1ce4	d5 	. 
	push hl			;1ce5	e5 	. 
	ex de,hl			;1ce6	eb 	. 
	call sub_099eh		;1ce7	cd 9e 09 	. . . 
	jr l1d0eh		;1cea	18 22 	. " 
l1cech:
	call sub_0ab1h		;1cec	cd b1 0a 	. . . 
	call sub_09bfh		;1cef	cd bf 09 	. . . 
	pop hl			;1cf2	e1 	. 
	push bc			;1cf3	c5 	. 
	push de			;1cf4	d5 	. 
	ld bc,08100h		;1cf5	01 00 81 	. . . 
	ld d,c			;1cf8	51 	Q 
	ld e,d			;1cf9	5a 	Z 
	ld a,(hl)			;1cfa	7e 	~ 
	cp 0cch		;1cfb	fe cc 	. . 
	ld a,001h		;1cfd	3e 01 	> . 
	jr nz,l1d0fh		;1cff	20 0e 	  . 
	call sub_2338h		;1d01	cd 38 23 	. 8 # 
	push hl			;1d04	e5 	. 
	call sub_0ab1h		;1d05	cd b1 0a 	. . . 
	call sub_09bfh		;1d08	cd bf 09 	. . . 
	call sub_0955h		;1d0b	cd 55 09 	. U . 
l1d0eh:
	pop hl			;1d0e	e1 	. 
l1d0fh:
	push bc			;1d0f	c5 	. 
	push de			;1d10	d5 	. 
	ld c,a			;1d11	4f 	O 
	rst 20h			;1d12	e7 	. 
	ld b,a			;1d13	47 	G 
	push bc			;1d14	c5 	. 
	push hl			;1d15	e5 	. 
	ld hl,(040dfh)		;1d16	2a df 40 	* . @ 
	ex (sp),hl			;1d19	e3 	. 
l1d1ah:
	ld b,081h		;1d1a	06 81 	. . 
	push bc			;1d1c	c5 	. 
	inc sp			;1d1d	33 	3 
l1d1eh:
	call sub_0358h		;1d1e	cd 58 03 	. X . 
	or a			;1d21	b7 	. 
	call nz,sub_1da0h		;1d22	c4 a0 1d 	. . . 
	ld (040e6h),hl		;1d25	22 e6 40 	" . @ 
	ld (040e8h),sp		;1d28	ed 73 e8 40 	. s . @ 
	ld a,(hl)			;1d2c	7e 	~ 
	cp 03ah		;1d2d	fe 3a 	. : 
	jr z,l1d5ah		;1d2f	28 29 	( ) 
	or a			;1d31	b7 	. 
	jp nz,l1997h		;1d32	c2 97 19 	. . . 
	inc hl			;1d35	23 	# 
l1d36h:
	ld a,(hl)			;1d36	7e 	~ 
	inc hl			;1d37	23 	# 
	or (hl)			;1d38	b6 	. 
	jp z,l197eh		;1d39	ca 7e 19 	. ~ . 
	inc hl			;1d3c	23 	# 
	ld e,(hl)			;1d3d	5e 	^ 
	inc hl			;1d3e	23 	# 
	ld d,(hl)			;1d3f	56 	V 
	ex de,hl			;1d40	eb 	. 
	ld (040a2h),hl		;1d41	22 a2 40 	" . @ 
	ld a,(0411bh)		;1d44	3a 1b 41 	: . A 
	or a			;1d47	b7 	. 
	jr z,l1d59h		;1d48	28 0f 	( . 
	push de			;1d4a	d5 	. 
	ld a,03ch		;1d4b	3e 3c 	> < 
	call sub_032ah		;1d4d	cd 2a 03 	. * . 
	call sub_0fafh		;1d50	cd af 0f 	. . . 
	ld a,03eh		;1d53	3e 3e 	> > 
	call sub_032ah		;1d55	cd 2a 03 	. * . 
	pop de			;1d58	d1 	. 
l1d59h:
	ex de,hl			;1d59	eb 	. 
l1d5ah:
	rst 10h			;1d5a	d7 	. 
	ld de,l1d1eh		;1d5b	11 1e 1d 	. . . 
	push de			;1d5e	d5 	. 
l1d5fh:
	ret z			;1d5f	c8 	. 
l1d60h:
	sub 080h		;1d60	d6 80 	. . 
	jp c,l1f21h		;1d62	da 21 1f 	. ! . 
	cp 03ch		;1d65	fe 3c 	. < 
	jp nc,l2ae7h		;1d67	d2 e7 2a 	. . * 
	rlca			;1d6a	07 	. 
	ld c,a			;1d6b	4f 	O 
	ld b,000h		;1d6c	06 00 	. . 
	ex de,hl			;1d6e	eb 	. 
	ld hl,l1822h		;1d6f	21 22 18 	! " . 
	add hl,bc			;1d72	09 	. 
	ld c,(hl)			;1d73	4e 	N 
	inc hl			;1d74	23 	# 
	ld b,(hl)			;1d75	46 	F 
	push bc			;1d76	c5 	. 
	ex de,hl			;1d77	eb 	. 
l1d78h:
	inc hl			;1d78	23 	# 
	ld a,(hl)			;1d79	7e 	~ 
	cp 03ah		;1d7a	fe 3a 	. : 
	ret nc			;1d7c	d0 	. 
	cp 020h		;1d7d	fe 20 	.   
	jp z,l1d78h		;1d7f	ca 78 1d 	. x . 
	cp 00bh		;1d82	fe 0b 	. . 
	jr nc,l1d8bh		;1d84	30 05 	0 . 
	cp 009h		;1d86	fe 09 	. . 
	jp nc,l1d78h		;1d88	d2 78 1d 	. x . 
l1d8bh:
	cp 030h		;1d8b	fe 30 	. 0 
	ccf			;1d8d	3f 	? 
	inc a			;1d8e	3c 	< 
	dec a			;1d8f	3d 	= 
	ret			;1d90	c9 	. 
sub_1d91h:
	ex de,hl			;1d91	eb 	. 
	ld hl,(040a4h)		;1d92	2a a4 40 	* . @ 
	dec hl			;1d95	2b 	+ 
l1d96h:
	ld (040ffh),hl		;1d96	22 ff 40 	" . @ 
	ex de,hl			;1d99	eb 	. 
	ret			;1d9a	c9 	. 
sub_1d9bh:
	call sub_0358h		;1d9b	cd 58 03 	. X . 
	or a			;1d9e	b7 	. 
	ret z			;1d9f	c8 	. 
sub_1da0h:
	cp 060h		;1da0	fe 60 	. ` 
	call z,l0384h		;1da2	cc 84 03 	. . . 
	ld (04099h),a		;1da5	32 99 40 	2 . @ 
	dec a			;1da8	3d 	= 
	ret nz			;1da9	c0 	. 
	inc a			;1daa	3c 	< 
	jp l1db4h		;1dab	c3 b4 1d 	. . . 
	ret nz			;1dae	c0 	. 
	push af			;1daf	f5 	. 
	call z,041bbh		;1db0	cc bb 41 	. . A 
	pop af			;1db3	f1 	. 
l1db4h:
	ld (040e6h),hl		;1db4	22 e6 40 	" . @ 
	ld hl,040b5h		;1db7	21 b5 40 	! . @ 
	ld (040b3h),hl		;1dba	22 b3 40 	" . @ 
	ld hl,0fff6h		;1dbd	21 f6 ff 	! . . 
	pop bc			;1dc0	c1 	. 
l1dc1h:
	ld hl,(040a2h)		;1dc1	2a a2 40 	* . @ 
	push hl			;1dc4	e5 	. 
	push af			;1dc5	f5 	. 
	ld a,l			;1dc6	7d 	} 
	and h			;1dc7	a4 	. 
	inc a			;1dc8	3c 	< 
	jr z,l1dd4h		;1dc9	28 09 	( . 
	ld (040f5h),hl		;1dcb	22 f5 40 	" . @ 
	ld hl,(040e6h)		;1dce	2a e6 40 	* . @ 
	ld (040f7h),hl		;1dd1	22 f7 40 	" . @ 
l1dd4h:
	call sub_038bh		;1dd4	cd 8b 03 	. . . 
	call sub_20f9h		;1dd7	cd f9 20 	. .   
	pop af			;1dda	f1 	. 
	ld hl,l1930h		;1ddb	21 30 19 	! 0 . 
	jp nz,l1a06h		;1dde	c2 06 1a 	. . . 
	jp 01a18h		;1de1	c3 18 1a 	. . . 
	ld hl,(040f7h)		;1de4	2a f7 40 	* . @ 
	ld a,h			;1de7	7c 	| 
	or l			;1de8	b5 	. 
	ld e,020h		;1de9	1e 20 	.   
	jp z,l19a2h		;1deb	ca a2 19 	. . . 
	ex de,hl			;1dee	eb 	. 
	ld hl,(040f5h)		;1def	2a f5 40 	* . @ 
	ld (040a2h),hl		;1df2	22 a2 40 	" . @ 
	ex de,hl			;1df5	eb 	. 
	ret			;1df6	c9 	. 
	ld a,0afh		;1df7	3e af 	> . 
	ld (0411bh),a		;1df9	32 1b 41 	2 . A 
	ret			;1dfc	c9 	. 
	pop af			;1dfd	f1 	. 
	pop hl			;1dfe	e1 	. 
	ret			;1dff	c9 	. 
	ld e,003h		;1e00	1e 03 	. . 
	ld bc,sub_021eh		;1e02	01 1e 02 	. . . 
	ld bc,0041eh		;1e05	01 1e 04 	. . . 
	ld bc,l081eh		;1e08	01 1e 08 	. . . 
l1e0bh:
	call sub_1e3dh		;1e0b	cd 3d 1e 	. = . 
	ld bc,l1997h		;1e0e	01 97 19 	. . . 
	push bc			;1e11	c5 	. 
	ret c			;1e12	d8 	. 
	sub 041h		;1e13	d6 41 	. A 
	ld c,a			;1e15	4f 	O 
	ld b,a			;1e16	47 	G 
	rst 10h			;1e17	d7 	. 
	cp 0ceh		;1e18	fe ce 	. . 
	jr nz,l1e25h		;1e1a	20 09 	  . 
	rst 10h			;1e1c	d7 	. 
	call sub_1e3dh		;1e1d	cd 3d 1e 	. = . 
	ret c			;1e20	d8 	. 
	sub 041h		;1e21	d6 41 	. A 
	ld b,a			;1e23	47 	G 
	rst 10h			;1e24	d7 	. 
l1e25h:
	ld a,b			;1e25	78 	x 
	sub c			;1e26	91 	. 
	ret c			;1e27	d8 	. 
	inc a			;1e28	3c 	< 
	ex (sp),hl			;1e29	e3 	. 
	ld hl,04101h		;1e2a	21 01 41 	! . A 
	ld b,000h		;1e2d	06 00 	. . 
	add hl,bc			;1e2f	09 	. 
l1e30h:
	ld (hl),e			;1e30	73 	s 
	inc hl			;1e31	23 	# 
	dec a			;1e32	3d 	= 
	jr nz,l1e30h		;1e33	20 fb 	  . 
	pop hl			;1e35	e1 	. 
	ld a,(hl)			;1e36	7e 	~ 
	cp 02ch		;1e37	fe 2c 	. , 
	ret nz			;1e39	c0 	. 
	rst 10h			;1e3a	d7 	. 
	jr l1e0bh		;1e3b	18 ce 	. . 
sub_1e3dh:
	ld a,(hl)			;1e3d	7e 	~ 
	cp 041h		;1e3e	fe 41 	. A 
	ret c			;1e40	d8 	. 
	cp 05bh		;1e41	fe 5b 	. [ 
	ccf			;1e43	3f 	? 
	ret			;1e44	c9 	. 
sub_1e45h:
	rst 10h			;1e45	d7 	. 
sub_1e46h:
	call sub_2b02h		;1e46	cd 02 2b 	. . + 
	ret p			;1e49	f0 	. 
l1e4ah:
	ld e,008h		;1e4a	1e 08 	. . 
	jp l19a2h		;1e4c	c3 a2 19 	. . . 
sub_1e4fh:
	ld a,(hl)			;1e4f	7e 	~ 
	cp 02eh		;1e50	fe 2e 	. . 
	ex de,hl			;1e52	eb 	. 
	ld hl,(040ech)		;1e53	2a ec 40 	* . @ 
	ex de,hl			;1e56	eb 	. 
	jp z,l1d78h		;1e57	ca 78 1d 	. x . 
sub_1e5ah:
	dec hl			;1e5a	2b 	+ 
sub_1e5bh:
	ld de,l0000h		;1e5b	11 00 00 	. . . 
l1e5eh:
	rst 10h			;1e5e	d7 	. 
	ret nc			;1e5f	d0 	. 
	push hl			;1e60	e5 	. 
	push af			;1e61	f5 	. 
	ld hl,l1997h+1		;1e62	21 98 19 	! . . 
	rst 18h			;1e65	df 	. 
	jp c,l1997h		;1e66	da 97 19 	. . . 
	ld h,d			;1e69	62 	b 
	ld l,e			;1e6a	6b 	k 
	add hl,de			;1e6b	19 	. 
	add hl,hl			;1e6c	29 	) 
	add hl,de			;1e6d	19 	. 
	add hl,hl			;1e6e	29 	) 
	pop af			;1e6f	f1 	. 
	sub 030h		;1e70	d6 30 	. 0 
	ld e,a			;1e72	5f 	_ 
	ld d,000h		;1e73	16 00 	. . 
	add hl,de			;1e75	19 	. 
	ex de,hl			;1e76	eb 	. 
	pop hl			;1e77	e1 	. 
	jr l1e5eh		;1e78	18 e4 	. . 
	jp z,l1b61h		;1e7a	ca 61 1b 	. a . 
	call sub_1e46h		;1e7d	cd 46 1e 	. F . 
	dec hl			;1e80	2b 	+ 
	rst 10h			;1e81	d7 	. 
	ret nz			;1e82	c0 	. 
	push hl			;1e83	e5 	. 
	ld hl,(040b1h)		;1e84	2a b1 40 	* . @ 
	ld a,l			;1e87	7d 	} 
	sub e			;1e88	93 	. 
	ld e,a			;1e89	5f 	_ 
	ld a,h			;1e8a	7c 	| 
	sbc a,d			;1e8b	9a 	. 
	ld d,a			;1e8c	57 	W 
	jp c,l197ah		;1e8d	da 7a 19 	. z . 
	ld hl,(040f9h)		;1e90	2a f9 40 	* . @ 
	ld bc,l0028h		;1e93	01 28 00 	. ( . 
	add hl,bc			;1e96	09 	. 
	rst 18h			;1e97	df 	. 
	jp nc,l197ah		;1e98	d2 7a 19 	. z . 
	ex de,hl			;1e9b	eb 	. 
	ld (040a0h),hl		;1e9c	22 a0 40 	" . @ 
	pop hl			;1e9f	e1 	. 
	jp l1b61h		;1ea0	c3 61 1b 	. a . 
	jp z,sub_1b5dh		;1ea3	ca 5d 1b 	. ] . 
	call 041c7h		;1ea6	cd c7 41 	. . A 
	call l1b61h		;1ea9	cd 61 1b 	. a . 
	ld bc,l1d1eh		;1eac	01 1e 1d 	. . . 
	jr l1ec1h		;1eaf	18 10 	. . 
	ld c,003h		;1eb1	0e 03 	. . 
	call sub_1963h		;1eb3	cd 63 19 	. c . 
	pop bc			;1eb6	c1 	. 
	push hl			;1eb7	e5 	. 
	push hl			;1eb8	e5 	. 
	ld hl,(040a2h)		;1eb9	2a a2 40 	* . @ 
	ex (sp),hl			;1ebc	e3 	. 
	ld a,091h		;1ebd	3e 91 	> . 
	push af			;1ebf	f5 	. 
	inc sp			;1ec0	33 	3 
l1ec1h:
	push bc			;1ec1	c5 	. 
l1ec2h:
	call sub_1e5ah		;1ec2	cd 5a 1e 	. Z . 
l1ec5h:
	call l1f05h+2		;1ec5	cd 07 1f 	. . . 
	push hl			;1ec8	e5 	. 
	ld hl,(040a2h)		;1ec9	2a a2 40 	* . @ 
	rst 18h			;1ecc	df 	. 
	pop hl			;1ecd	e1 	. 
	inc hl			;1ece	23 	# 
	call c,l1b2fh		;1ecf	dc 2f 1b 	. / . 
	call nc,sub_1b2ch		;1ed2	d4 2c 1b 	. , . 
	ld h,b			;1ed5	60 	` 
	ld l,c			;1ed6	69 	i 
	dec hl			;1ed7	2b 	+ 
	ret c			;1ed8	d8 	. 
l1ed9h:
	ld e,00eh		;1ed9	1e 0e 	. . 
	jp l19a2h		;1edb	c3 a2 19 	. . . 
	ret nz			;1ede	c0 	. 
	ld d,0ffh		;1edf	16 ff 	. . 
	call sub_1936h		;1ee1	cd 36 19 	. 6 . 
	ld sp,hl			;1ee4	f9 	. 
	ld (040e8h),hl		;1ee5	22 e8 40 	" . @ 
	cp 091h		;1ee8	fe 91 	. . 
	ld e,004h		;1eea	1e 04 	. . 
	jp nz,l19a2h		;1eec	c2 a2 19 	. . . 
	pop hl			;1eef	e1 	. 
	ld (040a2h),hl		;1ef0	22 a2 40 	" . @ 
	inc hl			;1ef3	23 	# 
	ld a,h			;1ef4	7c 	| 
	or l			;1ef5	b5 	. 
	jr nz,l1effh		;1ef6	20 07 	  . 
	ld a,(040ddh)		;1ef8	3a dd 40 	: . @ 
	or a			;1efb	b7 	. 
	jp nz,01a18h		;1efc	c2 18 1a 	. . . 
l1effh:
	ld hl,l1d1eh		;1eff	21 1e 1d 	! . . 
	ex (sp),hl			;1f02	e3 	. 
	ld a,0e1h		;1f03	3e e1 	> . 
l1f05h:
	ld bc,l0e3ah		;1f05	01 3a 0e 	. : . 
	nop			;1f08	00 	. 
	ld b,000h		;1f09	06 00 	. . 
l1f0bh:
	ld a,c			;1f0b	79 	y 
	ld c,b			;1f0c	48 	H 
	ld b,a			;1f0d	47 	G 
l1f0eh:
	ld a,(hl)			;1f0e	7e 	~ 
	or a			;1f0f	b7 	. 
	ret z			;1f10	c8 	. 
	cp b			;1f11	b8 	. 
	ret z			;1f12	c8 	. 
	inc hl			;1f13	23 	# 
	cp 022h		;1f14	fe 22 	. " 
	jr z,l1f0bh		;1f16	28 f3 	( . 
	sub 08fh		;1f18	d6 8f 	. . 
	jr nz,l1f0eh		;1f1a	20 f2 	  . 
	cp b			;1f1c	b8 	. 
	adc a,d			;1f1d	8a 	. 
	ld d,a			;1f1e	57 	W 
	jr l1f0eh		;1f1f	18 ed 	. . 
l1f21h:
	call 0260dh		;1f21	cd 0d 26 	. . & 
	rst 8			;1f24	cf 	. 
	push de			;1f25	d5 	. 
	ex de,hl			;1f26	eb 	. 
	ld (040dfh),hl		;1f27	22 df 40 	" . @ 
	ex de,hl			;1f2a	eb 	. 
	push de			;1f2b	d5 	. 
	rst 20h			;1f2c	e7 	. 
	push af			;1f2d	f5 	. 
	call 02337h		;1f2e	cd 37 23 	. 7 # 
	pop af			;1f31	f1 	. 
	ex (sp),hl			;1f32	e3 	. 
l1f33h:
	add a,003h		;1f33	c6 03 	. . 
	call sub_2819h		;1f35	cd 19 28 	. . ( 
	call sub_0a03h		;1f38	cd 03 0a 	. . . 
	push hl			;1f3b	e5 	. 
	jr nz,l1f66h		;1f3c	20 28 	  ( 
	ld hl,(04121h)		;1f3e	2a 21 41 	* ! A 
	push hl			;1f41	e5 	. 
	inc hl			;1f42	23 	# 
	ld e,(hl)			;1f43	5e 	^ 
	inc hl			;1f44	23 	# 
	ld d,(hl)			;1f45	56 	V 
	ld hl,(040a4h)		;1f46	2a a4 40 	* . @ 
	rst 18h			;1f49	df 	. 
	jr nc,$+16		;1f4a	30 0e 	0 . 
	ld hl,(040a0h)		;1f4c	2a a0 40 	* . @ 
	rst 18h			;1f4f	df 	. 
	pop de			;1f50	d1 	. 
	jr nc,l1f62h		;1f51	30 0f 	0 . 
	ld hl,(040f9h)		;1f53	2a f9 40 	* . @ 
	rst 18h			;1f56	df 	. 
	jr nc,l1f62h		;1f57	30 09 	0 . 
	ld a,0d1h		;1f59	3e d1 	> . 
	call sub_29f5h		;1f5b	cd f5 29 	. . ) 
	ex de,hl			;1f5e	eb 	. 
	call sub_2843h		;1f5f	cd 43 28 	. C ( 
l1f62h:
	call sub_29f5h		;1f62	cd f5 29 	. . ) 
	ex (sp),hl			;1f65	e3 	. 
l1f66h:
	call l09d3h		;1f66	cd d3 09 	. . . 
	pop de			;1f69	d1 	. 
	pop hl			;1f6a	e1 	. 
	ret			;1f6b	c9 	. 
l1f6ch:
	cp 09eh		;1f6c	fe 9e 	. . 
	jr nz,l1f95h		;1f6e	20 25 	  % 
	rst 10h			;1f70	d7 	. 
	rst 8			;1f71	cf 	. 
	adc a,l			;1f72	8d 	. 
	call sub_1e5ah		;1f73	cd 5a 1e 	. Z . 
	ld a,d			;1f76	7a 	z 
	or e			;1f77	b3 	. 
	jr z,l1f83h		;1f78	28 09 	( . 
	call sub_1b2ah		;1f7a	cd 2a 1b 	. * . 
	ld d,b			;1f7d	50 	P 
	ld e,c			;1f7e	59 	Y 
	pop hl			;1f7f	e1 	. 
	jp nc,l1ed9h		;1f80	d2 d9 1e 	. . . 
l1f83h:
	ex de,hl			;1f83	eb 	. 
	ld (040f0h),hl		;1f84	22 f0 40 	" . @ 
	ex de,hl			;1f87	eb 	. 
	ret c			;1f88	d8 	. 
	ld a,(040f2h)		;1f89	3a f2 40 	: . @ 
	or a			;1f8c	b7 	. 
	ret z			;1f8d	c8 	. 
	ld a,(0409ah)		;1f8e	3a 9a 40 	: . @ 
	ld e,a			;1f91	5f 	_ 
	jp l19abh		;1f92	c3 ab 19 	. . . 
l1f95h:
	call sub_2b1ch		;1f95	cd 1c 2b 	. . + 
	ld a,(hl)			;1f98	7e 	~ 
	ld b,a			;1f99	47 	G 
	cp 091h		;1f9a	fe 91 	. . 
	jr z,l1fa1h		;1f9c	28 03 	( . 
	rst 8			;1f9e	cf 	. 
	adc a,l			;1f9f	8d 	. 
	dec hl			;1fa0	2b 	+ 
l1fa1h:
	ld c,e			;1fa1	4b 	K 
l1fa2h:
	dec c			;1fa2	0d 	. 
	ld a,b			;1fa3	78 	x 
	jp z,l1d60h		;1fa4	ca 60 1d 	. ` . 
	call sub_1e5bh		;1fa7	cd 5b 1e 	. [ . 
	cp 02ch		;1faa	fe 2c 	. , 
	ret nz			;1fac	c0 	. 
	jr l1fa2h		;1fad	18 f3 	. . 
	ld de,040f2h		;1faf	11 f2 40 	. . @ 
	ld a,(de)			;1fb2	1a 	. 
	or a			;1fb3	b7 	. 
	jp z,019a0h		;1fb4	ca a0 19 	. . . 
	inc a			;1fb7	3c 	< 
	ld (0409ah),a		;1fb8	32 9a 40 	2 . @ 
	ld (de),a			;1fbb	12 	. 
	ld a,(hl)			;1fbc	7e 	~ 
	cp 087h		;1fbd	fe 87 	. . 
	jr z,l1fcdh		;1fbf	28 0c 	( . 
	call sub_1e5ah		;1fc1	cd 5a 1e 	. Z . 
	ret nz			;1fc4	c0 	. 
	ld a,d			;1fc5	7a 	z 
	or e			;1fc6	b3 	. 
	jp nz,l1ec5h		;1fc7	c2 c5 1e 	. . . 
	inc a			;1fca	3c 	< 
	jr l1fcfh		;1fcb	18 02 	. . 
l1fcdh:
	rst 10h			;1fcd	d7 	. 
	ret nz			;1fce	c0 	. 
l1fcfh:
	ld hl,(040eeh)		;1fcf	2a ee 40 	* . @ 
	ex de,hl			;1fd2	eb 	. 
	ld hl,(040eah)		;1fd3	2a ea 40 	* . @ 
	ld (040a2h),hl		;1fd6	22 a2 40 	" . @ 
	ex de,hl			;1fd9	eb 	. 
	ret nz			;1fda	c0 	. 
	ld a,(hl)			;1fdb	7e 	~ 
	or a			;1fdc	b7 	. 
	jr nz,l1fe3h		;1fdd	20 04 	  . 
	inc hl			;1fdf	23 	# 
	inc hl			;1fe0	23 	# 
	inc hl			;1fe1	23 	# 
	inc hl			;1fe2	23 	# 
l1fe3h:
	inc hl			;1fe3	23 	# 
	ld a,d			;1fe4	7a 	z 
	and e			;1fe5	a3 	. 
	inc a			;1fe6	3c 	< 
	jp nz,l1f05h		;1fe7	c2 05 1f 	. . . 
	ld a,(040ddh)		;1fea	3a dd 40 	: . @ 
	dec a			;1fed	3d 	= 
	jp z,01dbeh		;1fee	ca be 1d 	. . . 
	jp l1f05h		;1ff1	c3 05 1f 	. . . 
	call sub_2b1ch		;1ff4	cd 1c 2b 	. . + 
	ret nz			;1ff7	c0 	. 
	or a			;1ff8	b7 	. 
	jp z,l1e4ah		;1ff9	ca 4a 1e 	. J . 
	dec a			;1ffc	3d 	= 
	add a,a			;1ffd	87 	. 
	ld e,a			;1ffe	5f 	_ 
	cp 02dh		;1fff	fe 2d 	. - 
	jr c,l2005h		;2001	38 02 	8 . 
	ld e,026h		;2003	1e 26 	. & 
l2005h:
	jp l19a2h		;2005	c3 a2 19 	. . . 
	ld de,0000ah		;2008	11 0a 00 	. . . 
	push de			;200b	d5 	. 
	jr z,l2025h		;200c	28 17 	( . 
	call sub_1e4fh		;200e	cd 4f 1e 	. O . 
	ex de,hl			;2011	eb 	. 
	ex (sp),hl			;2012	e3 	. 
	jr z,l2026h		;2013	28 11 	( . 
	ex de,hl			;2015	eb 	. 
	rst 8			;2016	cf 	. 
	inc l			;2017	2c 	, 
	ex de,hl			;2018	eb 	. 
	ld hl,(040e4h)		;2019	2a e4 40 	* . @ 
	ex de,hl			;201c	eb 	. 
	jr z,l2025h		;201d	28 06 	( . 
	call sub_1e5ah		;201f	cd 5a 1e 	. Z . 
	jp nz,l1997h		;2022	c2 97 19 	. . . 
l2025h:
	ex de,hl			;2025	eb 	. 
l2026h:
	ld a,h			;2026	7c 	| 
	or l			;2027	b5 	. 
	jp z,l1e4ah		;2028	ca 4a 1e 	. J . 
	ld (040e4h),hl		;202b	22 e4 40 	" . @ 
	ld (040e1h),a		;202e	32 e1 40 	2 . @ 
	pop hl			;2031	e1 	. 
	ld (040e2h),hl		;2032	22 e2 40 	" . @ 
	pop bc			;2035	c1 	. 
	jp l1a33h		;2036	c3 33 1a 	. 3 . 
	call 02337h		;2039	cd 37 23 	. 7 # 
	ld a,(hl)			;203c	7e 	~ 
	cp 02ch		;203d	fe 2c 	. , 
	call z,l1d78h		;203f	cc 78 1d 	. x . 
	cp 0cah		;2042	fe ca 	. . 
	call z,l1d78h		;2044	cc 78 1d 	. x . 
	dec hl			;2047	2b 	+ 
	push hl			;2048	e5 	. 
	call sub_0994h		;2049	cd 94 09 	. . . 
	pop hl			;204c	e1 	. 
	jr z,l2056h		;204d	28 07 	( . 
l204fh:
	rst 10h			;204f	d7 	. 
	jp c,l1ec2h		;2050	da c2 1e 	. . . 
	jp l1d5fh		;2053	c3 5f 1d 	. _ . 
l2056h:
	ld d,001h		;2056	16 01 	. . 
l2058h:
	call l1f05h		;2058	cd 05 1f 	. . . 
	or a			;205b	b7 	. 
	ret z			;205c	c8 	. 
	rst 10h			;205d	d7 	. 
	cp 095h		;205e	fe 95 	. . 
	jr nz,l2058h		;2060	20 f6 	  . 
	dec d			;2062	15 	. 
	jr nz,l2058h		;2063	20 f3 	  . 
	jr l204fh		;2065	18 e8 	. . 
	ld a,001h		;2067	3e 01 	> . 
	ld (0409ch),a		;2069	32 9c 40 	2 . @ 
	jp l209bh		;206c	c3 9b 20 	. .   
	call 041cah		;206f	cd ca 41 	. . A 
	cp 040h		;2072	fe 40 	. @ 
	jr nz,l208fh		;2074	20 19 	  . 
	call sub_2b01h		;2076	cd 01 2b 	. . + 
	cp 004h		;2079	fe 04 	. . 
	jp nc,l1e4ah		;207b	d2 4a 1e 	. J . 
	push hl			;207e	e5 	. 
	ld hl,03c00h		;207f	21 00 3c 	! . < 
	add hl,de			;2082	19 	. 
	ld (04020h),hl		;2083	22 20 40 	"   @ 
	ld a,e			;2086	7b 	{ 
	and 03fh		;2087	e6 3f 	. ? 
	ld (040a6h),a		;2089	32 a6 40 	2 . @ 
	pop hl			;208c	e1 	. 
	rst 8			;208d	cf 	. 
	inc l			;208e	2c 	, 
l208fh:
	cp 023h		;208f	fe 23 	. # 
	jr nz,l209bh		;2091	20 08 	  . 
	call sub_0284h		;2093	cd 84 02 	. . . 
	ld a,080h		;2096	3e 80 	> . 
	ld (0409ch),a		;2098	32 9c 40 	2 . @ 
l209bh:
	dec hl			;209b	2b 	+ 
	rst 10h			;209c	d7 	. 
	call z,sub_20feh		;209d	cc fe 20 	. .   
l20a0h:
	jp z,sub_2169h		;20a0	ca 69 21 	. i ! 
	cp 0bfh		;20a3	fe bf 	. . 
	jp z,l2cbdh		;20a5	ca bd 2c 	. . , 
	cp 0bch		;20a8	fe bc 	. . 
	jp z,l2137h		;20aa	ca 37 21 	. 7 ! 
	push hl			;20ad	e5 	. 
	cp 02ch		;20ae	fe 2c 	. , 
	jp z,l2108h		;20b0	ca 08 21 	. . ! 
	cp 03bh		;20b3	fe 3b 	. ; 
	jp z,l2164h		;20b5	ca 64 21 	. d ! 
	pop bc			;20b8	c1 	. 
	call 02337h		;20b9	cd 37 23 	. 7 # 
	push hl			;20bc	e5 	. 
	rst 20h			;20bd	e7 	. 
	jr z,l20f2h		;20be	28 32 	( 2 
	call sub_0fbdh		;20c0	cd bd 0f 	. . . 
	call sub_2865h		;20c3	cd 65 28 	. e ( 
	call 041cdh		;20c6	cd cd 41 	. . A 
	ld hl,(04121h)		;20c9	2a 21 41 	* ! A 
	ld a,(0409ch)		;20cc	3a 9c 40 	: . @ 
	or a			;20cf	b7 	. 
	jp m,l20e9h		;20d0	fa e9 20 	. .   
	jr z,l20ddh		;20d3	28 08 	( . 
	ld a,(0409bh)		;20d5	3a 9b 40 	: . @ 
	add a,(hl)			;20d8	86 	. 
	cp 084h		;20d9	fe 84 	. . 
	jr l20e6h		;20db	18 09 	. . 
l20ddh:
	ld a,(0409dh)		;20dd	3a 9d 40 	: . @ 
	ld b,a			;20e0	47 	G 
	ld a,(040a6h)		;20e1	3a a6 40 	: . @ 
	add a,(hl)			;20e4	86 	. 
	cp b			;20e5	b8 	. 
l20e6h:
	call nc,sub_20feh		;20e6	d4 fe 20 	. .   
l20e9h:
	call sub_28aah		;20e9	cd aa 28 	. . ( 
	ld a,020h		;20ec	3e 20 	>   
	call sub_032ah		;20ee	cd 2a 03 	. * . 
	or a			;20f1	b7 	. 
l20f2h:
	call z,sub_28aah		;20f2	cc aa 28 	. . ( 
	pop hl			;20f5	e1 	. 
	jp l209bh		;20f6	c3 9b 20 	. .   
sub_20f9h:
	ld a,(040a6h)		;20f9	3a a6 40 	: . @ 
	or a			;20fc	b7 	. 
	ret z			;20fd	c8 	. 
sub_20feh:
	ld a,00dh		;20fe	3e 0d 	> . 
l2100h:
	call sub_032ah		;2100	cd 2a 03 	. * . 
sub_2103h:
	call 041d0h		;2103	cd d0 41 	. . A 
	xor a			;2106	af 	. 
	ret			;2107	c9 	. 
l2108h:
	call 041d3h		;2108	cd d3 41 	. . A 
	ld a,(0409ch)		;210b	3a 9c 40 	: . @ 
	or a			;210e	b7 	. 
	jp p,l2119h		;210f	f2 19 21 	. . ! 
	ld a,02ch		;2112	3e 2c 	> , 
	call sub_032ah		;2114	cd 2a 03 	. * . 
	jr l2164h		;2117	18 4b 	. K 
l2119h:
	jr z,l2123h		;2119	28 08 	( . 
	ld a,(0409bh)		;211b	3a 9b 40 	: . @ 
	cp 070h		;211e	fe 70 	. p 
	jp l212bh		;2120	c3 2b 21 	. + ! 
l2123h:
	ld a,(0409eh)		;2123	3a 9e 40 	: . @ 
	ld b,a			;2126	47 	G 
	ld a,(040a6h)		;2127	3a a6 40 	: . @ 
	cp b			;212a	b8 	. 
l212bh:
	call nc,sub_20feh		;212b	d4 fe 20 	. .   
	jr nc,l2164h		;212e	30 34 	0 4 
l2130h:
	sub 010h		;2130	d6 10 	. . 
	jr nc,l2130h		;2132	30 fc 	0 . 
	cpl			;2134	2f 	/ 
	jr l215ah		;2135	18 23 	. # 
l2137h:
	call sub_2b1bh		;2137	cd 1b 2b 	. . + 
	and 03fh		;213a	e6 3f 	. ? 
	ld e,a			;213c	5f 	_ 
	rst 8			;213d	cf 	. 
	add hl,hl			;213e	29 	) 
	dec hl			;213f	2b 	+ 
	push hl			;2140	e5 	. 
	call 041d3h		;2141	cd d3 41 	. . A 
	ld a,(0409ch)		;2144	3a 9c 40 	: . @ 
	or a			;2147	b7 	. 
	jp m,l1e4ah		;2148	fa 4a 1e 	. J . 
	jp z,l2153h		;214b	ca 53 21 	. S ! 
	ld a,(0409bh)		;214e	3a 9b 40 	: . @ 
	jr l2156h		;2151	18 03 	. . 
l2153h:
	ld a,(040a6h)		;2153	3a a6 40 	: . @ 
l2156h:
	cpl			;2156	2f 	/ 
	add a,e			;2157	83 	. 
	jr nc,l2164h		;2158	30 0a 	0 . 
l215ah:
	inc a			;215a	3c 	< 
	ld b,a			;215b	47 	G 
	ld a,020h		;215c	3e 20 	>   
l215eh:
	call sub_032ah		;215e	cd 2a 03 	. * . 
	dec b			;2161	05 	. 
	jr nz,l215eh		;2162	20 fa 	  . 
l2164h:
	pop hl			;2164	e1 	. 
	rst 10h			;2165	d7 	. 
	jp l20a0h		;2166	c3 a0 20 	. .   
sub_2169h:
	ld a,(0409ch)		;2169	3a 9c 40 	: . @ 
	or a			;216c	b7 	. 
	call m,sub_01f8h		;216d	fc f8 01 	. . . 
	xor a			;2170	af 	. 
	ld (0409ch),a		;2171	32 9c 40 	2 . @ 
	call 041beh		;2174	cd be 41 	. . A 
	ret			;2177	c9 	. 
l2178h:
	ccf			;2178	3f 	? 
	ld d,d			;2179	52 	R 
	ld b,l			;217a	45 	E 
	ld b,h			;217b	44 	D 
	ld c,a			;217c	4f 	O 
	dec c			;217d	0d 	. 
	nop			;217e	00 	. 
l217fh:
	ld a,(040deh)		;217f	3a de 40 	: . @ 
	or a			;2182	b7 	. 
	jp nz,l1991h		;2183	c2 91 19 	. . . 
	ld a,(040a9h)		;2186	3a a9 40 	: . @ 
	or a			;2189	b7 	. 
	ld e,02ah		;218a	1e 2a 	. * 
	jp z,l19a2h		;218c	ca a2 19 	. . . 
	pop bc			;218f	c1 	. 
	ld hl,l2178h		;2190	21 78 21 	! x ! 
	call sub_28a7h		;2193	cd a7 28 	. . ( 
	ld hl,(040e6h)		;2196	2a e6 40 	* . @ 
	ret			;2199	c9 	. 
	call sub_2828h		;219a	cd 28 28 	. ( ( 
	ld a,(hl)			;219d	7e 	~ 
	call 041d6h		;219e	cd d6 41 	. . A 
	sub 023h		;21a1	d6 23 	. # 
	ld (040a9h),a		;21a3	32 a9 40 	2 . @ 
	ld a,(hl)			;21a6	7e 	~ 
	jr nz,l21c9h		;21a7	20 20 	    
	call sub_0293h		;21a9	cd 93 02 	. . . 
	push hl			;21ac	e5 	. 
	ld b,0fah		;21ad	06 fa 	. . 
	ld hl,(040a7h)		;21af	2a a7 40 	* . @ 
l21b2h:
	call sub_0235h		;21b2	cd 35 02 	. 5 . 
	ld (hl),a			;21b5	77 	w 
	inc hl			;21b6	23 	# 
	cp 00dh		;21b7	fe 0d 	. . 
	jr z,l21bdh		;21b9	28 02 	( . 
	djnz l21b2h		;21bb	10 f5 	. . 
l21bdh:
	dec hl			;21bd	2b 	+ 
	ld (hl),000h		;21be	36 00 	6 . 
	call sub_01f8h		;21c0	cd f8 01 	. . . 
	ld hl,(040a7h)		;21c3	2a a7 40 	* . @ 
	dec hl			;21c6	2b 	+ 
	jr l21ebh		;21c7	18 22 	. " 
l21c9h:
	ld bc,l21dbh		;21c9	01 db 21 	. . ! 
	push bc			;21cc	c5 	. 
	cp 022h		;21cd	fe 22 	. " 
	ret nz			;21cf	c0 	. 
	call sub_2866h		;21d0	cd 66 28 	. f ( 
	rst 8			;21d3	cf 	. 
	dec sp			;21d4	3b 	; 
	push hl			;21d5	e5 	. 
	call sub_28aah		;21d6	cd aa 28 	. . ( 
	pop hl			;21d9	e1 	. 
	ret			;21da	c9 	. 
l21dbh:
	push hl			;21db	e5 	. 
	call sub_1bb3h		;21dc	cd b3 1b 	. . . 
	pop bc			;21df	c1 	. 
	jp c,01dbeh		;21e0	da be 1d 	. . . 
	inc hl			;21e3	23 	# 
	ld a,(hl)			;21e4	7e 	~ 
	or a			;21e5	b7 	. 
	dec hl			;21e6	2b 	+ 
	push bc			;21e7	c5 	. 
	jp z,01f04h		;21e8	ca 04 1f 	. . . 
l21ebh:
	ld (hl),02ch		;21eb	36 2c 	6 , 
	jr $+7		;21ed	18 05 	. . 
	push hl			;21ef	e5 	. 
	ld hl,(040ffh)		;21f0	2a ff 40 	* . @ 
	or 0afh		;21f3	f6 af 	. . 
	ld (040deh),a		;21f5	32 de 40 	2 . @ 
	ex (sp),hl			;21f8	e3 	. 
	jr l21fdh		;21f9	18 02 	. . 
l21fbh:
	rst 8			;21fb	cf 	. 
	inc l			;21fc	2c 	, 
l21fdh:
	call 0260dh		;21fd	cd 0d 26 	. . & 
	ex (sp),hl			;2200	e3 	. 
	push de			;2201	d5 	. 
	ld a,(hl)			;2202	7e 	~ 
	cp 02ch		;2203	fe 2c 	. , 
	jr z,l222dh		;2205	28 26 	( & 
	ld a,(040deh)		;2207	3a de 40 	: . @ 
	or a			;220a	b7 	. 
	jp nz,l2296h		;220b	c2 96 22 	. . " 
	ld a,(040a9h)		;220e	3a a9 40 	: . @ 
	or a			;2211	b7 	. 
	ld e,006h		;2212	1e 06 	. . 
	jp z,l19a2h		;2214	ca a2 19 	. . . 
	ld a,03fh		;2217	3e 3f 	> ? 
	call sub_032ah		;2219	cd 2a 03 	. * . 
	call sub_1bb3h		;221c	cd b3 1b 	. . . 
	pop de			;221f	d1 	. 
	pop bc			;2220	c1 	. 
	jp c,01dbeh		;2221	da be 1d 	. . . 
	inc hl			;2224	23 	# 
	ld a,(hl)			;2225	7e 	~ 
	or a			;2226	b7 	. 
	dec hl			;2227	2b 	+ 
	push bc			;2228	c5 	. 
	jp z,01f04h		;2229	ca 04 1f 	. . . 
	push de			;222c	d5 	. 
l222dh:
	call 041dch		;222d	cd dc 41 	. . A 
	rst 20h			;2230	e7 	. 
	push af			;2231	f5 	. 
	jr nz,l224dh		;2232	20 19 	  . 
	rst 10h			;2234	d7 	. 
	ld d,a			;2235	57 	W 
	ld b,a			;2236	47 	G 
	cp 022h		;2237	fe 22 	. " 
	jr z,l2240h		;2239	28 05 	( . 
	ld d,03ah		;223b	16 3a 	. : 
	ld b,02ch		;223d	06 2c 	. , 
	dec hl			;223f	2b 	+ 
l2240h:
	call sub_2869h		;2240	cd 69 28 	. i ( 
l2243h:
	pop af			;2243	f1 	. 
	ex de,hl			;2244	eb 	. 
	ld hl,l225ah		;2245	21 5a 22 	! Z " 
	ex (sp),hl			;2248	e3 	. 
	push de			;2249	d5 	. 
	jp l1f33h		;224a	c3 33 1f 	. 3 . 
l224dh:
	rst 10h			;224d	d7 	. 
	pop af			;224e	f1 	. 
	push af			;224f	f5 	. 
	ld bc,l2243h		;2250	01 43 22 	. C " 
	push bc			;2253	c5 	. 
	jp c,00e6ch		;2254	da 6c 0e 	. l . 
	jp nc,l0e65h		;2257	d2 65 0e 	. e . 
l225ah:
	dec hl			;225a	2b 	+ 
	rst 10h			;225b	d7 	. 
	jr z,l2263h		;225c	28 05 	( . 
	cp 02ch		;225e	fe 2c 	. , 
	jp nz,l217fh		;2260	c2 7f 21 	.  ! 
l2263h:
	ex (sp),hl			;2263	e3 	. 
	dec hl			;2264	2b 	+ 
	rst 10h			;2265	d7 	. 
	jp nz,l21fbh		;2266	c2 fb 21 	. . ! 
	pop de			;2269	d1 	. 
	nop			;226a	00 	. 
	nop			;226b	00 	. 
	nop			;226c	00 	. 
	nop			;226d	00 	. 
	nop			;226e	00 	. 
	ld a,(040deh)		;226f	3a de 40 	: . @ 
	or a			;2272	b7 	. 
	ex de,hl			;2273	eb 	. 
	jp nz,l1d96h		;2274	c2 96 1d 	. . . 
	push de			;2277	d5 	. 
	call 041dfh		;2278	cd df 41 	. . A 
	or (hl)			;227b	b6 	. 
	ld hl,l2286h		;227c	21 86 22 	! . " 
	call nz,sub_28a7h		;227f	c4 a7 28 	. . ( 
	pop hl			;2282	e1 	. 
	jp sub_2169h		;2283	c3 69 21 	. i ! 
l2286h:
	ccf			;2286	3f 	? 
	ld b,l			;2287	45 	E 
	ld a,b			;2288	78 	x 
	ld (hl),h			;2289	74 	t 
	ld (hl),d			;228a	72 	r 
	ld h,c			;228b	61 	a 
	jr nz,l22f7h		;228c	20 69 	  i 
	ld h,a			;228e	67 	g 
	ld l,(hl)			;228f	6e 	n 
	ld l,a			;2290	6f 	o 
	ld (hl),d			;2291	72 	r 
	ld h,l			;2292	65 	e 
	ld h,h			;2293	64 	d 
	dec c			;2294	0d 	. 
	nop			;2295	00 	. 
l2296h:
	call l1f05h		;2296	cd 05 1f 	. . . 
	or a			;2299	b7 	. 
	jr nz,l22aeh		;229a	20 12 	  . 
	inc hl			;229c	23 	# 
	ld a,(hl)			;229d	7e 	~ 
	inc hl			;229e	23 	# 
	or (hl)			;229f	b6 	. 
	ld e,006h		;22a0	1e 06 	. . 
	jp z,l19a2h		;22a2	ca a2 19 	. . . 
	inc hl			;22a5	23 	# 
	ld e,(hl)			;22a6	5e 	^ 
	inc hl			;22a7	23 	# 
	ld d,(hl)			;22a8	56 	V 
	ex de,hl			;22a9	eb 	. 
	ld (040dah),hl		;22aa	22 da 40 	" . @ 
	ex de,hl			;22ad	eb 	. 
l22aeh:
	rst 10h			;22ae	d7 	. 
	cp 088h		;22af	fe 88 	. . 
	jr nz,l2296h		;22b1	20 e3 	  . 
	jp l222dh		;22b3	c3 2d 22 	. - " 
	ld de,l0000h		;22b6	11 00 00 	. . . 
sub_22b9h:
	call nz,0260dh		;22b9	c4 0d 26 	. . & 
	ld (040dfh),hl		;22bc	22 df 40 	" . @ 
	call sub_1936h		;22bf	cd 36 19 	. 6 . 
	jp nz,0199dh		;22c2	c2 9d 19 	. . . 
	ld sp,hl			;22c5	f9 	. 
	ld (040e8h),hl		;22c6	22 e8 40 	" . @ 
	push de			;22c9	d5 	. 
	ld a,(hl)			;22ca	7e 	~ 
	inc hl			;22cb	23 	# 
	push af			;22cc	f5 	. 
	push de			;22cd	d5 	. 
	ld a,(hl)			;22ce	7e 	~ 
	inc hl			;22cf	23 	# 
	or a			;22d0	b7 	. 
	jp m,l22eah		;22d1	fa ea 22 	. . " 
	call sub_09b1h		;22d4	cd b1 09 	. . . 
	ex (sp),hl			;22d7	e3 	. 
	push hl			;22d8	e5 	. 
	call sub_070bh		;22d9	cd 0b 07 	. . . 
	pop hl			;22dc	e1 	. 
	call sub_09cbh		;22dd	cd cb 09 	. . . 
	pop hl			;22e0	e1 	. 
	call sub_09c2h		;22e1	cd c2 09 	. . . 
	push hl			;22e4	e5 	. 
	call sub_0a0ch		;22e5	cd 0c 0a 	. . . 
	jr l2313h		;22e8	18 29 	. ) 
l22eah:
	inc hl			;22ea	23 	# 
	inc hl			;22eb	23 	# 
	inc hl			;22ec	23 	# 
	inc hl			;22ed	23 	# 
	ld c,(hl)			;22ee	4e 	N 
	inc hl			;22ef	23 	# 
	ld b,(hl)			;22f0	46 	F 
	inc hl			;22f1	23 	# 
	ex (sp),hl			;22f2	e3 	. 
	ld e,(hl)			;22f3	5e 	^ 
	inc hl			;22f4	23 	# 
	ld d,(hl)			;22f5	56 	V 
	push hl			;22f6	e5 	. 
l22f7h:
	ld l,c			;22f7	69 	i 
	ld h,b			;22f8	60 	` 
	call sub_0bd2h		;22f9	cd d2 0b 	. . . 
	ld a,(040afh)		;22fc	3a af 40 	: . @ 
	cp 004h		;22ff	fe 04 	. . 
	jp z,l07b2h		;2301	ca b2 07 	. . . 
	ex de,hl			;2304	eb 	. 
	pop hl			;2305	e1 	. 
	ld (hl),d			;2306	72 	r 
	dec hl			;2307	2b 	+ 
	ld (hl),e			;2308	73 	s 
	pop hl			;2309	e1 	. 
	push de			;230a	d5 	. 
	ld e,(hl)			;230b	5e 	^ 
	inc hl			;230c	23 	# 
	ld d,(hl)			;230d	56 	V 
	inc hl			;230e	23 	# 
	ex (sp),hl			;230f	e3 	. 
	call sub_0a39h		;2310	cd 39 0a 	. 9 . 
l2313h:
	pop hl			;2313	e1 	. 
	pop bc			;2314	c1 	. 
	sub b			;2315	90 	. 
	call sub_09c2h		;2316	cd c2 09 	. . . 
	jr z,l2324h		;2319	28 09 	( . 
	ex de,hl			;231b	eb 	. 
	ld (040a2h),hl		;231c	22 a2 40 	" . @ 
	ld l,c			;231f	69 	i 
	ld h,b			;2320	60 	` 
	jp l1d1ah		;2321	c3 1a 1d 	. . . 
l2324h:
	ld sp,hl			;2324	f9 	. 
	ld (040e8h),hl		;2325	22 e8 40 	" . @ 
	ld hl,(040dfh)		;2328	2a df 40 	* . @ 
	ld a,(hl)			;232b	7e 	~ 
	cp 02ch		;232c	fe 2c 	. , 
	jp nz,l1d1eh		;232e	c2 1e 1d 	. . . 
	rst 10h			;2331	d7 	. 
	call sub_22b9h		;2332	cd b9 22 	. . " 
sub_2335h:
	rst 8			;2335	cf 	. 
	jr z,$+45		;2336	28 2b 	( + 
sub_2338h:
	ld d,000h		;2338	16 00 	. . 
l233ah:
	push de			;233a	d5 	. 
	ld c,001h		;233b	0e 01 	. . 
	call sub_1963h		;233d	cd 63 19 	. c . 
	call sub_249fh		;2340	cd 9f 24 	. . $ 
	ld (040f3h),hl		;2343	22 f3 40 	" . @ 
l2346h:
	ld hl,(040f3h)		;2346	2a f3 40 	* . @ 
l2349h:
	pop bc			;2349	c1 	. 
	ld a,(hl)			;234a	7e 	~ 
	ld d,000h		;234b	16 00 	. . 
l234dh:
	sub 0d4h		;234d	d6 d4 	. . 
	jr c,l2364h		;234f	38 13 	8 . 
	cp 003h		;2351	fe 03 	. . 
	jr nc,l2364h		;2353	30 0f 	0 . 
	cp 001h		;2355	fe 01 	. . 
	rla			;2357	17 	. 
	xor d			;2358	aa 	. 
	cp d			;2359	ba 	. 
	ld d,a			;235a	57 	W 
	jp c,l1997h		;235b	da 97 19 	. . . 
	ld (040d8h),hl		;235e	22 d8 40 	" . @ 
	rst 10h			;2361	d7 	. 
	jr l234dh		;2362	18 e9 	. . 
l2364h:
	ld a,d			;2364	7a 	z 
	or a			;2365	b7 	. 
	jp nz,l23ech		;2366	c2 ec 23 	. . # 
	ld a,(hl)			;2369	7e 	~ 
	ld (040d8h),hl		;236a	22 d8 40 	" . @ 
	sub 0cdh		;236d	d6 cd 	. . 
	ret c			;236f	d8 	. 
	cp 007h		;2370	fe 07 	. . 
	ret nc			;2372	d0 	. 
	ld e,a			;2373	5f 	_ 
	ld a,(040afh)		;2374	3a af 40 	: . @ 
	sub 003h		;2377	d6 03 	. . 
	or e			;2379	b3 	. 
	jp z,l298fh		;237a	ca 8f 29 	. . ) 
	ld hl,l189ah		;237d	21 9a 18 	! . . 
	add hl,de			;2380	19 	. 
	ld a,b			;2381	78 	x 
	ld d,(hl)			;2382	56 	V 
	cp d			;2383	ba 	. 
	ret nc			;2384	d0 	. 
	push bc			;2385	c5 	. 
	ld bc,l2346h		;2386	01 46 23 	. F # 
	push bc			;2389	c5 	. 
	ld a,d			;238a	7a 	z 
	cp 07fh		;238b	fe 7f 	.  
	jp z,l23d4h		;238d	ca d4 23 	. . # 
	cp 051h		;2390	fe 51 	. Q 
	jp c,l23e1h		;2392	da e1 23 	. . # 
l2395h:
	ld hl,04121h		;2395	21 21 41 	! ! A 
	or a			;2398	b7 	. 
	ld a,(040afh)		;2399	3a af 40 	: . @ 
	dec a			;239c	3d 	= 
	dec a			;239d	3d 	= 
	dec a			;239e	3d 	= 
	jp z,l0af6h		;239f	ca f6 0a 	. . . 
	ld c,(hl)			;23a2	4e 	N 
	inc hl			;23a3	23 	# 
	ld b,(hl)			;23a4	46 	F 
	push bc			;23a5	c5 	. 
	jp m,l23c5h		;23a6	fa c5 23 	. . # 
	inc hl			;23a9	23 	# 
	ld c,(hl)			;23aa	4e 	N 
	inc hl			;23ab	23 	# 
	ld b,(hl)			;23ac	46 	F 
	push bc			;23ad	c5 	. 
	push af			;23ae	f5 	. 
	or a			;23af	b7 	. 
	jp po,023c4h		;23b0	e2 c4 23 	. . # 
	pop af			;23b3	f1 	. 
	inc hl			;23b4	23 	# 
	jr c,l23bah		;23b5	38 03 	8 . 
	ld hl,0411dh		;23b7	21 1d 41 	! . A 
l23bah:
	ld c,(hl)			;23ba	4e 	N 
	inc hl			;23bb	23 	# 
	ld b,(hl)			;23bc	46 	F 
	inc hl			;23bd	23 	# 
	push bc			;23be	c5 	. 
	ld c,(hl)			;23bf	4e 	N 
	inc hl			;23c0	23 	# 
	ld b,(hl)			;23c1	46 	F 
	push bc			;23c2	c5 	. 
	ld b,0f1h		;23c3	06 f1 	. . 
l23c5h:
	add a,003h		;23c5	c6 03 	. . 
	ld c,e			;23c7	4b 	K 
	ld b,a			;23c8	47 	G 
	push bc			;23c9	c5 	. 
	ld bc,l2406h		;23ca	01 06 24 	. . $ 
l23cdh:
	push bc			;23cd	c5 	. 
	ld hl,(040d8h)		;23ce	2a d8 40 	* . @ 
	jp l233ah		;23d1	c3 3a 23 	. : # 
l23d4h:
	call sub_0ab1h		;23d4	cd b1 0a 	. . . 
	call sub_09a4h		;23d7	cd a4 09 	. . . 
	ld bc,l13f2h		;23da	01 f2 13 	. . . 
	ld d,07fh		;23dd	16 7f 	.  
	jr l23cdh		;23df	18 ec 	. . 
l23e1h:
	push de			;23e1	d5 	. 
	call l0a7fh		;23e2	cd 7f 0a 	.  . 
	pop de			;23e5	d1 	. 
	push hl			;23e6	e5 	. 
	ld bc,l25e9h		;23e7	01 e9 25 	. . % 
	jr l23cdh		;23ea	18 e1 	. . 
l23ech:
	ld a,b			;23ec	78 	x 
	cp 064h		;23ed	fe 64 	. d 
	ret nc			;23ef	d0 	. 
	push bc			;23f0	c5 	. 
	push de			;23f1	d5 	. 
	ld de,06404h		;23f2	11 04 64 	. . d 
	ld hl,l25b8h		;23f5	21 b8 25 	! . % 
l23f8h:
	push hl			;23f8	e5 	. 
	rst 20h			;23f9	e7 	. 
	jp nz,l2395h		;23fa	c2 95 23 	. . # 
	ld hl,(04121h)		;23fd	2a 21 41 	* ! A 
l2400h:
	push hl			;2400	e5 	. 
	ld bc,l258ch		;2401	01 8c 25 	. . % 
	jr l23cdh		;2404	18 c7 	. . 
l2406h:
	pop bc			;2406	c1 	. 
	ld a,c			;2407	79 	y 
	ld (040b0h),a		;2408	32 b0 40 	2 . @ 
	ld a,b			;240b	78 	x 
	cp 008h		;240c	fe 08 	. . 
	jr z,l2438h		;240e	28 28 	( ( 
	ld a,(040afh)		;2410	3a af 40 	: . @ 
	cp 008h		;2413	fe 08 	. . 
	jp z,l2460h		;2415	ca 60 24 	. ` $ 
	ld d,a			;2418	57 	W 
	ld a,b			;2419	78 	x 
	cp 004h		;241a	fe 04 	. . 
	jp z,l2472h		;241c	ca 72 24 	. r $ 
	ld a,d			;241f	7a 	z 
	cp 003h		;2420	fe 03 	. . 
	jp z,l0af6h		;2422	ca f6 0a 	. . . 
	jp nc,l247ch		;2425	d2 7c 24 	. | $ 
	ld hl,l18bfh		;2428	21 bf 18 	! . . 
	ld b,000h		;242b	06 00 	. . 
	add hl,bc			;242d	09 	. 
	add hl,bc			;242e	09 	. 
	ld c,(hl)			;242f	4e 	N 
	inc hl			;2430	23 	# 
	ld b,(hl)			;2431	46 	F 
	pop de			;2432	d1 	. 
	ld hl,(04121h)		;2433	2a 21 41 	* ! A 
	push bc			;2436	c5 	. 
	ret			;2437	c9 	. 
l2438h:
	call sub_0adbh		;2438	cd db 0a 	. . . 
	call sub_09fch		;243b	cd fc 09 	. . . 
	pop hl			;243e	e1 	. 
	ld (0411fh),hl		;243f	22 1f 41 	" . A 
	pop hl			;2442	e1 	. 
	ld (0411dh),hl		;2443	22 1d 41 	" . A 
l2446h:
	pop bc			;2446	c1 	. 
	pop de			;2447	d1 	. 
	call l09b4h		;2448	cd b4 09 	. . . 
l244bh:
	call sub_0adbh		;244b	cd db 0a 	. . . 
	ld hl,l18abh		;244e	21 ab 18 	! . . 
l2451h:
	ld a,(040b0h)		;2451	3a b0 40 	: . @ 
	rlca			;2454	07 	. 
	push bc			;2455	c5 	. 
	ld c,a			;2456	4f 	O 
	ld b,000h		;2457	06 00 	. . 
	add hl,bc			;2459	09 	. 
	pop bc			;245a	c1 	. 
	ld a,(hl)			;245b	7e 	~ 
	inc hl			;245c	23 	# 
	ld h,(hl)			;245d	66 	f 
	ld l,a			;245e	6f 	o 
	jp (hl)			;245f	e9 	. 
l2460h:
	push bc			;2460	c5 	. 
	call sub_09fch		;2461	cd fc 09 	. . . 
	pop af			;2464	f1 	. 
	ld (040afh),a		;2465	32 af 40 	2 . @ 
	cp 004h		;2468	fe 04 	. . 
	jr z,l2446h		;246a	28 da 	( . 
	pop hl			;246c	e1 	. 
	ld (04121h),hl		;246d	22 21 41 	" ! A 
	jr l244bh		;2470	18 d9 	. . 
l2472h:
	call sub_0ab1h		;2472	cd b1 0a 	. . . 
	pop bc			;2475	c1 	. 
	pop de			;2476	d1 	. 
l2477h:
	ld hl,l18b5h		;2477	21 b5 18 	! . . 
	jr l2451h		;247a	18 d5 	. . 
l247ch:
	pop hl			;247c	e1 	. 
	call sub_09a4h		;247d	cd a4 09 	. . . 
	call sub_0acfh		;2480	cd cf 0a 	. . . 
	call sub_09bfh		;2483	cd bf 09 	. . . 
	pop hl			;2486	e1 	. 
	ld (04123h),hl		;2487	22 23 41 	" # A 
	pop hl			;248a	e1 	. 
	ld (04121h),hl		;248b	22 21 41 	" ! A 
	jr l2477h		;248e	18 e7 	. . 
	push hl			;2490	e5 	. 
	ex de,hl			;2491	eb 	. 
	call sub_0acfh		;2492	cd cf 0a 	. . . 
	pop hl			;2495	e1 	. 
	call sub_09a4h		;2496	cd a4 09 	. . . 
	call sub_0acfh		;2499	cd cf 0a 	. . . 
	jp l08a0h		;249c	c3 a0 08 	. . . 
sub_249fh:
	rst 10h			;249f	d7 	. 
	ld e,028h		;24a0	1e 28 	. ( 
	jp z,l19a2h		;24a2	ca a2 19 	. . . 
	jp c,00e6ch		;24a5	da 6c 0e 	. l . 
	call sub_1e3dh		;24a8	cd 3d 1e 	. = . 
	jp nc,l2540h		;24ab	d2 40 25 	. @ % 
	cp 0cdh		;24ae	fe cd 	. . 
	jr z,sub_249fh		;24b0	28 ed 	( . 
	cp 02eh		;24b2	fe 2e 	. . 
	jp z,00e6ch		;24b4	ca 6c 0e 	. l . 
	cp 0ceh		;24b7	fe ce 	. . 
	jp z,l2532h		;24b9	ca 32 25 	. 2 % 
l24bch:
	cp 022h		;24bc	fe 22 	. " 
	jp z,sub_2866h		;24be	ca 66 28 	. f ( 
	cp 0cbh		;24c1	fe cb 	. . 
	jp z,l25c4h		;24c3	ca c4 25 	. . % 
	cp 026h		;24c6	fe 26 	. & 
	jp z,04194h		;24c8	ca 94 41 	. . A 
	cp 0c3h		;24cb	fe c3 	. . 
	jr nz,l24d9h		;24cd	20 0a 	  . 
	rst 10h			;24cf	d7 	. 
	ld a,(0409ah)		;24d0	3a 9a 40 	: . @ 
	push hl			;24d3	e5 	. 
	call sub_27f8h		;24d4	cd f8 27 	. . ' 
	pop hl			;24d7	e1 	. 
	ret			;24d8	c9 	. 
l24d9h:
	cp 0c2h		;24d9	fe c2 	. . 
	jr nz,l24e7h		;24db	20 0a 	  . 
	rst 10h			;24dd	d7 	. 
	push hl			;24de	e5 	. 
	ld hl,(040eah)		;24df	2a ea 40 	* . @ 
	call sub_0c66h		;24e2	cd 66 0c 	. f . 
	pop hl			;24e5	e1 	. 
	ret			;24e6	c9 	. 
l24e7h:
	cp 0c0h		;24e7	fe c0 	. . 
	jr nz,l24ffh		;24e9	20 14 	  . 
	rst 10h			;24eb	d7 	. 
	rst 8			;24ec	cf 	. 
	jr z,l24bch		;24ed	28 cd 	( . 
	dec c			;24ef	0d 	. 
	ld h,0cfh		;24f0	26 cf 	& . 
	add hl,hl			;24f2	29 	) 
	push hl			;24f3	e5 	. 
	ex de,hl			;24f4	eb 	. 
	ld a,h			;24f5	7c 	| 
	or l			;24f6	b5 	. 
	jp z,l1e4ah		;24f7	ca 4a 1e 	. J . 
	call l0a9ah		;24fa	cd 9a 0a 	. . . 
	pop hl			;24fd	e1 	. 
	ret			;24fe	c9 	. 
l24ffh:
	cp 0c1h		;24ff	fe c1 	. . 
	jp z,l27feh		;2501	ca fe 27 	. . ' 
	cp 0c5h		;2504	fe c5 	. . 
	jp z,0419dh		;2506	ca 9d 41 	. . A 
	cp 0c8h		;2509	fe c8 	. . 
	jp z,l27c9h		;250b	ca c9 27 	. . ' 
	cp 0c7h		;250e	fe c7 	. . 
	jp z,04176h		;2510	ca 76 41 	. v A 
	cp 0c6h		;2513	fe c6 	. . 
	jp z,l0132h		;2515	ca 32 01 	. 2 . 
	cp 0c9h		;2518	fe c9 	. . 
	jp z,l019dh		;251a	ca 9d 01 	. . . 
	cp 0c4h		;251d	fe c4 	. . 
	jp z,l2a2fh		;251f	ca 2f 2a 	. / * 
	cp 0beh		;2522	fe be 	. . 
	jp z,04155h		;2524	ca 55 41 	. U A 
	sub 0d7h		;2527	d6 d7 	. . 
	jp nc,l254eh		;2529	d2 4e 25 	. N % 
sub_252ch:
	call sub_2335h		;252c	cd 35 23 	. 5 # 
	rst 8			;252f	cf 	. 
	add hl,hl			;2530	29 	) 
	ret			;2531	c9 	. 
l2532h:
	ld d,07dh		;2532	16 7d 	. } 
	call l233ah		;2534	cd 3a 23 	. : # 
	ld hl,(040f3h)		;2537	2a f3 40 	* . @ 
	push hl			;253a	e5 	. 
	call l097bh		;253b	cd 7b 09 	. { . 
l253eh:
	pop hl			;253e	e1 	. 
	ret			;253f	c9 	. 
l2540h:
	call 0260dh		;2540	cd 0d 26 	. . & 
l2543h:
	push hl			;2543	e5 	. 
	ex de,hl			;2544	eb 	. 
	ld (04121h),hl		;2545	22 21 41 	" ! A 
	rst 20h			;2548	e7 	. 
	call nz,sub_09f7h		;2549	c4 f7 09 	. . . 
	pop hl			;254c	e1 	. 
	ret			;254d	c9 	. 
l254eh:
	ld b,000h		;254e	06 00 	. . 
	rlca			;2550	07 	. 
	ld c,a			;2551	4f 	O 
	push bc			;2552	c5 	. 
	rst 10h			;2553	d7 	. 
	ld a,c			;2554	79 	y 
	cp 041h		;2555	fe 41 	. A 
	jr c,l256fh		;2557	38 16 	8 . 
	call sub_2335h		;2559	cd 35 23 	. 5 # 
	rst 8			;255c	cf 	. 
	inc l			;255d	2c 	, 
	call sub_0af4h		;255e	cd f4 0a 	. . . 
	ex de,hl			;2561	eb 	. 
	ld hl,(04121h)		;2562	2a 21 41 	* ! A 
	ex (sp),hl			;2565	e3 	. 
	push hl			;2566	e5 	. 
	ex de,hl			;2567	eb 	. 
	call sub_2b1ch		;2568	cd 1c 2b 	. . + 
	ex de,hl			;256b	eb 	. 
	ex (sp),hl			;256c	e3 	. 
	jr l2583h		;256d	18 14 	. . 
l256fh:
	call sub_252ch		;256f	cd 2c 25 	. , % 
	ex (sp),hl			;2572	e3 	. 
	ld a,l			;2573	7d 	} 
	cp 00ch		;2574	fe 0c 	. . 
	jr c,l257fh		;2576	38 07 	8 . 
	cp 01bh		;2578	fe 1b 	. . 
	push hl			;257a	e5 	. 
	call c,sub_0ab1h		;257b	dc b1 0a 	. . . 
	pop hl			;257e	e1 	. 
l257fh:
	ld de,l253eh		;257f	11 3e 25 	. > % 
	push de			;2582	d5 	. 
l2583h:
	ld bc,l1608h		;2583	01 08 16 	. . . 
sub_2586h:
	add hl,bc			;2586	09 	. 
	ld c,(hl)			;2587	4e 	N 
	inc hl			;2588	23 	# 
	ld h,(hl)			;2589	66 	f 
	ld l,c			;258a	69 	i 
	jp (hl)			;258b	e9 	. 
l258ch:
	call sub_29d7h		;258c	cd d7 29 	. . ) 
	ld a,(hl)			;258f	7e 	~ 
	inc hl			;2590	23 	# 
	ld c,(hl)			;2591	4e 	N 
	inc hl			;2592	23 	# 
	ld b,(hl)			;2593	46 	F 
	pop de			;2594	d1 	. 
	push bc			;2595	c5 	. 
	push af			;2596	f5 	. 
	call sub_29deh		;2597	cd de 29 	. . ) 
	pop de			;259a	d1 	. 
	ld e,(hl)			;259b	5e 	^ 
	inc hl			;259c	23 	# 
	ld c,(hl)			;259d	4e 	N 
	inc hl			;259e	23 	# 
	ld b,(hl)			;259f	46 	F 
	pop hl			;25a0	e1 	. 
l25a1h:
	ld a,e			;25a1	7b 	{ 
	or d			;25a2	b2 	. 
	ret z			;25a3	c8 	. 
	ld a,d			;25a4	7a 	z 
	sub 001h		;25a5	d6 01 	. . 
	ret c			;25a7	d8 	. 
	xor a			;25a8	af 	. 
	cp e			;25a9	bb 	. 
	inc a			;25aa	3c 	< 
	ret nc			;25ab	d0 	. 
	dec d			;25ac	15 	. 
	dec e			;25ad	1d 	. 
	ld a,(bc)			;25ae	0a 	. 
	cp (hl)			;25af	be 	. 
	inc hl			;25b0	23 	# 
	inc bc			;25b1	03 	. 
	jr z,l25a1h		;25b2	28 ed 	( . 
	ccf			;25b4	3f 	? 
	jp l0960h		;25b5	c3 60 09 	. ` . 
l25b8h:
	inc a			;25b8	3c 	< 
	adc a,a			;25b9	8f 	. 
	pop bc			;25ba	c1 	. 
	and b			;25bb	a0 	. 
	add a,0ffh		;25bc	c6 ff 	. . 
	sbc a,a			;25be	9f 	. 
	call sub_098dh		;25bf	cd 8d 09 	. . . 
	jr l25d6h		;25c2	18 12 	. . 
l25c4h:
	ld d,05ah		;25c4	16 5a 	. Z 
	call l233ah		;25c6	cd 3a 23 	. : # 
	call l0a7fh		;25c9	cd 7f 0a 	.  . 
	ld a,l			;25cc	7d 	} 
	cpl			;25cd	2f 	/ 
	ld l,a			;25ce	6f 	o 
	ld a,h			;25cf	7c 	| 
	cpl			;25d0	2f 	/ 
	ld h,a			;25d1	67 	g 
	ld (04121h),hl		;25d2	22 21 41 	" ! A 
	pop bc			;25d5	c1 	. 
l25d6h:
	jp l2346h		;25d6	c3 46 23 	. F # 
l25d9h:
	ld a,(040afh)		;25d9	3a af 40 	: . @ 
	cp 008h		;25dc	fe 08 	. . 
	jr nc,l25e5h		;25de	30 05 	0 . 
	sub 003h		;25e0	d6 03 	. . 
	or a			;25e2	b7 	. 
	scf			;25e3	37 	7 
	ret			;25e4	c9 	. 
l25e5h:
	sub 003h		;25e5	d6 03 	. . 
	or a			;25e7	b7 	. 
	ret			;25e8	c9 	. 
l25e9h:
	push bc			;25e9	c5 	. 
	call l0a7fh		;25ea	cd 7f 0a 	.  . 
	pop af			;25ed	f1 	. 
	pop de			;25ee	d1 	. 
	ld bc,l27fah		;25ef	01 fa 27 	. . ' 
	push bc			;25f2	c5 	. 
	cp 046h		;25f3	fe 46 	. F 
	jr nz,l25fdh		;25f5	20 06 	  . 
	ld a,e			;25f7	7b 	{ 
	or l			;25f8	b5 	. 
	ld l,a			;25f9	6f 	o 
	ld a,h			;25fa	7c 	| 
	or d			;25fb	b2 	. 
	ret			;25fc	c9 	. 
l25fdh:
	ld a,e			;25fd	7b 	{ 
	and l			;25fe	a5 	. 
	ld l,a			;25ff	6f 	o 
	ld a,h			;2600	7c 	| 
	and d			;2601	a2 	. 
	ret			;2602	c9 	. 
l2603h:
	dec hl			;2603	2b 	+ 
	rst 10h			;2604	d7 	. 
	ret z			;2605	c8 	. 
	rst 8			;2606	cf 	. 
	inc l			;2607	2c 	, 
l2608h:
	ld bc,l2603h		;2608	01 03 26 	. . & 
	push bc			;260b	c5 	. 
	or 0afh		;260c	f6 af 	. . 
	ld (040aeh),a		;260e	32 ae 40 	2 . @ 
	ld b,(hl)			;2611	46 	F 
	call sub_1e3dh		;2612	cd 3d 1e 	. = . 
	jp c,l1997h		;2615	da 97 19 	. . . 
	xor a			;2618	af 	. 
	ld c,a			;2619	4f 	O 
	rst 10h			;261a	d7 	. 
	jr c,l2622h		;261b	38 05 	8 . 
	call sub_1e3dh		;261d	cd 3d 1e 	. = . 
	jr c,l262bh		;2620	38 09 	8 . 
l2622h:
	ld c,a			;2622	4f 	O 
l2623h:
	rst 10h			;2623	d7 	. 
	jr c,l2623h		;2624	38 fd 	8 . 
	call sub_1e3dh		;2626	cd 3d 1e 	. = . 
	jr nc,l2623h		;2629	30 f8 	0 . 
l262bh:
	ld de,l2652h		;262b	11 52 26 	. R & 
	push de			;262e	d5 	. 
	ld d,002h		;262f	16 02 	. . 
	cp 025h		;2631	fe 25 	. % 
	ret z			;2633	c8 	. 
	inc d			;2634	14 	. 
	cp 024h		;2635	fe 24 	. $ 
	ret z			;2637	c8 	. 
	inc d			;2638	14 	. 
	cp 021h		;2639	fe 21 	. ! 
	ret z			;263b	c8 	. 
	ld d,008h		;263c	16 08 	. . 
	cp 023h		;263e	fe 23 	. # 
	ret z			;2640	c8 	. 
	ld a,b			;2641	78 	x 
	sub 041h		;2642	d6 41 	. A 
	and 07fh		;2644	e6 7f 	.  
	ld e,a			;2646	5f 	_ 
	ld d,000h		;2647	16 00 	. . 
	push hl			;2649	e5 	. 
	ld hl,04101h		;264a	21 01 41 	! . A 
	add hl,de			;264d	19 	. 
	ld d,(hl)			;264e	56 	V 
	pop hl			;264f	e1 	. 
	dec hl			;2650	2b 	+ 
	ret			;2651	c9 	. 
l2652h:
	ld a,d			;2652	7a 	z 
	ld (040afh),a		;2653	32 af 40 	2 . @ 
	rst 10h			;2656	d7 	. 
	ld a,(040dch)		;2657	3a dc 40 	: . @ 
	or a			;265a	b7 	. 
	jp nz,l2664h		;265b	c2 64 26 	. d & 
	ld a,(hl)			;265e	7e 	~ 
	sub 028h		;265f	d6 28 	. ( 
	jp z,l26e9h		;2661	ca e9 26 	. . & 
l2664h:
	xor a			;2664	af 	. 
	ld (040dch),a		;2665	32 dc 40 	2 . @ 
	push hl			;2668	e5 	. 
	push de			;2669	d5 	. 
	ld hl,(040f9h)		;266a	2a f9 40 	* . @ 
l266dh:
	ex de,hl			;266d	eb 	. 
	ld hl,(040fbh)		;266e	2a fb 40 	* . @ 
	rst 18h			;2671	df 	. 
	pop hl			;2672	e1 	. 
	jr z,l268eh		;2673	28 19 	( . 
	ld a,(de)			;2675	1a 	. 
	ld l,a			;2676	6f 	o 
	cp h			;2677	bc 	. 
	inc de			;2678	13 	. 
	jr nz,$+13		;2679	20 0b 	  . 
	ld a,(de)			;267b	1a 	. 
	cp c			;267c	b9 	. 
	jr nz,$+9		;267d	20 07 	  . 
	inc de			;267f	13 	. 
	ld a,(de)			;2680	1a 	. 
	cp b			;2681	b8 	. 
	jp z,l26cch		;2682	ca cc 26 	. . & 
	ld a,013h		;2685	3e 13 	> . 
	inc de			;2687	13 	. 
	push hl			;2688	e5 	. 
	ld h,000h		;2689	26 00 	& . 
	add hl,de			;268b	19 	. 
	jr l266dh		;268c	18 df 	. . 
l268eh:
	ld a,h			;268e	7c 	| 
	pop hl			;268f	e1 	. 
	ex (sp),hl			;2690	e3 	. 
	push af			;2691	f5 	. 
	push de			;2692	d5 	. 
	ld de,024f1h		;2693	11 f1 24 	. . $ 
	rst 18h			;2696	df 	. 
	jr z,l26cfh		;2697	28 36 	( 6 
	ld de,l2543h		;2699	11 43 25 	. C % 
	rst 18h			;269c	df 	. 
	pop de			;269d	d1 	. 
	jr z,l26d5h		;269e	28 35 	( 5 
	pop af			;26a0	f1 	. 
	ex (sp),hl			;26a1	e3 	. 
	push hl			;26a2	e5 	. 
	push bc			;26a3	c5 	. 
	ld c,a			;26a4	4f 	O 
	ld b,000h		;26a5	06 00 	. . 
	push bc			;26a7	c5 	. 
	inc bc			;26a8	03 	. 
	inc bc			;26a9	03 	. 
	inc bc			;26aa	03 	. 
	ld hl,(040fdh)		;26ab	2a fd 40 	* . @ 
	push hl			;26ae	e5 	. 
	add hl,bc			;26af	09 	. 
	pop bc			;26b0	c1 	. 
	push hl			;26b1	e5 	. 
	call sub_1955h		;26b2	cd 55 19 	. U . 
	pop hl			;26b5	e1 	. 
	ld (040fdh),hl		;26b6	22 fd 40 	" . @ 
	ld h,b			;26b9	60 	` 
	ld l,c			;26ba	69 	i 
	ld (040fbh),hl		;26bb	22 fb 40 	" . @ 
l26beh:
	dec hl			;26be	2b 	+ 
	ld (hl),000h		;26bf	36 00 	6 . 
	rst 18h			;26c1	df 	. 
	jr nz,l26beh		;26c2	20 fa 	  . 
	pop de			;26c4	d1 	. 
	ld (hl),e			;26c5	73 	s 
	inc hl			;26c6	23 	# 
	pop de			;26c7	d1 	. 
	ld (hl),e			;26c8	73 	s 
	inc hl			;26c9	23 	# 
	ld (hl),d			;26ca	72 	r 
	ex de,hl			;26cb	eb 	. 
l26cch:
	inc de			;26cc	13 	. 
	pop hl			;26cd	e1 	. 
	ret			;26ce	c9 	. 
l26cfh:
	ld d,a			;26cf	57 	W 
	ld e,a			;26d0	5f 	_ 
	pop af			;26d1	f1 	. 
	pop af			;26d2	f1 	. 
	ex (sp),hl			;26d3	e3 	. 
	ret			;26d4	c9 	. 
l26d5h:
	ld (04124h),a		;26d5	32 24 41 	2 $ A 
	pop bc			;26d8	c1 	. 
	ld h,a			;26d9	67 	g 
	ld l,a			;26da	6f 	o 
	ld (04121h),hl		;26db	22 21 41 	" ! A 
	rst 20h			;26de	e7 	. 
	jr nz,l26e7h		;26df	20 06 	  . 
	ld hl,01928h		;26e1	21 28 19 	! ( . 
	ld (04121h),hl		;26e4	22 21 41 	" ! A 
l26e7h:
	pop hl			;26e7	e1 	. 
	ret			;26e8	c9 	. 
l26e9h:
	push hl			;26e9	e5 	. 
	ld hl,(040aeh)		;26ea	2a ae 40 	* . @ 
	ex (sp),hl			;26ed	e3 	. 
	ld d,a			;26ee	57 	W 
l26efh:
	push de			;26ef	d5 	. 
	push bc			;26f0	c5 	. 
	call sub_1e45h		;26f1	cd 45 1e 	. E . 
	pop bc			;26f4	c1 	. 
	pop af			;26f5	f1 	. 
	ex de,hl			;26f6	eb 	. 
	ex (sp),hl			;26f7	e3 	. 
	push hl			;26f8	e5 	. 
	ex de,hl			;26f9	eb 	. 
	inc a			;26fa	3c 	< 
	ld d,a			;26fb	57 	W 
	ld a,(hl)			;26fc	7e 	~ 
	cp 02ch		;26fd	fe 2c 	. , 
	jr z,l26efh		;26ff	28 ee 	( . 
	rst 8			;2701	cf 	. 
	add hl,hl			;2702	29 	) 
	ld (040f3h),hl		;2703	22 f3 40 	" . @ 
	pop hl			;2706	e1 	. 
	ld (040aeh),hl		;2707	22 ae 40 	" . @ 
	push de			;270a	d5 	. 
	ld hl,(040fbh)		;270b	2a fb 40 	* . @ 
	ld a,019h		;270e	3e 19 	> . 
l2710h:
	ex de,hl			;2710	eb 	. 
	ld hl,(040fdh)		;2711	2a fd 40 	* . @ 
	ex de,hl			;2714	eb 	. 
	rst 18h			;2715	df 	. 
	ld a,(040afh)		;2716	3a af 40 	: . @ 
	jr z,l2742h		;2719	28 27 	( ' 
	cp (hl)			;271b	be 	. 
	inc hl			;271c	23 	# 
	jr nz,$+10		;271d	20 08 	  . 
	ld a,(hl)			;271f	7e 	~ 
	cp c			;2720	b9 	. 
	inc hl			;2721	23 	# 
	jr nz,l2728h		;2722	20 04 	  . 
	ld a,(hl)			;2724	7e 	~ 
	cp b			;2725	b8 	. 
	ld a,023h		;2726	3e 23 	> # 
l2728h:
	inc hl			;2728	23 	# 
	ld e,(hl)			;2729	5e 	^ 
	inc hl			;272a	23 	# 
	ld d,(hl)			;272b	56 	V 
	inc hl			;272c	23 	# 
	jr nz,$-30		;272d	20 e0 	  . 
	ld a,(040aeh)		;272f	3a ae 40 	: . @ 
	or a			;2732	b7 	. 
	ld e,012h		;2733	1e 12 	. . 
	jp nz,l19a2h		;2735	c2 a2 19 	. . . 
	pop af			;2738	f1 	. 
	sub (hl)			;2739	96 	. 
	jp z,l2795h		;273a	ca 95 27 	. . ' 
l273dh:
	ld e,010h		;273d	1e 10 	. . 
	jp l19a2h		;273f	c3 a2 19 	. . . 
l2742h:
	ld (hl),a			;2742	77 	w 
	inc hl			;2743	23 	# 
	ld e,a			;2744	5f 	_ 
	ld d,000h		;2745	16 00 	. . 
	pop af			;2747	f1 	. 
	ld (hl),c			;2748	71 	q 
	inc hl			;2749	23 	# 
	ld (hl),b			;274a	70 	p 
	inc hl			;274b	23 	# 
	ld c,a			;274c	4f 	O 
	call sub_1963h		;274d	cd 63 19 	. c . 
	inc hl			;2750	23 	# 
	inc hl			;2751	23 	# 
	ld (040d8h),hl		;2752	22 d8 40 	" . @ 
	ld (hl),c			;2755	71 	q 
	inc hl			;2756	23 	# 
	ld a,(040aeh)		;2757	3a ae 40 	: . @ 
	rla			;275a	17 	. 
	ld a,c			;275b	79 	y 
l275ch:
	ld bc,l000bh		;275c	01 0b 00 	. . . 
	jr nc,l2763h		;275f	30 02 	0 . 
	pop bc			;2761	c1 	. 
	inc bc			;2762	03 	. 
l2763h:
	ld (hl),c			;2763	71 	q 
	inc hl			;2764	23 	# 
	ld (hl),b			;2765	70 	p 
	inc hl			;2766	23 	# 
	push af			;2767	f5 	. 
	call sub_0baah		;2768	cd aa 0b 	. . . 
	pop af			;276b	f1 	. 
	dec a			;276c	3d 	= 
	jr nz,l275ch		;276d	20 ed 	  . 
	push af			;276f	f5 	. 
	ld b,d			;2770	42 	B 
	ld c,e			;2771	4b 	K 
	ex de,hl			;2772	eb 	. 
	add hl,de			;2773	19 	. 
	jr c,l273dh		;2774	38 c7 	8 . 
	call 0196ch		;2776	cd 6c 19 	. l . 
	ld (040fdh),hl		;2779	22 fd 40 	" . @ 
l277ch:
	dec hl			;277c	2b 	+ 
	ld (hl),000h		;277d	36 00 	6 . 
	rst 18h			;277f	df 	. 
	jr nz,l277ch		;2780	20 fa 	  . 
	inc bc			;2782	03 	. 
	ld d,a			;2783	57 	W 
	ld hl,(040d8h)		;2784	2a d8 40 	* . @ 
	ld e,(hl)			;2787	5e 	^ 
	ex de,hl			;2788	eb 	. 
	add hl,hl			;2789	29 	) 
	add hl,bc			;278a	09 	. 
	ex de,hl			;278b	eb 	. 
	dec hl			;278c	2b 	+ 
	dec hl			;278d	2b 	+ 
	ld (hl),e			;278e	73 	s 
	inc hl			;278f	23 	# 
	ld (hl),d			;2790	72 	r 
	inc hl			;2791	23 	# 
	pop af			;2792	f1 	. 
	jr c,l27c5h		;2793	38 30 	8 0 
l2795h:
	ld b,a			;2795	47 	G 
	ld c,a			;2796	4f 	O 
	ld a,(hl)			;2797	7e 	~ 
	inc hl			;2798	23 	# 
	ld d,0e1h		;2799	16 e1 	. . 
	ld e,(hl)			;279b	5e 	^ 
	inc hl			;279c	23 	# 
	ld d,(hl)			;279d	56 	V 
	inc hl			;279e	23 	# 
	ex (sp),hl			;279f	e3 	. 
	push af			;27a0	f5 	. 
	rst 18h			;27a1	df 	. 
	jp nc,l273dh		;27a2	d2 3d 27 	. = ' 
	call sub_0baah		;27a5	cd aa 0b 	. . . 
	add hl,de			;27a8	19 	. 
	pop af			;27a9	f1 	. 
	dec a			;27aa	3d 	= 
	ld b,h			;27ab	44 	D 
	ld c,l			;27ac	4d 	M 
	jr nz,$-19		;27ad	20 eb 	  . 
	ld a,(040afh)		;27af	3a af 40 	: . @ 
	ld b,h			;27b2	44 	D 
	ld c,l			;27b3	4d 	M 
	add hl,hl			;27b4	29 	) 
	sub 004h		;27b5	d6 04 	. . 
	jr c,l27bdh		;27b7	38 04 	8 . 
	add hl,hl			;27b9	29 	) 
	jr z,l27c2h		;27ba	28 06 	( . 
	add hl,hl			;27bc	29 	) 
l27bdh:
	or a			;27bd	b7 	. 
	jp po,l27c2h		;27be	e2 c2 27 	. . ' 
	add hl,bc			;27c1	09 	. 
l27c2h:
	pop bc			;27c2	c1 	. 
	add hl,bc			;27c3	09 	. 
	ex de,hl			;27c4	eb 	. 
l27c5h:
	ld hl,(040f3h)		;27c5	2a f3 40 	* . @ 
	ret			;27c8	c9 	. 
l27c9h:
	xor a			;27c9	af 	. 
	push hl			;27ca	e5 	. 
	ld (040afh),a		;27cb	32 af 40 	2 . @ 
	call sub_27d4h		;27ce	cd d4 27 	. . ' 
	pop hl			;27d1	e1 	. 
	rst 10h			;27d2	d7 	. 
	ret			;27d3	c9 	. 
sub_27d4h:
	ld hl,(040fdh)		;27d4	2a fd 40 	* . @ 
	ex de,hl			;27d7	eb 	. 
	ld hl,l0000h		;27d8	21 00 00 	! . . 
	add hl,sp			;27db	39 	9 
	rst 20h			;27dc	e7 	. 
	jr nz,l27ech		;27dd	20 0d 	  . 
	call sub_29dah		;27df	cd da 29 	. . ) 
	call sub_28e6h		;27e2	cd e6 28 	. . ( 
	ld hl,(040a0h)		;27e5	2a a0 40 	* . @ 
	ex de,hl			;27e8	eb 	. 
	ld hl,(040d6h)		;27e9	2a d6 40 	* . @ 
l27ech:
	ld a,l			;27ec	7d 	} 
	sub e			;27ed	93 	. 
	ld l,a			;27ee	6f 	o 
	ld a,h			;27ef	7c 	| 
	sbc a,d			;27f0	9a 	. 
	ld h,a			;27f1	67 	g 
	jp sub_0c66h		;27f2	c3 66 0c 	. f . 
l27f5h:
	ld a,(040a6h)		;27f5	3a a6 40 	: . @ 
sub_27f8h:
	ld l,a			;27f8	6f 	o 
	xor a			;27f9	af 	. 
l27fah:
	ld h,a			;27fa	67 	g 
	jp l0a9ah		;27fb	c3 9a 0a 	. . . 
l27feh:
	call 041a9h		;27fe	cd a9 41 	. . A 
	rst 10h			;2801	d7 	. 
	call sub_252ch		;2802	cd 2c 25 	. , % 
	push hl			;2805	e5 	. 
	ld hl,l0890h		;2806	21 90 08 	! . . 
	push hl			;2809	e5 	. 
	ld a,(040afh)		;280a	3a af 40 	: . @ 
	push af			;280d	f5 	. 
	cp 003h		;280e	fe 03 	. . 
	call z,sub_29dah		;2810	cc da 29 	. . ) 
	pop af			;2813	f1 	. 
	ex de,hl			;2814	eb 	. 
	ld hl,(0408eh)		;2815	2a 8e 40 	* . @ 
	jp (hl)			;2818	e9 	. 
sub_2819h:
	push hl			;2819	e5 	. 
	and 007h		;281a	e6 07 	. . 
	ld hl,l18a1h		;281c	21 a1 18 	! . . 
	ld c,a			;281f	4f 	O 
	ld b,000h		;2820	06 00 	. . 
	add hl,bc			;2822	09 	. 
	call sub_2586h		;2823	cd 86 25 	. . % 
	pop hl			;2826	e1 	. 
	ret			;2827	c9 	. 
sub_2828h:
	push hl			;2828	e5 	. 
	ld hl,(040a2h)		;2829	2a a2 40 	* . @ 
	inc hl			;282c	23 	# 
	ld a,h			;282d	7c 	| 
	or l			;282e	b5 	. 
	pop hl			;282f	e1 	. 
	ret nz			;2830	c0 	. 
	ld e,016h		;2831	1e 16 	. . 
	jp l19a2h		;2833	c3 a2 19 	. . . 
l2836h:
	call sub_0fbdh		;2836	cd bd 0f 	. . . 
	call sub_2865h		;2839	cd 65 28 	. e ( 
	call sub_29dah		;283c	cd da 29 	. . ) 
	ld bc,l2a2bh		;283f	01 2b 2a 	. + * 
	push bc			;2842	c5 	. 
sub_2843h:
	ld a,(hl)			;2843	7e 	~ 
	inc hl			;2844	23 	# 
	push hl			;2845	e5 	. 
	call sub_28bfh		;2846	cd bf 28 	. . ( 
	pop hl			;2849	e1 	. 
	ld c,(hl)			;284a	4e 	N 
	inc hl			;284b	23 	# 
	ld b,(hl)			;284c	46 	F 
	call sub_285ah		;284d	cd 5a 28 	. Z ( 
	push hl			;2850	e5 	. 
	ld l,a			;2851	6f 	o 
	call sub_29ceh		;2852	cd ce 29 	. . ) 
	pop de			;2855	d1 	. 
	ret			;2856	c9 	. 
sub_2857h:
	call sub_28bfh		;2857	cd bf 28 	. . ( 
sub_285ah:
	ld hl,040d3h		;285a	21 d3 40 	! . @ 
	push hl			;285d	e5 	. 
	ld (hl),a			;285e	77 	w 
	inc hl			;285f	23 	# 
	ld (hl),e			;2860	73 	s 
	inc hl			;2861	23 	# 
	ld (hl),d			;2862	72 	r 
	pop hl			;2863	e1 	. 
	ret			;2864	c9 	. 
sub_2865h:
	dec hl			;2865	2b 	+ 
sub_2866h:
	ld b,022h		;2866	06 22 	. " 
	ld d,b			;2868	50 	P 
sub_2869h:
	push hl			;2869	e5 	. 
	ld c,0ffh		;286a	0e ff 	. . 
l286ch:
	inc hl			;286c	23 	# 
	ld a,(hl)			;286d	7e 	~ 
	inc c			;286e	0c 	. 
	or a			;286f	b7 	. 
	jr z,l2878h		;2870	28 06 	( . 
	cp d			;2872	ba 	. 
	jr z,l2878h		;2873	28 03 	( . 
	cp b			;2875	b8 	. 
	jr nz,l286ch		;2876	20 f4 	  . 
l2878h:
	cp 022h		;2878	fe 22 	. " 
	call z,l1d78h		;287a	cc 78 1d 	. x . 
	ex (sp),hl			;287d	e3 	. 
	inc hl			;287e	23 	# 
	ex de,hl			;287f	eb 	. 
	ld a,c			;2880	79 	y 
	call sub_285ah		;2881	cd 5a 28 	. Z ( 
l2884h:
	ld de,040d3h		;2884	11 d3 40 	. . @ 
	ld a,0d5h		;2887	3e d5 	> . 
	ld hl,(040b3h)		;2889	2a b3 40 	* . @ 
	ld (04121h),hl		;288c	22 21 41 	" ! A 
	ld a,003h		;288f	3e 03 	> . 
	ld (040afh),a		;2891	32 af 40 	2 . @ 
	call l09d3h		;2894	cd d3 09 	. . . 
	ld de,040d6h		;2897	11 d6 40 	. . @ 
	rst 18h			;289a	df 	. 
	ld (040b3h),hl		;289b	22 b3 40 	" . @ 
	pop hl			;289e	e1 	. 
	ld a,(hl)			;289f	7e 	~ 
	ret nz			;28a0	c0 	. 
	ld e,01eh		;28a1	1e 1e 	. . 
	jp l19a2h		;28a3	c3 a2 19 	. . . 
l28a6h:
	inc hl			;28a6	23 	# 
sub_28a7h:
	call sub_2865h		;28a7	cd 65 28 	. e ( 
sub_28aah:
	call sub_29dah		;28aa	cd da 29 	. . ) 
	call sub_09c4h		;28ad	cd c4 09 	. . . 
	inc d			;28b0	14 	. 
l28b1h:
	dec d			;28b1	15 	. 
	ret z			;28b2	c8 	. 
	ld a,(bc)			;28b3	0a 	. 
	call sub_032ah		;28b4	cd 2a 03 	. * . 
	cp 00dh		;28b7	fe 0d 	. . 
	call z,sub_2103h		;28b9	cc 03 21 	. . ! 
	inc bc			;28bc	03 	. 
	jr l28b1h		;28bd	18 f2 	. . 
sub_28bfh:
	or a			;28bf	b7 	. 
	ld c,0f1h		;28c0	0e f1 	. . 
	push af			;28c2	f5 	. 
	ld hl,(040a0h)		;28c3	2a a0 40 	* . @ 
	ex de,hl			;28c6	eb 	. 
	ld hl,(040d6h)		;28c7	2a d6 40 	* . @ 
	cpl			;28ca	2f 	/ 
	ld c,a			;28cb	4f 	O 
	ld b,0ffh		;28cc	06 ff 	. . 
	add hl,bc			;28ce	09 	. 
	inc hl			;28cf	23 	# 
	rst 18h			;28d0	df 	. 
	jr c,l28dah		;28d1	38 07 	8 . 
	ld (040d6h),hl		;28d3	22 d6 40 	" . @ 
	inc hl			;28d6	23 	# 
	ex de,hl			;28d7	eb 	. 
l28d8h:
	pop af			;28d8	f1 	. 
	ret			;28d9	c9 	. 
l28dah:
	pop af			;28da	f1 	. 
	ld e,01ah		;28db	1e 1a 	. . 
	jp z,l19a2h		;28dd	ca a2 19 	. . . 
	cp a			;28e0	bf 	. 
	push af			;28e1	f5 	. 
	ld bc,028c1h		;28e2	01 c1 28 	. . ( 
	push bc			;28e5	c5 	. 
sub_28e6h:
	ld hl,(040b1h)		;28e6	2a b1 40 	* . @ 
l28e9h:
	ld (040d6h),hl		;28e9	22 d6 40 	" . @ 
	ld hl,l0000h		;28ec	21 00 00 	! . . 
	push hl			;28ef	e5 	. 
	ld hl,(040a0h)		;28f0	2a a0 40 	* . @ 
	push hl			;28f3	e5 	. 
	ld hl,040b5h		;28f4	21 b5 40 	! . @ 
l28f7h:
	ex de,hl			;28f7	eb 	. 
	ld hl,(040b3h)		;28f8	2a b3 40 	* . @ 
	ex de,hl			;28fb	eb 	. 
	rst 18h			;28fc	df 	. 
	ld bc,l28f7h		;28fd	01 f7 28 	. . ( 
	jp nz,l294ah		;2900	c2 4a 29 	. J ) 
	ld hl,(040f9h)		;2903	2a f9 40 	* . @ 
l2906h:
	ex de,hl			;2906	eb 	. 
	ld hl,(040fbh)		;2907	2a fb 40 	* . @ 
	ex de,hl			;290a	eb 	. 
	rst 18h			;290b	df 	. 
	jr z,l2921h		;290c	28 13 	( . 
	ld a,(hl)			;290e	7e 	~ 
	inc hl			;290f	23 	# 
	inc hl			;2910	23 	# 
	inc hl			;2911	23 	# 
	cp 003h		;2912	fe 03 	. . 
	jr nz,l291ah		;2914	20 04 	  . 
	call sub_294bh		;2916	cd 4b 29 	. K ) 
	xor a			;2919	af 	. 
l291ah:
	ld e,a			;291a	5f 	_ 
	ld d,000h		;291b	16 00 	. . 
	add hl,de			;291d	19 	. 
	jr l2906h		;291e	18 e6 	. . 
l2920h:
	pop bc			;2920	c1 	. 
l2921h:
	ex de,hl			;2921	eb 	. 
	ld hl,(040fdh)		;2922	2a fd 40 	* . @ 
	ex de,hl			;2925	eb 	. 
	rst 18h			;2926	df 	. 
	jp z,l296bh		;2927	ca 6b 29 	. k ) 
	ld a,(hl)			;292a	7e 	~ 
	inc hl			;292b	23 	# 
	call sub_09c2h		;292c	cd c2 09 	. . . 
	push hl			;292f	e5 	. 
	add hl,bc			;2930	09 	. 
	cp 003h		;2931	fe 03 	. . 
	jr nz,l2920h		;2933	20 eb 	  . 
	ld (040d8h),hl		;2935	22 d8 40 	" . @ 
	pop hl			;2938	e1 	. 
	ld c,(hl)			;2939	4e 	N 
	ld b,000h		;293a	06 00 	. . 
	add hl,bc			;293c	09 	. 
	add hl,bc			;293d	09 	. 
	inc hl			;293e	23 	# 
l293fh:
	ex de,hl			;293f	eb 	. 
	ld hl,(040d8h)		;2940	2a d8 40 	* . @ 
	ex de,hl			;2943	eb 	. 
	rst 18h			;2944	df 	. 
	jr z,l2921h		;2945	28 da 	( . 
	ld bc,l293fh		;2947	01 3f 29 	. ? ) 
l294ah:
	push bc			;294a	c5 	. 
sub_294bh:
	xor a			;294b	af 	. 
	or (hl)			;294c	b6 	. 
	inc hl			;294d	23 	# 
	ld e,(hl)			;294e	5e 	^ 
	inc hl			;294f	23 	# 
	ld d,(hl)			;2950	56 	V 
	inc hl			;2951	23 	# 
	ret z			;2952	c8 	. 
	ld b,h			;2953	44 	D 
	ld c,l			;2954	4d 	M 
	ld hl,(040d6h)		;2955	2a d6 40 	* . @ 
	rst 18h			;2958	df 	. 
	ld h,b			;2959	60 	` 
	ld l,c			;295a	69 	i 
	ret c			;295b	d8 	. 
	pop hl			;295c	e1 	. 
	ex (sp),hl			;295d	e3 	. 
	rst 18h			;295e	df 	. 
	ex (sp),hl			;295f	e3 	. 
	push hl			;2960	e5 	. 
	ld h,b			;2961	60 	` 
	ld l,c			;2962	69 	i 
	ret nc			;2963	d0 	. 
	pop bc			;2964	c1 	. 
	pop af			;2965	f1 	. 
	pop af			;2966	f1 	. 
	push hl			;2967	e5 	. 
	push de			;2968	d5 	. 
	push bc			;2969	c5 	. 
	ret			;296a	c9 	. 
l296bh:
	pop de			;296b	d1 	. 
	pop hl			;296c	e1 	. 
	ld a,l			;296d	7d 	} 
	or h			;296e	b4 	. 
	ret z			;296f	c8 	. 
	dec hl			;2970	2b 	+ 
	ld b,(hl)			;2971	46 	F 
	dec hl			;2972	2b 	+ 
	ld c,(hl)			;2973	4e 	N 
	push hl			;2974	e5 	. 
	dec hl			;2975	2b 	+ 
	ld l,(hl)			;2976	6e 	n 
	ld h,000h		;2977	26 00 	& . 
	add hl,bc			;2979	09 	. 
	ld d,b			;297a	50 	P 
	ld e,c			;297b	59 	Y 
	dec hl			;297c	2b 	+ 
	ld b,h			;297d	44 	D 
	ld c,l			;297e	4d 	M 
	ld hl,(040d6h)		;297f	2a d6 40 	* . @ 
	call sub_1958h		;2982	cd 58 19 	. X . 
	pop hl			;2985	e1 	. 
	ld (hl),c			;2986	71 	q 
	inc hl			;2987	23 	# 
	ld (hl),b			;2988	70 	p 
	ld l,c			;2989	69 	i 
	ld h,b			;298a	60 	` 
	dec hl			;298b	2b 	+ 
	jp l28e9h		;298c	c3 e9 28 	. . ( 
l298fh:
	push bc			;298f	c5 	. 
	push hl			;2990	e5 	. 
	ld hl,(04121h)		;2991	2a 21 41 	* ! A 
	ex (sp),hl			;2994	e3 	. 
	call sub_249fh		;2995	cd 9f 24 	. . $ 
	ex (sp),hl			;2998	e3 	. 
	call sub_0af4h		;2999	cd f4 0a 	. . . 
	ld a,(hl)			;299c	7e 	~ 
	push hl			;299d	e5 	. 
	ld hl,(04121h)		;299e	2a 21 41 	* ! A 
	push hl			;29a1	e5 	. 
	add a,(hl)			;29a2	86 	. 
	ld e,01ch		;29a3	1e 1c 	. . 
	jp c,l19a2h		;29a5	da a2 19 	. . . 
	call sub_2857h		;29a8	cd 57 28 	. W ( 
	pop de			;29ab	d1 	. 
	call sub_29deh		;29ac	cd de 29 	. . ) 
	ex (sp),hl			;29af	e3 	. 
	call sub_29ddh		;29b0	cd dd 29 	. . ) 
	push hl			;29b3	e5 	. 
	ld hl,(040d4h)		;29b4	2a d4 40 	* . @ 
	ex de,hl			;29b7	eb 	. 
	call sub_29c6h		;29b8	cd c6 29 	. . ) 
	call sub_29c6h		;29bb	cd c6 29 	. . ) 
	ld hl,l2349h		;29be	21 49 23 	! I # 
	ex (sp),hl			;29c1	e3 	. 
	push hl			;29c2	e5 	. 
	jp l2884h		;29c3	c3 84 28 	. . ( 
sub_29c6h:
	pop hl			;29c6	e1 	. 
	ex (sp),hl			;29c7	e3 	. 
	ld a,(hl)			;29c8	7e 	~ 
	inc hl			;29c9	23 	# 
	ld c,(hl)			;29ca	4e 	N 
	inc hl			;29cb	23 	# 
	ld b,(hl)			;29cc	46 	F 
	ld l,a			;29cd	6f 	o 
sub_29ceh:
	inc l			;29ce	2c 	, 
l29cfh:
	dec l			;29cf	2d 	- 
	ret z			;29d0	c8 	. 
	ld a,(bc)			;29d1	0a 	. 
	ld (de),a			;29d2	12 	. 
	inc bc			;29d3	03 	. 
	inc de			;29d4	13 	. 
	jr l29cfh		;29d5	18 f8 	. . 
sub_29d7h:
	call sub_0af4h		;29d7	cd f4 0a 	. . . 
sub_29dah:
	ld hl,(04121h)		;29da	2a 21 41 	* ! A 
sub_29ddh:
	ex de,hl			;29dd	eb 	. 
sub_29deh:
	call sub_29f5h		;29de	cd f5 29 	. . ) 
	ex de,hl			;29e1	eb 	. 
	ret nz			;29e2	c0 	. 
	push de			;29e3	d5 	. 
	ld d,b			;29e4	50 	P 
	ld e,c			;29e5	59 	Y 
	dec de			;29e6	1b 	. 
	ld c,(hl)			;29e7	4e 	N 
	ld hl,(040d6h)		;29e8	2a d6 40 	* . @ 
	rst 18h			;29eb	df 	. 
	jr nz,l29f3h		;29ec	20 05 	  . 
	ld b,a			;29ee	47 	G 
	add hl,bc			;29ef	09 	. 
	ld (040d6h),hl		;29f0	22 d6 40 	" . @ 
l29f3h:
	pop hl			;29f3	e1 	. 
	ret			;29f4	c9 	. 
sub_29f5h:
	ld hl,(040b3h)		;29f5	2a b3 40 	* . @ 
	dec hl			;29f8	2b 	+ 
	ld b,(hl)			;29f9	46 	F 
	dec hl			;29fa	2b 	+ 
	ld c,(hl)			;29fb	4e 	N 
	dec hl			;29fc	2b 	+ 
	rst 18h			;29fd	df 	. 
	ret nz			;29fe	c0 	. 
	ld (040b3h),hl		;29ff	22 b3 40 	" . @ 
	ret			;2a02	c9 	. 
	ld bc,sub_27f8h		;2a03	01 f8 27 	. . ' 
	push bc			;2a06	c5 	. 
sub_2a07h:
	call sub_29d7h		;2a07	cd d7 29 	. . ) 
	xor a			;2a0a	af 	. 
	ld d,a			;2a0b	57 	W 
	ld a,(hl)			;2a0c	7e 	~ 
	or a			;2a0d	b7 	. 
	ret			;2a0e	c9 	. 
l2a0fh:
	ld bc,sub_27f8h		;2a0f	01 f8 27 	. . ' 
	push bc			;2a12	c5 	. 
sub_2a13h:
	call sub_2a07h		;2a13	cd 07 2a 	. . * 
	jp z,l1e4ah		;2a16	ca 4a 1e 	. J . 
	inc hl			;2a19	23 	# 
	ld e,(hl)			;2a1a	5e 	^ 
	inc hl			;2a1b	23 	# 
	ld d,(hl)			;2a1c	56 	V 
	ld a,(de)			;2a1d	1a 	. 
	ret			;2a1e	c9 	. 
	ld a,001h		;2a1f	3e 01 	> . 
	call sub_2857h		;2a21	cd 57 28 	. W ( 
	call sub_2b1fh		;2a24	cd 1f 2b 	. . + 
	ld hl,(040d4h)		;2a27	2a d4 40 	* . @ 
	ld (hl),e			;2a2a	73 	s 
l2a2bh:
	pop bc			;2a2b	c1 	. 
	jp l2884h		;2a2c	c3 84 28 	. . ( 
l2a2fh:
	rst 10h			;2a2f	d7 	. 
	rst 8			;2a30	cf 	. 
	jr z,$-49		;2a31	28 cd 	( . 
	inc e			;2a33	1c 	. 
	dec hl			;2a34	2b 	+ 
	push de			;2a35	d5 	. 
	rst 8			;2a36	cf 	. 
	inc l			;2a37	2c 	, 
	call 02337h		;2a38	cd 37 23 	. 7 # 
	rst 8			;2a3b	cf 	. 
	add hl,hl			;2a3c	29 	) 
	ex (sp),hl			;2a3d	e3 	. 
	push hl			;2a3e	e5 	. 
	rst 20h			;2a3f	e7 	. 
	jr z,l2a47h		;2a40	28 05 	( . 
	call sub_2b1fh		;2a42	cd 1f 2b 	. . + 
	jr l2a4ah		;2a45	18 03 	. . 
l2a47h:
	call sub_2a13h		;2a47	cd 13 2a 	. . * 
l2a4ah:
	pop de			;2a4a	d1 	. 
	push af			;2a4b	f5 	. 
	push af			;2a4c	f5 	. 
	ld a,e			;2a4d	7b 	{ 
	call sub_2857h		;2a4e	cd 57 28 	. W ( 
	ld e,a			;2a51	5f 	_ 
	pop af			;2a52	f1 	. 
	inc e			;2a53	1c 	. 
	dec e			;2a54	1d 	. 
	jr z,l2a2bh		;2a55	28 d4 	( . 
	ld hl,(040d4h)		;2a57	2a d4 40 	* . @ 
l2a5ah:
	ld (hl),a			;2a5a	77 	w 
	inc hl			;2a5b	23 	# 
	dec e			;2a5c	1d 	. 
	jr nz,l2a5ah		;2a5d	20 fb 	  . 
	jr l2a2bh		;2a5f	18 ca 	. . 
l2a61h:
	call sub_2adfh		;2a61	cd df 2a 	. . * 
	xor a			;2a64	af 	. 
l2a65h:
	ex (sp),hl			;2a65	e3 	. 
	ld c,a			;2a66	4f 	O 
	ld a,0e5h		;2a67	3e e5 	> . 
l2a69h:
	push hl			;2a69	e5 	. 
	ld a,(hl)			;2a6a	7e 	~ 
	cp b			;2a6b	b8 	. 
	jr c,$+4		;2a6c	38 02 	8 . 
	ld a,b			;2a6e	78 	x 
	ld de,0000eh		;2a6f	11 0e 00 	. . . 
	push bc			;2a72	c5 	. 
	call sub_28bfh		;2a73	cd bf 28 	. . ( 
	pop bc			;2a76	c1 	. 
	pop hl			;2a77	e1 	. 
	push hl			;2a78	e5 	. 
	inc hl			;2a79	23 	# 
	ld b,(hl)			;2a7a	46 	F 
	inc hl			;2a7b	23 	# 
	ld h,(hl)			;2a7c	66 	f 
	ld l,b			;2a7d	68 	h 
	ld b,000h		;2a7e	06 00 	. . 
	add hl,bc			;2a80	09 	. 
	ld b,h			;2a81	44 	D 
	ld c,l			;2a82	4d 	M 
	call sub_285ah		;2a83	cd 5a 28 	. Z ( 
	ld l,a			;2a86	6f 	o 
	call sub_29ceh		;2a87	cd ce 29 	. . ) 
	pop de			;2a8a	d1 	. 
	call sub_29deh		;2a8b	cd de 29 	. . ) 
	jp l2884h		;2a8e	c3 84 28 	. . ( 
	call sub_2adfh		;2a91	cd df 2a 	. . * 
	pop de			;2a94	d1 	. 
	push de			;2a95	d5 	. 
	ld a,(de)			;2a96	1a 	. 
	sub b			;2a97	90 	. 
	jr l2a65h		;2a98	18 cb 	. . 
l2a9ah:
	ex de,hl			;2a9a	eb 	. 
	ld a,(hl)			;2a9b	7e 	~ 
	call sub_2ae2h		;2a9c	cd e2 2a 	. . * 
	inc b			;2a9f	04 	. 
	dec b			;2aa0	05 	. 
	jp z,l1e4ah		;2aa1	ca 4a 1e 	. J . 
	push bc			;2aa4	c5 	. 
	ld e,0ffh		;2aa5	1e ff 	. . 
	cp 029h		;2aa7	fe 29 	. ) 
	jr z,l2ab0h		;2aa9	28 05 	( . 
	rst 8			;2aab	cf 	. 
	inc l			;2aac	2c 	, 
	call sub_2b1ch		;2aad	cd 1c 2b 	. . + 
l2ab0h:
	rst 8			;2ab0	cf 	. 
	add hl,hl			;2ab1	29 	) 
	pop af			;2ab2	f1 	. 
	ex (sp),hl			;2ab3	e3 	. 
	ld bc,l2a69h		;2ab4	01 69 2a 	. i * 
	push bc			;2ab7	c5 	. 
	dec a			;2ab8	3d 	= 
	cp (hl)			;2ab9	be 	. 
	ld b,000h		;2aba	06 00 	. . 
	ret nc			;2abc	d0 	. 
	ld c,a			;2abd	4f 	O 
	ld a,(hl)			;2abe	7e 	~ 
	sub c			;2abf	91 	. 
	cp e			;2ac0	bb 	. 
	ld b,a			;2ac1	47 	G 
	ret c			;2ac2	d8 	. 
	ld b,e			;2ac3	43 	C 
	ret			;2ac4	c9 	. 
	call sub_2a07h		;2ac5	cd 07 2a 	. . * 
	jp z,sub_27f8h		;2ac8	ca f8 27 	. . ' 
	ld e,a			;2acb	5f 	_ 
	inc hl			;2acc	23 	# 
	ld a,(hl)			;2acd	7e 	~ 
	inc hl			;2ace	23 	# 
	ld h,(hl)			;2acf	66 	f 
	ld l,a			;2ad0	6f 	o 
	push hl			;2ad1	e5 	. 
	add hl,de			;2ad2	19 	. 
	ld b,(hl)			;2ad3	46 	F 
	ld (hl),d			;2ad4	72 	r 
	ex (sp),hl			;2ad5	e3 	. 
	push bc			;2ad6	c5 	. 
	ld a,(hl)			;2ad7	7e 	~ 
	call l0e65h		;2ad8	cd 65 0e 	. e . 
	pop bc			;2adb	c1 	. 
	pop hl			;2adc	e1 	. 
	ld (hl),b			;2add	70 	p 
	ret			;2ade	c9 	. 
sub_2adfh:
	ex de,hl			;2adf	eb 	. 
	rst 8			;2ae0	cf 	. 
	add hl,hl			;2ae1	29 	) 
sub_2ae2h:
	pop bc			;2ae2	c1 	. 
	pop de			;2ae3	d1 	. 
	push bc			;2ae4	c5 	. 
	ld b,e			;2ae5	43 	C 
	ret			;2ae6	c9 	. 
l2ae7h:
	cp 07ah		;2ae7	fe 7a 	. z 
	jp nz,l1997h		;2ae9	c2 97 19 	. . . 
	jp 041d9h		;2aec	c3 d9 41 	. . A 
	call sub_2b1fh		;2aef	cd 1f 2b 	. . + 
	ld (04094h),a		;2af2	32 94 40 	2 . @ 
	call 04093h		;2af5	cd 93 40 	. . @ 
	jp sub_27f8h		;2af8	c3 f8 27 	. . ' 
	call sub_2b0eh		;2afb	cd 0e 2b 	. . + 
	jp 04096h		;2afe	c3 96 40 	. . @ 
sub_2b01h:
	rst 10h			;2b01	d7 	. 
sub_2b02h:
	call 02337h		;2b02	cd 37 23 	. 7 # 
sub_2b05h:
	push hl			;2b05	e5 	. 
	call l0a7fh		;2b06	cd 7f 0a 	.  . 
	ex de,hl			;2b09	eb 	. 
	pop hl			;2b0a	e1 	. 
	ld a,d			;2b0b	7a 	z 
	or a			;2b0c	b7 	. 
	ret			;2b0d	c9 	. 
sub_2b0eh:
	call sub_2b1ch		;2b0e	cd 1c 2b 	. . + 
	ld (04094h),a		;2b11	32 94 40 	2 . @ 
	ld (04097h),a		;2b14	32 97 40 	2 . @ 
	rst 8			;2b17	cf 	. 
	inc l			;2b18	2c 	, 
	jr sub_2b1ch		;2b19	18 01 	. . 
sub_2b1bh:
	rst 10h			;2b1b	d7 	. 
sub_2b1ch:
	call 02337h		;2b1c	cd 37 23 	. 7 # 
sub_2b1fh:
	call sub_2b05h		;2b1f	cd 05 2b 	. . + 
	jp nz,l1e4ah		;2b22	c2 4a 1e 	. J . 
	dec hl			;2b25	2b 	+ 
	rst 10h			;2b26	d7 	. 
	ld a,e			;2b27	7b 	{ 
	ret			;2b28	c9 	. 
	ld a,001h		;2b29	3e 01 	> . 
	ld (0409ch),a		;2b2b	32 9c 40 	2 . @ 
	pop bc			;2b2e	c1 	. 
	call sub_1b10h		;2b2f	cd 10 1b 	. . . 
	push bc			;2b32	c5 	. 
l2b33h:
	ld hl,0ffffh		;2b33	21 ff ff 	! . . 
	ld (040a2h),hl		;2b36	22 a2 40 	" . @ 
	pop hl			;2b39	e1 	. 
	pop de			;2b3a	d1 	. 
	ld c,(hl)			;2b3b	4e 	N 
	inc hl			;2b3c	23 	# 
	ld b,(hl)			;2b3d	46 	F 
	inc hl			;2b3e	23 	# 
	ld a,b			;2b3f	78 	x 
	or c			;2b40	b1 	. 
	jp z,l1a19h		;2b41	ca 19 1a 	. . . 
	call 041dfh		;2b44	cd df 41 	. . A 
	call sub_1d9bh		;2b47	cd 9b 1d 	. . . 
	push bc			;2b4a	c5 	. 
	ld c,(hl)			;2b4b	4e 	N 
	inc hl			;2b4c	23 	# 
	ld b,(hl)			;2b4d	46 	F 
	inc hl			;2b4e	23 	# 
	push bc			;2b4f	c5 	. 
	ex (sp),hl			;2b50	e3 	. 
	ex de,hl			;2b51	eb 	. 
	rst 18h			;2b52	df 	. 
	pop bc			;2b53	c1 	. 
	jp c,01a18h		;2b54	da 18 1a 	. . . 
	ex (sp),hl			;2b57	e3 	. 
	push hl			;2b58	e5 	. 
	push bc			;2b59	c5 	. 
	ex de,hl			;2b5a	eb 	. 
	ld (040ech),hl		;2b5b	22 ec 40 	" . @ 
	call sub_0fafh		;2b5e	cd af 0f 	. . . 
	ld a,020h		;2b61	3e 20 	>   
	pop hl			;2b63	e1 	. 
	call sub_032ah		;2b64	cd 2a 03 	. * . 
	call sub_2b7eh		;2b67	cd 7e 2b 	. ~ + 
	ld hl,(040a7h)		;2b6a	2a a7 40 	* . @ 
	call sub_2b75h		;2b6d	cd 75 2b 	. u + 
	call sub_20feh		;2b70	cd fe 20 	. .   
	jr l2b33h		;2b73	18 be 	. . 
sub_2b75h:
	ld a,(hl)			;2b75	7e 	~ 
	or a			;2b76	b7 	. 
	ret z			;2b77	c8 	. 
	call sub_032ah		;2b78	cd 2a 03 	. * . 
	inc hl			;2b7b	23 	# 
	jr sub_2b75h		;2b7c	18 f7 	. . 
sub_2b7eh:
	push hl			;2b7e	e5 	. 
	ld hl,(040a7h)		;2b7f	2a a7 40 	* . @ 
	ld b,h			;2b82	44 	D 
	ld c,l			;2b83	4d 	M 
	pop hl			;2b84	e1 	. 
	ld d,0ffh		;2b85	16 ff 	. . 
	jr l2b8ch		;2b87	18 03 	. . 
l2b89h:
	inc bc			;2b89	03 	. 
	dec d			;2b8a	15 	. 
	ret z			;2b8b	c8 	. 
l2b8ch:
	ld a,(hl)			;2b8c	7e 	~ 
	or a			;2b8d	b7 	. 
	inc hl			;2b8e	23 	# 
	ld (bc),a			;2b8f	02 	. 
	ret z			;2b90	c8 	. 
	jp p,l2b89h		;2b91	f2 89 2b 	. . + 
	cp 0fbh		;2b94	fe fb 	. . 
	jr nz,l2ba0h		;2b96	20 08 	  . 
	dec bc			;2b98	0b 	. 
	dec bc			;2b99	0b 	. 
	dec bc			;2b9a	0b 	. 
	dec bc			;2b9b	0b 	. 
	inc d			;2b9c	14 	. 
	inc d			;2b9d	14 	. 
	inc d			;2b9e	14 	. 
	inc d			;2b9f	14 	. 
l2ba0h:
	cp 095h		;2ba0	fe 95 	. . 
	call z,sub_0b24h		;2ba2	cc 24 0b 	. $ . 
	sub 07fh		;2ba5	d6 7f 	.  
	push hl			;2ba7	e5 	. 
	ld e,a			;2ba8	5f 	_ 
	ld hl,l1650h		;2ba9	21 50 16 	! P . 
l2bach:
	ld a,(hl)			;2bac	7e 	~ 
	or a			;2bad	b7 	. 
	inc hl			;2bae	23 	# 
	jp p,l2bach		;2baf	f2 ac 2b 	. . + 
	dec e			;2bb2	1d 	. 
	jr nz,l2bach		;2bb3	20 f7 	  . 
	and 07fh		;2bb5	e6 7f 	.  
l2bb7h:
	ld (bc),a			;2bb7	02 	. 
	inc bc			;2bb8	03 	. 
	dec d			;2bb9	15 	. 
	jp z,l28d8h		;2bba	ca d8 28 	. . ( 
	ld a,(hl)			;2bbd	7e 	~ 
	inc hl			;2bbe	23 	# 
	or a			;2bbf	b7 	. 
	jp p,l2bb7h		;2bc0	f2 b7 2b 	. . + 
	pop hl			;2bc3	e1 	. 
	jr l2b8ch		;2bc4	18 c6 	. . 
	call sub_1b10h		;2bc6	cd 10 1b 	. . . 
	pop de			;2bc9	d1 	. 
	push bc			;2bca	c5 	. 
	push bc			;2bcb	c5 	. 
	call sub_1b2ch		;2bcc	cd 2c 1b 	. , . 
	jr nc,l2bd6h		;2bcf	30 05 	0 . 
	ld d,h			;2bd1	54 	T 
	ld e,l			;2bd2	5d 	] 
	ex (sp),hl			;2bd3	e3 	. 
	push hl			;2bd4	e5 	. 
	rst 18h			;2bd5	df 	. 
l2bd6h:
	jp nc,l1e4ah		;2bd6	d2 4a 1e 	. J . 
	ld hl,l1929h		;2bd9	21 29 19 	! ) . 
	call sub_28a7h		;2bdc	cd a7 28 	. . ( 
	pop bc			;2bdf	c1 	. 
	ld hl,l1ae8h		;2be0	21 e8 1a 	! . . 
	ex (sp),hl			;2be3	e3 	. 
sub_2be4h:
	ex de,hl			;2be4	eb 	. 
	ld hl,(040f9h)		;2be5	2a f9 40 	* . @ 
l2be8h:
	ld a,(de)			;2be8	1a 	. 
	ld (bc),a			;2be9	02 	. 
	inc bc			;2bea	03 	. 
	inc de			;2beb	13 	. 
	rst 18h			;2bec	df 	. 
	jr nz,l2be8h		;2bed	20 f9 	  . 
	ld h,b			;2bef	60 	` 
	ld l,c			;2bf0	69 	i 
	ld (040f9h),hl		;2bf1	22 f9 40 	" . @ 
	ret			;2bf4	c9 	. 
	call sub_0284h		;2bf5	cd 84 02 	. . . 
	call 02337h		;2bf8	cd 37 23 	. 7 # 
	push hl			;2bfb	e5 	. 
	call sub_2a13h		;2bfc	cd 13 2a 	. . * 
	ld a,0d3h		;2bff	3e d3 	> . 
	call sub_0264h		;2c01	cd 64 02 	. d . 
	call sub_0261h		;2c04	cd 61 02 	. a . 
	ld a,(de)			;2c07	1a 	. 
	call sub_0264h		;2c08	cd 64 02 	. d . 
	ld hl,(040a4h)		;2c0b	2a a4 40 	* . @ 
	ex de,hl			;2c0e	eb 	. 
	ld hl,(040f9h)		;2c0f	2a f9 40 	* . @ 
l2c12h:
	ld a,(de)			;2c12	1a 	. 
	inc de			;2c13	13 	. 
	call sub_0264h		;2c14	cd 64 02 	. d . 
	rst 18h			;2c17	df 	. 
	jr nz,l2c12h		;2c18	20 f8 	  . 
	call sub_01f8h		;2c1a	cd f8 01 	. . . 
	pop hl			;2c1d	e1 	. 
	ret			;2c1e	c9 	. 
	call sub_0293h		;2c1f	cd 93 02 	. . . 
	ld a,(hl)			;2c22	7e 	~ 
	sub 0b2h		;2c23	d6 b2 	. . 
	jr z,$+4		;2c25	28 02 	( . 
	xor a			;2c27	af 	. 
	ld bc,0232fh		;2c28	01 2f 23 	. / # 
	push af			;2c2b	f5 	. 
	dec hl			;2c2c	2b 	+ 
	rst 10h			;2c2d	d7 	. 
	ld a,000h		;2c2e	3e 00 	> . 
	jr z,l2c39h		;2c30	28 07 	( . 
	call 02337h		;2c32	cd 37 23 	. 7 # 
	call sub_2a13h		;2c35	cd 13 2a 	. . * 
	ld a,(de)			;2c38	1a 	. 
l2c39h:
	ld l,a			;2c39	6f 	o 
	pop af			;2c3a	f1 	. 
	or a			;2c3b	b7 	. 
	ld h,a			;2c3c	67 	g 
	ld (04121h),hl		;2c3d	22 21 41 	" ! A 
	call z,sub_1b4dh		;2c40	cc 4d 1b 	. M . 
	ld hl,(04121h)		;2c43	2a 21 41 	* ! A 
	ex de,hl			;2c46	eb 	. 
l2c47h:
	ld b,003h		;2c47	06 03 	. . 
l2c49h:
	call sub_0235h		;2c49	cd 35 02 	. 5 . 
	sub 0d3h		;2c4c	d6 d3 	. . 
	jr nz,l2c47h		;2c4e	20 f7 	  . 
	djnz l2c49h		;2c50	10 f7 	. . 
	call sub_0235h		;2c52	cd 35 02 	. 5 . 
	inc e			;2c55	1c 	. 
	dec e			;2c56	1d 	. 
	jr z,l2c5ch		;2c57	28 03 	( . 
	cp e			;2c59	bb 	. 
	jr nz,l2c93h		;2c5a	20 37 	  7 
l2c5ch:
	ld hl,(040a4h)		;2c5c	2a a4 40 	* . @ 
l2c5fh:
	ld b,003h		;2c5f	06 03 	. . 
l2c61h:
	call sub_0235h		;2c61	cd 35 02 	. 5 . 
	ld e,a			;2c64	5f 	_ 
	sub (hl)			;2c65	96 	. 
	and d			;2c66	a2 	. 
	jr nz,l2c8ah		;2c67	20 21 	  ! 
	ld (hl),e			;2c69	73 	s 
	call 0196ch		;2c6a	cd 6c 19 	. l . 
	ld a,(hl)			;2c6d	7e 	~ 
	or a			;2c6e	b7 	. 
	inc hl			;2c6f	23 	# 
	jr nz,l2c5fh		;2c70	20 ed 	  . 
	call sub_022ch		;2c72	cd 2c 02 	. , . 
	djnz l2c61h		;2c75	10 ea 	. . 
	ld (040f9h),hl		;2c77	22 f9 40 	" . @ 
	ld hl,l1929h		;2c7a	21 29 19 	! ) . 
	call sub_28a7h		;2c7d	cd a7 28 	. . ( 
	call sub_01f8h		;2c80	cd f8 01 	. . . 
l2c83h:
	ld hl,(040a4h)		;2c83	2a a4 40 	* . @ 
	push hl			;2c86	e5 	. 
	jp l1ae8h		;2c87	c3 e8 1a 	. . . 
l2c8ah:
	ld hl,l2ca5h		;2c8a	21 a5 2c 	! . , 
	call sub_28a7h		;2c8d	cd a7 28 	. . ( 
	jp 01a18h		;2c90	c3 18 1a 	. . . 
l2c93h:
	ld (03c3eh),a		;2c93	32 3e 3c 	2 > < 
l2c96h:
	ld b,003h		;2c96	06 03 	. . 
l2c98h:
	call sub_0235h		;2c98	cd 35 02 	. 5 . 
	or a			;2c9b	b7 	. 
	jr nz,l2c96h		;2c9c	20 f8 	  . 
	djnz l2c98h		;2c9e	10 f8 	. . 
	call sub_0296h		;2ca0	cd 96 02 	. . . 
	jr l2c47h		;2ca3	18 a2 	. . 
l2ca5h:
	ld b,d			;2ca5	42 	B 
	ld b,c			;2ca6	41 	A 
	ld b,h			;2ca7	44 	D 
	dec c			;2ca8	0d 	. 
	nop			;2ca9	00 	. 
	call l0a7fh		;2caa	cd 7f 0a 	.  . 
	ld a,(hl)			;2cad	7e 	~ 
	jp sub_27f8h		;2cae	c3 f8 27 	. . ' 
	call sub_2b02h		;2cb1	cd 02 2b 	. . + 
	push de			;2cb4	d5 	. 
	rst 8			;2cb5	cf 	. 
	inc l			;2cb6	2c 	, 
	call sub_2b1ch		;2cb7	cd 1c 2b 	. . + 
	pop de			;2cba	d1 	. 
	ld (de),a			;2cbb	12 	. 
	ret			;2cbc	c9 	. 
l2cbdh:
	call sub_2338h		;2cbd	cd 38 23 	. 8 # 
	call sub_0af4h		;2cc0	cd f4 0a 	. . . 
	rst 8			;2cc3	cf 	. 
	dec sp			;2cc4	3b 	; 
	ex de,hl			;2cc5	eb 	. 
	ld hl,(04121h)		;2cc6	2a 21 41 	* ! A 
	jr l2cd3h		;2cc9	18 08 	. . 
l2ccbh:
	ld a,(040deh)		;2ccb	3a de 40 	: . @ 
	or a			;2cce	b7 	. 
	jr z,l2cddh		;2ccf	28 0c 	( . 
	pop de			;2cd1	d1 	. 
	ex de,hl			;2cd2	eb 	. 
l2cd3h:
	push hl			;2cd3	e5 	. 
	xor a			;2cd4	af 	. 
	ld (040deh),a		;2cd5	32 de 40 	2 . @ 
	cp d			;2cd8	ba 	. 
	push af			;2cd9	f5 	. 
	push de			;2cda	d5 	. 
	ld b,(hl)			;2cdb	46 	F 
	or b			;2cdc	b0 	. 
l2cddh:
	jp z,l1e4ah		;2cdd	ca 4a 1e 	. J . 
	inc hl			;2ce0	23 	# 
	ld c,(hl)			;2ce1	4e 	N 
	inc hl			;2ce2	23 	# 
	ld h,(hl)			;2ce3	66 	f 
	ld l,c			;2ce4	69 	i 
	jr l2d03h		;2ce5	18 1c 	. . 
l2ce7h:
	ld e,b			;2ce7	58 	X 
	push hl			;2ce8	e5 	. 
	ld c,002h		;2ce9	0e 02 	. . 
l2cebh:
	ld a,(hl)			;2ceb	7e 	~ 
	inc hl			;2cec	23 	# 
	cp 025h		;2ced	fe 25 	. % 
	jp z,02e17h		;2cef	ca 17 2e 	. . . 
	cp 020h		;2cf2	fe 20 	.   
	jr nz,l2cf9h		;2cf4	20 03 	  . 
	inc c			;2cf6	0c 	. 
	djnz l2cebh		;2cf7	10 f2 	. . 
l2cf9h:
	pop hl			;2cf9	e1 	. 
	ld b,e			;2cfa	43 	C 
	ld a,025h		;2cfb	3e 25 	> % 
l2cfdh:
	call sub_2e49h		;2cfd	cd 49 2e 	. I . 
	call sub_032ah		;2d00	cd 2a 03 	. * . 
l2d03h:
	xor a			;2d03	af 	. 
	ld e,a			;2d04	5f 	_ 
	ld d,a			;2d05	57 	W 
l2d06h:
	call sub_2e49h		;2d06	cd 49 2e 	. I . 
	ld d,a			;2d09	57 	W 
	ld a,(hl)			;2d0a	7e 	~ 
	inc hl			;2d0b	23 	# 
	cp 021h		;2d0c	fe 21 	. ! 
	jp z,l2e14h		;2d0e	ca 14 2e 	. . . 
	cp 023h		;2d11	fe 23 	. # 
	jr z,l2d4ch		;2d13	28 37 	( 7 
	dec b			;2d15	05 	. 
	jp z,l2dfeh		;2d16	ca fe 2d 	. . - 
	cp 02bh		;2d19	fe 2b 	. + 
	ld a,008h		;2d1b	3e 08 	> . 
	jr z,l2d06h		;2d1d	28 e7 	( . 
	dec hl			;2d1f	2b 	+ 
	ld a,(hl)			;2d20	7e 	~ 
	inc hl			;2d21	23 	# 
	cp 02eh		;2d22	fe 2e 	. . 
	jr z,l2d66h		;2d24	28 40 	( @ 
	cp 025h		;2d26	fe 25 	. % 
	jr z,l2ce7h		;2d28	28 bd 	( . 
	cp (hl)			;2d2a	be 	. 
	jr nz,l2cfdh		;2d2b	20 d0 	  . 
	cp 024h		;2d2d	fe 24 	. $ 
	jr z,$+22		;2d2f	28 14 	( . 
	cp 02ah		;2d31	fe 2a 	. * 
	jr nz,l2cfdh		;2d33	20 c8 	  . 
	ld a,b			;2d35	78 	x 
	cp 002h		;2d36	fe 02 	. . 
	inc hl			;2d38	23 	# 
	jr c,l2d3eh		;2d39	38 03 	8 . 
	ld a,(hl)			;2d3b	7e 	~ 
	cp 024h		;2d3c	fe 24 	. $ 
l2d3eh:
	ld a,020h		;2d3e	3e 20 	>   
	jr nz,l2d49h		;2d40	20 07 	  . 
	dec b			;2d42	05 	. 
	inc e			;2d43	1c 	. 
	cp 0afh		;2d44	fe af 	. . 
	add a,010h		;2d46	c6 10 	. . 
	inc hl			;2d48	23 	# 
l2d49h:
	inc e			;2d49	1c 	. 
	add a,d			;2d4a	82 	. 
	ld d,a			;2d4b	57 	W 
l2d4ch:
	inc e			;2d4c	1c 	. 
	ld c,000h		;2d4d	0e 00 	. . 
	dec b			;2d4f	05 	. 
	jr z,l2d99h		;2d50	28 47 	( G 
	ld a,(hl)			;2d52	7e 	~ 
	inc hl			;2d53	23 	# 
	cp 02eh		;2d54	fe 2e 	. . 
	jr z,l2d70h		;2d56	28 18 	( . 
	cp 023h		;2d58	fe 23 	. # 
	jr z,l2d4ch		;2d5a	28 f0 	( . 
	cp 02ch		;2d5c	fe 2c 	. , 
	jr nz,l2d7ah		;2d5e	20 1a 	  . 
	ld a,d			;2d60	7a 	z 
	or 040h		;2d61	f6 40 	. @ 
	ld d,a			;2d63	57 	W 
	jr l2d4ch		;2d64	18 e6 	. . 
l2d66h:
	ld a,(hl)			;2d66	7e 	~ 
	cp 023h		;2d67	fe 23 	. # 
	ld a,02eh		;2d69	3e 2e 	> . 
	jr nz,l2cfdh		;2d6b	20 90 	  . 
	ld c,001h		;2d6d	0e 01 	. . 
	inc hl			;2d6f	23 	# 
l2d70h:
	inc c			;2d70	0c 	. 
	dec b			;2d71	05 	. 
	jr z,l2d99h		;2d72	28 25 	( % 
	ld a,(hl)			;2d74	7e 	~ 
	inc hl			;2d75	23 	# 
	cp 023h		;2d76	fe 23 	. # 
	jr z,l2d70h		;2d78	28 f6 	( . 
l2d7ah:
	push de			;2d7a	d5 	. 
	ld de,02d97h		;2d7b	11 97 2d 	. . - 
	push de			;2d7e	d5 	. 
	ld d,h			;2d7f	54 	T 
	ld e,l			;2d80	5d 	] 
	cp 05bh		;2d81	fe 5b 	. [ 
	ret nz			;2d83	c0 	. 
	cp (hl)			;2d84	be 	. 
	ret nz			;2d85	c0 	. 
	inc hl			;2d86	23 	# 
	cp (hl)			;2d87	be 	. 
	ret nz			;2d88	c0 	. 
	inc hl			;2d89	23 	# 
	cp (hl)			;2d8a	be 	. 
	ret nz			;2d8b	c0 	. 
	inc hl			;2d8c	23 	# 
	ld a,b			;2d8d	78 	x 
	sub 004h		;2d8e	d6 04 	. . 
	ret c			;2d90	d8 	. 
	pop de			;2d91	d1 	. 
	pop de			;2d92	d1 	. 
	ld b,a			;2d93	47 	G 
	inc d			;2d94	14 	. 
	inc hl			;2d95	23 	# 
	jp z,0d1ebh		;2d96	ca eb d1 	. . . 
l2d99h:
	ld a,d			;2d99	7a 	z 
	dec hl			;2d9a	2b 	+ 
	inc e			;2d9b	1c 	. 
	and 008h		;2d9c	e6 08 	. . 
	jr nz,l2db5h		;2d9e	20 15 	  . 
	dec e			;2da0	1d 	. 
	ld a,b			;2da1	78 	x 
	or a			;2da2	b7 	. 
	jr z,l2db5h		;2da3	28 10 	( . 
	ld a,(hl)			;2da5	7e 	~ 
	sub 02dh		;2da6	d6 2d 	. - 
	jr z,l2db0h		;2da8	28 06 	( . 
	cp 0feh		;2daa	fe fe 	. . 
	jr nz,l2db5h		;2dac	20 07 	  . 
	ld a,008h		;2dae	3e 08 	> . 
l2db0h:
	add a,004h		;2db0	c6 04 	. . 
	add a,d			;2db2	82 	. 
	ld d,a			;2db3	57 	W 
	dec b			;2db4	05 	. 
l2db5h:
	pop hl			;2db5	e1 	. 
	pop af			;2db6	f1 	. 
	jr z,l2e09h		;2db7	28 50 	( P 
	push bc			;2db9	c5 	. 
	push de			;2dba	d5 	. 
	call 02337h		;2dbb	cd 37 23 	. 7 # 
	pop de			;2dbe	d1 	. 
	pop bc			;2dbf	c1 	. 
	push bc			;2dc0	c5 	. 
	push hl			;2dc1	e5 	. 
	ld b,e			;2dc2	43 	C 
	ld a,b			;2dc3	78 	x 
	add a,c			;2dc4	81 	. 
	cp 019h		;2dc5	fe 19 	. . 
	jp nc,l1e4ah		;2dc7	d2 4a 1e 	. J . 
	ld a,d			;2dca	7a 	z 
	or 080h		;2dcb	f6 80 	. . 
	call sub_0fbeh		;2dcd	cd be 0f 	. . . 
	call sub_28a7h		;2dd0	cd a7 28 	. . ( 
l2dd3h:
	pop hl			;2dd3	e1 	. 
	dec hl			;2dd4	2b 	+ 
	rst 10h			;2dd5	d7 	. 
	scf			;2dd6	37 	7 
	jr z,l2de6h		;2dd7	28 0d 	( . 
	ld (040deh),a		;2dd9	32 de 40 	2 . @ 
	cp 03bh		;2ddc	fe 3b 	. ; 
	jr z,l2de5h		;2dde	28 05 	( . 
	cp 02ch		;2de0	fe 2c 	. , 
	jp nz,l1997h		;2de2	c2 97 19 	. . . 
l2de5h:
	rst 10h			;2de5	d7 	. 
l2de6h:
	pop bc			;2de6	c1 	. 
	ex de,hl			;2de7	eb 	. 
	pop hl			;2de8	e1 	. 
	push hl			;2de9	e5 	. 
	push af			;2dea	f5 	. 
	push de			;2deb	d5 	. 
	ld a,(hl)			;2dec	7e 	~ 
	sub b			;2ded	90 	. 
	inc hl			;2dee	23 	# 
	ld c,(hl)			;2def	4e 	N 
	inc hl			;2df0	23 	# 
	ld h,(hl)			;2df1	66 	f 
	ld l,c			;2df2	69 	i 
	ld d,000h		;2df3	16 00 	. . 
	ld e,a			;2df5	5f 	_ 
	add hl,de			;2df6	19 	. 
	ld a,b			;2df7	78 	x 
	or a			;2df8	b7 	. 
	jp nz,l2d03h		;2df9	c2 03 2d 	. . - 
	jr l2e04h		;2dfc	18 06 	. . 
l2dfeh:
	call sub_2e49h		;2dfe	cd 49 2e 	. I . 
	call sub_032ah		;2e01	cd 2a 03 	. * . 
l2e04h:
	pop hl			;2e04	e1 	. 
	pop af			;2e05	f1 	. 
	jp nz,l2ccbh		;2e06	c2 cb 2c 	. . , 
l2e09h:
	call c,sub_20feh		;2e09	dc fe 20 	. .   
	ex (sp),hl			;2e0c	e3 	. 
	call sub_29ddh		;2e0d	cd dd 29 	. . ) 
	pop hl			;2e10	e1 	. 
	jp sub_2169h		;2e11	c3 69 21 	. i ! 
l2e14h:
	ld c,001h		;2e14	0e 01 	. . 
	ld a,0f1h		;2e16	3e f1 	> . 
	dec b			;2e18	05 	. 
	call sub_2e49h		;2e19	cd 49 2e 	. I . 
	pop hl			;2e1c	e1 	. 
	pop af			;2e1d	f1 	. 
	jr z,l2e09h		;2e1e	28 e9 	( . 
	push bc			;2e20	c5 	. 
	call 02337h		;2e21	cd 37 23 	. 7 # 
	call sub_0af4h		;2e24	cd f4 0a 	. . . 
	pop bc			;2e27	c1 	. 
	push bc			;2e28	c5 	. 
	push hl			;2e29	e5 	. 
	ld hl,(04121h)		;2e2a	2a 21 41 	* ! A 
	ld b,c			;2e2d	41 	A 
	ld c,000h		;2e2e	0e 00 	. . 
	push bc			;2e30	c5 	. 
	call 02a68h		;2e31	cd 68 2a 	. h * 
	call sub_28aah		;2e34	cd aa 28 	. . ( 
	ld hl,(04121h)		;2e37	2a 21 41 	* ! A 
	pop af			;2e3a	f1 	. 
	sub (hl)			;2e3b	96 	. 
	ld b,a			;2e3c	47 	G 
	ld a,020h		;2e3d	3e 20 	>   
	inc b			;2e3f	04 	. 
l2e40h:
	dec b			;2e40	05 	. 
	jp z,l2dd3h		;2e41	ca d3 2d 	. . - 
	call sub_032ah		;2e44	cd 2a 03 	. * . 
	jr l2e40h		;2e47	18 f7 	. . 
sub_2e49h:
	push af			;2e49	f5 	. 
	ld a,d			;2e4a	7a 	z 
	or a			;2e4b	b7 	. 
	ld a,02bh		;2e4c	3e 2b 	> + 
	call nz,sub_032ah		;2e4e	c4 2a 03 	. * . 
	pop af			;2e51	f1 	. 
	ret			;2e52	c9 	. 
sub_2e53h:
	ld (0409ah),a		;2e53	32 9a 40 	2 . @ 
	ld hl,(040eah)		;2e56	2a ea 40 	* . @ 
	or h			;2e59	b4 	. 
	and l			;2e5a	a5 	. 
	inc a			;2e5b	3c 	< 
	ex de,hl			;2e5c	eb 	. 
	ret z			;2e5d	c8 	. 
	jr l2e64h		;2e5e	18 04 	. . 
	call sub_1e4fh		;2e60	cd 4f 1e 	. O . 
	ret nz			;2e63	c0 	. 
l2e64h:
	pop hl			;2e64	e1 	. 
l2e65h:
	ex de,hl			;2e65	eb 	. 
	ld (040ech),hl		;2e66	22 ec 40 	" . @ 
	ex de,hl			;2e69	eb 	. 
	call sub_1b2ch		;2e6a	cd 2c 1b 	. , . 
	jp nc,l1ed9h		;2e6d	d2 d9 1e 	. . . 
	ld h,b			;2e70	60 	` 
	ld l,c			;2e71	69 	i 
	inc hl			;2e72	23 	# 
	inc hl			;2e73	23 	# 
	ld c,(hl)			;2e74	4e 	N 
	inc hl			;2e75	23 	# 
	ld b,(hl)			;2e76	46 	F 
	inc hl			;2e77	23 	# 
	push bc			;2e78	c5 	. 
	call sub_2b7eh		;2e79	cd 7e 2b 	. ~ + 
l2e7ch:
	pop hl			;2e7c	e1 	. 
	push hl			;2e7d	e5 	. 
	call sub_0fafh		;2e7e	cd af 0f 	. . . 
	ld a,020h		;2e81	3e 20 	>   
	call sub_032ah		;2e83	cd 2a 03 	. * . 
	ld hl,(040a7h)		;2e86	2a a7 40 	* . @ 
	ld a,00eh		;2e89	3e 0e 	> . 
	call sub_032ah		;2e8b	cd 2a 03 	. * . 
	push hl			;2e8e	e5 	. 
	ld c,0ffh		;2e8f	0e ff 	. . 
l2e91h:
	inc c			;2e91	0c 	. 
	ld a,(hl)			;2e92	7e 	~ 
	or a			;2e93	b7 	. 
	inc hl			;2e94	23 	# 
	jr nz,l2e91h		;2e95	20 fa 	  . 
	pop hl			;2e97	e1 	. 
	ld b,a			;2e98	47 	G 
l2e99h:
	ld d,000h		;2e99	16 00 	. . 
l2e9bh:
	call l0384h		;2e9b	cd 84 03 	. . . 
	sub 030h		;2e9e	d6 30 	. 0 
	jr c,l2eb0h		;2ea0	38 0e 	8 . 
	cp 00ah		;2ea2	fe 0a 	. . 
	jr nc,l2eb0h		;2ea4	30 0a 	0 . 
	ld e,a			;2ea6	5f 	_ 
	ld a,d			;2ea7	7a 	z 
	rlca			;2ea8	07 	. 
	rlca			;2ea9	07 	. 
	add a,d			;2eaa	82 	. 
	rlca			;2eab	07 	. 
	add a,e			;2eac	83 	. 
	ld d,a			;2ead	57 	W 
	jr l2e9bh		;2eae	18 eb 	. . 
l2eb0h:
	push hl			;2eb0	e5 	. 
	ld hl,l2e99h		;2eb1	21 99 2e 	! . . 
	ex (sp),hl			;2eb4	e3 	. 
	dec d			;2eb5	15 	. 
	inc d			;2eb6	14 	. 
	jp nz,l2ebbh		;2eb7	c2 bb 2e 	. . . 
	inc d			;2eba	14 	. 
l2ebbh:
	cp 0d8h		;2ebb	fe d8 	. . 
	jp z,l2fd2h		;2ebd	ca d2 2f 	. . / 
	cp 0ddh		;2ec0	fe dd 	. . 
	jp z,l2fe0h		;2ec2	ca e0 2f 	. . / 
	cp 0f0h		;2ec5	fe f0 	. . 
	jr z,l2f0ah		;2ec7	28 41 	( A 
	cp 031h		;2ec9	fe 31 	. 1 
	jr c,l2ecfh		;2ecb	38 02 	8 . 
	sub 020h		;2ecd	d6 20 	.   
l2ecfh:
	cp 021h		;2ecf	fe 21 	. ! 
	jp z,l2ff6h		;2ed1	ca f6 2f 	. . / 
	cp 01ch		;2ed4	fe 1c 	. . 
	jp z,l2f40h		;2ed6	ca 40 2f 	. @ / 
	cp 023h		;2ed9	fe 23 	. # 
	jr z,l2f1ch		;2edb	28 3f 	( ? 
	cp 019h		;2edd	fe 19 	. . 
	jp z,l2f7dh		;2edf	ca 7d 2f 	. } / 
	cp 014h		;2ee2	fe 14 	. . 
	jp z,l2f4ah		;2ee4	ca 4a 2f 	. J / 
	cp 013h		;2ee7	fe 13 	. . 
	jp z,l2f65h		;2ee9	ca 65 2f 	. e / 
	cp 015h		;2eec	fe 15 	. . 
	jp z,l2fe3h		;2eee	ca e3 2f 	. . / 
	cp 028h		;2ef1	fe 28 	. ( 
	jp z,l2f78h		;2ef3	ca 78 2f 	. x / 
	cp 01bh		;2ef6	fe 1b 	. . 
	jr z,l2f16h		;2ef8	28 1c 	( . 
	cp 018h		;2efa	fe 18 	. . 
	jp z,l2f75h		;2efc	ca 75 2f 	. u / 
	cp 011h		;2eff	fe 11 	. . 
	ret nz			;2f01	c0 	. 
	pop bc			;2f02	c1 	. 
	pop de			;2f03	d1 	. 
	call sub_20feh		;2f04	cd fe 20 	. .   
	jp l2e65h		;2f07	c3 65 2e 	. e . 
l2f0ah:
	ld a,(hl)			;2f0a	7e 	~ 
	or a			;2f0b	b7 	. 
	ret z			;2f0c	c8 	. 
	inc b			;2f0d	04 	. 
	call sub_032ah		;2f0e	cd 2a 03 	. * . 
	inc hl			;2f11	23 	# 
	dec d			;2f12	15 	. 
	jr nz,l2f0ah		;2f13	20 f5 	  . 
	ret			;2f15	c9 	. 
l2f16h:
	push hl			;2f16	e5 	. 
	ld hl,l2f5fh		;2f17	21 5f 2f 	! _ / 
	ex (sp),hl			;2f1a	e3 	. 
	scf			;2f1b	37 	7 
l2f1ch:
	push af			;2f1c	f5 	. 
	call l0384h		;2f1d	cd 84 03 	. . . 
	ld e,a			;2f20	5f 	_ 
	pop af			;2f21	f1 	. 
	push af			;2f22	f5 	. 
	call c,l2f5fh		;2f23	dc 5f 2f 	. _ / 
l2f26h:
	ld a,(hl)			;2f26	7e 	~ 
	or a			;2f27	b7 	. 
	jp z,l2f3eh		;2f28	ca 3e 2f 	. > / 
	call sub_032ah		;2f2b	cd 2a 03 	. * . 
	pop af			;2f2e	f1 	. 
	push af			;2f2f	f5 	. 
	call c,sub_2fa1h		;2f30	dc a1 2f 	. . / 
	jr c,l2f37h		;2f33	38 02 	8 . 
	inc hl			;2f35	23 	# 
	inc b			;2f36	04 	. 
l2f37h:
	ld a,(hl)			;2f37	7e 	~ 
	cp e			;2f38	bb 	. 
	jr nz,l2f26h		;2f39	20 eb 	  . 
	dec d			;2f3b	15 	. 
	jr nz,l2f26h		;2f3c	20 e8 	  . 
l2f3eh:
	pop af			;2f3e	f1 	. 
	ret			;2f3f	c9 	. 
l2f40h:
	call sub_2b75h		;2f40	cd 75 2b 	. u + 
	call sub_20feh		;2f43	cd fe 20 	. .   
	pop bc			;2f46	c1 	. 
	jp l2e7ch		;2f47	c3 7c 2e 	. | . 
l2f4ah:
	ld a,(hl)			;2f4a	7e 	~ 
	or a			;2f4b	b7 	. 
	ret z			;2f4c	c8 	. 
	ld a,021h		;2f4d	3e 21 	> ! 
	call sub_032ah		;2f4f	cd 2a 03 	. * . 
l2f52h:
	ld a,(hl)			;2f52	7e 	~ 
	or a			;2f53	b7 	. 
	jr z,l2f5fh		;2f54	28 09 	( . 
	call sub_032ah		;2f56	cd 2a 03 	. * . 
	call sub_2fa1h		;2f59	cd a1 2f 	. . / 
	dec d			;2f5c	15 	. 
	jr nz,l2f52h		;2f5d	20 f3 	  . 
l2f5fh:
	ld a,021h		;2f5f	3e 21 	> ! 
	call sub_032ah		;2f61	cd 2a 03 	. * . 
	ret			;2f64	c9 	. 
l2f65h:
	ld a,(hl)			;2f65	7e 	~ 
	or a			;2f66	b7 	. 
	ret z			;2f67	c8 	. 
	call l0384h		;2f68	cd 84 03 	. . . 
	ld (hl),a			;2f6b	77 	w 
	call sub_032ah		;2f6c	cd 2a 03 	. * . 
	inc hl			;2f6f	23 	# 
	inc b			;2f70	04 	. 
	dec d			;2f71	15 	. 
	jr nz,l2f65h		;2f72	20 f1 	  . 
	ret			;2f74	c9 	. 
l2f75h:
	ld (hl),000h		;2f75	36 00 	6 . 
	ld c,b			;2f77	48 	H 
l2f78h:
	ld d,0ffh		;2f78	16 ff 	. . 
	call l2f0ah		;2f7a	cd 0a 2f 	. . / 
l2f7dh:
	call l0384h		;2f7d	cd 84 03 	. . . 
	or a			;2f80	b7 	. 
	jp z,l2f7dh		;2f81	ca 7d 2f 	. } / 
	cp 008h		;2f84	fe 08 	. . 
	jr z,l2f92h		;2f86	28 0a 	( . 
	cp 00dh		;2f88	fe 0d 	. . 
	jp z,l2fe0h		;2f8a	ca e0 2f 	. . / 
	cp 01bh		;2f8d	fe 1b 	. . 
	ret z			;2f8f	c8 	. 
	jr nz,l2fb0h		;2f90	20 1e 	  . 
l2f92h:
	ld a,008h		;2f92	3e 08 	> . 
	dec b			;2f94	05 	. 
	inc b			;2f95	04 	. 
	jr z,l2fb7h		;2f96	28 1f 	( . 
	call sub_032ah		;2f98	cd 2a 03 	. * . 
	dec hl			;2f9b	2b 	+ 
	dec b			;2f9c	05 	. 
	ld de,l2f7dh		;2f9d	11 7d 2f 	. } / 
	push de			;2fa0	d5 	. 
sub_2fa1h:
	push hl			;2fa1	e5 	. 
	dec c			;2fa2	0d 	. 
l2fa3h:
	ld a,(hl)			;2fa3	7e 	~ 
	or a			;2fa4	b7 	. 
	scf			;2fa5	37 	7 
	jp z,l0890h		;2fa6	ca 90 08 	. . . 
	inc hl			;2fa9	23 	# 
	ld a,(hl)			;2faa	7e 	~ 
	dec hl			;2fab	2b 	+ 
	ld (hl),a			;2fac	77 	w 
	inc hl			;2fad	23 	# 
	jr l2fa3h		;2fae	18 f3 	. . 
l2fb0h:
	push af			;2fb0	f5 	. 
	ld a,c			;2fb1	79 	y 
	cp 0ffh		;2fb2	fe ff 	. . 
	jr c,l2fb9h		;2fb4	38 03 	8 . 
	pop af			;2fb6	f1 	. 
l2fb7h:
	jr l2f7dh		;2fb7	18 c4 	. . 
l2fb9h:
	sub b			;2fb9	90 	. 
	inc c			;2fba	0c 	. 
	inc b			;2fbb	04 	. 
	push bc			;2fbc	c5 	. 
	ex de,hl			;2fbd	eb 	. 
	ld l,a			;2fbe	6f 	o 
	ld h,000h		;2fbf	26 00 	& . 
	add hl,de			;2fc1	19 	. 
	ld b,h			;2fc2	44 	D 
	ld c,l			;2fc3	4d 	M 
	inc hl			;2fc4	23 	# 
	call sub_1958h		;2fc5	cd 58 19 	. X . 
	pop bc			;2fc8	c1 	. 
	pop af			;2fc9	f1 	. 
	ld (hl),a			;2fca	77 	w 
	call sub_032ah		;2fcb	cd 2a 03 	. * . 
	inc hl			;2fce	23 	# 
	jp l2f7dh		;2fcf	c3 7d 2f 	. } / 
l2fd2h:
	ld a,b			;2fd2	78 	x 
	or a			;2fd3	b7 	. 
	ret z			;2fd4	c8 	. 
	dec b			;2fd5	05 	. 
	dec hl			;2fd6	2b 	+ 
	ld a,008h		;2fd7	3e 08 	> . 
	call sub_032ah		;2fd9	cd 2a 03 	. * . 
	dec d			;2fdc	15 	. 
	jr nz,l2fd2h		;2fdd	20 f3 	  . 
	ret			;2fdf	c9 	. 
l2fe0h:
	call sub_2b75h		;2fe0	cd 75 2b 	. u + 
l2fe3h:
	call sub_20feh		;2fe3	cd fe 20 	. .   
	pop bc			;2fe6	c1 	. 
	pop de			;2fe7	d1 	. 
	ld a,d			;2fe8	7a 	z 
	and e			;2fe9	a3 	. 
	inc a			;2fea	3c 	< 
l2febh:
	ld hl,(040a7h)		;2feb	2a a7 40 	* . @ 
	dec hl			;2fee	2b 	+ 
	ret z			;2fef	c8 	. 
	scf			;2ff0	37 	7 
	inc hl			;2ff1	23 	# 
	push af			;2ff2	f5 	. 
	jp l1a98h		;2ff3	c3 98 1a 	. . . 
l2ff6h:
	pop bc			;2ff6	c1 	. 
	pop de			;2ff7	d1 	. 
	jp l1a19h		;2ff8	c3 19 1a 	. . . 
	sbc a,0c3h		;2ffb	de c3 	. . 
	jp 0b244h		;2ffd	c3 44 b2 	. D . 
	call sub_305ch		;3000	cd 5c 30 	. \ 0 
	jp l3021h		;3003	c3 21 30 	. ! 0 
l3006h:
	ld hl,l3147h		;3006	21 47 31 	! G 1 
	jr l3012h		;3009	18 07 	. . 
	call sub_305ch		;300b	cd 5c 30 	. \ 0 
	ld a,010h		;300e	3e 10 	> . 
	jr l3022h		;3010	18 10 	. . 
l3012h:
	ld (0401eh),hl		;3012	22 1e 40 	" . @ 
	ld hl,l33d4h		;3015	21 d4 33 	! . 3 
	ld (04004h),hl		;3018	22 04 40 	" . @ 
	call l1b61h		;301b	cd 61 1b 	. a . 
	jp l1a19h		;301e	c3 19 1a 	. . . 
l3021h:
	xor a			;3021	af 	. 
l3022h:
	ld (iy+006h),a		;3022	fd 77 06 	. w . 
	push iy		;3025	fd e5 	. . 
	pop hl			;3027	e1 	. 
	ld b,005h		;3028	06 05 	. . 
	xor a			;302a	af 	. 
l302bh:
	inc hl			;302b	23 	# 
	ld (hl),a			;302c	77 	w 
	djnz l302bh		;302d	10 fc 	. . 
	ld hl,l3040h		;302f	21 40 30 	! @ 0 
	call sub_01c9h		;3032	cd c9 01 	. . . 
	call sub_28a7h		;3035	cd a7 28 	. . ( 
	ld hl,l3078h		;3038	21 78 30 	! x 0 
	ld (04016h),hl		;303b	22 16 40 	" . @ 
	jr l3006h		;303e	18 c6 	. . 
l3040h:
	ld c,(hl)			;3040	4e 	N 
	ld b,l			;3041	45 	E 
	ld d,a			;3042	57 	W 
	jr nz,$+77		;3043	20 4b 	  K 
	ld b,l			;3045	45 	E 
	ld e,c			;3046	59 	Y 
	ld b,d			;3047	42 	B 
	ld c,a			;3048	4f 	O 
	ld b,c			;3049	41 	A 
	ld d,d			;304a	52 	R 
	ld b,h			;304b	44 	D 
	jr nz,l30a0h		;304c	20 52 	  R 
	ld c,a			;304e	4f 	O 
	ld d,l			;304f	55 	U 
	ld d,h			;3050	54 	T 
	ld c,c			;3051	49 	I 
	ld c,(hl)			;3052	4e 	N 
	ld b,l			;3053	45 	E 
	jr nz,l309bh		;3054	20 45 	  E 
	ld c,(hl)			;3056	4e 	N 
	ld b,c			;3057	41 	A 
	ld b,d			;3058	42 	B 
	ld c,h			;3059	4c 	L 
	ld b,l			;305a	45 	E 
	nop			;305b	00 	. 
sub_305ch:
	ld hl,(040b1h)		;305c	2a b1 40 	* . @ 
	ld de,0fffah		;305f	11 fa ff 	. . . 
	add hl,de			;3062	19 	. 
	ld (040b1h),hl		;3063	22 b1 40 	" . @ 
	ld (04049h),hl		;3066	22 49 40 	" I @ 
	ld (0401bh),hl		;3069	22 1b 40 	" . @ 
	ld de,0ffceh		;306c	11 ce ff 	. . . 
	add hl,de			;306f	19 	. 
	ld (040a0h),hl		;3070	22 a0 40 	" . @ 
	ld iy,(0401bh)		;3073	fd 2a 1b 40 	. * . @ 
	ret			;3077	c9 	. 
l3078h:
	push iy		;3078	fd e5 	. . 
	call sub_3080h		;307a	cd 80 30 	. . 0 
	pop iy		;307d	fd e1 	. . 
	ret			;307f	c9 	. 
sub_3080h:
	ld iy,(0401bh)		;3080	fd 2a 1b 40 	. * . @ 
	ld hl,04036h		;3084	21 36 40 	! 6 @ 
	ld bc,03880h		;3087	01 80 38 	. . 8 
	ld a,(bc)			;308a	0a 	. 
	and 001h		;308b	e6 01 	. . 
	jr z,l30a3h		;308d	28 14 	( . 
	ld c,040h		;308f	0e 40 	. @ 
	ld a,(bc)			;3091	0a 	. 
	and 004h		;3092	e6 04 	. . 
	jr z,l30a3h		;3094	28 0d 	( . 
l3096h:
	ld a,(bc)			;3096	0a 	. 
	and 004h		;3097	e6 04 	. . 
	jr nz,l3096h		;3099	20 fb 	  . 
l309bh:
	ld a,(iy+006h)		;309b	fd 7e 06 	. ~ . 
	xor 010h		;309e	ee 10 	. . 
l30a0h:
	ld (iy+006h),a		;30a0	fd 77 06 	. w . 
l30a3h:
	ld a,(iy+005h)		;30a3	fd 7e 05 	. ~ . 
	and a			;30a6	a7 	. 
	jr z,l30b1h		;30a7	28 08 	( . 
	ld e,a			;30a9	5f 	_ 
	ld c,(iy+003h)		;30aa	fd 4e 03 	. N . 
	ld a,(bc)			;30ad	0a 	. 
	and e			;30ae	a3 	. 
	jr nz,l30f8h		;30af	20 47 	  G 
l30b1h:
	ld a,(04022h)		;30b1	3a 22 40 	: " @ 
	and a			;30b4	a7 	. 
	jr z,l30cah		;30b5	28 13 	( . 
	ld a,(iy+006h)		;30b7	fd 7e 06 	. ~ . 
	and a			;30ba	a7 	. 
	jr nz,l30cah		;30bb	20 0d 	  . 
	inc (iy+002h)		;30bd	fd 34 02 	. 4 . 
	jr nz,l30cah		;30c0	20 08 	  . 
	ld de,(04020h)		;30c2	ed 5b 20 40 	. [   @ 
	ld a,(de)			;30c6	1a 	. 
	xor 0d0h		;30c7	ee d0 	. . 
	ld (de),a			;30c9	12 	. 
l30cah:
	xor a			;30ca	af 	. 
	ld (iy+005h),a		;30cb	fd 77 05 	. w . 
	ld c,001h		;30ce	0e 01 	. . 
	ld d,000h		;30d0	16 00 	. . 
l30d2h:
	ld a,(bc)			;30d2	0a 	. 
	ld e,a			;30d3	5f 	_ 
	xor (hl)			;30d4	ae 	. 
	ld (hl),e			;30d5	73 	s 
	and e			;30d6	a3 	. 
	jr nz,l30e1h		;30d7	20 08 	  . 
	inc d			;30d9	14 	. 
	inc l			;30da	2c 	, 
	rlc c		;30db	cb 01 	. . 
	jp p,l30d2h		;30dd	f2 d2 30 	. . 0 
	ret			;30e0	c9 	. 
l30e1h:
	ld e,a			;30e1	5f 	_ 
	push bc			;30e2	c5 	. 
	ld bc,l0600h		;30e3	01 00 06 	. . . 
	call l0060h		;30e6	cd 60 00 	. ` . 
	pop bc			;30e9	c1 	. 
	ld a,(bc)			;30ea	0a 	. 
	and e			;30eb	a3 	. 
	ret z			;30ec	c8 	. 
	ld (iy+005h),a		;30ed	fd 77 05 	. w . 
	ld (iy+003h),c		;30f0	fd 71 03 	. q . 
	ld (iy+004h),b		;30f3	fd 70 04 	. p . 
	jr l3165h		;30f6	18 6d 	. m 
l30f8h:
	ld a,(iy+004h)		;30f8	fd 7e 04 	. ~ . 
	and a			;30fb	a7 	. 
	jr nz,l310ch		;30fc	20 0e 	  . 
	push bc			;30fe	c5 	. 
	ld bc,00a00h		;30ff	01 00 0a 	. . . 
	call l0060h		;3102	cd 60 00 	. ` . 
	pop bc			;3105	c1 	. 
	ld a,(bc)			;3106	0a 	. 
	and e			;3107	a3 	. 
	jr z,l30cah		;3108	28 c0 	( . 
	jr l3134h		;310a	18 28 	. ( 
l310ch:
	ld hl,04c00h		;310c	21 00 4c 	! . L 
l310fh:
	push hl			;310f	e5 	. 
	push bc			;3110	c5 	. 
	ld hl,04036h		;3111	21 36 40 	! 6 @ 
	ld c,001h		;3114	0e 01 	. . 
l3116h:
	ld a,(bc)			;3116	0a 	. 
	ld e,a			;3117	5f 	_ 
	xor (hl)			;3118	ae 	. 
	and e			;3119	a3 	. 
	jr nz,l313fh		;311a	20 23 	  # 
	inc l			;311c	2c 	, 
	rlc c		;311d	cb 01 	. . 
	jp p,l3116h		;311f	f2 16 31 	. . 1 
	pop bc			;3122	c1 	. 
	ld e,(iy+005h)		;3123	fd 5e 05 	. ^ . 
	ld a,(bc)			;3126	0a 	. 
	and e			;3127	a3 	. 
	jr z,l3140h		;3128	28 16 	( . 
	pop hl			;312a	e1 	. 
	dec hl			;312b	2b 	+ 
	bit 6,h		;312c	cb 74 	. t 
	jr nz,l310fh		;312e	20 df 	  . 
	xor a			;3130	af 	. 
	ld (iy+004h),a		;3131	fd 77 04 	. w . 
l3134h:
	ld d,000h		;3134	16 00 	. . 
l3136h:
	bit 0,c		;3136	cb 41 	. A 
	jr nz,l3165h		;3138	20 2b 	  + 
	rr c		;313a	cb 19 	. . 
	inc d			;313c	14 	. 
	jr l3136h		;313d	18 f7 	. . 
l313fh:
	pop bc			;313f	c1 	. 
l3140h:
	pop hl			;3140	e1 	. 
	ld hl,04036h		;3141	21 36 40 	! 6 @ 
	jp l30cah		;3144	c3 ca 30 	. . 0 
l3147h:
	ld l,(ix+003h)		;3147	dd 6e 03 	. n . 
	ld h,(ix+004h)		;314a	dd 66 04 	. f . 
	jp c,l049ah		;314d	da 9a 04 	. . . 
	ld a,(ix+005h)		;3150	dd 7e 05 	. ~ . 
	or a			;3153	b7 	. 
	jr z,l3157h		;3154	28 01 	( . 
	ld (hl),a			;3156	77 	w 
l3157h:
	ld a,c			;3157	79 	y 
	cp 020h		;3158	fe 20 	.   
	jp c,l0506h		;315a	da 06 05 	. . . 
	cp 080h		;315d	fe 80 	. . 
	jp nc,l04a6h		;315f	d2 a6 04 	. . . 
	jp l047dh		;3162	c3 7d 04 	. } . 
l3165h:
	push hl			;3165	e5 	. 
	ld hl,l316dh		;3166	21 6d 31 	! m 1 
	ex (sp),hl			;3169	e3 	. 
	jp l03fbh		;316a	c3 fb 03 	. . . 
l316dh:
	cp 010h		;316d	fe 10 	. . 
	jr z,l3172h		;316f	28 01 	( . 
	ret			;3171	c9 	. 
l3172h:
	in a,(0fdh)		;3172	db fd 	. . 
	and 0f0h		;3174	e6 f0 	. . 
	cp 030h		;3176	fe 30 	. 0 
	jr nz,l31a4h		;3178	20 2a 	  * 
	ld hl,03c00h		;317a	21 00 3c 	! . < 
l317dh:
	ld a,l			;317d	7d 	} 
	and 03fh		;317e	e6 3f 	. ? 
	ld a,00dh		;3180	3e 0d 	> . 
	call z,sub_003bh		;3182	cc 3b 00 	. ; . 
	ld a,(hl)			;3185	7e 	~ 
	bit 7,a		;3186	cb 7f 	.  
	jr z,l318ch		;3188	28 02 	( . 
	and 0bfh		;318a	e6 bf 	. . 
l318ch:
	bit 6,h		;318c	cb 74 	. t 
	inc hl			;318e	23 	# 
	jr nz,l3196h		;318f	20 05 	  . 
	call sub_003bh		;3191	cd 3b 00 	. ; . 
	jr l317dh		;3194	18 e7 	. . 
l3196h:
	ld b,006h		;3196	06 06 	. . 
l3198h:
	ld a,020h		;3198	3e 20 	>   
	call sub_003bh		;319a	cd 3b 00 	. ; . 
	ld a,00dh		;319d	3e 0d 	> . 
	call sub_003bh		;319f	cd 3b 00 	. ; . 
	djnz l3198h		;31a2	10 f4 	. . 
l31a4h:
	xor a			;31a4	af 	. 
	ret			;31a5	c9 	. 
	ex (sp),hl			;31a6	e3 	. 
	ld (041feh),hl		;31a7	22 fe 41 	" . A 
	ex (sp),hl			;31aa	e3 	. 
l31abh:
	ld (041fch),sp		;31ab	ed 73 fc 41 	. s . A 
	ld sp,041fch		;31af	31 fc 41 	1 . A 
	ex af,af'			;31b2	08 	. 
	exx			;31b3	d9 	. 
	push hl			;31b4	e5 	. 
	push de			;31b5	d5 	. 
	push bc			;31b6	c5 	. 
	push af			;31b7	f5 	. 
	ex af,af'			;31b8	08 	. 
	exx			;31b9	d9 	. 
	push hl			;31ba	e5 	. 
	push de			;31bb	d5 	. 
	push bc			;31bc	c5 	. 
	push af			;31bd	f5 	. 
	push ix		;31be	dd e5 	. . 
	push iy		;31c0	fd e5 	. . 
	ld sp,(041fch)		;31c2	ed 7b fc 41 	. { . A 
l31c6h:
	call sub_01c9h		;31c6	cd c9 01 	. . . 
	call sub_3234h		;31c9	cd 34 32 	. 4 2 
	call l0049h		;31cc	cd 49 00 	. I . 
	call sub_033ah		;31cf	cd 3a 03 	. : . 
	cp 044h		;31d2	fe 44 	. D 
	jr z,l31efh		;31d4	28 19 	( . 
	cp 04dh		;31d6	fe 4d 	. M 
	jr z,l3227h		;31d8	28 4d 	( M 
	cp 052h		;31da	fe 52 	. R 
	jr z,l322ch		;31dc	28 4e 	( N 
	cp 042h		;31de	fe 42 	. B 
	jr nz,l31e8h		;31e0	20 06 	  . 
	call l1b61h		;31e2	cd 61 1b 	. a . 
	jp l1a19h		;31e5	c3 19 1a 	. . . 
l31e8h:
	cp 047h		;31e8	fe 47 	. G 
	call z,sub_32ebh		;31ea	cc eb 32 	. . 2 
	jr l31c6h		;31ed	18 d7 	. . 
l31efh:
	call sub_3392h		;31ef	cd 92 33 	. . 3 
	cp 058h		;31f2	fe 58 	. X 
	jr z,l31c6h		;31f4	28 d0 	( . 
	call sub_01c9h		;31f6	cd c9 01 	. . . 
l31f9h:
	call sub_3269h		;31f9	cd 69 32 	. i 2 
	ld a,03eh		;31fc	3e 3e 	> > 
	call sub_033ah		;31fe	cd 3a 03 	. : . 
	ld b,010h		;3201	06 10 	. . 
l3203h:
	ld a,(hl)			;3203	7e 	~ 
	call sub_3373h		;3204	cd 73 33 	. s 3 
	ld a,020h		;3207	3e 20 	>   
	call sub_033ah		;3209	cd 3a 03 	. : . 
	inc hl			;320c	23 	# 
	djnz l3203h		;320d	10 f4 	. . 
	ld a,00dh		;320f	3e 0d 	> . 
	call sub_033ah		;3211	cd 3a 03 	. : . 
	call l0049h		;3214	cd 49 00 	. I . 
	cp 00ah		;3217	fe 0a 	. . 
	jr z,l31f9h		;3219	28 de 	( . 
	cp 05bh		;321b	fe 5b 	. [ 
	jr nz,l31c6h		;321d	20 a7 	  . 
	ld de,l0020h		;321f	11 20 00 	.   . 
	or a			;3222	b7 	. 
	sbc hl,de		;3223	ed 52 	. R 
	jr l31f9h		;3225	18 d2 	. . 
l3227h:
	call sub_3272h		;3227	cd 72 32 	. r 2 
	jr l31c6h		;322a	18 9a 	. . 
l322ch:
	call sub_01c9h		;322c	cd c9 01 	. . . 
	call sub_32bdh		;322f	cd bd 32 	. . 2 
	jr l31c6h		;3232	18 92 	. . 
sub_3234h:
	ld iy,041e8h		;3234	fd 21 e8 41 	. ! . A 
	ld hl,l3298h		;3238	21 98 32 	! . 2 
	ld b,00ch		;323b	06 0c 	. . 
l323dh:
	push bc			;323d	c5 	. 
	call sub_324eh		;323e	cd 4e 32 	. N 2 
	ld a,00dh		;3241	3e 0d 	> . 
	call sub_033ah		;3243	cd 3a 03 	. : . 
	pop bc			;3246	c1 	. 
	inc iy		;3247	fd 23 	. # 
	inc iy		;3249	fd 23 	. # 
	djnz l323dh		;324b	10 f0 	. . 
	ret			;324d	c9 	. 
sub_324eh:
	ld b,003h		;324e	06 03 	. . 
l3250h:
	ld a,(hl)			;3250	7e 	~ 
	call sub_033ah		;3251	cd 3a 03 	. : . 
	inc hl			;3254	23 	# 
	djnz l3250h		;3255	10 f9 	. . 
	ld a,03dh		;3257	3e 3d 	> = 
	call sub_033ah		;3259	cd 3a 03 	. : . 
	ld a,(iy+001h)		;325c	fd 7e 01 	. ~ . 
	call sub_3373h		;325f	cd 73 33 	. s 3 
	ld a,(iy+000h)		;3262	fd 7e 00 	. ~ . 
	call sub_3373h		;3265	cd 73 33 	. s 3 
	ret			;3268	c9 	. 
sub_3269h:
	ld a,h			;3269	7c 	| 
	call sub_3373h		;326a	cd 73 33 	. s 3 
	ld a,l			;326d	7d 	} 
	call sub_3373h		;326e	cd 73 33 	. s 3 
	ret			;3271	c9 	. 
sub_3272h:
	call sub_3392h		;3272	cd 92 33 	. . 3 
	cp 058h		;3275	fe 58 	. X 
	ret z			;3277	c8 	. 
	call sub_01c9h		;3278	cd c9 01 	. . . 
l327bh:
	call sub_3269h		;327b	cd 69 32 	. i 2 
	ld a,03eh		;327e	3e 3e 	> > 
	call sub_033ah		;3280	cd 3a 03 	. : . 
	ld a,(hl)			;3283	7e 	~ 
	call sub_3373h		;3284	cd 73 33 	. s 3 
	ld a,02dh		;3287	3e 2d 	> - 
	call sub_033ah		;3289	cd 3a 03 	. : . 
	call sub_339bh		;328c	cd 9b 33 	. . 3 
	ld (hl),b			;328f	70 	p 
	ld a,00dh		;3290	3e 0d 	> . 
	call sub_033ah		;3292	cd 3a 03 	. : . 
	inc hl			;3295	23 	# 
	jr l327bh		;3296	18 e3 	. . 
l3298h:
	ld c,c			;3298	49 	I 
	ld e,c			;3299	59 	Y 
	jr nz,$+75		;329a	20 49 	  I 
	ld e,b			;329c	58 	X 
	jr nz,$+67		;329d	20 41 	  A 
	ld b,(hl)			;329f	46 	F 
	jr nz,l32e4h		;32a0	20 42 	  B 
	ld b,e			;32a2	43 	C 
	jr nz,$+70		;32a3	20 44 	  D 
	ld b,l			;32a5	45 	E 
	jr nz,$+74		;32a6	20 48 	  H 
	ld c,h			;32a8	4c 	L 
	jr nz,$+67		;32a9	20 41 	  A 
	ld b,(hl)			;32ab	46 	F 
	daa			;32ac	27 	' 
	ld b,d			;32ad	42 	B 
	ld b,e			;32ae	43 	C 
	daa			;32af	27 	' 
	ld b,h			;32b0	44 	D 
	ld b,l			;32b1	45 	E 
	daa			;32b2	27 	' 
	ld c,b			;32b3	48 	H 
	ld c,h			;32b4	4c 	L 
	daa			;32b5	27 	' 
	ld d,e			;32b6	53 	S 
	ld d,b			;32b7	50 	P 
	jr nz,$+82		;32b8	20 50 	  P 
	ld b,e			;32ba	43 	C 
	jr nz,sub_32bdh		;32bb	20 00 	  . 
sub_32bdh:
	ld hl,l3298h		;32bd	21 98 32 	! . 2 
	ld iy,041e8h		;32c0	fd 21 e8 41 	. ! . A 
	ld b,00ch		;32c4	06 0c 	. . 
l32c6h:
	push bc			;32c6	c5 	. 
	call sub_324eh		;32c7	cd 4e 32 	. N 2 
	ld a,02fh		;32ca	3e 2f 	> / 
	call sub_033ah		;32cc	cd 3a 03 	. : . 
	push hl			;32cf	e5 	. 
	call sub_3392h		;32d0	cd 92 33 	. . 3 
	cp 058h		;32d3	fe 58 	. X 
	jr z,l32ddh		;32d5	28 06 	( . 
	ld (iy+000h),l		;32d7	fd 75 00 	. u . 
	ld (iy+001h),h		;32da	fd 74 01 	. t . 
l32ddh:
	inc iy		;32dd	fd 23 	. # 
	inc iy		;32df	fd 23 	. # 
	pop hl			;32e1	e1 	. 
	ld a,00dh		;32e2	3e 0d 	> . 
l32e4h:
	call sub_033ah		;32e4	cd 3a 03 	. : . 
	pop bc			;32e7	c1 	. 
	djnz l32c6h		;32e8	10 dc 	. . 
	ret			;32ea	c9 	. 
sub_32ebh:
	call sub_339bh		;32eb	cd 9b 33 	. . 3 
	ld h,b			;32ee	60 	` 
	call sub_339bh		;32ef	cd 9b 33 	. . 3 
	ld l,b			;32f2	68 	h 
	ld (041feh),hl		;32f3	22 fe 41 	" . A 
l32f6h:
	call l0049h		;32f6	cd 49 00 	. I . 
	cp 02ch		;32f9	fe 2c 	. , 
	jr z,l3306h		;32fb	28 09 	( . 
	cp 00dh		;32fd	fe 0d 	. . 
	jr z,l3323h		;32ff	28 22 	( " 
	cp 058h		;3301	fe 58 	. X 
	ret z			;3303	c8 	. 
	jr l32f6h		;3304	18 f0 	. . 
l3306h:
	call sub_033ah		;3306	cd 3a 03 	. : . 
	call sub_3392h		;3309	cd 92 33 	. . 3 
	cp 058h		;330c	fe 58 	. X 
	ret z			;330e	c8 	. 
	push hl			;330f	e5 	. 
	ld de,04200h		;3310	11 00 42 	. . B 
	ld bc,00003h		;3313	01 03 00 	. . . 
	ldir		;3316	ed b0 	. . 
	pop hl			;3318	e1 	. 
	ld de,l3347h		;3319	11 47 33 	. G 3 
	ld a,0cdh		;331c	3e cd 	> . 
	ld (hl),a			;331e	77 	w 
	inc hl			;331f	23 	# 
	ld (hl),e			;3320	73 	s 
	inc hl			;3321	23 	# 
	ld (hl),d			;3322	72 	r 
l3323h:
	ld sp,(041fch)		;3323	ed 7b fc 41 	. { . A 
	ld hl,(041feh)		;3327	2a fe 41 	* . A 
	push hl			;332a	e5 	. 
	ld (041fch),sp		;332b	ed 73 fc 41 	. s . A 
	ld sp,041e8h		;332f	31 e8 41 	1 . A 
	pop iy		;3332	fd e1 	. . 
	pop ix		;3334	dd e1 	. . 
	pop af			;3336	f1 	. 
	pop bc			;3337	c1 	. 
	pop de			;3338	d1 	. 
	pop hl			;3339	e1 	. 
	ex af,af'			;333a	08 	. 
	exx			;333b	d9 	. 
	pop af			;333c	f1 	. 
	pop bc			;333d	c1 	. 
	pop de			;333e	d1 	. 
	pop hl			;333f	e1 	. 
	ex af,af'			;3340	08 	. 
	exx			;3341	d9 	. 
	ld sp,(041fch)		;3342	ed 7b fc 41 	. { . A 
	ret			;3346	c9 	. 
l3347h:
	ex (sp),hl			;3347	e3 	. 
	dec hl			;3348	2b 	+ 
	dec hl			;3349	2b 	+ 
	dec hl			;334a	2b 	+ 
	ld (041feh),hl		;334b	22 fe 41 	" . A 
	ld (04203h),a		;334e	32 03 42 	2 . B 
	ld (04204h),de		;3351	ed 53 04 42 	. S . B 
	ld a,b			;3355	78 	x 
	ld (04206h),a		;3356	32 06 42 	2 . B 
	ld de,04200h		;3359	11 00 42 	. . B 
	ex de,hl			;335c	eb 	. 
	ld bc,00003h		;335d	01 03 00 	. . . 
	ldir		;3360	ed b0 	. . 
	ex de,hl			;3362	eb 	. 
	ld de,(04204h)		;3363	ed 5b 04 42 	. [ . B 
	ld a,(04206h)		;3367	3a 06 42 	: . B 
	ld b,a			;336a	47 	G 
	ld a,(04203h)		;336b	3a 03 42 	: . B 
	ld hl,l31abh		;336e	21 ab 31 	! . 1 
	ex (sp),hl			;3371	e3 	. 
	ret			;3372	c9 	. 
sub_3373h:
	ld c,a			;3373	4f 	O 
	srl a		;3374	cb 3f 	. ? 
	srl a		;3376	cb 3f 	. ? 
	srl a		;3378	cb 3f 	. ? 
	srl a		;337a	cb 3f 	. ? 
	call sub_3386h		;337c	cd 86 33 	. . 3 
	ld a,c			;337f	79 	y 
	and 00fh		;3380	e6 0f 	. . 
	call sub_3386h		;3382	cd 86 33 	. . 3 
	ret			;3385	c9 	. 
sub_3386h:
	add a,030h		;3386	c6 30 	. 0 
	cp 03ah		;3388	fe 3a 	. : 
	jr c,l338eh		;338a	38 02 	8 . 
	add a,007h		;338c	c6 07 	. . 
l338eh:
	call sub_033ah		;338e	cd 3a 03 	. : . 
	ret			;3391	c9 	. 
sub_3392h:
	call sub_339bh		;3392	cd 9b 33 	. . 3 
	ld h,b			;3395	60 	` 
	call sub_339bh		;3396	cd 9b 33 	. . 3 
	ld l,b			;3399	68 	h 
	ret			;339a	c9 	. 
sub_339bh:
	call sub_33b5h		;339b	cd b5 33 	. . 3 
	sla a		;339e	cb 27 	. ' 
	sla a		;33a0	cb 27 	. ' 
	sla a		;33a2	cb 27 	. ' 
	sla a		;33a4	cb 27 	. ' 
	ld b,a			;33a6	47 	G 
	ld a,c			;33a7	79 	y 
	call sub_033ah		;33a8	cd 3a 03 	. : . 
	call sub_33b5h		;33ab	cd b5 33 	. . 3 
	add a,b			;33ae	80 	. 
	ld b,a			;33af	47 	G 
	ld a,c			;33b0	79 	y 
	call sub_033ah		;33b1	cd 3a 03 	. : . 
	ret			;33b4	c9 	. 
sub_33b5h:
	call l0049h		;33b5	cd 49 00 	. I . 
	cp 058h		;33b8	fe 58 	. X 
	jr nz,l33c1h		;33ba	20 05 	  . 
	ex (sp),hl			;33bc	e3 	. 
	pop hl			;33bd	e1 	. 
	ex (sp),hl			;33be	e3 	. 
	pop hl			;33bf	e1 	. 
	ret			;33c0	c9 	. 
l33c1h:
	ld c,a			;33c1	4f 	O 
	sub 030h		;33c2	d6 30 	. 0 
	jr c,sub_33b5h		;33c4	38 ef 	8 . 
	cp 00ah		;33c6	fe 0a 	. . 
	ret c			;33c8	d8 	. 
	sub 011h		;33c9	d6 11 	. . 
	jr c,sub_33b5h		;33cb	38 e8 	8 . 
	add a,00ah		;33cd	c6 0a 	. . 
	cp 010h		;33cf	fe 10 	. . 
	ret c			;33d1	d8 	. 
	jr sub_33b5h		;33d2	18 e1 	. . 
l33d4h:
	ex (sp),hl			;33d4	e3 	. 
	ld a,01dh		;33d5	3e 1d 	> . 
	cp h			;33d7	bc 	. 
	jr nz,l33ddh		;33d8	20 03 	  . 
	ld a,05bh		;33da	3e 5b 	> [ 
	cp l			;33dc	bd 	. 
l33ddh:
	ex (sp),hl			;33dd	e3 	. 
	jp nz,l1d78h		;33de	c2 78 1d 	. x . 
	call l1d78h		;33e1	cd 78 1d 	. x . 
	push af			;33e4	f5 	. 
	push hl			;33e5	e5 	. 
	cp 052h		;33e6	fe 52 	. R 
	jr nz,l33f1h		;33e8	20 07 	  . 
	inc hl			;33ea	23 	# 
	ld a,(hl)			;33eb	7e 	~ 
	cp 045h		;33ec	fe 45 	. E 
	jp z,l346dh		;33ee	ca 6d 34 	. m 4 
l33f1h:
	pop hl			;33f1	e1 	. 
	pop af			;33f2	f1 	. 
	ret			;33f3	c9 	. 
sub_33f4h:
	push de			;33f4	d5 	. 
	ld (04121h),hl		;33f5	22 21 41 	" ! A 
	ld bc,l0000h		;33f8	01 00 00 	. . . 
	ld hl,(040a7h)		;33fb	2a a7 40 	* . @ 
	push hl			;33fe	e5 	. 
	call sub_132fh		;33ff	cd 2f 13 	. / . 
	pop hl			;3402	e1 	. 
	ld b,005h		;3403	06 05 	. . 
l3405h:
	ld a,(hl)			;3405	7e 	~ 
	sub 030h		;3406	d6 30 	. 0 
	jr nz,l340fh		;3408	20 05 	  . 
	inc hl			;340a	23 	# 
	djnz l3405h		;340b	10 f8 	. . 
	dec hl			;340d	2b 	+ 
	inc b			;340e	04 	. 
l340fh:
	pop de			;340f	d1 	. 
	ret			;3410	c9 	. 
sub_3411h:
	inc iy		;3411	fd 23 	. # 
	inc iy		;3413	fd 23 	. # 
	inc iy		;3415	fd 23 	. # 
	inc iy		;3417	fd 23 	. # 
	ret			;3419	c9 	. 
l341ah:
	inc hl			;341a	23 	# 
	ld a,(hl)			;341b	7e 	~ 
	or a			;341c	b7 	. 
	ret z			;341d	c8 	. 
	cp 08dh		;341e	fe 8d 	. . 
	jr z,l342eh		;3420	28 0c 	( . 
	cp 091h		;3422	fe 91 	. . 
	jr z,l342eh		;3424	28 08 	( . 
	cp 0cah		;3426	fe ca 	. . 
	jr z,l342eh		;3428	28 04 	( . 
	cp 095h		;342a	fe 95 	. . 
	jr nz,l341ah		;342c	20 ec 	  . 
l342eh:
	and a			;342e	a7 	. 
	ret			;342f	c9 	. 
sub_3430h:
	ld de,(040a7h)		;3430	ed 5b a7 40 	. [ . @ 
	push de			;3434	d5 	. 
	ld b,000h		;3435	06 00 	. . 
l3437h:
	ld a,(hl)			;3437	7e 	~ 
	cp 020h		;3438	fe 20 	.   
	jr z,l3447h		;343a	28 0b 	( . 
	cp 030h		;343c	fe 30 	. 0 
	jr c,l344ah		;343e	38 0a 	8 . 
	cp 03ah		;3440	fe 3a 	. : 
	jr nc,l344ah		;3442	30 06 	0 . 
	inc b			;3444	04 	. 
	ld (de),a			;3445	12 	. 
	inc de			;3446	13 	. 
l3447h:
	inc hl			;3447	23 	# 
	jr l3437h		;3448	18 ed 	. . 
l344ah:
	xor a			;344a	af 	. 
	ld (de),a			;344b	12 	. 
	pop de			;344c	d1 	. 
	inc b			;344d	04 	. 
	dec b			;344e	05 	. 
	ret			;344f	c9 	. 
sub_3450h:
	push bc			;3450	c5 	. 
l3451h:
	ld a,b			;3451	78 	x 
	sbc a,c			;3452	99 	. 
	jr z,l3465h		;3453	28 10 	( . 
	dec b			;3455	05 	. 
	jr z,l3460h		;3456	28 08 	( . 
	dec c			;3458	0d 	. 
	jr nz,l3451h		;3459	20 f6 	  . 
	call sub_35cdh		;345b	cd cd 35 	. . 5 
	jr l3465h		;345e	18 05 	. . 
l3460h:
	ld b,c			;3460	41 	A 
	dec b			;3461	05 	. 
	call sub_35ach		;3462	cd ac 35 	. . 5 
l3465h:
	pop bc			;3465	c1 	. 
l3466h:
	ld a,(de)			;3466	1a 	. 
	ld (hl),a			;3467	77 	w 
	inc de			;3468	13 	. 
	inc hl			;3469	23 	# 
	djnz l3466h		;346a	10 fa 	. . 
	ret			;346c	c9 	. 
l346dh:
	inc hl			;346d	23 	# 
	ld de,0000ah		;346e	11 0a 00 	. . . 
	ld (040e2h),de		;3471	ed 53 e2 40 	. S . @ 
	ld (040e4h),de		;3475	ed 53 e4 40 	. S . @ 
	ld a,(hl)			;3479	7e 	~ 
	and a			;347a	a7 	. 
	jr z,l349fh		;347b	28 22 	( " 
	cp 02ch		;347d	fe 2c 	. , 
	jr z,l3492h		;347f	28 11 	( . 
	call sub_1e5ah		;3481	cd 5a 1e 	. Z . 
	ld c,a			;3484	4f 	O 
	ld a,d			;3485	7a 	z 
	or e			;3486	b3 	. 
	jr z,l349ch		;3487	28 13 	( . 
	ld a,c			;3489	79 	y 
	ld (040e2h),de		;348a	ed 53 e2 40 	. S . @ 
	cp 02ch		;348e	fe 2c 	. , 
	jr nz,l349fh		;3490	20 0d 	  . 
l3492h:
	inc hl			;3492	23 	# 
	call sub_1e5ah		;3493	cd 5a 1e 	. Z . 
	ld (040e4h),de		;3496	ed 53 e4 40 	. S . @ 
	ld a,d			;349a	7a 	z 
	or e			;349b	b3 	. 
l349ch:
	jp z,l1997h		;349c	ca 97 19 	. . . 
l349fh:
	ld iy,(040f9h)		;349f	fd 2a f9 40 	. * . @ 
	ld de,l00ffh+1		;34a3	11 00 01 	. . . 
	add iy,de		;34a6	fd 19 	. . 
	push iy		;34a8	fd e5 	. . 
	ld hl,(040a4h)		;34aa	2a a4 40 	* . @ 
	push hl			;34ad	e5 	. 
l34aeh:
	ld a,(hl)			;34ae	7e 	~ 
	inc hl			;34af	23 	# 
	or (hl)			;34b0	b6 	. 
	jp z,l34feh		;34b1	ca fe 34 	. . 4 
	inc hl			;34b4	23 	# 
	inc hl			;34b5	23 	# 
l34b6h:
	call l341ah		;34b6	cd 1a 34 	. . 4 
	inc hl			;34b9	23 	# 
	jr z,l34aeh		;34ba	28 f2 	( . 
l34bch:
	call sub_3430h		;34bc	cd 30 34 	. 0 4 
	dec hl			;34bf	2b 	+ 
	jr z,l34b6h		;34c0	28 f4 	( . 
	inc hl			;34c2	23 	# 
	push hl			;34c3	e5 	. 
	push de			;34c4	d5 	. 
	push iy		;34c5	fd e5 	. . 
	pop de			;34c7	d1 	. 
	ld hl,(040b1h)		;34c8	2a b1 40 	* . @ 
	sbc hl,de		;34cb	ed 52 	. R 
	jp c,l197ah		;34cd	da 7a 19 	. z . 
	ld de,00004h		;34d0	11 04 00 	. . . 
	sbc hl,de		;34d3	ed 52 	. R 
	jp c,l197ah		;34d5	da 7a 19 	. z . 
	ld (iy+000h),b		;34d8	fd 70 00 	. p . 
	pop hl			;34db	e1 	. 
	call sub_1e5ah		;34dc	cd 5a 1e 	. Z . 
	ld (iy+001h),e		;34df	fd 73 01 	. s . 
	ld (iy+002h),d		;34e2	fd 72 02 	. r . 
	ld (iy+003h),000h		;34e5	fd 36 03 00 	. 6 . . 
	call sub_3411h		;34e9	cd 11 34 	. . 4 
	pop hl			;34ec	e1 	. 
	dec hl			;34ed	2b 	+ 
l34eeh:
	inc hl			;34ee	23 	# 
	ld a,(hl)			;34ef	7e 	~ 
	cp 020h		;34f0	fe 20 	.   
	jr z,l34eeh		;34f2	28 fa 	( . 
	cp 02ch		;34f4	fe 2c 	. , 
	jr z,l34fbh		;34f6	28 03 	( . 
	dec hl			;34f8	2b 	+ 
	jr l34b6h		;34f9	18 bb 	. . 
l34fbh:
	inc hl			;34fb	23 	# 
	jr l34bch		;34fc	18 be 	. . 
l34feh:
	ld (iy+000h),0ffh		;34fe	fd 36 00 ff 	. 6 . . 
	pop hl			;3502	e1 	. 
	pop iy		;3503	fd e1 	. . 
	ld de,(040e2h)		;3505	ed 5b e2 40 	. [ . @ 
	push de			;3509	d5 	. 
	push iy		;350a	fd e5 	. . 
	push hl			;350c	e5 	. 
l350dh:
	push de			;350d	d5 	. 
	call sub_09c2h		;350e	cd c2 09 	. . . 
	ld a,d			;3511	7a 	z 
	or e			;3512	b3 	. 
	jr z,l3556h		;3513	28 41 	( A 
	ex de,hl			;3515	eb 	. 
	pop de			;3516	d1 	. 
	push iy		;3517	fd e5 	. . 
l3519h:
	ld a,(iy+000h)		;3519	fd 7e 00 	. ~ . 
	inc a			;351c	3c 	< 
	jr z,l3540h		;351d	28 21 	( ! 
	ld a,(iy+003h)		;351f	fd 7e 03 	. ~ . 
	or a			;3522	b7 	. 
	jr nz,l353bh		;3523	20 16 	  . 
	ld a,(iy+001h)		;3525	fd 7e 01 	. ~ . 
	cp c			;3528	b9 	. 
	jr nz,l353bh		;3529	20 10 	  . 
	ld a,(iy+002h)		;352b	fd 7e 02 	. ~ . 
	cp b			;352e	b8 	. 
	jr nz,l353bh		;352f	20 0a 	  . 
	ld (iy+001h),e		;3531	fd 73 01 	. s . 
	ld (iy+002h),d		;3534	fd 72 02 	. r . 
	ld (iy+003h),001h		;3537	fd 36 03 01 	. 6 . . 
l353bh:
	call sub_3411h		;353b	cd 11 34 	. . 4 
	jr l3519h		;353e	18 d9 	. . 
l3540h:
	pop iy		;3540	fd e1 	. . 
	push hl			;3542	e5 	. 
	ld hl,(040e4h)		;3543	2a e4 40 	* . @ 
	add hl,de			;3546	19 	. 
	jp c,l197ah		;3547	da 7a 19 	. z . 
	ex de,hl			;354a	eb 	. 
	ld hl,0fff8h		;354b	21 f8 ff 	! . . 
	sbc hl,de		;354e	ed 52 	. R 
	jp c,l197ah		;3550	da 7a 19 	. z . 
	pop hl			;3553	e1 	. 
	jr l350dh		;3554	18 b7 	. . 
l3556h:
	pop de			;3556	d1 	. 
	pop hl			;3557	e1 	. 
	pop iy		;3558	fd e1 	. . 
	pop de			;355a	d1 	. 
l355bh:
	ld a,(hl)			;355b	7e 	~ 
	inc hl			;355c	23 	# 
	or (hl)			;355d	b6 	. 
	jp z,l2c83h		;355e	ca 83 2c 	. . , 
	inc hl			;3561	23 	# 
	ld (hl),e			;3562	73 	s 
	inc hl			;3563	23 	# 
	ld (hl),d			;3564	72 	r 
l3565h:
	call l341ah		;3565	cd 1a 34 	. . 4 
	inc hl			;3568	23 	# 
	jr nz,l3574h		;3569	20 09 	  . 
	push hl			;356b	e5 	. 
	ld hl,(040e4h)		;356c	2a e4 40 	* . @ 
	add hl,de			;356f	19 	. 
	ex de,hl			;3570	eb 	. 
	pop hl			;3571	e1 	. 
	jr l355bh		;3572	18 e7 	. . 
l3574h:
	push hl			;3574	e5 	. 
	push de			;3575	d5 	. 
	call sub_3430h		;3576	cd 30 34 	. 0 4 
	pop de			;3579	d1 	. 
	pop hl			;357a	e1 	. 
	dec hl			;357b	2b 	+ 
	jr z,l3565h		;357c	28 e7 	( . 
l357eh:
	inc hl			;357e	23 	# 
	ld a,(hl)			;357f	7e 	~ 
	cp 020h		;3580	fe 20 	.   
	jr z,l357eh		;3582	28 fa 	( . 
	push de			;3584	d5 	. 
	push hl			;3585	e5 	. 
	ld l,(iy+001h)		;3586	fd 6e 01 	. n . 
	ld h,(iy+002h)		;3589	fd 66 02 	. f . 
	call sub_33f4h		;358c	cd f4 33 	. . 3 
	ld c,(iy+000h)		;358f	fd 4e 00 	. N . 
	call sub_3411h		;3592	cd 11 34 	. . 4 
	ex de,hl			;3595	eb 	. 
	pop hl			;3596	e1 	. 
	call sub_3450h		;3597	cd 50 34 	. P 4 
	pop de			;359a	d1 	. 
	dec hl			;359b	2b 	+ 
l359ch:
	inc hl			;359c	23 	# 
	ld a,(hl)			;359d	7e 	~ 
	cp 020h		;359e	fe 20 	.   
	jr z,l359ch		;35a0	28 fa 	( . 
	cp 02ch		;35a2	fe 2c 	. , 
	jr z,l35a9h		;35a4	28 03 	( . 
	dec hl			;35a6	2b 	+ 
	jr l3565h		;35a7	18 bc 	. . 
l35a9h:
	inc hl			;35a9	23 	# 
	jr l3574h		;35aa	18 c8 	. . 
sub_35ach:
	push de			;35ac	d5 	. 
	push bc			;35ad	c5 	. 
	push hl			;35ae	e5 	. 
	push hl			;35af	e5 	. 
	pop de			;35b0	d1 	. 
	push de			;35b1	d5 	. 
	push de			;35b2	d5 	. 
	ld hl,(040f9h)		;35b3	2a f9 40 	* . @ 
	push hl			;35b6	e5 	. 
l35b7h:
	dec hl			;35b7	2b 	+ 
	inc de			;35b8	13 	. 
	djnz l35b7h		;35b9	10 fc 	. . 
	ld (040f9h),hl		;35bb	22 f9 40 	" . @ 
	pop hl			;35be	e1 	. 
	pop bc			;35bf	c1 	. 
	sbc hl,bc		;35c0	ed 42 	. B 
	inc hl			;35c2	23 	# 
	push hl			;35c3	e5 	. 
	pop bc			;35c4	c1 	. 
	pop hl			;35c5	e1 	. 
	ex de,hl			;35c6	eb 	. 
	ldir		;35c7	ed b0 	. . 
	pop hl			;35c9	e1 	. 
	pop bc			;35ca	c1 	. 
	pop de			;35cb	d1 	. 
	ret			;35cc	c9 	. 
sub_35cdh:
	push de			;35cd	d5 	. 
	push bc			;35ce	c5 	. 
	push hl			;35cf	e5 	. 
	ld hl,(040f9h)		;35d0	2a f9 40 	* . @ 
	push hl			;35d3	e5 	. 
	pop de			;35d4	d1 	. 
l35d5h:
	inc hl			;35d5	23 	# 
	djnz l35d5h		;35d6	10 fd 	. . 
	ld (040f9h),hl		;35d8	22 f9 40 	" . @ 
	pop bc			;35db	c1 	. 
	push bc			;35dc	c5 	. 
	push hl			;35dd	e5 	. 
	or a			;35de	b7 	. 
	sbc hl,bc		;35df	ed 42 	. B 
	push hl			;35e1	e5 	. 
	pop bc			;35e2	c1 	. 
	inc bc			;35e3	03 	. 
	pop hl			;35e4	e1 	. 
	ex de,hl			;35e5	eb 	. 
	lddr		;35e6	ed b8 	. . 
	pop hl			;35e8	e1 	. 
	pop bc			;35e9	c1 	. 
	pop de			;35ea	d1 	. 
	ret			;35eb	c9 	. 
	rst 38h			;35ec	ff 	. 
	rst 38h			;35ed	ff 	. 
	rst 38h			;35ee	ff 	. 
	rst 38h			;35ef	ff 	. 
	rst 38h			;35f0	ff 	. 
	rst 38h			;35f1	ff 	. 
	rst 38h			;35f2	ff 	. 
	rst 38h			;35f3	ff 	. 
	rst 38h			;35f4	ff 	. 
	rst 38h			;35f5	ff 	. 
	rst 38h			;35f6	ff 	. 
	rst 38h			;35f7	ff 	. 
	rst 38h			;35f8	ff 	. 
	rst 38h			;35f9	ff 	. 
	rst 38h			;35fa	ff 	. 
	rst 38h			;35fb	ff 	. 
	rst 38h			;35fc	ff 	. 
	rst 38h			;35fd	ff 	. 
	rst 38h			;35fe	ff 	. 
	rst 38h			;35ff	ff 	. 
	rst 38h			;3600	ff 	. 
	rst 38h			;3601	ff 	. 
	rst 38h			;3602	ff 	. 
	rst 38h			;3603	ff 	. 
	rst 38h			;3604	ff 	. 
	rst 38h			;3605	ff 	. 
	rst 38h			;3606	ff 	. 
	rst 38h			;3607	ff 	. 
	rst 38h			;3608	ff 	. 
	rst 38h			;3609	ff 	. 
	rst 38h			;360a	ff 	. 
	rst 38h			;360b	ff 	. 
	rst 38h			;360c	ff 	. 
	rst 38h			;360d	ff 	. 
	rst 38h			;360e	ff 	. 
	rst 38h			;360f	ff 	. 
	rst 38h			;3610	ff 	. 
	rst 38h			;3611	ff 	. 
	rst 38h			;3612	ff 	. 
	rst 38h			;3613	ff 	. 
	rst 38h			;3614	ff 	. 
	rst 38h			;3615	ff 	. 
	rst 38h			;3616	ff 	. 
	rst 38h			;3617	ff 	. 
	rst 38h			;3618	ff 	. 
	rst 38h			;3619	ff 	. 
	rst 38h			;361a	ff 	. 
	rst 38h			;361b	ff 	. 
	rst 38h			;361c	ff 	. 
	rst 38h			;361d	ff 	. 
	rst 38h			;361e	ff 	. 
	rst 38h			;361f	ff 	. 
	rst 38h			;3620	ff 	. 
	rst 38h			;3621	ff 	. 
	rst 38h			;3622	ff 	. 
	rst 38h			;3623	ff 	. 
	rst 38h			;3624	ff 	. 
	rst 38h			;3625	ff 	. 
	rst 38h			;3626	ff 	. 
	rst 38h			;3627	ff 	. 
	rst 38h			;3628	ff 	. 
	rst 38h			;3629	ff 	. 
	rst 38h			;362a	ff 	. 
	rst 38h			;362b	ff 	. 
	rst 38h			;362c	ff 	. 
	rst 38h			;362d	ff 	. 
	rst 38h			;362e	ff 	. 
	rst 38h			;362f	ff 	. 
	rst 38h			;3630	ff 	. 
	rst 38h			;3631	ff 	. 
	rst 38h			;3632	ff 	. 
	rst 38h			;3633	ff 	. 
	rst 38h			;3634	ff 	. 
	rst 38h			;3635	ff 	. 
	rst 38h			;3636	ff 	. 
	rst 38h			;3637	ff 	. 
	rst 38h			;3638	ff 	. 
	rst 38h			;3639	ff 	. 
	rst 38h			;363a	ff 	. 
	rst 38h			;363b	ff 	. 
	rst 38h			;363c	ff 	. 
	rst 38h			;363d	ff 	. 
	rst 38h			;363e	ff 	. 
	rst 38h			;363f	ff 	. 
	rst 38h			;3640	ff 	. 
	rst 38h			;3641	ff 	. 
	rst 38h			;3642	ff 	. 
	rst 38h			;3643	ff 	. 
	rst 38h			;3644	ff 	. 
	rst 38h			;3645	ff 	. 
	rst 38h			;3646	ff 	. 
	rst 38h			;3647	ff 	. 
	rst 38h			;3648	ff 	. 
	rst 38h			;3649	ff 	. 
	rst 38h			;364a	ff 	. 
	rst 38h			;364b	ff 	. 
	rst 38h			;364c	ff 	. 
	rst 38h			;364d	ff 	. 
	rst 38h			;364e	ff 	. 
	rst 38h			;364f	ff 	. 
	rst 38h			;3650	ff 	. 
	rst 38h			;3651	ff 	. 
	rst 38h			;3652	ff 	. 
	rst 38h			;3653	ff 	. 
	rst 38h			;3654	ff 	. 
	rst 38h			;3655	ff 	. 
	rst 38h			;3656	ff 	. 
	rst 38h			;3657	ff 	. 
	rst 38h			;3658	ff 	. 
	rst 38h			;3659	ff 	. 
	rst 38h			;365a	ff 	. 
	rst 38h			;365b	ff 	. 
	rst 38h			;365c	ff 	. 
	rst 38h			;365d	ff 	. 
	rst 38h			;365e	ff 	. 
	rst 38h			;365f	ff 	. 
	rst 38h			;3660	ff 	. 
	rst 38h			;3661	ff 	. 
	rst 38h			;3662	ff 	. 
	rst 38h			;3663	ff 	. 
	rst 38h			;3664	ff 	. 
	rst 38h			;3665	ff 	. 
	rst 38h			;3666	ff 	. 
	rst 38h			;3667	ff 	. 
	rst 38h			;3668	ff 	. 
	rst 38h			;3669	ff 	. 
	rst 38h			;366a	ff 	. 
	rst 38h			;366b	ff 	. 
	rst 38h			;366c	ff 	. 
	rst 38h			;366d	ff 	. 
	rst 38h			;366e	ff 	. 
	rst 38h			;366f	ff 	. 
	rst 38h			;3670	ff 	. 
	rst 38h			;3671	ff 	. 
	rst 38h			;3672	ff 	. 
	rst 38h			;3673	ff 	. 
	rst 38h			;3674	ff 	. 
	rst 38h			;3675	ff 	. 
	rst 38h			;3676	ff 	. 
	rst 38h			;3677	ff 	. 
	rst 38h			;3678	ff 	. 
	rst 38h			;3679	ff 	. 
	rst 38h			;367a	ff 	. 
	rst 38h			;367b	ff 	. 
	rst 38h			;367c	ff 	. 
	rst 38h			;367d	ff 	. 
	rst 38h			;367e	ff 	. 
	rst 38h			;367f	ff 	. 
	rst 38h			;3680	ff 	. 
	rst 38h			;3681	ff 	. 
	rst 38h			;3682	ff 	. 
	rst 38h			;3683	ff 	. 
	rst 38h			;3684	ff 	. 
	rst 38h			;3685	ff 	. 
	rst 38h			;3686	ff 	. 
	rst 38h			;3687	ff 	. 
	rst 38h			;3688	ff 	. 
	rst 38h			;3689	ff 	. 
	rst 38h			;368a	ff 	. 
	rst 38h			;368b	ff 	. 
	rst 38h			;368c	ff 	. 
	rst 38h			;368d	ff 	. 
	rst 38h			;368e	ff 	. 
	rst 38h			;368f	ff 	. 
	rst 38h			;3690	ff 	. 
	rst 38h			;3691	ff 	. 
	rst 38h			;3692	ff 	. 
	rst 38h			;3693	ff 	. 
	rst 38h			;3694	ff 	. 
	rst 38h			;3695	ff 	. 
	rst 38h			;3696	ff 	. 
	rst 38h			;3697	ff 	. 
	rst 38h			;3698	ff 	. 
	rst 38h			;3699	ff 	. 
	rst 38h			;369a	ff 	. 
	rst 38h			;369b	ff 	. 
	rst 38h			;369c	ff 	. 
	rst 38h			;369d	ff 	. 
	rst 38h			;369e	ff 	. 
	rst 38h			;369f	ff 	. 
	rst 38h			;36a0	ff 	. 
	rst 38h			;36a1	ff 	. 
	rst 38h			;36a2	ff 	. 
	rst 38h			;36a3	ff 	. 
	rst 38h			;36a4	ff 	. 
	rst 38h			;36a5	ff 	. 
	rst 38h			;36a6	ff 	. 
	rst 38h			;36a7	ff 	. 
	rst 38h			;36a8	ff 	. 
	rst 38h			;36a9	ff 	. 
	rst 38h			;36aa	ff 	. 
	rst 38h			;36ab	ff 	. 
	rst 38h			;36ac	ff 	. 
	rst 38h			;36ad	ff 	. 
	rst 38h			;36ae	ff 	. 
	rst 38h			;36af	ff 	. 
	rst 38h			;36b0	ff 	. 
	rst 38h			;36b1	ff 	. 
	rst 38h			;36b2	ff 	. 
	rst 38h			;36b3	ff 	. 
	rst 38h			;36b4	ff 	. 
	rst 38h			;36b5	ff 	. 
	rst 38h			;36b6	ff 	. 
	rst 38h			;36b7	ff 	. 
	rst 38h			;36b8	ff 	. 
	rst 38h			;36b9	ff 	. 
	rst 38h			;36ba	ff 	. 
	rst 38h			;36bb	ff 	. 
	rst 38h			;36bc	ff 	. 
	rst 38h			;36bd	ff 	. 
	rst 38h			;36be	ff 	. 
	rst 38h			;36bf	ff 	. 
	rst 38h			;36c0	ff 	. 
	rst 38h			;36c1	ff 	. 
	rst 38h			;36c2	ff 	. 
	rst 38h			;36c3	ff 	. 
	rst 38h			;36c4	ff 	. 
	rst 38h			;36c5	ff 	. 
	rst 38h			;36c6	ff 	. 
	rst 38h			;36c7	ff 	. 
	rst 38h			;36c8	ff 	. 
	rst 38h			;36c9	ff 	. 
	rst 38h			;36ca	ff 	. 
	rst 38h			;36cb	ff 	. 
	rst 38h			;36cc	ff 	. 
	rst 38h			;36cd	ff 	. 
	rst 38h			;36ce	ff 	. 
	rst 38h			;36cf	ff 	. 
	rst 38h			;36d0	ff 	. 
	rst 38h			;36d1	ff 	. 
	rst 38h			;36d2	ff 	. 
	rst 38h			;36d3	ff 	. 
	rst 38h			;36d4	ff 	. 
	rst 38h			;36d5	ff 	. 
	rst 38h			;36d6	ff 	. 
	rst 38h			;36d7	ff 	. 
	rst 38h			;36d8	ff 	. 
	rst 38h			;36d9	ff 	. 
	rst 38h			;36da	ff 	. 
	rst 38h			;36db	ff 	. 
	rst 38h			;36dc	ff 	. 
	rst 38h			;36dd	ff 	. 
	rst 38h			;36de	ff 	. 
	rst 38h			;36df	ff 	. 
	rst 38h			;36e0	ff 	. 
	rst 38h			;36e1	ff 	. 
	rst 38h			;36e2	ff 	. 
	rst 38h			;36e3	ff 	. 
	rst 38h			;36e4	ff 	. 
	rst 38h			;36e5	ff 	. 
	rst 38h			;36e6	ff 	. 
	rst 38h			;36e7	ff 	. 
	rst 38h			;36e8	ff 	. 
	rst 38h			;36e9	ff 	. 
	rst 38h			;36ea	ff 	. 
	rst 38h			;36eb	ff 	. 
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
l37e1h:
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
l37ech:
	rst 38h			;37ec	ff 	. 
	rst 38h			;37ed	ff 	. 
l37eeh:
	rst 38h			;37ee	ff 	. 
l37efh:
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
