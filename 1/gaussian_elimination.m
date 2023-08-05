function result_vector = gaussian_elimination(coeff_matrix, const_vector)


[rows_number, columns_number] = size(coeff_matrix);


% Input Validations:

if ( rows_number ~= columns_number )
   disp('Coefficients matrix is not square!');
   return
end

constants_number = length(const_vector);

if (rows_number ~= constants_number)
   disp ('Size of constants vector is not compatible with the coefficients matrix!')
   return
end


% initializing the resulting variables vector
result_vector = zeros(1, rows_number);


% Gaussian Elimination Implementation:

for row_index = 1: rows_number - 1

    % If an array on the diagonal is 0, we must reorder the equations so
    % that we dont't divide by zero:

    if coeff_matrix(row_index, row_index) == 0

       % Find the suitable non-zero candidate:
	   non_zero_diagonal_array =  min( find(coeff_matrix(row_index+1: rows_number, row_index) ~= 0 ) + row_index);
	   
       % If we cannot rearrange the equations in any way (all arrays on the
       % diagonal are zero), the matrix is singular:

       if isempty(non_zero__min_diagonal_array)
	      disp ('Coefficients matrix is singular!');
		  return
       end

       % Else, we rearrange them:

	   temp_coeff = coeff_matrix(row_index, :);
       temp_const = const_vector(row_index);

	   coeff_matrix(row_index, :) = coeff_matrix(non_zero_diagonal_array, :);
       const_vector(row_index) = const_vector(non_zero_diagonal_array);

	   coeff_matrix(non_zero_diagonal_array, :) = temp_coeff;
       const_vector(non_zero_diagonal_array) = temp_const;
    end


    % Transforming the matrix to a triangular matrix: 
  
    for index = row_index+1: rows_number
        
	    ratio = -coeff_matrix(index, row_index) / coeff_matrix(row_index, row_index);
		coeff_matrix(index, row_index) = 0;

		coeff_matrix(index, row_index+1: rows_number) = ...
            coeff_matrix(index, row_index+1: rows_number) + ratio * coeff_matrix(row_index, row_index+1: rows_number);
		const_vector(index) = const_vector(index) + ratio * const_vector(row_index);
    end
end


%  Back substitution to find the value of each variable:

result_vector(rows_number) = const_vector(rows_number) / coeff_matrix(rows_number, rows_number);

for row = (rows_number-1): -1: 1
    result_vector(row) = ...
        (const_vector(row) - sum(result_vector(row+1: rows_number) .* coeff_matrix(row, row+1: rows_number))) / coeff_matrix(row, row);
end

