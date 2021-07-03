#init registers,memory,sp
lui $t0,0x1000
ori $t0,$t0,0x1008 # $t0 = 0x10001008
sw $t0,0($0)
lui $t1,0x1000
ori $t1,$t1,0x1002 # $t1 = 0x10001002
sw $t1,4($0)
lui $t2,0x8000
ori $t2,$t2,0x1001 # $t2 = 0x80001001
sw $t2,8($0)
lui $t3,0x1000
ori $t3,$t3,0x1005 # $t3 = 0x10001005
sw $t3,12($0)
lui $t4,0x8000
ori $t4,$t4,0x1000 # $t4 = 0x80001000
sw $t4,16($0)
lui $t5,0xFFF8 
ori $t5,$t5,0x0000 # $t5 = 0xFFF80000
sw $t5,20($0)
addi $sp,$0,0x0800 # stack starts at memory[512]

add $a0,$0,$0
addi $a1,$0,6
jal Sort
j Exit

Swap: # a0: addr of array | a1: location of element
sll $t1,$a1,2 # k * 4: 以字节寻址
add $t1,$a0,$t1 # &Array[k]
lw $t0,0($t1)
lw $t2,4($t1) # load
sw $t2,0($t1)
sw $t0,4($t1) # swap
jr $ra # return

Sort: # a0: addr of array | a1: size of array
# store the register $s
addi $sp,$sp,-20
sw $ra,16($sp)
sw $s3,12($sp)
sw $s2,8($sp)
sw $s1,4($sp)
sw $s0,0($sp) 
# store arguments for swap use
add $s2,$0,$a0 # a0
add $s3,$0,$a1 # a1
addi $s0,$0,1# i: $s0
forTest1: # 外层循环, i
slt $t0,$s0,$s3
beq $t0,$0,exit1 # if i >= n, exit
addi $s1,$s0,-1
forTest2: # 内层循环, j
slti $t0,$s1,0
bne $t0,$0,exit2 # if j < 0, exit
sll $t1,$s1,2 # j * 4 :以字节寻址
add $t2,$s2,$t1 # array[j]
lw $t3,0($t2)
lw $t4,4($t2)
slt $t0,$t3,$t4 
bne $t0,$0,exit2 # if array[j] < array[j+1], not swap
add $a0,$0,$s2
add $a1,$0,$s1 # prepare to Swap
jal Swap
addi $s1,$s1,-1
j forTest2

exit2:
addi $s0,$s0,1
j forTest1

exit1:
lw $s0,0($sp)
lw $s1,4($sp)
lw $s2,8($sp)
lw $s3,12($sp)
lw $ra,16($sp)
addi $sp,$sp,20
jr $ra

Exit:


















