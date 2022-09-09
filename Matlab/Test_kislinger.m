clc
s = tf('s');
%--------------------------------------------------------------------------
Gs = 1 / (s^2+2*s+1); %Übertragungsfunktion

[numRt,denRt] = tfdata(Gs,'v'); % 