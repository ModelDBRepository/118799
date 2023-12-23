%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%           Loss of phase-locking in non-weakly coupled 
%           inhibitory networks of type-I model neurons
%           
%       Journal of Computational Neuroscince, 26(2): 303-320. 
%                  Myongkeun Oh and Victor Matveev            
%                       Dept Math Sci, NJIT
%  
%             Reproduces all activity states shown in Fig. 1
%                         April 12, 2009
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

global gbarsyn;

IC = [-37.7891  -40.2443 0 0 0 0 ];

Period = 260; 
twindow = Period * 1.2;
T = 2 *(Period + twindow);
figure(1); set(1, 'position', [250, 500, 640, 320]);

options = [];
options = odeset(options,'RelTol',1e-6);

%  Change these parameters to obtain different activity states (see Figs. 1,2)
%  Parameter array: [ gbarsyn tauSyn tgamma vthresh ]
Params = [0.22 1 0.2 -3];

[t,y] = ode45(@MLode, [0 T], IC, options, Params);
IC = y(length(t),:);
[t,y] = ode45(@MLode, [0 T], IC, options, Params);

Vinterval = [-65:2:30];
Yw = 0.5*(1+tanh((Vinterval+8)/6));

i = find(t>twindow/2, 1);

while t(i) < T - twindow/2;
    i = i + 5;
    subplot('position',[0.1 0.15 0.45 0.78]);
    hold off;
    plot(Vinterval, Yw, 'b-', 'linewidth', 2);
    xlabel('V','fontsize',14); ylabel('w','fontsize',14);
    hold on;
    
    V1 = y(i,1); w = y(i,3);
    plot(V1, w,'om', 'linewidth', 2);
    V2 = y(i,2); w = y(i,4);
    plot(V2, w,'ok', 'linewidth', 2);

    s  = y(i,6); 
    Y = Vnullcline(Vinterval, s);
    plot(Vinterval, Y, '-m', 'linewidth', 2);
    s  = y(i,5);
    Y = Vnullcline(Vinterval, s);
    plot(Vinterval, Y, '-k', 'linewidth', 2);

    axis([-65 30 -0.02 0.6]);
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    subplot('position', [0.6 0.6 0.37 0.25]);
    hold off;
    tt = t - t(i) + twindow/2;
    vmin = min(y(:,1))*1.1; vmax = max(y(:,1))*1.1;
    plot([twindow/2 twindow/2], [vmin vmax], 'y-', 'linewidth', 2); hold on;
    plot(tt,y(:,1),'m-','linewidth',1);
    plot(tt,y(:,2),'k-','linewidth',1);
    axis([0 twindow vmin vmax]);
    title('Voltage: V_1(t), V_2(t)','fontsize',12);
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    smax = max(y(:,5)) * 1.1;
    subplot('position', [0.6 0.15 0.37 0.25]);
    hold off;
    tt = t - t(i) + twindow/2;
    plot([twindow/2 twindow/2], [0 smax], 'y-', 'linewidth', 2);
    hold on;
    plot(tt,y(:,5),'m-','linewidth',1);
    plot(tt,y(:,6),'k-','linewidth',1);
    axis([0 twindow 0 smax]);
    title('Synaptic variables: s_1(t), s_2(t)','fontsize',12);
    xlabel('time (ms)', 'fontsize', 12);
    drawnow;

end;
