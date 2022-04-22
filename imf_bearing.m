clc
clear
Fs=1;                        % Sampling frequency
T=1/Fs;                      % Sample time                   
L=3000;                      % Length of signal
t=(0:L-1)*T;
fr=0.001;     
f=load('sin-1.txt');
g=f(:,1);
imf=emd(g); 
% plot IMFs
M = length(imf);
N = length(g);
Ts=1/Fs;
c = linspace(0,(N-2)*Ts,N);
for k1 = 0:5:M-1   % controls the no of plots per figure
   figure
   for k2 = 1:min(5,M-k1), subplot(5,1,k2),plot(c,imf{k1+k2}); %here too
       set(gca,'FontSize',5,'XLim',[0 c(end)]);
   end
   xlabel('Time');
end
d=imf{1,3}+imf{1,4}+imf{1,5}+imf{1,6}+imf{1,7}+imf{1,8}+imf{1,9};
figure
% plot (g, 'g')
% hold on
plot(c,d,'r')

r=snr(d,Fs)
%plot FFTs of lth IMFs
   N=8192;T=N/Fs;
   figure();
   Y=abs(fft(imf{7},N)); 
   freq=(0:N-1)/T;
   plot(freq,Y);xlabel('Frequency');
   
  

