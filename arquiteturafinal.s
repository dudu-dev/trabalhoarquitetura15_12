.data



taxaaprendizado: .double 0.05

pesow0: .float 1.3

pesow1: .float 1.7

termo11: .float 1.0

termo12: .float 1.0

saida1: .float 0.0

saidaneuronio1: .float 0.0

termo21: .float 2.0

termo22: .float 2.0

saida2: .float 0.0

saidaneuronio2: .float 0.0

termo31: .float 3.0

termo32: .float 3.0

saida3: .float 0.0

saidaneuronio3: .float 0.0

termo41: .float 4.0

termo42: .float 4.0

saida4: .float 0.0

saidaneuronio4: .float 0.0


.text 


main:


#saida1

lwc1  $f1,saida1

lwc1  $f11,termo11

lwc1  $f13,termo12

add.s $f1,$f11,$f13







#saida2

lwc1 $f3,saida2

lwc1 $f15,termo21

lwc1 $f17,termo22

add.s $f3,$f15,$f17





#saida3

lwc1 $f5,saida3

lwc1 $f19,termo31

lwc1 $f21,termo32

add.s $f5,$f19,$f21





#saida4

lwc1 $f7,saida4

lwc1  $f23,termo41

lwc1  $f25,termo42

add.s $f7,$f23,$f25


lwc1   $f0,pesow0
lwc1   $f31,pesow1
lwc1   $f30,taxaaprendizado



For: 

sw  $s0,5

sw  $s1,0



slt $t0,$s0,$s1

beq $t0,$s5,fim

mul $t0,$t0,4 #i*4



#primeiro resultado


mul.s $f2,$f11,$f0 #termo11 * w0
mul.s $f4,$f13,$f31 #termo12 * w1
add.d $f6,$f2,$f4 #saidaneoronio1 = termo11 * w0 + termo12 * w1


sub.s $f8,$f1,$f6 #erro= saída1 – saídaneoronio1


mul.d $f12,$f8,$f30 #erro * taxaaprendizado
mul.s $f14,$f12,$f11 #erro * taxaaprendizado *termo11
add.s $f14,$f14,$f12 #ajuste paraopeso w0


mul.s $f16,$f8,$f30 #erro * taxaaprendizado
mul.s $f18,$f16,$f13 #(erro * taxaaprendizado) * termo12
add.s $f18,$f18,$f16 #ajuste para o peso w1



#segundo resultado 


mul.s $f2,$f15,$f0 #termo21 * w0
mul.s $f4,$f17,$f31 #termo22 * w1
add.s $f20,$f2,$f4 #saidaneoronio2 = termo21 * w0 + termo22 * w1


sub.s $f8,$f3,$f20 #erro= saída2 – saídaneoronio2


mul.s $f10,$f8,$f30 #erro * taxaaprendizado
mul.s $f14,$f10,$f15 #erro * taxaaprendizado *termo21
add.s $f14,$f14,$f10 #ajuste paraopeso w0


mul.s $f16,$f8,$f30 #erro * taxaaprendizado
mul.s $f18,$f16,$f17 #(erro * taxaaprendizado) * termo22
add.s $f18,$f18,$f16 #ajuste para o peso w1



#terceiro resultado


mul.s $f2,$f19,$f14 #termo31 * w0
mul.s $f4,$f21,$f18 #termo32 * w1
add.d $f22,$f2,$f4 #saidaneoronio3 = termo31 * w0 + termo32 * w1


sub.s $f8,$f5,$f22 #erro= saída3 – saídaneoronio3


mul.s $f16,$f8,$f30 #erro * taxaaprendizado
mul.s $f10,$f30,$f19 #erro * taxaaprendizado *termo31
add.s $f10,$f10,$f16 #ajuste paraopeso w0


mul.s $f12,$f8,$f30 #erro * taxaaprendizado
mul.s $f14,$f12,$f21 #(erro * taxaaprendizado) * termo32
add.s $f14,$f14,$f12 #ajuste para o peso w1



#quarto resultado


mul.s $f2,$f23,$f10 #termo41 * w0
mul.s $f4,$f25,$f14 #termo42 * w1
add.d $f24,$f2,$f4 #saidaneoronio4 = termo41 * w0 + termo42 * w1


sub.s $f8,$f7,$f24 #erro= saída4 – saídaneoronio4


mul.s $f10,$f8,$f30 #erro * taxaaprendizado
mul.s $f12,$f10,$f23 #erro * taxaaprendizado *termo41
add.s $f12,$f12,$f10 #ajuste paraopeso w0


mul.s $f16,$f8,$f30 #erro * taxaaprendizado
mul.s $f18,$f16,$f25 #(erro * taxaaprendizado) * termo42
add.s $f18,$f18,$f14 #ajuste para o peso w1



 

fim:
j fim

fimfor:

jr $ra



fimprograma:

li $v0,10

syscall