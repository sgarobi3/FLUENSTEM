function plotting(p)    
    if p.probe.plot_real_probe == true
        fig(10) = figure();
        hAx = axes(fig(10));
        imagesc(abs(p.probe.probe_function_real), 'Parent', hAx);colormap('gray');axis image;
        
        pixPerA = 1/p.global.delta_e;
        scalebarLength = 10^(1+round(log10(p.global.delta_e)));  
        unit = sprintf('%s', 'A'); 
        
        hScalebar = scalebar(hAx, 'x', scalebarLength, unit, 'Location', 'southeast', ...
            'ConversionFactor', pixPerA,'Color','white');
    end
end