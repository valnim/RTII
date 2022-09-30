function [isimp_ext__flag,modify_flag, Tresult] = myisimpl_extended(P,T)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
modify_flag = 0;
s = tf('s');

%Überprüfe für T(s) auf Bibo Stabilität
if myisstable(T) == 1 % T(s) is Bibo Stabil
    %Überprüfe instabile Nullstellen von P(s) sind Nullstellen von T(s)
    nu = zero(P);
    nut = zero(T);
    
    T_neu = T;
    for i = 1:length(nu)
        if (real(nu(i)) > 0) && ~ismember(nu(i), nut)
            % T(s) modifizieren
            T_neu = T_neu * (s - real(nu(i)));
            modify_flag = 1;
        end
    end

    % Polüberschuss prüfen
    if (length(pole(T_neu)) - length(zero(T_neu))) < (length(pole(P)) - length(zero(P)))
        %T(s) modifizieren
        k = -((length(pole(T_neu)) - length(zero(T_neu))) - (length(pole(P)) - length(zero(P))));
        T_neu = T_neu / (s+2)^k;
        modify_flag = 1;
    end
    isimp_ext__flag = 1;
    
    figure(1)
    clf
    step(T, 10);
    grid on;
    hold on;

    if modify_flag == 1
        Tresult = T_neu;
        step(T_neu, 10);
        legend('T', 'T_neu')
    else
        Tresult = T;
        legend('T')
    end
    


else      % T(s) is nicht Bibo Stabil
    isimp_ext__flag = 0;
    Tresult = [];
    
    figure(1)
    clf
    step(T, 10);
    grid on;
end
end