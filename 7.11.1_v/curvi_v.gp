#   Gnuplot Script
#
#   A plot for the curvilinear system found at
#   "Vectors Tensors and the Basic Equations of Fluid Mechanics"
#   by Aris Rutherford
#   Exersice 7.11.1 (v)
#
#   Curvilinear coordinates x1, x2, x3 are transformed to zeta, eta, theta
#   such that ...
#       sin(zeta) = 1/x1
#       sin(eta)  = x2
#       tan(theta)  = sqrt(1-x3^2) / x3
#
#   The curvilinear system is z-axissymmetric.
#
#   Holding x3 constant surface coordinates are planes.
#   Angle theta defines rotation about the z-axis
#
#   Holding x1 constant surface coordinates are tori.
#   z-axis is the axis of their symmetry while the core cycle lies on the
#   xy-plane.
#   Angle zeta defines:
#   -the core cycle radius R = 1/cos(zeta)
#   -the tube radius       r = tan(zeta)
#   Thus x1 is the ratio   x1 = R/r = 1/sin(zeta)
#   The physical meaning of x1 and zeta follows.
#
#   Holding x2 constant surface coordinates are spheres.
#   Their centers lie on the z-axis. Its like they sit on (or hang from) the
#   ring x^2+y^2=a^2.
#   Angle eta defines:
#   -the center Zc = tan(eta)
#   -the radius R  = 1/cos(eta)
#   Thus x2 is the ratio x2 = sin(eta) = Zc/R
#   The physical meaning of x2 and eta follows.
#
#   The surface of the plot is a plane for which x3 is held constant.
#   Cross sections of tori are displayed red.
#   Cross sections of upper spheres are displayed blue.
#   Cross sections of upper spheres are displayed green.

reset

unset key
set grid

unset autoscale
set xrange [-6.0:6.0]
set xlabel "Rxy"
set yrange [-6.0:6.0]
set ylabel "Z"
set size square

set parametric
set trange [0:2*pi]

res = 30 #resolution
a = 1.0  #parameter alpha
p for [n=1:res] eta=0.5*pi*n/res a*cos(t)/cos(eta), +a*tan(eta)+a*sin(t)/cos(eta) w l lc 'blue' \
, for [n=1:res] eta=0.5*pi*n/res a*cos(t)/cos(eta), -a*tan(eta)+a*sin(t)/cos(eta) w l lc 'green' \
, for [n=1:res] zeta=0.5*pi*n/res a*tan(zeta)*cos(t)+a/cos(zeta), a*tan(zeta)*sin(t) w l lc 'red' \
, for [n=1:res] zeta=0.5*pi*n/res a*tan(zeta)*cos(t)-a/cos(zeta), a*tan(zeta)*sin(t) w l lc 'red'

