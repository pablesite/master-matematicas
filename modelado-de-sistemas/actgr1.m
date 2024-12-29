close all;

wholesize = size(out.simout);
tsize = wholesize(1);
nvar = wholesize(2)/4; 
t = 1/1000:1/1000:tsize/1000;
t = t';

Cgut = zeros(tsize, nvar);
C1 = zeros(tsize, nvar);
C2 = zeros(tsize, nvar);
Ce = zeros(tsize, nvar);
Effect = zeros(tsize, nvar);

E0 = 10;
Emax = 5.17;
EC50 = 9.98;


for i=1:nvar
    Cgut(:, i) = out.simout(:, i+0*nvar);
    C1(:, i) = out.simout(:, i+1*nvar);
    C2(:, i) = out.simout(:,i+2*nvar);
    Ce(:, i) = out.simout(:,i+3*nvar);

    Effect(:, i) = E0 - ((Emax*Ce(:, i))./(EC50 + Ce(:, i)));
end

[Cgutmax, iCgutmax] = max(Cgut);
[C1max, iC1max] = max(C1);
[C2max, iC2max] = max(C2);
[Cemax, iCemax]  = max(Ce);
[Effectmax, iEffectmax]  = min(Effect);

figure(1)
plot(t, C1, 'b')
hold on
plot(t, Ce, 'r')
plot(iC1max/1000, C1max, 'b*', 'MarkerSize', 10, 'MarkerFaceColor', 'r'); 
plot(iCemax/1000, Cemax, 'r*', 'MarkerSize', 10, 'MarkerFaceColor', 'r'); 
grid on

figure(2)
plot(t, Effect, 'g')
hold on
plot(iEffectmax/1000, Effectmax, 'g*', 'MarkerSize', 10, 'MarkerFaceColor', 'r'); 
grid on


%%%

% close all;
% 
% wholesize = size(out.simout);
% tsize = wholesize(1);
% nvar = 5; 
% t = 1/1000:1/1000:tsize/1000;
% t = t';
% 
% Cgut = zeros(tsize, 1);
% C1 = zeros(tsize, nvar);
% C2 = zeros(tsize, nvar);
% Ce = zeros(tsize, nvar);
% Effect = zeros(tsize, nvar);
% 
% E0 = 10;
% Emax = 5.17;
% EC50 = 9.98;
% 
% Cgut = out.simout(:, 1);
% 
% for i=1:nvar
%     C1(:, i) = out.simout(:, i+0*nvar+1);
%     C2(:, i) = out.simout(:,i+1*nvar+1);
%     Ce(:, i) = out.simout(:,i+2*nvar+1);
% 
%     Effect(:, i) = E0 - ((Emax*Ce(:, i))./(EC50 + Ce(:, i)));
% end
% 
% [Cgutmax, iCgutmax] = max(Cgut);
% [C1max, iC1max] = max(C1);
% [C2max, iC2max] = max(C2);
% [Cemax, iCemax]  = max(Ce);
% [Effectmax, iEffectmax]  = min(Effect);
% 
% figure(1)
% plot(t, C1, 'b')
% hold on
% plot(t, Ce, 'r')
% plot(iC1max/1000, C1max, 'b*', 'MarkerSize', 10, 'MarkerFaceColor', 'r'); 
% plot(iCemax/1000, Cemax, 'r*', 'MarkerSize', 10, 'MarkerFaceColor', 'r'); 
% grid on
% 
% figure(2)
% plot(t, Effect, 'g')
% hold on
% plot(iEffectmax/1000, Effectmax, 'g*', 'MarkerSize', 10, 'MarkerFaceColor', 'r'); 
% grid on