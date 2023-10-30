function [p] = calculate_overlap_ratio(p)
    defocus = p.probe.aberrations.C1*1e10; %A
    alpha = p.probe.convergence_semi_angle;%rad
    r = abs(defocus)*tan(alpha); %A
    scan_step = p.scan.step/sqrt(p.scan.mask.sampling); %A
    temp_var = scan_step/(2*r);
    R = (2/pi)*(acos(temp_var)- temp_var*sqrt(1-temp_var^2));
    p.probe.overlap_ratio = R;
    disp(append('Overlap ratio: ',num2str(round(100*R)),'%'));
end