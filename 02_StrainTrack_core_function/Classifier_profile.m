function [singlespeciesclassifiers,comparename] = Classifier(DataStruct,Names,nm1,nm2,threshold,ROCs,perc,quantilecut);
%% Engineer the names
NM1 = Names{nm1};
NM2 = Names{nm2};

rec=[];

NM1 = strsplit(Names{nm1},'_');nm1n=str2num(NM1{1});
NM2 = strsplit(Names{nm2},'_');nm2n=str2num(NM2{1});

comparename=(nm1n==nm2n);
%% Select species based on ROC cutoff

goodspecies=find(ROCs(:,1)>perc);
cutoffs=ROCs(:,2);
axiscutoff1=ROCs(:,3);
axiscutoff2=ROCs(:,4);
%%
singlespeciesclassifiers=[];
for selectedspecies = 1:length(goodspecies); % For each species
    i=goodspecies(selectedspecies); % Species order in the originals
    quasi_median_Xs=0.5*(quantile(DataStruct{nm1}{i},quantilecut)+quantile(DataStruct{nm1}{i},1-quantilecut));
    quasi_median_Ys=0.5*(quantile(DataStruct{nm2}{i},quantilecut)+quantile(DataStruct{nm2}{i},1-quantilecut));
    if quasi_median_Xs>threshold & quasi_median_Ys>threshold;
        GenomeSectorLength = length(DataStruct{nm1}{i});
        Xs = DataStruct{nm1}{i}; Ys = DataStruct{nm2}{i};
        Outlier1 = sum(Xs<quasi_median_Xs/axiscutoff2(i) & Ys>axiscutoff1(i)*quasi_median_Ys*2);
        Outlier2 = sum(Xs>axiscutoff1(i)*quasi_median_Xs*2 & Ys<quasi_median_Ys/axiscutoff2(i));
        dif = (Outlier1+Outlier2)/GenomeSectorLength;
        [B,S] = polyfit(Xs,Ys, 1); p = polyfit(Xs,Ys, 1); yfit = polyval(p,Xs); yresid = Ys - yfit; SSresid = sum(yresid.^2); SStotal = (length(Ys)-1) * var(Ys);
        rsq = 1 - SSresid/SStotal;
        singlespeciesclassifiers=[singlespeciesclassifiers;[dif<cutoffs(i) rsq]];
    end
end
