function mask = uds(sampling,height,width)
    mask = rand([height width]);
    mask(mask>sampling) = 0;
    mask(mask>0) = 1;
end