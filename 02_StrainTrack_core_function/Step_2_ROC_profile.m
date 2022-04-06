%% Part 1: define the variables to store information
ROCs=[];  %% 1: Best ROC; 2. Inter/Intra personal Cutoff; 3. Axiscutoff1; 4. Axiscutoff2
mkdir ROC_figures
load("Profile_Summary.mat")
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
%% Part 2: for each species, find the cutoff sets that gives the best ROC
% Also plot the ROC and print out the cutoffs
for sp=1:40;
    % Species-specific input data
    InterProf_comb=InterProfAll{sp};
    IntraProf_comb=IntraProfAll{sp};
    if length(IntraProf_comb) < 2 | length(InterProf_comb) < 2;
        ROCs=[ROCs;[0 0 0 0 0 0 0]];
    else
    % Markers to compare with
    max_roc = 0;
    max_roc_index = 0;
    max_roc_cutoffs=[];
    
    % Go through the axiscutoffs:
    for axcmbi = 80; % fixed cutoffs to determine AGDs
        if axiscutoff_comb(axcmbi,2)>10;
        axcmbi
        InterProf=InterProf_comb(:,axcmbi);
        IntraProf=IntraProf_comb(:,axcmbi); 
        FP=[];FN=[];
        cutoff=0;
        maxfnfp=0;
        tps=0;
        tns=0;
        for th = 0:0.0001:1;
            fp = sum(InterProf<th)/length(InterProf);FP=[FP;fp];
            tn = sum(IntraProf<th)/length(IntraProf);FN=[FN;tn];
    %         fp = sum(InterProf<th);
    %         fn = sum(IntraProf<th);
            if (1-fp)+tn>maxfnfp;
                maxfnfp=(1-fp)+tn;
                cutoff=th;
                tps=1-fp;
                tns=tn;
            end
        end
        % Compute ROC
        ROC=0;
        ybase=0;
        for bs = 2:length(FP);
            dx = FP(bs)-FP(bs-1); dy = FN(bs)-FN(bs-1);
            ROC = ROC+ybase*dx+0.5*dx*dy;
            ybase=ybase+dy;
        end
        if ROC > max_roc;
            max_roc_index = axcmbi;
            max_roc_cutoffs = [cutoff, axiscutoff_comb(axcmbi,1),axiscutoff_comb(axcmbi,2)];
            % for plotting purpose
            BestInterProf = InterProf; 
            BestIntraProf = IntraProf;
            BestFP=FP;
            BestFN=FN;
            max_roc=ROC;
        end
        end
    end
    % Update the ROCs variable with the new species information
    ROCs = [ROCs;[max_roc,max_roc_cutoffs,maxfnfp,tps,tns]];
    
        
        
    % Plot the best ROC
    figure(1);
    subplot(1,3,1);
    hist(BestInterProf,100);xlim([0 0.25]);
    subplot(1,3,2);hold on;
    hist(BestIntraProf,100);xlim([0 0.25]);
    subplot(1,3,3);hold on;
    plot(BestFP,BestFN,'r');    
    
    xlabel(num2str(max_roc))
    subplot(1,3,2);hold on;
    xlabel(num2str(max_roc_cutoffs(1)))
    subplot(1,3,1);hold on;
    xlabel([num2str(max_roc_cutoffs(2)) '+' num2str(max_roc_cutoffs(3))])
    saveas(gcf,['ROC_figures/sp_' num2str(sp) GNs{sp} '.png']);
       

    close all
    end
end