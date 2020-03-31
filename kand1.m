%Experimental setup @ tandemlab in Uppsala
d1 = 0.40;                            % distance between MCP1 & MCP2
d2 = 0.10;                            % distance between MCP2 & Si/detector

A = 79.904;                           % Ion (# neutrons+protons)
E = 44e6;                             % Energy of ion
%E = [44e6 44e6 44e6];
%A = [79 79 79];

v = velocity(E,A);                    % velocity of Ion 

TOF1 = d1./v;                         % TOF1
TOF2 = (d1+d2)./v;                    % TOF2

x = linspace(0, 50, 1000);
mean = 25;
sigma = 5;
gauss = normpdf(x, mean, sigma);
plot(x, gauss);
