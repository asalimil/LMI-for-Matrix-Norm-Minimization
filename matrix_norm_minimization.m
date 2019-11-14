%% LMI for Matrix Norm Minimization
clc; clear; close all;

t = sdpvar(1);

x1 = sdpvar(1);
x2 = sdpvar(1);

A0 = [1 -4; 2 1];
A1 = [2 -1; -1 2];
A2 = [1 -2; 1 3];

% eta = 0.00000001;
C = [];
A = A0 + A1*x1 + A2*x2;
M = [-t*eye(2)  A
      A'     -t*eye(2)];
F = [C, M <= 0];
optimize(F,t);

% maximum eigenvalues
t = value(t)

% x_{i}
x1 = value(x1)
x2 = value(x2)

% norm of matrix
A = A0 + A1*x1 + A2*x2;
norm(A)
