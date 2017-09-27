function PlotShad(x,TimeOrigin,TimeEnd)
 n=size(x,1);
if nargin==1,
    TimeOrigin=0;
    TimeEnd=n-1;
end
nn = TimeEnd-TimeOrigin+1;
if size(x,2)==3
    col2 = [.8 .8 .8];
   
    ll=10;
    TEMP = x(:,1);
    te4 = x(:,2);
    te5 = x(:,3);
    b=fill([TimeOrigin :TimeEnd TimeEnd:-1:TimeOrigin],[te4' flipud(te5)'],col2);
    set(b,'EdgeAlpha',0);
    hold on
    a = plot(TimeOrigin:TimeEnd,[squeeze(TEMP) ]);
    set(a(1),'Color','k','LineWidth',1.5);
     z = plot(1:n,zeros(n,1));
     set(z(1),'Color','r','LineWidth',1);

    %     c = plot(1:10,[te4 te5],'k');
%     set(gca,'Layer','top','FontSize',10);
    axis([TimeOrigin TimeEnd min(te4) max(te5)])%axis(ax(t,:));
    grid on
elseif size(x,2)==5
    col2 = [.9 .9 .9];
    col1 = [.7 .7 .7];
    %n=size(x,1);
    TEMP = x(:,1);
    te1 = x(:,2);
    te2 = x(:,3);
    te3 = x(:,4);
    te4 = x(:,5);
    b=fill([TimeOrigin:TimeEnd TimeEnd:-1:TimeOrigin],[te1' flipud(te4)'],col2);set(b,'EdgeAlpha',0);hold on
    b=fill([TimeOrigin:TimeEnd TimeEnd:-1:TimeOrigin],[te2' flipud(te3)'],col1);set(b,'EdgeAlpha',0);
    a = plot(TimeOrigin:TimeEnd,[squeeze(TEMP) ]);
    set(a(1),'Color','k','LineWidth',1.5);
    z = plot(TimeOrigin:TimeEnd,zeros(nn,1));
    set(z(1),'Color','r','LineWidth',1);
%     axis([1 n min(te1) max(te4)])%axis(ax(t,:));
grid on
end   