/*
 * by Wololo (adapted from Gripshift loader by Matiaz) (modified by qwikrazor87)
 * Updating the offsets are no longer required with this binloader
 * since it uses FindImport to search for the required functions.
 * The only thing that needs to be updated is the path
 * to the exploit folder at the bottom of this file.
 */
 
 /*
  * Binary-Loader modified for the 'scrabblehax' exploit by ChampionLeake
  * file-path "ms0:/PSP/SAVEDATA/ULUS10412/H.BIN"
  * Greets to qwikrazor87 for fetching this loader for me
  */

.set noat
.set noreorder

bal	getIoFileMgrForUserString
nop
move	$a0, $ra
li	$a1, 0x109F50BC	/* sceIoOpen NID */
bal	FindImport
move	$a2, $0
move	$s0, $v0

bal	getIoFileMgrForUserString
nop
move	$a0, $ra
li	$a1, 0x6A638D83	/* sceIoRead NID */
bal	FindImport
move	$a2, $0
move	$s1, $v0

bal	getIoFileMgrForUserString
nop
move	$a0, $ra
li	$a1, 0x810C4BC3	/* sceIoClose NID */
bal	FindImport
move	$a2, $0
move	$s2, $v0

bal	getUtilsForUserString
nop
move	$a0, $ra
li	$a1, 0x79D1C3FA	/* sceKernelDcacheWritebackAll NID */
bal	FindImport
move	$a2, $0
move	$s3, $v0

bal	getBinPath
nop
move	$a0, $ra
li	$a1, 1
jalr	$s0		/* sceIoOpen */
li	$a2, 31

move	$a0, $v0
move	$s4, $v0	/* backup file descriptor */
lui	$a1, 0x08D2	/* load address */
move	$s5, $a1	/* backup load address */
jalr	$s1		/* sceIoRead */
lui	$a2, 1		/* read 0x10000 bytes max from the file */

jalr	$s2		/* sceIoClose */
move	$a0, $s4

jalr	$s3		/* sceKernelDcacheWritebackAll */
nop

jr	$s5		/* jump to loaded bin */
nop

FindImport:
	li	$v1, 0x08800000
	li	$12, 0x0A000000
	li	$v0, 0x08400000
	move	$t1, $v1
	movn	$t1, $v0, $a2
	move	$t2, $a0
	movn	$t4, $v1, $a2
	li	$t9, 0xF7800000
	li	$t8, 0x01800000
	li	$t7, 0xF7C00000
	li	$t6, 0x00400000
	lw	$t0, 0($t1)
$L1:
	beql	$t0, $t2, $L9
	addiu	$t1, $t1, 4

	beq	$a2, $0, $L10
	addu	$v0, $t0, $t9

	addu	$v0, $t0, $t7
	sltu	$v0, $v0, $t6
$L2:
	beql	$v0, $0, $L9
	addiu	$t1, $t1, 4

	beq	$a2, $0, $L11
	lw	$t3, 12($t1)

	addu	$v0, $t3, $t7
	sltu	$v0, $v0, $t6
$L3:
	beql	$v0, $0, $L9
	addiu	$t1, $t1, 4

	beq	$a2, $0, $L12
	lw	$t5, 16($t1)

	addu	$v0, $t5, $t7
	sltu	$v0, $v0, $t6
$L4:
	beql	$v0, $0, $L9
	addiu	$t1, $t1, 4

	lbu	$v0, 0($t2)
	lbu	$v1, 0($t0)
	bnel	$v1, $v0, $L9
	addiu	$t1, $t1, 4

	bne	$v1, $0, $L13
	move	$a3, $0

	lhu	$a3, 10($t1)
$L5:
	beql	$a3, $0, $L9
	addiu	$t1, $t1, 4

	lw	$v0, 0($t3)
	beq	$v0, $a1, $L17
	move	$a0, $t3

	b	$L7
	move	$v1, $0

$L6:
	beq	$v0, $a1, $L15
	addiu	$a0, $a0, 4

$L7:
	addiu	$v1, $v1, 1
	slt	$v0, $v1, $a3
	bnel	$v0, $0, $L6
	lw	$v0, 4($a0)

$L8:
	addiu	$t1, $t1, 4
$L9:
	sltu	$v0, $t1, $t4
	bnel	$v0, $0, $L1
	lw	$t0, 0($t1)

	jr	$ra
	move	$v0, $0

$L10:
	b	$L2
	sltu	$v0, $v0, $t8

$L11:
	addu	$v0, $t3, $t9
	b	$L3
	sltu	$v0, $v0, $t8

$L12:
	addu	$v0, $t5, $t9
	b	$L4
	sltu	$v0, $v0, $t8

$L13:
	addu	$v0, $t2, $a3
$L14:
	addu	$v1, $t0, $a3
	lbu	$v1, 1($v1)
	lbu	$a0, 1($v0)
	bne	$v1, $a0, $L8
	addiu	$a3, $a3, 1

	bne	$v1, $0, $L14
	addu	$v0, $t2, $a3

	b	$L5
	lhu	$a3, 10($t1)

$L15:
	sll	$v0, $v1, 3
$L16:
	jr	$ra
	addu	$v0, $t5, $v0

$L17:
	b	$L16
	move	$v0, $0

getIoFileMgrForUserString:
	jalr	$ra
	nop
	.asciz	"IoFileMgrForUser\x00\x00\x00"

getUtilsForUserString:
	jalr	$ra
	nop
	.asciz	"UtilsForUser\x00\x00\x00"

getBinPath:
	jalr	$ra
	nop
	.asciz	"ms0:/PSP/SAVEDATA/ULUS10412/H.BIN"	/* change TODO to the name of your exploit's savedata folder */
