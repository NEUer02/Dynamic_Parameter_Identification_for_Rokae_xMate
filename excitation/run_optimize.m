%% run_optimize.m
% @brief: optimize excitation trajectory

clear, clc, close all;

%% REMEMBER MANUALLY:
% 1. modify Système International d'Unités of {DH, G} in `utils\min_regressor.m` and 'optimize_object_fun_syms.m'
% 2. copy scripts in `dyn_minimal_param_math.txt` to `utils\min_regressor.m`

optimize_traj_main; 

% save to mat
clear ans;
save('.\data\No2_excitation_trajectory_parameters_0-30-0-60-0-270-0.mat', 'opt_x');

% save to txt
addpath('.\utils\')
mat2txt('.\data\No2_excitation_trajectory_parameters_0-30-0-60-0-270-0.txt', opt_x);

optimal_traj_vis();

rmpath('.\utils\')