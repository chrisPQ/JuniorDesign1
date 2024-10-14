*Transistor simulation
.include 2n4401.mod
.include MCP6281.subckt

V1 vcc_out gnd 5
V2 gnd vee_out 10
V3 Ac_pos gnd AC 1 SIN(0 0.5 1000)
Vkick V_pulse V_pulse_neg pulse(0 1 1.0m 0.1u 0.1u 0.1m 2 0) ; 1V kicker

XOPAMP1 in_pos1 in_neg1 vcc_out gnd opamp_out1 MCP6281
XOPAMP2 in_pos2 opamp_out2 vcc_out gnd opamp_out2 MCP6281
XOPAMP3 in_pos3 opamp_out3 vcc_out gnd opamp_out3 MCP6281
XOPAMP4 in_pos4 opamp_out4 vcc_out gnd opamp_out4 MCP6281

R1 V_pulse in_neg1 360k
R2 in_neg1 modify 1460k
R3 modify opamp_out1 4.7k
R4 opamp_out1 in_pos2 10k
R5 opamp_out2 in_pos3 10k
R6 opamp_out3 in_pos4 10k
R7 opamp_out4 V_pulse_neg 10k

C1 in_pos2 gnd 10n 
C2 in_pos3 gnd 10n
C3 in_pos4 gnd 10n
C4 V_pulse_neg gnd 10n 

Cout opamp_out vo 10u
RL vo gnd 10k
Ra vcc_out in_pos1 10k
Rb in_pos1 gnd 10k
Cbyp in_pos1 gnd 0.1u
Cin Ac_pos in 10u

.control
   destroy all

   tran 20u 15m 2m 
   plot v(opamp_out1) v(opamp_out2) v(opamp_out3) v(opamp_out4) 
.endc

.end
