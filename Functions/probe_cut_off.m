function [p] = probe_cut_off(p)
    emass = 510.99906;		% electron rest mass in keV
    hc = 12.3984244;		% Planck's const x speed of light	
    p.global.lambda = hc/sqrt(p.global.acceleration_voltage*(2.0*emass + p.global.acceleration_voltage));
    p.probe.cut_off = (p.global.lambda/p.probe.convergence_semi_angle)/2; %cut off in real space
end