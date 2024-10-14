*Transistor simulation
.include 2n4401.mod

V1 dc_out gnd 12

Q1 col base emit 2N4401

R1 dc_out col 560
R2 dc_out base 10000
R3 base gnd 1200
R4 emit gnd 47



.control
   op
   show Q1
   print V(base)
   print v(col)
   print v(emit)
.endc

.end
