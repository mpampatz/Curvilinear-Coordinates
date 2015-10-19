
# gnuplot script for plot (v)

reset

set style line 1 \
    linewidth 1.000 \
    dashtype solid \
    pointtype 1 \
    pointsize 1 \
    pointinterval 0


                

unset autoscale
set xrange [-6.0:6.0]
set xlabel "Rxy"
set yrange [-6.0:6.0]
set ylabel "Z"
set size square

unset key
set grid

set parametric
set isosamples 30
set trange [0:2*pi]


res = 20 #resolution
d = 2    #parameter d

Er(x1,t) = sqrt(x1**2+d**2)*cos(t)
Ez(x1,t) = x1*sin(t)

Hr(x2,t) = sqrt(1-x2**2)*cosh(t)
Hz(x2,t) = x2*sinh(t)
p for [n=0:res] x1=tan(0.5*pi*n/(1.15*res)) Er(x1,t), Ez(x1,t) w l ls 1 lc 'blue' \
, for [n=0:res] x2=sin(0.5*pi*n/res)  Hr(x2,t),  Hz(x2,t) w l ls 1 lc 'red'\
, for [n=0:res] x2=sin(0.5*pi*n/res)  Hr(x2,t), -Hz(x2,t) w l ls 1 lc 'red'\
, for [n=0:res] x2=sin(0.5*pi*n/res)  Hr(x2,t)*(-1), -Hz(x2,t) w l ls 1 lc 'red'\
, for [n=0:res] x2=sin(0.5*pi*n/res)  Hr(x2,t)*(-1),  Hz(x2,t) w l ls 1 lc 'red'
