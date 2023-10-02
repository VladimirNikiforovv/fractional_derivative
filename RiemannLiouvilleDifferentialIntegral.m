clc
clearvars
cla
close all

a = 15;

h = 0.01;

t = complex(-a:h:a);

%порядок производной
D =  1/2;

pf = 1/gamma(1-D);

dfx = zeros(1,length(t));

ddfx = zeros(1,length(t));

for i = 1:length(t)
%нтеграл Римана-Лиувиля
fun = @(x) sin(2.*x).*(x - t(i)).^(-D);
dfx(i) =  integral(fun,-2,t(i));
if i > 1
ddfx(i) = pf*(dfx(i)-dfx(i-1))/h;
end
end
% первая часть под функцией плот численный расчет через интеграл
% Римана-Лиувиля вторая аналитически вычисленная функция для порядка взятия
% производной 1/2
plot(t, (-imag(ddfx)) , t, (real(sqrt(2).*sin(2.*t+pi/4))));
