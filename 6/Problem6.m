% Numerical Analysis Project: Problem 6
% Group Members & Student ID:
%                             Zahra Keshavarzi      - 9932108
%                             Pardis FarahmandSaber - 9932105
%                             AmirHossein Ezzati    - 9932101


clear
close
clc


A = [9, -3, -6; 2, 8, 2; -5, 10, 7];
initial_guess = [11, 12, 13; 14, 15, 16; 17, 18, 19];
steps = 500; 


[eigen_value1, eigen_vector1, residual_err1] = power_method_for_positive_definite(A, initial_guess, steps);
[eigen_value2, eigen_vector2, residual_err2] = power_method_for_negative_definite(A, initial_guess, steps);
[eigen_value3, eigen_vector3, residual_err3] = inverse_power_method_for_positive_definite(A, initial_guess, steps);
[eigen_value4, eigen_vector4, residual_err4] = inverse_power_method_for_negative_definite(A, initial_guess, steps);


% A can be positive-definite or negative-definite
% This can be concluded by the residual which shows
% the error difference between the real and estimated
% values resulted: The closer to 0, the more precise.

if residual_err1 < residual_err2
    max_eigen_value = eigen_value1;          % A is positive-definite.
else                 
    max_eigen_value = eigen_value2;          % A is negative-definite.
end


% The same geos for minimum eigen value:

if residual_err3 < residual_err4
    min_eigen_value = eigen_value3;
else
    min_eigen_value = eigen_value4;
end


% Show the result:
min_eigen_value
max_eigen_value

