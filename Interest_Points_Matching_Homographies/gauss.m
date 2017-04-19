function G=gauss(x,sigma)
normal = 1/sqrt(2*pi*sigma^2);
G = normal * exp(-x.^2/(2*sigma^2));
%TODO: compute the gaussian(mean=0, sig=sigma) for x and put the results in "G" variable
end
