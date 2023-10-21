function [mask,pos] = blockconstrained(sampling,height,width)
    block_area = round(1/sampling);
    block_width = floor(sqrt(block_area));
    block_height = round(block_area/block_width);
    if block_area == 1
        mask = ones([height width]);
    else
        [mask,pos] = block_constrained_base(block_height,block_width,...
            height,width);
    end
end

function [im,pos] = block_constrained_base(block_height,block_width,height,width)
    num_rows = ceil(height / (block_height));
    num_cols = ceil(width / (block_width));
    track = zeros([num_rows * (block_height) num_cols*block_width]);
    im = zeros([height width]);
    block = zeros([block_height block_width]);
    x = linspace(1,block_width*block_height,block_height*block_width);
    block_tracker = reshape(x,[block_height block_width]);
    pos = (1.1*height).*ones([num_rows*num_cols 2]);
    if block_height>1
       counter = 0;
       for i=1:num_rows
           for j=1:num_cols
                counter = counter+1;
                block = rand(size(block));
                m = max(block,[],'all');
                block(block<m) = 0;
                block(block>0) = 1;
                if sum(block,"all")>1
                    error('Error');
                end
                track((i-1)*block_height+1:i*block_height,(j-1)*block_width+1:j*block_width) = block;
                v = sum(block_tracker.*block,'all');
                l = rem(v,block_height);
                if l == 0
                    row = block_height;
                    col = v/block_height;
                else
                    row = l;
                    col = (v-row)/block_height + 1;
                end
                pos(counter,1) = row + (i-1)*block_height;
                pos(counter,2) = col + (j-1)*block_width;
           end
       end
       im = track(1:height,1:width);
       TF = pos(:,1)>height;
       pos(TF,:) = [];
       TF = pos(:,2)>width;
       pos(TF,:) = [];
    else
        for i=1:num_rows
            r = randi(block_height+block_width);
            rin = (i-1)*(block_height+block_width) + r;
            im(rin,:) = 1;
        end
    end
end