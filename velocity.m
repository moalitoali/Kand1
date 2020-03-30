%Given inputs energy and ion, this function spits out the velocity of ion.
%Non relativistic 
%

function v = velocity(E,A)
u = 1.6605394e-27;          %atomic mass unit
m = A*u;                    %mass of ion [Kg]
E = E*1.60217662e-19;       %converting Ev to joule

v = sqrt((2*E)/m);

end 