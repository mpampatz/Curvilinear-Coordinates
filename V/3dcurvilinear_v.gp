# gnuplot script for plot (v)

reset

set style line 1 \
    linewidth 1.000 \
    dashtype solid \
    pointtype 1 \
    pointsize 1 \
    pointinterval 0


                

unset autoscale
set xrange [-3.0:3.0]
set yrange [-3.0:3.0]
set zrange [-3.0:3.0]
set size square

unset key
set grid

set parametric
set isosamples 50
set urange [pi/2:2*pi]
set vrange [0:2*pi]

Tx(zeta,u,v) = a*(1/cos(zeta)+tan(zeta)*cos(v))*cos(u)
Ty(zeta,u,v) = a*(1/cos(zeta)+tan(zeta)*cos(v))*sin(u)
Tz(zeta,u,v) = a*tan(zeta)*sin(v)

Sx(eta,u,v) = a*(1/cos(eta))*cos(v)*cos(u)
Sy(eta,u,v) = a*(1/cos(eta))*cos(v)*sin(u)
Sz(eta,u,v) = a*(1/cos(eta))*sin(v) + a*tan(eta)

#p for [n=1:res] eta=0.5*pi*n/(res) a*cos(t)/cos(eta), +a*tan(eta)+a*sin(t)/cos(eta) w l ls 1 lc 'blue' \

res = 5 #resolution
a = 1.0  #parameter alpha
set hidden3d
sp for [n=1:res] zeta=0.5*pi*n/(res+1) Tx(zeta,u,v), Ty(zeta,u,v), Tz(zeta,u,v) w l ls 1 lc 'red' \
,  for [n=1:res] eta=0.5*pi*n/(res+1)  Sx(eta,u,(pi-v)/2),  Sy(eta,u,(pi-v)/2),  Sz(eta,u,(pi-v)/2) w l ls 1 lc 'blue' 


