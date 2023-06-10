clear
close all
clc

%CV+CM
benar=0;
jumlahData=1907;
%
X = readmatrix('CLBPFlaviaLeavesHistogram.csv');
Y = X((1:end),31);
%}
%{
X = readmatrix('LBPFlaviaLeavesHistogram.csv');
Y = X((1:end),11);
%}

cvp = cvpartition(Y, 'KFold', 10);
%{
mdl = fitcknn(X,Y,'NumNeighbors',2,'Standardize',1,'CVPartition', cvp);
prediction = kfoldPredict(mdl);
confusionmat(prediction, Y)
for i=1:jumlahData
    if Y(i)==prediction(i)
        benar=benar+1;
    end
end
akurasi=(benar/jumlahData)*100;
%}

%CM
%
mdl = fitcknn(X,Y,'NumNeighbors',3,'Standardize',1);
predictedY = resubPredict(mdl);
for i=1:jumlahData
    if Y(i)==predictedY(i)
        benar=benar+1;
    end
end
akurasi=(benar/jumlahData)*100
cm = confusionchart(Y,predictedY);
cm.NormalizedValues;
cm.Title = 'Flavia Classification Using KNN';
cm.RowSummary = 'row-normalized';
cm.ColumnSummary = 'column-normalized';
%}