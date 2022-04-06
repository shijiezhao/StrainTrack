
%%%
% This script is to make a species profile for 
% cross sample comparison of AGD
%%%
%% 1. Load data
load('Coverage_Data.mat')
quantilecut=0.15;
axiscutoff1=[0.1 0.2 0.3 0.4 0.5 0.6 0.7 .8 .9];
axiscutoff2=[1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20];
axiscutoff_comb=[];
for i = 1:length(axiscutoff1);
    for j = 1:length(axiscutoff2);
        axiscutoff_comb=[axiscutoff_comb;[axiscutoff1(i) axiscutoff2(j)]]; %% Making a two-dimentional gid of paramters combinations
    end
end
threshold=1
%% Make species profile
InterProfAll={};   
IntraProfAll={};
for sp = 1:40;
    InterProfAll{sp}=[];
    IntraProfAll{sp}=[];
end

%% Compare each pair of samples
for i = 1:534;
    i
    for j = i+1:535;
        j
        nm1 = strsplit(Names{i},'_');nm1n=str2num(nm1{1});
        nm2 = strsplit(Names{j},'_');nm2n=str2num(nm2{1});
        for sp = 1:40;
            ds1 = DataStruct{i}{sp};ds2=DataStruct{j}{sp};
            OL = outliers(ds1,ds2,1,axiscutoff1,quantilecut,axiscutoff2);
            if length(OL)>1;
                if nm1n==nm2n;
                    IntraProfAll{sp}=[IntraProfAll{sp};OL];
                else;
                    InterProfAll{sp}=[InterProfAll{sp};OL];
                end
            end
    end
end
%     InterProfAll{sp}=InterProf;
%     IntreProfAll{sp}=IntraProf;
%     figure(1);hold on;
%     subplot(2,1,1);
%     hist(InterProf,100);xlim([0 0.25]);
%     subplot(2,1,2);
%     hist(IntraProf,100);xlim([0 0.25]);
%     saveas(gcf,['hist/sp_' num2str(sp) '.png']);
end
save Profile_Summary

            