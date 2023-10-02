clc
clearvars
cla
close all

%%

fs = 180 ;

totalTime = 34;

Ts = 1 / fs;

tic

t = -totalTime/2:Ts:totalTime/2 - Ts;

% функция от которой будет взяда дробная производная порядка 1/2
ft = sin(t) ; 

l = length(ft);

w = 0:l-1 ;

% порядок дифф
n = 1/2;

fw =  (fft(ft));

figure(1)
subplot(311)
plot(w, abs(fw))

dw = ( 1i * w ) .^ n;

ftt =  (ifft(dw.*fw));
%ifftshift
toc

% Аналитическая функция производной 
figure(1)
subplot(312)
plot(t,  sin(t+pi/4));  

figure(1)
subplot(313)
plot(t, real(ftt)/real(ftt(end)),t, imag(ftt)/imag(ftt(end)))
legend('real','imag')

% Численно вычисленная функция производной 
figure(1)
subplot(312)
hold on
plot(t,  imag(ftt)/imag(ftt(end) ))
hold off


