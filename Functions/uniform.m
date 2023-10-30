function mask = uniform(sampling,height,width)
    mask = zeros(height,width);
    d = round(1/sqrt(sampling));
    mask(1:d:end,1:d:end) = 1;
end