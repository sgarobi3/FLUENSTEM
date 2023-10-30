clc,clear,close all
addpath("Functions\");

%----- Load parameter tree ----------%

p = parameters();

%----- Change mask ------------------%

p.scan.mask.type = 5; % Raster: 0, UDS: 1, Line-hop: 2, Block-constrained: 3, Custom:4, Uniform: 5
p.scan.mask.sampling = 1/9; % only applies to UDS, Line-hop, or Block-constrained

%----- Generate custom mask ---------%

cmask = rand([p.scan.dim_y p.scan.dim_x]);
cmask(cmask>p.scan.mask.sampling) = 0;
cmask(cmask>0) = 1;
cmask(1,1:end) = 1;
cmask(1:end,1) = 1;
cmask(1:end,end) = 1;
cmask(end,1:end) = 1;

%----- Run the code -----------------%

[p] = probe_cut_off(p);
[p] = define_reciprocal_space(p);
[p] = probe_maker(p);
[p] = define_sampling_mask(p,cmask);
[p] = define_real_space_map(p);
[p] = probe_dose(p);
[p] = dose_distribution_map(p);
[p] = calculate_overlap_ratio(p);
plotting(p);
