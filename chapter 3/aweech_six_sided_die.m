close all
clear all
display('rolling a six on a single die simulation')
display('Alex Weech 2/8/2019')
% determining as the sample size of rolling a die increases from 1 to 20000
% times how many sixes are rolled in that sample
% randi returns uniformly distributed integers within a range

nitr = 20000;
prob = zeros(nitr, 1);
for i=1:nitr
    %get random numbers between 0 and 1
    %when i = 1, then r will just be a single number
    %when i=20,000, then r will be 20000 values
    r = randi([1 6], i, 1);
    %find when it is a six within the 20000 rolls
    six = find(r == 6);
    % now based on how many rolls have been made, what is the empirical
    % probability for each of the 20000 rolls 
    %initially those probabilities can vary quite a bit but as the number
    %of rolls increases, then the probability should converge to 1/6
    %the following statement is just so there is a probability for the first one
    %if a six isn't rolled
    prob(i, 1) = 0;
    if (six)
        count = length(six);
        prob(i, 1) = count/i;
    end
end
% define the tolerance in order to be close to the expected probability 1/6
tol = .01;
%find all the cases when the empirical probability is outside the tolerance
large_diff = find(abs(prob - 1/6) > tol);
%find the last one that is outside the tolerance
%after this roll, then all of the additional rolls are really close to the
%expected probability, so we are converging to an infinite number of rolls
last = large_diff(end)

plot(prob)
title("Measured Probability of Rolling a 6")
xlabel("Number of Simulations")
ylabel("Probability")
yticks(0:1/6:1)
yticklabels(["0", "1/6", "2/6", "3/6", "4/6", "5/6", "7/6", "1"])

% Several different outputs for last
% 19626, 19327, 17671, 15378, 19417, 14366, 16243, 17894, 14359, 19359, 17766
% Based on this sample, mean = 17401, std = 2022.5
    