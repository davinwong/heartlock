function [output]=get_dataset()
    persistent dataset;
    %dataset = [];
    load('C:\Users\Cain\Documents\MATLAB\opiconsole_win_v1.40_20140427\matlab\dataset', ['dataset']);

    if isempty(dataset)
        disp('Empty Dataset');

        %wave = wavread('C:\Users\Cain\Documents\MATLAB\opiconsole_win_v1.40_20140427\davin\D20140712_133459_164_davin1_true.wav');
        d1= wavread('C:\Users\Cain\Documents\MATLAB\opiconsole_win_v1.40_20140427\davin\D20140712_133459_164_davin1_true.wav');
        d2= wavread('C:\Users\Cain\Documents\MATLAB\opiconsole_win_v1.40_20140427\davin\D20140712_171308_164_1d2.wav');
        d3= wavread('C:\Users\Cain\Documents\MATLAB\opiconsole_win_v1.40_20140427\davin\D20140712_171159_164_1d3.wav');
        d4= wavread('C:\Users\Cain\Documents\MATLAB\opiconsole_win_v1.40_20140427\davin\D20140712_171042_164_1d4.wav');
        d5= wavread('C:\Users\Cain\Documents\MATLAB\opiconsole_win_v1.40_20140427\davin\D20140726_160340_164_1d5.wav');
        d20= wavread('C:\Users\Cain\Documents\MATLAB\opiconsole_win_v1.40_20140427\davin\D20140726_182027_164_1d20.wav');
        d21= wavread('C:\Users\Cain\Documents\MATLAB\opiconsole_win_v1.40_20140427\davin\D20140726_181606_164_1d21.wav');
        d22= wavread('C:\Users\Cain\Documents\MATLAB\opiconsole_win_v1.40_20140427\davin\D20140726_180839_164_1d22.wav');
        d23= wavread('C:\Users\Cain\Documents\MATLAB\opiconsole_win_v1.40_20140427\davin\D20140726_180321_164_1d23.wav');
        d24= wavread('C:\Users\Cain\Documents\MATLAB\opiconsole_win_v1.40_20140427\davin\D20140726_175834_164_1d24.wav');
        d30= wavread('C:\Users\Cain\Documents\MATLAB\opiconsole_win_v1.40_20140427\davin\D20140727_161854_164_1d30.wav');
        d31= wavread('C:\Users\Cain\Documents\MATLAB\opiconsole_win_v1.40_20140427\davin\D20140727_162321_164_1d31.wav');
        d32= wavread('C:\Users\Cain\Documents\MATLAB\opiconsole_win_v1.40_20140427\davin\D20140727_164551_164_1d32.wav');
        

        n1 = wavread('C:\Users\Cain\Documents\MATLAB\opiconsole_win_v1.40_20140427\nhieu\D20140712_134137_164_1n1.wav');
        n30 = wavread('C:\Users\Cain\Documents\MATLAB\opiconsole_win_v1.40_20140427\nhieu\D20140727_131748_164_1n30.wav');
        n31 = wavread('C:\Users\Cain\Documents\MATLAB\opiconsole_win_v1.40_20140427\nhieu\D20140727_132906_164_1n31.wav');
        n32 = wavread('C:\Users\Cain\Documents\MATLAB\opiconsole_win_v1.40_20140427\nhieu\D20140727_135045_164_1n32.wav');
        n33 = wavread('C:\Users\Cain\Documents\MATLAB\opiconsole_win_v1.40_20140427\nhieu\D20140727_141125_164_1n33.wav');

        a1 = wavread('C:\Users\Cain\Documents\MATLAB\opiconsole_win_v1.40_20140427\allan\D20140712_134836_164_1A.wav');
        a2 = wavread('C:\Users\Cain\Documents\MATLAB\opiconsole_win_v1.40_20140427\allan\D20140712_155657_164_1_Allan2.wav');
        a3 = wavread('C:\Users\Cain\Documents\MATLAB\opiconsole_win_v1.40_20140427\allan\D20140712_162625_164_1Allan_Regular_reading.wav');
        a4 = wavread('C:\Users\Cain\Documents\MATLAB\opiconsole_win_v1.40_20140427\allan\D20140712_162945_164_1Allan_walking.wav');
        a5 = wavread('C:\Users\Cain\Documents\MATLAB\opiconsole_win_v1.40_20140427\allan\D20140712_163211_164_1Allan_repositioning_sensor.wav');
        a6 = wavread('C:\Users\Cain\Documents\MATLAB\opiconsole_win_v1.40_20140427\allan\D20140726_153952_164_1allan.wav');
        a20 = wavread('C:\Users\Cain\Documents\MATLAB\opiconsole_win_v1.40_20140427\allan\D20140726_163233_164_1a20.wav');
        a21 = wavread('C:\Users\Cain\Documents\MATLAB\opiconsole_win_v1.40_20140427\allan\D20140726_175044_164_1a21.wav');
        a22 = wavread('C:\Users\Cain\Documents\MATLAB\opiconsole_win_v1.40_20140427\allan\D20140726_174524_164_1a22.wav');
        a23 = wavread('C:\Users\Cain\Documents\MATLAB\opiconsole_win_v1.40_20140427\allan\D20140726_173559_164_1a23.wav');
        a24 = wavread('C:\Users\Cain\Documents\MATLAB\opiconsole_win_v1.40_20140427\allan\D20140726_173036_164_1a24.wav');
        a25 = wavread('C:\Users\Cain\Documents\MATLAB\opiconsole_win_v1.40_20140427\allan\D20140726_172616_164_1a25.wav');
        a26 = wavread('C:\Users\Cain\Documents\MATLAB\opiconsole_win_v1.40_20140427\allan\D20140726_164019_164_1a26.wav');

        %allan
        data_a1 = pqrst(a1, 0);
        data_a2 = pqrst(a2, 0);
        data_a3 = pqrst(a3, 0);
        data_a4 = pqrst(a4, 0);
        data_a5 = pqrst(a5, 0);
        data_a6 = pqrst(a6, 0);
        data_a20 = pqrst(a20, 0);
        data_a21 = pqrst(a21, 0);
        data_a22 = pqrst(a22, 0);
        data_a23 = pqrst(a23, 0);
        data_a24 = pqrst(a24, 0);
        data_a25 = pqrst(a25, 0);
        data_a26 = pqrst(a26, 0);


        %davin
        data_d1 = pqrst(d1, 1);
        data_d2 = pqrst(d2, 1);
        data_d3 = pqrst(d3, 1);
        data_d4 = pqrst(d4, 1);
        data_d5 = pqrst(d5, 1);
        data_d20 = pqrst(d20, 1);
        data_d21 = pqrst(d21, 1);
        data_d22 = pqrst(d22, 1);
        data_d23 = pqrst(d23, 1);
        data_d24 = pqrst(d24, 1);
        data_d30 = pqrst(d30, 1);
        data_d31 = pqrst(d31, 1);
        data_d32 = pqrst(d32, 1);
        

        %nhieu
        
        data_n1 = pqrst(n1, 2);
        data_n30 = pqrst(n30, 2);
        data_n31 = pqrst(n31, 2);
        data_n32 = pqrst(n32, 2);
        data_n33 = pqrst(n33, 2);
        
        dataset = [data_a1; data_a2; data_a3; data_a4; data_a5; data_a6; data_a20; data_a21; data_a22; data_a23; data_a24; data_a25; data_a26; data_d1; data_d2; data_d3;data_d4;data_d5;data_d20;data_d21;data_d22;data_d23;data_d24;data_d30;data_d31;data_d32;data_n1;data_n30;data_n31;data_n32;data_n33;];
    end
    
    output = dataset;
    
    save('C:\Users\Cain\Documents\MATLAB\opiconsole_win_v1.40_20140427\matlab\dataset', ['dataset']);
end
