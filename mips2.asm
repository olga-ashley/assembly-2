.data
	msg1: .asciiz "Digite o raio: "
	msg2: .asciiz "A circunferência é igual a: " 
.text
	.globl main
	
	main:
	
	li $v0, 4
	la $a0, msg1
	syscall
	
	li $v0, 5
	syscall
	move $t0, $v0
	
	li $t1, 6
	mul $s0, $t0, $t1
	
	li $v0, 4
	la $a0, msg2
	syscall
	 
	li $v0, 1
	move $a0, $s0
	syscall
	
	li $v0, 10
	syscall  
	