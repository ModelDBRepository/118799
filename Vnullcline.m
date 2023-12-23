%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%           Loss of phase-locking in non-weakly coupled 
%           inhibitory networks of type-I model neurons
%           
%       Journal of Computational Neuroscince, 26(2): 303-320. 
%                  Myongkeun Oh and Victor Matveev            
%                       Dept Math Sci, NJIT
%
%                      V-nullcline routine
%                         April 12, 2009
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function wlist = Vnullcline(interval, s)
global gbarsyn;

VK=-84;     VL=-60;     VCa=120;
C=2;        phi=0.6667; V1=-12;
V2=18;      V3=-8;      V4=6.0;
gCa=4.0;    gK=8.0;     gL=2.0;
Cinv=1.0/C; einh=-80;  
slope=4;    zap=14;

wsol = 0; wlist = [];

for V = interval
    minf=0.5*(1+tanh((V-V1)/V2));
    Vprime = @(x) Cinv*(-gCa*minf*(V-VCa) - gK*x*(V-VK) - gL*(V-VL) - gbarsyn*s*(V-einh) + zap);
    wsol = fzero(Vprime, wsol);
    wlist = [wlist, wsol];
end;



