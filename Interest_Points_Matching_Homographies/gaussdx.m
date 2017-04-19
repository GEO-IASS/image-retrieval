function D=gaussdx(x,sigma)
%TODO: compute the derivative of gaussian(mean=0, sig=sigma) for x and put the results in "D" variable
dnormal = 1/sqrt(2*pi*sigma^2) * -1/sigma^2;
D = dnormal * exp(-x.^2/(2*sigma^2)) .* x;
end
