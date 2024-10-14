*Transistor simulation
.include 2n4401.mod
.include LM358.subckt

V1 vcc_out gnd 10
V2 gnd vee_out 10
V3 Ac_pos gnd AC 1 SIN(0 0.5 1000)

XOPAMP in_pos in_neg vcc_out vee_out opamp_out LM358

R1 opamp_out in_neg 2k
R2 in_neg in 1k
Cout opamp_out vo 10u
RL vo gnd 10k
Ra vcc_out in_pos 10k
Rb in_pos gnd 10k
Cbyp in_pos gnd 1u
Cin Ac_pos in 10u

.control
   destroy all

   tran 20u 5m 
   plot v(Ac_pos) v(opamp_out)
.endc

.end
