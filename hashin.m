clc
clear all
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Fluid volume percentage calculation
% Ajithabh K. S.
% ajithabhks@gmail.com
%%
melt = 0:0.0001:0.2;
sigm = 1/10000; % Conductivity of matrix
sigf =  1/0.1 ; % 6.55 and 41.06
%% Hashin Shtrikman
HSL = sigm + melt ./( (1/(sigf - sigm)) + ((1-melt) ./ (3 * sigm)));
HSU = sigf + (1 - melt) ./ ((1 /(sigm - sigf)) + (melt ./ (3 * sigf)));
rHSL = 1./HSU; % in resistivities
rHSU = 1./HSL; % in resistivities
%semilogy(melt,rHSU,'b')
%hold on
semilogy(melt,rHSL,'r')
hold on
%set(gca,'Ydir','reverse')
% yt = 1./yticks;
% yticklabels(yt)
xt = xticks * 100;
xticklabels(xt)
y = 5;
line([0,0.2],[y,y])
z = 10;
% line([0,0.2],[z,z])
xlabel('Fluid Fraction (vol%)')
ylabel('Resistivity')
% ylim([1 5000])
hold off
axis square
%%
print('-f','-dpdf','-r300','-fillpage','-painters','hashin.pdf')
