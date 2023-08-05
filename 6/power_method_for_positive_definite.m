function [eigen_value, eigen_vector, residual] = power_method_for_positive_definite(the_matrix, initial_guess, steps)

x = initial_guess;
for count = 1: steps
    x = the_matrix * x;
    e = max(x);
    if e ~= 0
        x = x / e;
    else                 % if e == 0, eigen value = 0; matrix is singular.
        break
    end
end

eigen_value = e;
eigen_vector = x / norm(x);
residual = norm(the_matrix * eigen_vector - eigen_value * eigen_vector);
