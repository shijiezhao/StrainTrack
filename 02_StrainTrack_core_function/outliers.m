%% This function computes the percentage of 5K genomic fragments that are different between samples
%% Given a set of parameters/thresholds
function ol = outliers(ds1,ds2,threshold,axiscutoff1,quantilecut,axiscutoff2);
    quasi_median_Xs=0.5*(quantile(ds1,quantilecut)+quantile(ds1,1-quantilecut));
    quasi_median_Ys=0.5*(quantile(ds2,quantilecut)+quantile(ds2,1-quantilecut));

if quasi_median_Xs>threshold & quasi_median_Ys>threshold;
    GenomeSectorLength = length(ds1);
    Xs = ds1; Ys = ds2;
    ol=[];
    for i = 1:length(axiscutoff1);
        for j = 1:length(axiscutoff2);
            a1 = axiscutoff1(i); a2 = axiscutoff2(j);
            Outlier1 = sum(Xs<quasi_median_Xs/a2 & Ys>a1*quasi_median_Ys*2);
            Outlier2 = sum(Xs>a1*quasi_median_Xs*2 & Ys<quasi_median_Xs/a2);
            dif = (Outlier1+Outlier2)/GenomeSectorLength;
            ol=[ol dif];
        end
    end
else;
    ol = -1;
end