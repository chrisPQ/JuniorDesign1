.include 2n4401.mod
.include 2n4403.mod
.include 1n5227.mod

V_L vcc_out V_sin pulse(0 15 0 .5 .5 1 2 0)
Vin2 V_sin gnd sin(0 1 120 0 0 0)


Q1 col1 base1 emit1 2N4401
Q2 vcc_out base2 emit1 2N4401
Q3 V_out col1 vcc_out 2N4403

R1 vcc_out base1 1k
R2 vcc_out col1 10k
R3 emit1 gnd 270
R4 V_out base2 1k
R5 base2 gnd 2.7k
R6 V_out gnd 4.75

C1 base1 gnd 0.1u
C2 V_out base2 2.7n

D1 gnd base1 3.6 1N5227

.control
	destroy all
	op
	tran 20u 1
	plot V(vcc_out) V(V_out)
        show Q1
	show Q2
	show Q3
.endc

.end
