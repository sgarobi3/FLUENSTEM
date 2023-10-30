function plotting(p)    
    if p.probe.plot_real_probe == true
        fig(10) = figure();
        hAx = axes(fig(10));
        title('Probe function- real space');
        imagesc(abs(p.probe.probe_function_real), 'Parent', hAx);colormap('gray');axis image off;
        
        pixPerA = 1/p.global.delta_e;
        scalebarLength = 10^(1+round(log10(p.global.delta_e)));  
        unit = sprintf('%s', 'A'); 
        
        hScalebar = scalebar(hAx, 'x', scalebarLength, unit, 'Location', 'southeast', ...
            'ConversionFactor', pixPerA,'Color','white');
    end
    if p.probe.plot_real_probe_dose == true
        fig(11) = figure();
        hAx = axes(fig(11));
        imagesc(abs(p.probe.probe_function_real_dose), 'Parent', hAx);colormap('gray');axis image off;
        
        pixPerA = 1/p.global.delta_e;
        scalebarLength = 10^(1+round(log10(p.global.delta_e)));  
        unit = sprintf('%s', 'A'); 
        
        hScalebar = scalebar(hAx, 'x', scalebarLength, unit, 'Location', 'southeast', ...
            'ConversionFactor', pixPerA,'Color','white');
    end
    if p.scan.plot_dose_distribution_map == true
        fig(12) = figure();
        hAx = axes(fig(12));
        imagesc(abs(p.scan.map), 'Parent', hAx);colormap('gray');axis image off;
        
        pixPerA = 1/p.global.delta_e;
        scalebarLength = 10^(2+round(log10(p.global.delta_e)));  
        unit = sprintf('%s', 'A'); 
        
        hScalebar = scalebar(hAx, 'x', scalebarLength, unit, 'Location', 'southeast', ...
            'ConversionFactor', pixPerA,'Color','white');
    end
    if p.scan.plot_fluence_distribution_map == true
        fig(13) = figure();
        hAx = axes(fig(13));
        imagesc(abs(p.scan.fluence_map), 'Parent', hAx);colormap('gray');axis image off;
        if p.probe.fluence_limit>0
        clim([0 p.probe.fluence_limit]);
        else
        end
        
        pixPerA = 1/p.global.delta_e;
        scalebarLength = 10^(2+round(log10(p.global.delta_e)));  
        unit = sprintf('%s', 'A'); 
        
        hScalebar = scalebar(hAx, 'x', scalebarLength, unit, 'Location', 'southeast', ...
            'ConversionFactor', pixPerA,'Color','white');
    end
end