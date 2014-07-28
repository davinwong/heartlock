function [tPQRST]=pqrst(wave,USER_ID)
fs = 400;
gr = 0;
[qrs_amp_raw_a1,qrs_i_raw_a1,delay_a1,ecg_mean]=pan_tompkin(wave,fs,gr);
f1=5; %cuttoff low frequency to get rid of baseline wander
f2=15; %cuttoff frequency to discard high frequency noise
Wn=[f1 f2]*2/fs; % cutt off based on fs
N = 3; % order of 3 less processing
[a,b] = butter(N,Wn); %bandpass filtering
ecg_h = filtfilt(a,b,wave);
ecg_h = ecg_h/ max( abs(ecg_h));
qrs_i_raw_a1 = times(qrs_i_raw_a1, 2) - (delay_a1 + 3);
[XMAX,IMAX,XMIN,IMIN] = extrema(ecg_h(:,1));

IXMAX=[IMAX XMAX];
IXMAX=sortrows(IXMAX,1);
IXMIN=[IMIN XMIN];
IXMIN=sortrows(IXMIN,1);
[lmax,wmax] = size(IXMAX);
[lmin,wmin] = size(IXMIN);
tPQRST=[];

max_pointer = 1;
min_pointer = 1;
    
% iterate through Rx values from pan-tomp
for r = 1:(numel(qrs_i_raw_a1))
    r_element = qrs_i_raw_a1(r);

    % get max P R T
    for m = max_pointer:lmax
        max_element = IXMAX(m,1);
        if abs(r_element-max_element) < 10
            tPQRST(r,1) = IXMAX(m-1,1);
            tPQRST(r,2) = IXMAX(m-1,2);
            tPQRST(r,5) = IXMAX(m,1);
            tPQRST(r,6) = IXMAX(m,2);
            tPQRST(r,9) = IXMAX(m+1,1);
            tPQRST(r,10) = IXMAX(m+1,2);
            max_pointer = m;
            break
        end    
    end    
    
    % get min Q S
    for m = min_pointer:lmin
        if r_element > IXMIN(m,1) && r_element < IXMIN(m+1,1)
            tPQRST(r,3) = IXMIN(m,1);
            tPQRST(r,4) = IXMIN(m,2);
            tPQRST(r,7) = IXMIN(m+1,1);
            tPQRST(r,8) = IXMIN(m+1,2);
            min_pointer = m;
            break
        end    
    end
end

% calculate x-differences
% replace tx with (tx-sx), replace sx with (sx-rx)
[lPQRST,wPQRST] = size(tPQRST);
for i = 1:lPQRST
    tPQRST(i,9) = tPQRST(i,9) - tPQRST(i,7);
    tPQRST(i,7) = tPQRST(i,7) - tPQRST(i,5);
    tPQRST(i,5) = tPQRST(i,5) - tPQRST(i,3);
    tPQRST(i,3) = tPQRST(i,3) - tPQRST(i,1);
    tPQRST(i,1) = 0; % px is now useless
end

% remove px
tPQRST = tPQRST(:, 2:10);

% append Rows x 1 array of Labels ('allan', 'davin'..)
% USER_ID of 0 = allan
% 1 = davin
% 2 = nhieu
tPQRST(:, 10) = ones(lPQRST,1) * USER_ID;

end
