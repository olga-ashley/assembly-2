.data
	msg1: .asciiz "Insira a primeira nota: "
	msg2: .asciiz "Insira a segunda nota: "
	msg3: .asciiz "Insira a terceira nota: "
	msg4: .asciiz "Insira a quarta nota: "
	msgA: .asciiz "APROVADO."
	msgE: .asciiz "EXAME."
	msgR: .asciiz "REPROVADO."
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
	
	li $v0, 4 
	la $a0, msg4
	syscall
	
	li $v0, 5
	syscall
	move $s4, $v0
	
	add $t0, $s1, $s2
	add $t1, $s3, $s4
	add $t0, $t0, $t1
	
	li $t1, 4
	div $t0, $t1
	mflo $s0
	
	blt $s0, 3, reprovado
	blt $s0, 6, exame
	
	li $v0, 4
	la $a0, msgA
	syscall
	
	li $v0, 10
	syscall
	
	exame:
	li $v0, 4
	la $a0, msgE
	syscall
	li $v0, 10
	syscall
	
	reprovado:
	li $v0, 4
	la $a0, msgR
	syscall
	li $v0, 10
	syscall