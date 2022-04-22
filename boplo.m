clc
clear all
f1=xlsread('healthyfeature.xlsx');
f2=xlsread('myopathyfeature.xlsx');
x1=f1(:,7);
x2=f2(:,7);
x3=f1(:,11);
x4=f2(:,11);
x5=f1(:,15);
x6=f2(:,15);
x7=f1(:,19);
x8=f2(:,19);
x9=f1(:,23);
x10=f2(:,23);
x11=f1(:,27);
x12=f2(:,27);
% x13=f1(:,26);
% x14=f2(:,26);
% x15=f1(:,30);
% x16=f2(:,30);
figure(1)
boxplot([x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12],'label',{'IMF1(H)','IMF1(M)','IMF2(H)','IMF2(M)','IMF3(H)','IMF3(M)','IMF4(H)','IMF4(M)','IMF5(H)','IMF5(M)','IMF6(H)','IMF6(M)'},'notch','on','whisker',1);
ylabel('Approximate Entropy');

% figure(2)
% boxplot([x9,x10,x11,x12,x13,x14,x15,x16],'label',{'IMF5(H)','IMF5(M)','IMF6(H)','IMF6(M)','IMF7(H)','IMF7(M)','IMF8(H)','IMF8(M)'},'notch','on','whisker',1);
% ylabel('Approximate Entropy');

% uu=double([(x1),(x2)]);
% m=uu(:,[1,2]);
% p = anova1(m)
