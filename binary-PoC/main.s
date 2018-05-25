	.file	1 "main.c"
	.section .mdebug.eabi32
	.previous
	.section .gcc_compiled_long32
	.previous
	.text
	.align	2
	.globl	FillVRAM
	.set	nomips16
	.ent	FillVRAM
FillVRAM:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	li	$2,1140850688			# 0x44000000
	li	$3,1141899264			# 0x44100000
	sw	$4,0($2)
$L6:
	addiu	$2,$2,4
	bnel	$2,$3,$L6
	sw	$4,0($2)

	j	$31
	nop

	.set	macro
	.set	reorder
	.end	FillVRAM
	.size	FillVRAM, .-FillVRAM
	.section	.text.start,"ax",@progbits
	.align	2
	.globl	_start
	.set	nomips16
	.ent	_start
_start:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	li	$2,1140850688			# 0x44000000
	li	$4,16711680			# 0xff0000
	li	$3,1141899264			# 0x44100000
	sw	$4,0($2)
$L17:
	addiu	$2,$2,4
	bnel	$2,$3,$L17
	sw	$4,0($2)

	li	$2,1140850688			# 0x44000000
	li	$4,65280			# 0xff00
	li	$3,1141899264			# 0x44100000
	sw	$4,0($2)
$L18:
	addiu	$2,$2,4
	bnel	$2,$3,$L18
	sw	$4,0($2)

	li	$2,1140850688			# 0x44000000
	li	$4,255			# 0xff
	li	$3,1141899264			# 0x44100000
	sw	$4,0($2)
$L19:
	addiu	$2,$2,4
	bnel	$2,$3,$L19
	sw	$4,0($2)

	li	$2,1140850688			# 0x44000000
	li	$4,-16777216			# 0xffffffffff000000
	li	$3,1141899264			# 0x44100000
	sw	$4,0($2)
$L20:
	addiu	$2,$2,4
	bnel	$2,$3,$L20
	sw	$4,0($2)

	j	$31
	nop

	.set	macro
	.set	reorder
	.end	_start
	.size	_start, .-_start
	.ident	"GCC: (GNU) 4.3.5"
