clc,clear,close all
addpath("Functions\");
p = parameters();
[p] = probe_cut_off(p);
[p] = define_reciprocal_space(p);
[p] = probe_maker(p);
[p] = define_sampling_mask(p);
[p] = define_real_space_map(p);
[p] = probe_dose(p);
[p] = dose_distribution_map(p);
plotting(p);
