*Transistor simulation
.include 2n4401.mod

V1 dc_out gnd 12
V2 Ac_pos gnd AC 1 SIN(0 0.0005 1000)

Q1 col base emit 2N4401

R1 dc_out col 560
R2 dc_out base 10000
R3 base gnd 1200
R4 bypass gnd 24
R5 C_out gnd 2000 ; load resistor
R6 emit bypass 24
C1 Ac_pos base 10u; input cap
C2 col C_out 10u  ; output cap
C3 bypass gnd 100u ; bypass cap

.control
   destroy all
   show Q1
   tran 20u 5m 
   plot v(Ac_pos) v(C_out)
.endc

.end
