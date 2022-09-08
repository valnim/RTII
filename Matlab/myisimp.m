function flag = myisimp(T,P)

%Überprüfe für T(s)
G = T;
a = myisproper(G);
b = myisstable(G);

%Überprüfe für Tu(s)
G1 = minreal(T/P);

c = myisproper(G1);
d = myisstable(G1);

%Überprüfe T(s) und Tu(s) auf Kriterien a und c lt. Skript, wenn beide erfüllt --> implementierbar
if a==1 && b==1 && c==1 && d==1
    flag = 1;
    disp('T(s) ist für diese Strecke implementierbar');
    
else
   flag = 0;
   disp('T(s) ist nicht für diese Strecke implementierbar');
end
end

