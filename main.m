clear all
clc
Fs=50000;
T=1/Fs;
L=1000;
t=(0:L-1)*T;
num=xlsread('healthy1.xlsx');
fx=num(:,1);
figure
plot(t,fx);
%%%%%EMPERICAL MODE DECOMPSITION%%%%%%%%%
ss=fx;
imf=emd(ss); 
% plot of IMFs
M = length(imf);
N = length(ss);
Ts=1/Fs;
c = linspace(0,(N-2)*Ts,N);
% for k1 = 0:5:M-1   % modify this to control the no of plots per figure
%    figure
%    for k2 = 1:min(5,M-k1), subplot(5,1,k2),plot(c,imf{k1+k2}); %here too
%        set(gca,'FontSize',5,'XLim',[0 c(end)]);
%        grid on
%    end
%    xlabel('Time');
% end
A= cell2mat(imf);
AA=A';
imf1=AA(1:1000);
imf2=AA(1001:2000);
imf3=AA(2001:3000);
imf4=AA(3001:4000);
imf5=AA(4001:5000);
imf6=AA(5001:6000);
imf7=AA(6001:7000);
imf8=AA(7001:8000);
imf9=AA(8001:9000);
%Entropy of IMF's%
r=0.2*std(imf1);
saen1=SampEn(2,r,imf1,1);
apen1=ApEn(2,r,imf1,1);
fuen1=FuzzyEn(imf1,2,r,2);
s1=svd(imf1);
yf1=fft(imf1);
syf1=0.0;
for i=1:length(imf1)
  syf1= syf1 + (abs(yf1(i)));
end
yf1=yf1/syf1;
entr1=0.0;
entr2=0.0;
%entr3=0.0;
alpha=2;
for i=1:length(imf1)
 entr1=entr1+abs(yf1(i))*log2(abs(yf1(i)));
 entr2=entr2+(1/(1-alpha))*log2(abs(yf1(i).^alpha));
 %entr2=entr2+abs(yf1(i))*log2(abs(yf1(i)));
end
shentr1=-entr1;
renentr1=entr2;
R=[s1 saen1 apen1 fuen1 shentr1 renentr1]