: This mod file is automaticaly generated by the ionc.write_mode_file() function in /source/ionchannels.py 

NEURON {
    SUFFIX IKA_prox
    USEION k WRITE ik
    RANGE  g, e
    GLOBAL var0inf, var1inf, tau0, tau1
    THREADSAFE
}

PARAMETER {
    g = 0.0477 (S/cm2)
    e = -90.0 (mV)
}

UNITS {
    (mA) = (milliamp)
    (mV) = (millivolt)
    (mM) = (milli/liter)
}

ASSIGNED {
    ik (mA/cm2)
    var0inf
    tau0 (ms)
    var1inf
    tau1 (ms)
    v (mV)
}

STATE {
    var0
    var1
}

BREAKPOINT {
    SOLVE states METHOD cnexp
    ik = g * ( var0 * var1 *1.0) * (v - e)
}

INITIAL {
    rates(v)
    var0 = var0inf
    var1 = var1inf
}

DERIVATIVE states {
    rates(v)
    var0' = (var0inf - var0) / tau0
    var1' = (var1inf - var1) / tau1
}

PROCEDURE rates(v) {
    var0inf = 1.0/(exp((-0.057 - 0.038/(exp(0.2*v + 8.0) + 1.0))*(v - 11.0)) + 1.0)
    tau0 = 4.0*exp((-0.03135 - 0.038/(exp(0.2*v + 8.0) + 1.0))*(v - 11.0))/(exp((-0.057 - 0.038/(exp(0.2*v + 8.0) + 1.0))*(v - 11.0)) + 1.0)
    var1inf = 1.0/(exp(0.11*v + 6.16) + 1.0)
    tau1 = 0.2 + 27.0/(exp(-0.0454545454545455*v + 0.2) + 1.0)
}

