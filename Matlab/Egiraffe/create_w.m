function w=create_w(g_w)
%
%   Generiere w wie in Angabe 3.2 beschrieben
%
%   w=create_w(g_w)
%
%   alle Nullstellen bei s = -1
%   d.h. (s+1)^(g_w)
%   
%   Berechnung per Pascal-Dreieck
%
% (c) Hannes Schwingenschlögl & Stefan Zausinger
%
%

size = g_w + 1 ;
Pascal = pascal(size);
w = Pascal(size:size-1:end-1);