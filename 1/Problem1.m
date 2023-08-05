% Numerical Analysis Project: Problem 1
% Group Members & Student ID:
%                             Zahra Keshavarzi      - 9932108
%                             Pardis FarahmandSaber - 9932105
%                             AmirHossien Ezzati    - 9932101


clear
close
clc


% declaring variables and equations:

syms x y z w m
equations = [0.3*x + 9*y - z + 3*w - 2*m == 17, ...
             7*x + z - 4*w - m == 3, ...
             6*x + 2*z + 2*y + m + 8*w == 1, ...
             -1.2*z + 17*y + w - x == 15, ...
             y + 2*w  + z - x == -7];


% Creating the coefficients matrix and constant vectors:

variables = [x y z w m];
[coeff_matrix, const_vector] = equationsToMatrix(equations, variables);


% displaying the result:

variables_number = length(coeff_matrix);
result = gaussian_elimination(coeff_matrix, const_vector);

for variable_index = 1: variables_number
    fprintf('   \n %11.8s', variables(variable_index));
    fprintf(' = %11.8f \n', result(variable_index));
end

