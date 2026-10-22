.data
	msg1: .asciiz "Insira o comprimento: "
	msg2: .asciiz "Insira a altura: "
	msg3: .asciiz "Insira a largura: "
	msg4: .asciiz "Seu paralelepípedo mede: "
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
	
	li $v0, 4
	la $a0, msg3
	syscall
	
	li $v0, 5
	syscall
	move $s3, $v0
	
	mul $s0, $s1, $s2
	mul $s0, $s0, $s3
	
	li $v0, 4
	la $a0, msg4
	syscall
	
	li $v0, 1
	move $a0, $s0
	syscall
	
	li $v0, 10
	syscall