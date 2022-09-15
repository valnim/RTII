% ISIMP ... Implementierbarkeit
% 
%       flag=isimp(T,P)
%
%       P ... Strecke (tf)
%       T ... Führungsübertragungsfunktion (tf)
%
%       flag=1 ... T ist implementierbar
%       flag=0 ... T ist nicht implementierbar
%
% (c) M.Horn IRT TUG
%

function flag=isimp(T,P)

flag=1;
if ~isproper(T)
    flag=0;
    return;
end
if ~isstable(T)
    flag=0;
    return;
end

Tu=minreal(T/P);

if ~isproper(Tu)
    flag=0;
    return;
end
if ~isstable(Tu)
    flag=0;
    return;
end


