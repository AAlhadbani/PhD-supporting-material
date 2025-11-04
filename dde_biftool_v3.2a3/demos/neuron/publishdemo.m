%%  DDE-BIFTOOL demo 1 - Neuron: run all scripts of neuron example for testing
% This script runs all demos files in a single run for testing purposes.
% See <html/demo1.html> for the published version of the single scripts
%
% (c) DDE-Biftool v3.2a3 2019-09-14 (76060b1c6081bc0c98a69a8b0829d26a658fc9d6)

%
%% Description and load path
publish('demo1');
%% Definition of user functions
opts={'maxOutputLines',20};
publish('demo1_funcs',opts{:});
%% Symbolic definition of right-hand side and derivatives
publish('gen_sym_demo1');
%% Equilibria
publish('demo1_stst',opts{:});
%% Hopf bifurcations
publish('demo1_hopf',opts{:});
%% Normal forms along Hopf bifurcations (broken for r109 of br_bifdet)
% publish('demo1_normalforms','maxOutputLines',Inf);
%% Periodic orbits
publish('demo1_psol',opts{:});
%% Homoclinic connection
publish('demo1_hcli',opts{:});
%% Saddle-node of periodic orbits
publish('demo1_POfold',opts{:});
%% repeat procedure using convenience functions
publish('demo1_simple',opts{:});
%% Background information
publish('demo1_definingsystems');