%Experimental setup @ tandemlab in uppsala (?)
d1 = 0.40;                            %distance between MCP1 & MCP2
d2 = 0.10;                            %distance between MCP2 & Si/detector

A = 79.904;                           %Ion
E = 44e6;                             %Energy of ion

v = velocity(E,A);                    % velocity of Ion 

t1 = d1/v;
t2 = (d1+d2)/v;