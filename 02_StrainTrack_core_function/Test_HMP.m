
TP=0;
TN=0;
FP=0;
FN=0;
perc=0.975
quantilecut=0.15;
mkdir False_predictions
for nm1 = 1:534;
    nm1
    for nm2 = nm1+1:535;
        [singlespeciesclassifiers,comparename] = Classifier_profile(DataStruct,Names,nm1,nm2,threshold,ROCs,perc,quantilecut);
        if size(singlespeciesclassifiers,1)==0;
            resultsfromclassifier=0;
        else;
            resultsfromclassifier = (sum(singlespeciesclassifiers(:,1)>0 & singlespeciesclassifiers(:,2)>=0.5)/length(singlespeciesclassifiers))>=0.5 & sum(singlespeciesclassifiers(:,1)>0 & singlespeciesclassifiers(:,2)>0.5)>1;
            resultsfromclassifier = sum(singlespeciesclassifiers(:,1)>0)>2;
            % | sum(singlespeciesclassifiers>0)>3;
        end
%         resultsfromclassifier = sum(singlespeciesclassifiers>0)>2;
        if resultsfromclassifier==1 & comparename==1;
            TP=TP+1;
        end
        if resultsfromclassifier==1 & comparename==0;
            FP=FP+1;
            ComparisonPlot(DataStruct,Names,nm1,nm2,threshold,ROCs,perc,'FP',quantilecut);
        end
        if resultsfromclassifier==0 & comparename==1;
            FN=FN+1;
            ComparisonPlot(DataStruct,Names,nm1,nm2,threshold,ROCs,perc,'FN',quantilecut);
        end
        if resultsfromclassifier==0 & comparename==0;
            TN=TN+1;
        end
    end
end
TN
TP
FN
FP