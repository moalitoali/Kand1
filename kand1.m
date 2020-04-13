%Experimental setup @ tandemlab in Uppsala
d1 = 0.40;                            % distance between MCP1 & MCP2
d2 = 0.10;                            % distance between MCP2 & Si/detector

A = 79.904;                           % atomic mass of ion
%E = 44e6;                             % Energy of ion
E = [44e6 43e6 40e6];
A = [79 79 79];
sigma_E = 0.0017;

E_spread = zeros(length(E), 1);
for i=1:length(E)
    %normrnd(E(i), sigma)
    E_spread(i) = normrnd(E(i), sigma_E);
end

v = velocity(E_spread, A);                   % velocity of Ion 

TOF1 = TOF(d1, v);                    
TOF2 = TOF(d1+d2, v);

% hold on;
% x = linspace(0, 100e6, 1000); % energy
% sigma = 1e6:1e6:10e6;
% for i=1:length(sigma)
%     gauss = normpdf(x, E, sigma(i));
%     
%     [m, index] = max(gauss);
%     
%     plot(x, gauss, x(index), m, '*');
%     xlabel('energy');
% end
% hold off;

% x = linspace(0, 50, 1000);
% mean = 25;
% sigma = 1;
% gauss = normpdf(x, mean, sigma);
% figure(1);
% plot(x, gauss);
