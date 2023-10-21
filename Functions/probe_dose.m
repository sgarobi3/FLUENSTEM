function [p] = probe_dose(p)
    e_charge = 1.6e-19;
    dose_per_probe = p.scan.dwell_time*p.probe.current/e_charge;
    p.probe.probe_function_real_dose = dose_per_probe.*p.probe.probe_function_real./sum(p.probe.probe_function_real,'all');
    p.probe.dose_per_probe = dose_per_probe;
end