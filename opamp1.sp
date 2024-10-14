.title opamp1.sp (non-inverting amp)
  
.include LM358.subckt

Vin in gnd sin(0 .5 1000) ; AC input signal for transient analysis
*                         ; 0V offset, 1.0Vpp, 1Khz signal
*
Vcc   vcc         gnd                   10v
Vee   vee         gnd                  -10v

*.subckt LM358 IN+    IN-  VCC VEE OUT  ; LM358 pin order
XOPAMP         in   in_neg vcc vee vo  LM358

R1    in_neg   gnd                     ?K
R2    in_neg   vo                      ?K

.control
* destroy all ; remove all old plots (optional)
* set printing and color options
  set hcopydevtype=postscript
  set hcopypscolor=true
  set color0=rgb:f/f/f
  set color1=rgb:0/0/0
  set color2=rgb:f/0/0
  set color3=rgb:0/f/0
  set color4=rgb:0/0/f

tran 20u 5m  ; transient analysis, plot every 20uS for 5mS
plot v(in) v(vo) v(in_neg)
.endc
.end
