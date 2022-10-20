function [isimp_ext__flag,modify_flag, Tresult] = myisimpl_extended(P,T)
%  Überprüfung auf Implementierbarkeit
modify_flag = 0;
s = tf('s');

%Überprüfe für T(s) auf Bibo Stabilität
if myisstable(T) == 1 % T(s) is Bibo Stabil
    %Überprüfe instabile Nullstellen von P(s) sind Nullstellen von T(s)
    mu = zero(P);
    mut = zero(T);
    
    T_neu = T;
    for i = 1:length(mu)
        if (real(mu(i)) > 0) && ~ismember(real(mu(i)), mut)
            % T(s) modifizieren
            T_neu = T_neu * (s - real(mu(i)));
            modify_flag = 1;
        elseif (real(mu(i)) > 0) && ismember(real(mu(i)), mut)
            for j = 1:length(mut)
                if mut(j) == real(mu(i))
                    mut(j) = 0;
                    break;
                end
            end
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