clc
clear all
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Fluid volume percentage calculation
% Ajithabh K. S.
% ajithabhks-at-gmail.com
%% Modify values below
melt = 0:0.0001:0.2; %Melt percentage
matrix = 10000; % Resistivity of rock matrix
fluid = 0.1; % Resistivity of fluid
sigm = 1/matrix; % Conductivity of matrix
sigf =  1/fluid ; % 6.55 and 41.06
%% Hashin Shtrikman Calculation begins
HSL = sigm + melt ./( (1/(sigf - sigm)) + ((1-melt) ./ (3 * sigm)));
HSU = sigf + (1 - melt) ./ ((1 /(sigm - sigf)) + (melt ./ (3 * sigf)));
rHSL = 1./HSU; % Upper bound in resistivities
rHSU = 1./HSL; % Lower bound in resistivities
%% Plotting
semilogy(melt,rHSL,'r')
hold on
xt = xticks * 100;
xticklabels(xt)
y = 5;
line([0,0.2],[y,y])
z = 10;
xlabel('Fluid Fraction (vol%)')
ylabel('Resistivity')
% ylim([1 5000])
hold off
axis square
%%
print('-f','-dpdf','-r600','-fillpage','-painters','hashin.pdf')