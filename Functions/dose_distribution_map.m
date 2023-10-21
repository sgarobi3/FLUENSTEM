function [p] = dose_distribution_map(p)
    p.scan.map = zeros([ceil(p.scan.fov_y(2)/p.global.delta_e) ceil((p.scan.fov_x(2))/p.global.delta_e)]);
    for i=1:size(p.scan.probe_positions,1)
        cx = round(p.scan.probe_positions(i,1)./p.global.delta_e);
        cy = round(p.scan.probe_positions(i,2)./p.global.delta_e);
        p.scan.map(round(cy-p.probe.dim_y/2)+1:round(cy+p.probe.dim_y/2),round(cx-p.probe.dim_x/2)+1:round(cx+p.probe.dim_x/2)) =... 
            p.scan.map(round(cy-p.probe.dim_y/2)+1:round(cy+p.probe.dim_y/2),round(cx-p.probe.dim_x/2)+1:round(cx+p.probe.dim_x/2))+...
            p.probe.probe_function_real_dose;
    end
    p.scan.fluence_map = p.scan.map./(p.global.delta_e^2);
    p.scan.mean_fluence = mean(p.scan.fluence_map,'all');
    p.scan.max_fluence = max(p.scan.fluence_map,[],'all');
end