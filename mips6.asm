.data
	msg1: .asciiz "Digite um número: "
	msg2: .asciiz "... e outro: "
	msg3a: .asciiz "O menor dos números colocados é "
	msg3b: .asciiz ", e o maior é "
	dot: .asciiz "."
.text
	.globl main
	main:
	li $v0, 4
	la $a0, msg1
	syscall
	
	li $v0, 5
	syscall
	move $s1, $v0
	move $s2, $v0
	
	loop:
	bge $s0, 9, endloop
	li $v0, 4
	la $a0, msg2
	syscall
	
	li $v0, 5
	syscall
	move $s3, $v0
	blt $s3, $s1, less
	bgt $s3, $s2, more
	b continue
	
	less:
	move $s1, $s3
	b continue
	
	more:
	move $s2, $s3
	b continue
	
	continue:
	addi $s0, $s0, 1
	b loop
	
	endloop:
	
	li $v0, 4
	la $a0, msg3a
	syscall

	li $v0, 1
	move $a0, $s1
	syscall

	li $v0, 4
	la $a0, msg3b
	syscall

	li $v0, 1
	move $a0, $s2
	syscall

	li $v0, 4
	la $a0, dot
	syscall

	li $v0, 10
	syscall
	
	
	
	