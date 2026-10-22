.data
	msg1: .asciiz "Insira valor A: "
	msg2: .asciiz "Insira valor B: "
	msg3a: .asciiz "A somatória dos valores ímpares entre "
	msg3b: .asciiz " e "
	msg3c: .asciiz " é de "
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
	
	li $v0, 4 
	la $a0, msg2
	syscall
	
	li $v0, 5
	syscall
	move $s2, $v0
	
	bgt  $s1, $s2, noinv
	
	move $t0, $s1
	move $s1, $s2
	move $s2, $t0
	
	noinv:
	
	move $s3, $s2
	li $s4, 0
	loop:
	addi $s3, $s3, 1
	bge $s3, $s1, endloop
	li $t1, 2
	div $s3, $t1
	mfhi $t0
	
	beq $t0, 0, even
	add $s4, $s4, $s3
	even:
	jal loop
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
	la $a0, msg3c
	syscall
	
	li $v0, 1
	move $a0, $s4
	syscall 
	
	li $v0, 4
	la $a0, dot
	syscall
	
	li $v0, 10
	syscall