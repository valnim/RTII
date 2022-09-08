function flag = myisproper(G)
% gibt als flag = 1 zurück, falls G Grade zusammenstimmen

%Zählergrad:

try   
Znum_deg = length(zero(G));

catch
    Znum_deg = 0;
end

%Nennergrad:
try
Zden_deg = length(pole(G));
catch
    Zden_deg = 0;
end
%Vergleich:

if Zden_deg >= Znum_deg
    
    flag = 1;
    
else
    flag = 0;
end

end

