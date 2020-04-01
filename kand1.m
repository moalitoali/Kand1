%Experimental setup @ tandemlab in Uppsala
d1 = 0.40;                            % distance between MCP1 & MCP2
d2 = 0.10;                            % distance between MCP2 & Si/detector

A = 79.904;                           % atomic mass of ion
E = 44e6;                             % Energy of ion
%E = [44e6 43e6 40e6];
%A = [79 79 79];

v = velocity(E, A);                    % velocity of Ion 

TOF1 = TOF(d1, v);                    
TOF2 = TOF(d1+d2, v);

hold on;
x = linspace(0, 100e6, 1000); % energy
sigma = [5e6 7e6 9e6];
for i=1:length(sigma)
    gauss = normpdf(x, E, sigma(i));
    
    plot(x, gauss);
    xlabel('energy');
end
plot(x, peak(x), '*');
hold off;

% x = linspace(0, 50, 100);
% mean = 25;
% sigma = 5;
% gauss = normpdf(x, mean, sigma);
% 
% figure(1);
% plot(x, gauss);