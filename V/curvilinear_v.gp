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


res = 50 #resolution
a = 1.0  #parameter alpha

set xzeroaxis ls 1 lc 'green'
p for [n=1:res] eta=0.5*pi*n/(res) a*cos(t)/cos(eta), +a*tan(eta)+a*sin(t)/cos(eta) w l ls 1 lc 'blue' \
, for [n=1:res] eta=0.5*pi*n/(res) a*cos(t)/cos(eta), -a*tan(eta)+a*sin(t)/cos(eta) w l ls 1 lc 'green' \
, for [n=1:res] zeta=0.5*pi*n/(res+1) a*tan(zeta)*cos(t)+a/cos(zeta), a*tan(zeta)*sin(t) w l ls 1 lc 'red' \
, for [n=1:res] zeta=0.5*pi*n/(res+1) a*tan(zeta)*cos(t)-a/cos(zeta), a*tan(zeta)*sin(t) w l ls 1 lc 'red' \
, 0, 20*(t-pi) w l ls 1 lc 'red'\
, res*(t-pi),0 w l ls 1 lc 'blue' dt 3


