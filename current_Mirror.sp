.include 2n4401.mod

V_L vcc_out gnd 10
V_S Vcc_out Vs_gnd 0

Q1 col1 col1 gnd 2N4401
Q2 col2 col1 gnd 2N4401

R1 vcc_out col1 20k
R2 Vs_gnd col2 10k

.control
	op
	print V(col1)
	show V_L
	show V_S
.endc

.end
