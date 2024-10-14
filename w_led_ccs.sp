.title w_led_ccs.sp

*Constant current source for two, series connected white LEDs. 
*Circuit keeps current constant through LEDs over a voltage range.

.include 2n4401.mod
.include xqawht.mod ; model file for Cree XQAWHT white LED 

Vcc    vcc        gnd             10v    ;supply voltage, vary over range
*      coll       base      emit
Q1     q2_b       q2_e      gnd   2N4401 ;feedback transistor
Q2     q2_c       q2_b      q2_e  2N4401 ;current sinking transistor

R1     vcc        q2_b            1K     ;provides base current to q2 
R2     q2_e       gnd             10     ;senses current to provide feedback 

V_s    vcc        d1_anode        0v     ;current-sensing voltage source 

*      anode      cathode
D1     d1_anode   led_tie        xqawht  ;white led 
D2     led_tie    q2_c           xqawht  ;white led 

.control
  set hcopydevtype=postscript
  set hcopypscolor=true
  set color0=rgb:f/f/f
  set color1=rgb:0/0/0
  op                           ; analyze dc operating point
  print v(q2_c) v(q2_e) i(v_s) ; print voltages and currents 
.endc
.end
