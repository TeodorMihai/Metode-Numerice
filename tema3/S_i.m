function [value] = S_i(a, b, c, d, x, xi)

	value = a + b * (x - xi) + c * (x - xi) ^ 2 + d * (x - xi) ^ 3;

end