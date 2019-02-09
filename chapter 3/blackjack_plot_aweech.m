display ('run blackjack simulator thousand times each time playing one hundred hands')
display (' Alex Weech 2/8/2019')
close all
clear all
maxw = zeros(1000, 1);
minw = zeros(1000, 1);
lastw = zeros(1000, 1);
for i = 1:1000
    win = blackjacksim(100);
    maxw(i) = max(win);
    minw(i) = min(win);
    lastw(i) = win(100);
end

data = [maxw minw lastw];
csvwrite("bjdata.csv", data)

%plot(lastw, "k")
%hold on
%plot(minw, "r")
%plot(maxw, "b")
%title("Potential Earnings from Blackjack")
%xlabel("Simulation")
%ylabel("Earnings (USD)")
