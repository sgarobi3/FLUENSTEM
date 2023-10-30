function [p] = define_real_space_map(p)
    px = p.scan.step.*linspace(1,p.scan.dim_x,p.scan.dim_x);
    py = p.scan.step.*linspace(1,p.scan.dim_y,p.scan.dim_y);
    cpx = p.global.delta_e*p.probe.dim_x/2;
    cpy = p.global.delta_e*p.probe.dim_y/2;
    p.scan.fov_x = [0,max(px)+2*cpx];
    p.scan.fov_y = [0,max(py)+2*cpy];
    p.scan.probe_positions = zeros([sum(p.scan.mask.mask,"all") 2]);
    p.scan.probe_map = zeros([ceil(p.scan.fov_y(2)/p.global.delta_e) ceil((p.scan.fov_x(2))/p.global.delta_e)]);
    count = 0;
    for i=1:length(px)
        x = px(i)+cpx;
        for j=1:length(py)
            y = py(j) + cpy;
            if p.scan.mask.mask(j,i) == 1
                count = count+1;
                p.scan.probe_positions(count,1) = x;
                p.scan.probe_positions(count,2) = y;
                p.scan.probe_map(round(y/p.global.delta_e))
            end
        end
    end
    
end