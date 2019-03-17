"Sum the squares of the numbers up to the given number"
square_of_sum(n::Int) = sum(1:n) ^ 2

"Square the sum of the numbers up to the given number"
sum_of_squares(n::Int) = map(n -> n ^ 2, 1:n) |> sum

"Subtract sum of squares from square of sums"
difference(n::Int) = square_of_sum(n) - sum_of_squares(n)
