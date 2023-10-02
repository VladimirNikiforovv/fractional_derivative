

clc
clearvars
cla
close all

%% вычисление дробной производной через преобразование фурье

fs = 50000;

totalTime = 5;

Ts = 1 / fs;

tic

t = -totalTime/2:Ts:totalTime/2 - Ts;

% функция от которой будет взяда дробная производная порядка 1/2
ft = t ; 

l = length(ft);

w = 0:l-1 ;

n = 1/2; % порядок дифф

fw = fftshift(fft(ft));

figure(1)
subplot(311)
plot(w,abs(fw))

dw = (-1i * w ) .^ n;

ftt = (ifft(dw.*fw));
%ifftshift
toc

% Аналитическая функция производной 
figure(1)
subplot(312)
plot(t, sqrt(t)/sqrt(t(end)));  

figure(1)
subplot(313)
plot(t, real(ftt),t, imag(ftt))
legend('real','imag')

% Численно вычисленная функция производной 
figure(1)
subplot(312)
hold on
plot(t, sqrt(abs(ftt))/sqrt(abs(ftt(end))))
hold off


