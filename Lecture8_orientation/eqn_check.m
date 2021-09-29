clear all
close all
clc

addpath('./../matlab_utils')
%%
th = pi/3;

w = [1, 2, 1];
w = w/norm(w);
w_skew = [0 -w(3) w(2);
         w(3) 0 -w(1);
         -w(2) w(1) 0];

R = expm(w_skew*th)
R = eye(3) + sin(th)*w_skew + (1-cos(th))*w_skew^2

1/(2*sin(th))*(R - R')