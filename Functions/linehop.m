function mask = linehop(sampling,height,width)
    row_height = round(1/sampling);
    padding = 0;
    if row_height == 1
        mask = ones([height width]);
    else
        final_row = rem(height,row_height);
        mask = zeros([height width]);
        mask(1:height-row_height-final_row,:) = line_hop_base(row_height,padding,...
            height-row_height-final_row,width);
        mask(height-row_height-final_row+1:end,:) = line_hop_base(row_height+final_row,padding,...
            row_height+final_row,width);
    end
end

function im = line_hop_base(row_height,padding,height,width)
    num_rows = ceil(height / (row_height + padding));
    track = zeros([num_rows * (row_height + padding) width]);
    mask = ones([height width]);
    im = zeros([height width]);
    if row_height>1
        for row = 0 : num_rows-1
            row_start = (row) * (row_height + padding);
            row_end = row_start + row_height - 1;
            if row > 0
                row_random = row_start + randi(row_height)-1;
            else
                row_random = round((row_start + row_end) / 2);
                %row_random = randi(row_height);
            end
            if row_random < height
                ypos = row_random;
            else
                ypos = height;
            end
            for x = 1:width
                track(ypos+1, x) = 1;
                jump = randi(3);
                if jump == 1
                    if ypos < row_end && ypos < height-1
                        ypos = ypos + 1;
                    else
                        ypos = ypos - 1;
                    end
                elseif jump == 2
                    if ypos > row_start 
                        ypos = ypos - 1;
                    else
                        ypos = ypos + 1;
                    end
                end
            end
            im = mask.* track(1:height, 1:width);
        end
    else
        for i=1:num_rows
            r = randi(row_height+padding);
            rin = (i-1)*(row_height+padding) + r;
            im(rin,:) = 1;
        end
    end
end