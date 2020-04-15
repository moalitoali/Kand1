clear all;

% load data inputs
[holder, delimiterOut] = importdata('data.txt'); 
simnra = holder.data;
gain = 40e3;
offset = 0;

% plot data
figure(1)
yyaxis left;
plot(simnra(:, 1), simnra(:, 2));
ylabel('counts');
xlabel('channel');
hold on;

A = 79.904; % atomic mass of Br
E_Br = simnra(755:867,1).*gain+offset;
E_Au = simnra(385:451,1).*gain+offset;
E_Si = simnra(1:388,1).*gain+offset;

d1 = 0.40; % distance between MCP1 & MCP2
d2 = 0.10; % distance between MCP2 & Si/detector

% Introduce energy resolutions
sigma_E = 0.0017;
E_spread = zeros(1, length(E_Br));
for i=1:length(E_Br)
    E_spread(i) = normrnd(E_Br(i), sigma_E);
end

v = velocity(E_spread, A);

% Ideal TOFs
TOF1 = TOF(d1, v);                    
TOF2 = TOF(d1+d2, v);

% Introduce timing resolutions
sigma_MCP = 140e-9;
sigma_Si = 150e-9;
TOF1_spread = zeros(1, length(TOF1));
TOF2_spread = zeros(1, length(TOF2));
for i=1:length(TOF1)
    TOF1_spread(i) = normrnd(normrnd(TOF1(i), sigma_MCP), sigma_MCP);
    TOF2_spread(i) = normrnd(normrnd(TOF1(i), sigma_MCP), sigma_Si);
end

%figure(2)
yyaxis right;
plot(simnra(755:867,1), TOF1, '-m');
%plot(simnra(755:867,1), TOF2, '-g');
plot(simnra(755:867,1), TOF1_spread, '*m');
%plot(simnra(755:867,1), TOF2_spread, '*g');
ylabel('time [s]');

hold off;