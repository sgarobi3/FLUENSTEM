clc,clear,close all
addpath("Functions\");
p = parameters();
[p] = probe_cut_off(p);
[p] = define_reciprocal_space(p);
[p] = probe_maker(p);
plotting(p);