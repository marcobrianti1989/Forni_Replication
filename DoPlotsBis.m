function DoPlotsBis(irf,irfboot,d1,d2,shocks,names)
n = size(irf,1);
if nargin == 5
    for i = 1:n
    names{i} = '';
    end
end
for j=shocks
    figure(j)
    for i=1:2
        imp = [squeeze(irf(i,j,:)) squeeze(prctile(irfboot(i,j,:,:),[5 16 84 95],4))];
        subplot(d1,d2,i),PlotShad(imp),title(names{i}),
        axis tight
    end
end

end