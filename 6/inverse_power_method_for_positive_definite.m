function [eigen_value, eigen_vector, residual] = inverse_power_method_for_positive_definite(the_matrix, initial_guess, steps)


x = initial_guess;
for count = 1: steps
    x = the_matrix \ x;   % It is more precise than (inv(the_matrix) * x);
    e = max(x);
    if e ~= 0
        x = x / e;
    else                  % if e == 0, eigen value = 0; matrix is singular.
        break
    end
end


if e ~= 0                 % else (if e == 0), matrix is singular and invertible.
    eigen_value = 1 / e;
end


eigen_vector = x / norm(x);
residual = norm(the_matrix * eigen_vector - eigen_value * eigen_vector);

