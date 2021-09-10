clc
clear all

%%

syms m1 m2 p1 p2 l1 l2 th1 th2 ddth1 ddth2 tau_1 tau_2 I1 I2

fx = m2 * (-ddth1 * l1 * sin(th1) - (ddth1 + ddth2) * p2 * sin(th1 + th2));
fy = m2 * (ddth1 * l1 *cos(th1) + (ddth1 + ddth2) * p2 * cos(th1 + th2));

tau_2 = I2 * (ddth1 + ddth2) - fx * p2 * sin(th1 + th2) + fy * p2 * cos(th1 + th2);
tau_1 = tau_2 - (fx*l1*sin(th1) - fy*l1*cos(th1)) + (I1 + m1 * p1*p1) * ddth1;

tau_1 = simplify(tau_1);
collect(tau_1, ddth1)
collect(tau_1, ddth2)