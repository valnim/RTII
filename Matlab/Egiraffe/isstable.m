function flag=isstable(P)
%
%   Überprüfung, ob Nennerpolynom von P stabil ist
%
%   flag=isstable(P)
%
%   flag=0 ... nicht stabil
%   flag=1 ... stabil
%
% (c) M.Horn IRT TUG
%

flag=1; % d.h. stabil

[num,den]=tfdata(P,'v');

if P.Ts>0  % zeitdiskret
    if max(abs(roots(den)))>(1-eps)
        flag=0;
        return;
    end
    
else    % zeitkontinuierlich
    if max(real(roots(den)))>-eps
        flag=0;
        return;
    end
end
