*Full-Wave Rectifier Circuit

.include 1N4007.mod ;this is a file, not model name

Vac vac_in gnd sin (0 169V 60Hz) ;line voltage

* transformer 
Rs    vac_in   pri   0.5 ;primary resistance
Lp       pri   gnd  10mH ;primary inductance
Ls      sec1  sec2  51uH ;secondary inductance 
Kxfrmr Lp Ls       0.999 ;mutual inductance

* rectifier circuit
*       anode  cathode model
D1       gnd    sec1   1N4007 ;use model, not file name
D2      sec1   rload   1N4007
D3      sec2   rload   1N4007
D4       gnd    sec2   1N4007
rload  rload     gnd   100

*two different caps to try for filtering ripple
C1     rload     gnd   100uF    ;initial value
*C1     rload     gnd   1000uF  ;try this one too

.control 
  destroy all
  set hcopydevtype=postscript
  set xbrushwidth=3
  set hcopypscolor=0
  set color0=rgb:f/f/f
  set color1=rgb:0/0/0
  set color2=blue     
  set color3=red      

*run tranisient simulation for 45mS: 
*data points every 0.25mS, starting at 12mS
  tran 0.25ms 45ms 12ms 
  plot V(sec1,sec2) V(rload) ;secondary voltage and load 
.endc
.end
