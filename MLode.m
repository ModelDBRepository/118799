%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%           Loss of phase-locking in non-weakly coupled 
%           inhibitory networks of type-I model neurons
%           
%       Journal of Computational Neuroscince, 26(2): 303-320. 
%                  Myongkeun Oh and Victor Matveev            
%                       Dept Math Sci, NJIT
%  
%             ODE file for simulations in LeapFrogMovie.m
%                         April 12, 2009
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function dydt = MLode(t, Y, Params)
global gbarsyn;

gbarsyn = Params(1);
tauSyn = Params(2); tgamma = Params(3);
vthresh = Params(4);

VK=-84;     VL=-60;     VCa=120;    VNa=180;
C=2;        phi=0.6667; V1=-12;
V2=18;      V3=-8;      V4=6.0;
gCa=4.0;    gK=8.0;     gL=2.0;
Cinv=1.0/C; einh=-80;   
slope=4;    zap=14;

minf=0.5*(1+tanh((Y(1)-V1)/V2));
winf=0.5*(1+tanh((Y(1)-V3)/V4));
kW=cosh((Y(1)-V3)/(2*V4));
minf1=0.5*(1+tanh((Y(2)-V1)/V2));
winf1=0.5*(1+tanh((Y(2)-V3)/V4));
kW1=cosh( (Y(2) - V3) / (2 * V4) );

dydt=[Cinv*(-gCa*minf*(Y(1)-VCa) - gK*Y(3)*(Y(1)-VK) - gL*(Y(1)-VL) - gbarsyn*Y(6)*(Y(1)-einh) + zap);
Cinv * (-gCa*minf1*(Y(2)-VCa) - gK*Y(4)*(Y(2)-VK) - gL*(Y(2)-VL) - gbarsyn*Y(5)*(Y(2)-einh) + zap);
phi * (winf - Y(3)) * kW; phi * (winf1 - Y(4)) * kW1;
(1-Y(5))*0.5*(1 + tanh(slope*(Y(1)-vthresh)))/tgamma - Y(5)*0.5*(1 + tanh(slope*(vthresh-Y(1))))/tauSyn;
(1-Y(6))*0.5*(1 + tanh(slope*(Y(2)-vthresh)))/tgamma - Y(6)*0.5*(1 + tanh(slope*(vthresh-Y(2))))/tauSyn; ];

