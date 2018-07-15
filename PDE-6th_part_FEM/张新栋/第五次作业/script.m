clear all;
close all;
clc;

addpath ./utils
addpath ./finite-element


left_boundary = 0.0;
right_boundary = 1.0;
space_step = 0.05;
initial_value = 0.0;
boundary_value = 0.0;


Y = finite_element(left_boundary, right_boundary, ...
                   space_step, ...
                   @p, @q, @f, ...
                   initial_value, boundary_value);

Y = [initial_value;Y];
Y_GT = GroundTruth(left_boundary:space_step:right_boundary)';
abs_err = abs(Y-Y_GT);
figure;
plot(abs_err);

