function [p] = probe_maker(p)
    Kx = p.global.Kx;
    Ky = p.global.Ky;
    K = sqrt(p.global.Kx.^2 + p.global.Ky.^2);
    p.global.K = K;
    Kx2 = Kx.*Kx;
    Kx3 = Kx2.*Kx;
    Kx4 = Kx3.*Kx;
    
    Ky2 = Ky.*Ky;
    Ky3 = Ky2.*Ky;
    Ky4 = Ky3.*Ky;
    
    aberration_function =  1/2.*p.probe.aberrations.C1.*(Kx2+Ky2)...
        + 1/2.*(p.probe.aberrations.C12a.*(Kx2-Ky2) + 2.*p.probe.aberrations.C12b.*Kx.*Ky)...
        + 1/3.*(p.probe.aberrations.C23a.*(Kx3-3*Kx.*Ky2) + p.probe.aberrations.C23b.*(3.*Kx2.*Ky - Ky3))...
        + 1/3.*(p.probe.aberrations.C21a.*(Kx3+Kx.*Ky2) + p.probe.aberrations.C21b.*(Ky3+Kx2.*Ky))...
        + 1/4.* p.probe.aberrations.C30a.*(Kx4+Ky4+2*Kx2.*Ky2)...
        + 1/4.* p.probe.aberrations.C34a.*(Kx4-6.*Kx2.*Ky2+Ky4)...
        + 1/4.* p.probe.aberrations.C34b.*(4.*Kx3.*Ky-4.*Kx.*Ky3)...
        + 1/4.* p.probe.aberrations.C32a.*(Kx4-Ky4)...
        + 1/4.* p.probe.aberrations.C32b.*(2.*Kx3.*Ky + 2.*Kx.*Ky3);
    transfer_function = exp(-sqrt(-1)*2*pi/ (p.global.lambda*1e-10) .* aberration_function);
    aperture_function = ones(size(K));
    aperture_function( K > p.probe.convergence_semi_angle) = 0;
    p.probe.probe_function_reciprocal = aperture_function.*transfer_function;
    p.probe.probe_function_real = fftshift(ifft2(ifftshift(p.probe.probe_function_reciprocal)));
    p.probe.probe_function_real = abs(p.probe.probe_function_real).^2;
end