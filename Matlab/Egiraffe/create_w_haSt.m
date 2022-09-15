function w=create_w_haSt(g_w)
%
%   Generiere w wie in Angabe 3.2 beschrieben
%
%   w=create_w_haSt(g_w)
%
%   alle Nullstellen bei s = -5
%   d.h. (s+5)^(g_w)
%   
%   Berechnung per tf
%
% (c) Hannes Schwingenschlögl & Stefan Zausinger
%
%

% old:
% size = g_w + 1 ;
% Pascal = pascal(size);
% w = Pascal(size:size-1:end-1);

% new:
s=zpk('s');
poly = (s+5)^g_w;
[w,~]=tfdata(poly,'v');
