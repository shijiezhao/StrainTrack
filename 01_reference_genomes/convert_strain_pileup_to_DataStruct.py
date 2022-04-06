import numpy as np
import scipy.io as sio

Dict={};Order={};B=[];
Dict['Alis_onder']=3865648;Order['Alis_onder']=0;B.append(np.zeros(778));
Dict['Alis_putredinis']=2550678;Order['Alis_putredinis']=1;B.append(np.zeros(515));
Dict['Barnesiella_intestinihominis']=3443906;Order['Barnesiella_intestinihominis']=2;B.append(np.zeros(693));
Dict['NZ_CP022412.2']=4570803;Order['NZ_CP022412.2']=3;B.append(np.zeros(919));
Dict['NZ_CP012801.1']=7084828;Order['NZ_CP012801.1']=4;B.append(np.zeros(1421));
Dict['gi|1026626831|gb|CP011531.1|']=5310365;Order['gi|1026626831|gb|CP011531.1|']=5;B.append(np.zeros(1067));
Dict['NZ_DS995527.1']=4184794;Order['NZ_DS995527.1']=6;B.append(np.zeros(841));
Dict['Bmass']=4646209;Order['Bmass']=7;B.append(np.zeros(934));
Dict['Bnordii']=5718278;Order['Bnordii']=8;B.append(np.zeros(1148));
Dict['NZ_CP012938.1']=6472489;Order['NZ_CP012938.1']=9;B.append(np.zeros(1299));
Dict['Bstercoris']=4009828;Order['Bstercoris']=10;B.append(np.zeros(806));
Dict['Buniform']=4719097;Order['Buniform']=11;B.append(np.zeros(948));
Dict['Buty_crossotus']=2496039;Order['Buty_crossotus']=12;B.append(np.zeros(504));
Dict['Cdiff']=4298133;Order['Cdiff']=13;B.append(np.zeros(864));
Dict['Clos_clostridioforme']=5655915;Order['Clos_clostridioforme']=14;B.append(np.zeros(1136));
Dict['Clos_symbiosum']=5352498;Order['Clos_symbiosum']=15;B.append(np.zeros(1075));
Dict['NZ_KB851182.1']=6377378;Order['NZ_KB851182.1']=16;B.append(np.zeros(1280));
Dict['AAVN02000022.1']=2438834;Order['AAVN02000022.1']=17;B.append(np.zeros(492));
Dict['Copro_comes']=3242215;Order['Copro_comes']=18;B.append(np.zeros(653));
Dict['Dialister_invisus']=1895960;Order['Dialister_invisus']=19;B.append(np.zeros(384));
Dict['Dorea_formicigenerans']=3186031;Order['Dorea_formicigenerans']=20;B.append(np.zeros(642));
Dict['Ecoli']=4641652;Order['Ecoli']=21;B.append(np.zeros(933));
Dict['Eubac_dolichum']=2191053;Order['Eubac_dolichum']=22;B.append(np.zeros(443));
Dict['Eubac_ramulus']=3447136;Order['Eubac_ramulus']=23;B.append(np.zeros(694));
Dict['Fpraus']=3090349;Order['Fpraus']=24;B.append(np.zeros(623));
Dict['Haemophilus_parainfluenzae']=2086875;Order['Haemophilus_parainfluenzae']=25;B.append(np.zeros(422));
Dict['Para_clara']=4233768;Order['Para_clara']=26;B.append(np.zeros(851));
Dict['Para_merdae']=4458741;Order['Para_merdae']=27;B.append(np.zeros(896));
Dict['Parasutterella_excrementihominis']=2831696;Order['Parasutterella_excrementihominis']=28;B.append(np.zeros(571));
Dict['Rose_intest']=4411375;Order['Rose_intest']=29;B.append(np.zeros(887));
Dict['Rose_inulin']=4048462;Order['Rose_inulin']=30;B.append(np.zeros(814));
Dict['Rumi_bromii']=2539482;Order['Rumi_bromii']=31;B.append(np.zeros(512));
Dict['Rumi_torques']=2741706;Order['Rumi_torques']=32;B.append(np.zeros(553));
Dict['Ruminocccus_gnavus']=3724077;Order['Ruminocccus_gnavus']=33;B.append(np.zeros(749));
Dict['Solo_moorei']=2335946;Order['Solo_moorei']=34;B.append(np.zeros(472));
Dict['Sutterella_wadsworthensis']=2725870;Order['Sutterella_wadsworthensis']=35;B.append(np.zeros(550));
Dict['Turici_sang']=2953411;Order['Turici_sang']=36;B.append(np.zeros(595));
Dict['Tyzz_nexilis']=3995628;Order['Tyzz_nexilis']=37;B.append(np.zeros(804));
Dict['NC_016077.1']=2487765;Order['NC_016077.1']=38;B.append(np.zeros(502));
Dict['NC_010655.1']=2664102;Order['NC_010655.1']=39;B.append(np.zeros(537));
Dict['NC_018011.1']=3734239;Order['NC_018011.1']=40;B.append(np.zeros(751));
Dict['NC_021030.1']=3763317;Order['NC_021030.1']=41;B.append(np.zeros(757));
Dict['NC_004307.2']=2260266;Order['NC_004307.2']=42;B.append(np.zeros(457));
Dict['gi|60491031|emb|CR626927.1|']=5205140;Order['gi|60491031|emb|CR626927.1|']=43;B.append(np.zeros(1046));
Dict['NC_014933.1']=3998906;Order['NC_014933.1']=44;B.append(np.zeros(804));
Dict['NC_008618.1']=2089645;Order['NC_008618.1']=45;B.append(np.zeros(422));
Dict['NC_004663.1']=6293358;Order['NC_004663.1']=46;B.append(np.zeros(1263));
Dict['CP013020.1']=5165891;Order['CP013020.1']=47;B.append(np.zeros(1038));
Dict['NC_012778.1']=2831304;Order['NC_012778.1']=48;B.append(np.zeros(571));
Dict['NC_012781.1']=3449685;Order['NC_012781.1']=49;B.append(np.zeros(694));
Dict['NC_015160.1']=4392288;Order['NC_015160.1']=50;B.append(np.zeros(883));
Dict['NC_009615.1']=4811379;Order['NC_009615.1']=51;B.append(np.zeros(967));
Dict['NC_015977.1']=3592125;Order['NC_015977.1']=52;B.append(np.zeros(723));

with open('strain.pileup') as f:
        lines = f.readlines()
        for line in lines:
                comps = line.split('\t')
                pos = int(comps[1])/5000
                gnm = Order[comps[0]]
                B[gnm][pos] = B[gnm][pos] + int(comps[3])
                
sio.savemat('output.mat',{'B':B});
