function flag = myisstable(G)
%Überprüfe Hurwitzpolynom

try
P = pole(G); %Nullstellen
catch
    P = 0;
end

R = real(P); %Realteile der Nullstellen

if all (R < 0) 
    flag = 1;
else
    flag = 0;
end

end

