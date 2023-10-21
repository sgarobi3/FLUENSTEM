function p = parameters()
    p.global.delta_e = 5; % Real space sampling (Angstrom)
    p.global.percentage = 1; % Fraction of maximum intensity values to carry into dose estimate
    p.global.acceleration_voltage = 300; %kV

    p.scan.dwell_time = 1e-3; % dwell time (seconds)
    p.scan.step = 31.25; % scan_step (Angstroms)
    p.scan.dim_x = 64; % number of scans in x
    p.scan.dim_y = 64; % number of scans in y
    p.scan.mask.type = 3; % Raster: 0, UDS: 1, Line-hop: 2, Block-constrained: 3
    p.scan.mask.sampling = 0.25; % only applies to UDS, Line-hop, or Block-constrained
    p.scan.plot_dose_distribution_map = false;
    p.scan.plot_fluence_distribution_map = true;

    p.probe.current = 4e-12; % Probe current (Amperes)
    p.probe.convergence_semi_angle = 1.034e-3; % radians
    p.probe.defocus = -130000; % angstroms (assume atleast Scherzer defocus)
    p.probe.fluence_limit = 28; % changes the maximum limit on colorbar e/A^{2}
    p.probe.dim_x = 128; % width of probe in pixels
    p.probe.dim_y = 128; % height of probe in pixels
    p.probe.plot_real_probe = false;
    p.probe.plot_real_probe_dose = true;

    % Aberrations in units of meter
    p.probe.aberrations.C1 = 1e-10*p.probe.defocus;
    p.probe.aberrations.C12a = 0;
    p.probe.aberrations.C12b = 0;
    p.probe.aberrations.C23a = 0; 
    p.probe.aberrations.C23b = 0; 
    p.probe.aberrations.C21a = 0; 
    p.probe.aberrations.C21b = 0; 
    p.probe.aberrations.C30a = 0;
    p.probe.aberrations.C34a = 0;
    p.probe.aberrations.C34b = 0;
    p.probe.aberrations.C32a = 0;
    p.probe.aberrations.C32b = 0;
end