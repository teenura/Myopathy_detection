clear all
clc
Td=load('ap_en.txt');
% load('Fn.mat');
% load('Fm.mat');
s=vertcat(Td);
label(1:50,:)=1;
label(51:100,:)=2;
% label(101:150,1)=3;
[IDX,Z]=rankfeatures(s',label,'criterion','ttest');
% s=s(:,IDX(1:4,1));
% s(:,[4 8 12])=[];
s=s(:,[1]);
A=s(1:50,:);
B=s(51:100,:);
% C=s(101:150,:);

latencytr(1:30,1)=1;
latencytr(31:60,1)=2;
% latencytr(31:60,1)=2;
% latencytr(61:90,1)=3;

latencyte(1:20,1)=1;
latencyte(21:40,1)=2;
% latencyte(21:40,1)=2;
% latencyte(41:60,1)=3;

for i=1:20
    i
[train,test]=crossvalind('holdout',100,0.4);
train_data=vertcat(A(train,:),B(train,:));
test_data=vertcat(A(test,:),B(test,:));
svmstruct=svmtrain(train_data,latencytr,'kernel_function','linear');
class=svmclassify(svmstruct,test_data);
svmstruct=svmtrain(train_data,latencytr,'kernel_function','quadratic');
class1=svmclassify(svmstruct,test_data);
svmstruct=svmtrain(train_data,latencytr,'kernel_function','polynomial');
class2=svmclassify(svmstruct,test_data);
svmstruct=svmtrain(train_data,latencytr,'kernel_function','rbf');
class3=svmclassify(svmstruct,test_data);
class4=knnclassify(test_data,train_data,latencytr,6);
pred=fitNaiveBayes(train_data,latencytr);
class5=pred.predict(test_data);
obj = fitcdiscr(train_data,latencytr);
class6 = predict(obj,test_data);
Mdl = classregtree(train_data,latencytr);     % Train Classification Tree
class7 = eval(Mdl,test_data);
[accuracy(i) sensitivity(i) specificity(i) precision(i) recall(i)] = Evaluate(latencyte,class); %SVMlinear
[accuracy1(i) sensitivity1(i) specificity1(i) precision1(i) recall1(i)] = Evaluate(latencyte,class1); %SVMquad
[accuracy2(i) sensitivity2(i) specificity2(i) precision2(i) recall2(i)] = Evaluate(latencyte,class2); %SVMpoly
[accuracy3(i) sensitivity3(i) specificity3(i) precision3(i) recall3(i)] = Evaluate(latencyte,class3); %SVMrbf
[accuracy4(i) sensitivity4(i) specificity4(i) precision4(i) recall4(i)] = Evaluate(latencyte,class4); %kNN
[accuracy5(i) sensitivity5(i) specificity5(i) precision5(i) recall5(i)] = Evaluate(latencyte,class5);%NaiveBayes
[accuracy6(i) sensitivity6(i) specificity6(i) precision6(i) recall6(i)] = Evaluate(latencyte,class6);%Discriminant analysis
[accuracy7(i) sensitivity7(i) specificity7(i) precision7(i) recall7(i)] = Evaluate(latencyte,class7);%Decision tree
end

aaacc_mean=mean(accuracy);
aaacc_max=max(accuracy);
stdacc=std(accuracy);
aaaspecificity=mean(specificity);
stdspecificity=std(specificity);
aaasensitivity=mean(sensitivity);
stdsensitivity=std(sensitivity);
aaaprecision=mean(precision);
stdprecision=std(precision);
aaarecal=mean(recall);
stdrecal=std(recall);
res=horzcat(aaacc_mean,aaacc_max,stdacc,aaaspecificity,stdspecificity,aaasensitivity,stdsensitivity,aaaprecision,stdprecision,aaarecal,stdrecal);

aaacc_mean=mean(accuracy1);
aaacc_max=max(accuracy1);
stdacc=std(accuracy1);
aaaspecificity=mean(specificity1);
stdspecificity=std(specificity1);
aaasensitivity=mean(sensitivity1);
stdsensitivity=std(sensitivity1);
aaaprecision=mean(precision1);
stdprecision=std(precision1);
aaarecal=mean(recall1);
stdrecal=std(recall1);
res1=horzcat(aaacc_mean,aaacc_max,stdacc,aaaspecificity,stdspecificity,aaasensitivity,stdsensitivity,aaaprecision,stdprecision,aaarecal,stdrecal);

aaacc_mean=mean(accuracy2);
aaacc_max=max(accuracy2);
stdacc=std(accuracy2);
aaaspecificity=mean(specificity2);
stdspecificity=std(specificity2);
aaasensitivity=mean(sensitivity2);
stdsensitivity=std(sensitivity2);
aaaprecision=mean(precision2);
stdprecision=std(precision2);
aaarecal=mean(recall2);
stdrecal=std(recall2);
res2=horzcat(aaacc_mean,aaacc_max,stdacc,aaaspecificity,stdspecificity,aaasensitivity,stdsensitivity,aaaprecision,stdprecision,aaarecal,stdrecal);

aaacc_mean=mean(accuracy3);
aaacc_max=max(accuracy3);
stdacc=std(accuracy3);
aaaspecificity=mean(specificity3);
stdspecificity=std(specificity3);
aaasensitivity=mean(sensitivity3);
stdsensitivity=std(sensitivity3);
aaaprecision=mean(precision3);
stdprecision=std(precision3);
aaarecal=mean(recall3);
stdrecal=std(recall3);
res3=horzcat(aaacc_mean,aaacc_max,stdacc,aaaspecificity,stdspecificity,aaasensitivity,stdsensitivity,aaaprecision,stdprecision,aaarecal,stdrecal);

aaacc_mean=mean(accuracy4);
aaacc_max=max(accuracy4);
stdacc=std(accuracy4);
aaaspecificity=mean(specificity4);
stdspecificity=std(specificity4);
aaasensitivity=mean(sensitivity4);
stdsensitivity=std(sensitivity4);
aaaprecision=mean(precision4);
stdprecision=std(precision4);
aaarecal=mean(recall4);
stdrecal=std(recall4);
res4=horzcat(aaacc_mean,aaacc_max,stdacc,aaaspecificity,stdspecificity,aaasensitivity,stdsensitivity,aaaprecision,stdprecision,aaarecal,stdrecal);


aaacc_mean=mean(accuracy5);
aaacc_max=max(accuracy5);
stdacc=std(accuracy5);
aaaspecificity=mean(specificity5);
stdspecificity=std(specificity5);
aaasensitivity=mean(sensitivity5);
stdsensitivity=std(sensitivity5);
aaaprecision=mean(precision5);
stdprecision=std(precision5);
aaarecal=mean(recall5);
stdrecal=std(recall5);
res5=horzcat(aaacc_mean,aaacc_max,stdacc,aaaspecificity,stdspecificity,aaasensitivity,stdsensitivity,aaaprecision,stdprecision,aaarecal,stdrecal);

aaacc_mean=mean(accuracy6);
aaacc_max=max(accuracy6);
stdacc=std(accuracy6);
aaaspecificity=mean(specificity6);
stdspecificity=std(specificity6);
aaasensitivity=mean(sensitivity6);
stdsensitivity=std(sensitivity6);
aaaprecision=mean(precision6);
stdprecision=std(precision6);
aaarecal=mean(recall6);
stdrecal=std(recall6);
res6=horzcat(aaacc_mean,aaacc_max,stdacc,aaaspecificity,stdspecificity,aaasensitivity,stdsensitivity,aaaprecision,stdprecision,aaarecal,stdrecal);

aaacc_mean=mean(accuracy7);
aaacc_max=max(accuracy7);
stdacc=std(accuracy7);
aaaspecificity=mean(specificity7);
stdspecificity=std(specificity7);
aaasensitivity=mean(sensitivity7);
stdsensitivity=std(sensitivity7);
aaaprecision=mean(precision7);
stdprecision=std(precision7);
aaarecal=mean(recall7);
stdrecal=std(recall7);
res7=horzcat(aaacc_mean,aaacc_max,stdacc,aaaspecificity,stdspecificity,aaasensitivity,stdsensitivity,aaaprecision,stdprecision,aaarecal,stdrecal);

resf=vertcat(res,res1,res2,res3,res4,res5,res6,res7);

