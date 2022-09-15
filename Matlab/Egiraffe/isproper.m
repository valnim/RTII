
function flag=isproper(P)
%
%   Überprüfung auf Realisierbarkeit 
%
%   flag=isproper(P)
%
%   flag=0 ... nicht realisierbar
%   flag=1 ... realisierbar
%
% (c) M.Horn IRT TUG
%

flag=1; % d.h. proper
[num,den]=tfdata(P,'v');

while (num(1)==0)
    num=num(2:end);
end

while (den(1)==0)
    den=den(2:end);
end

if length(num)>length(den)
    flag=0; % nicht ptoper
end

