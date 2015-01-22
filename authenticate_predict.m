data = get_dataset();

%live
l1 = wavread('C:\Users\Cain\Documents\MATLAB\opiconsole_win_v1.40_20140427\live.wav');
live = pqrst(l1, 123);

holdout =  live;    % to be withheld for testing

test = holdout(:, 1:9);
answers = holdout(:, 10);
features = data(:, 1:9);
label = data(:,10);

% random forest model
B = TreeBagger(50, features, label);

% make predictions
Y = predict(B, test(:, 1:9));
Y = str2double(Y);


% calculate accuracy
perform = [Y, answers];
[l_perform, w_perform] = size(perform);

correct = 0;
guess_allan = 0;
guess_davin = 0;
guess_nhieu = 0;
for p = 1:l_perform
    if perform(p,1) == perform(p, 2)
        correct = correct + 1;
    end
    
    if perform(p,1) == 0
        guess_allan = guess_allan + 1;
    end
    
    if perform(p,1) == 1
        guess_davin = guess_davin + 1;
    end
    
    if perform(p,1) == 2
        guess_nhieu = guess_nhieu + 1;
    end
end

disp(correct/l_perform);
disp(guess_allan);
disp(guess_davin);
disp(guess_nhieu);

guess = 123;

if guess_allan >= guess_davin && guess_allan >= guess_nhieu
    guess = 0;
end

if guess_davin >= guess_allan && guess_davin >= guess_nhieu
    guess = 1;
end

if guess_nhieu >= guess_allan && guess_nhieu >= guess_davin
    guess = 2;
end

%test_file = input('Test File: ');
%disp(test_file);


fileID = fopen('C:\Users\Cain\Documents\MATLAB\opiconsole_win_v1.40_20140427\matlab\authenticate_output.txt', 'w');
%fprintf(fileID,'%1.4f\n',correct/l_perform);
fprintf(fileID,'%1.0f\n',guess);
fclose(fileID);


%figure;
%plot(ecg_h);
%[XMAX,IMAX,XMIN,IMIN] = extrema(ecg_h(:,1));
%hold on
%plot(IMAX,XMAX,'r*',IMIN,XMIN,'g*', qrs_i_raw_a1, qrs_amp_raw_a1, 'y*');axis tight;



%HDR = sopen('C:\Users\Cain\Documents\MATLAB\opiconsole_win_v1.40_20140427\allan\D20140712_134836_164A.edf', 'r');
%[S,HDR] = sread(HDR, 1);

%HDR2 = qrsdetect(S, 100);
%HDR2.EVENT
%HDR = sclose(HDR);
%


%qrs_amp_raw2
