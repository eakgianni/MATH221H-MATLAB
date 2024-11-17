%% Everett Gianni Voting District Convexitivty Coefficient Estimation
% Approximation of the Convexitivty Coefficient for Voting Districts CA3, IL4, and TX11

%% Author Information
%
% * name: Everett Gianni
% * email: eag1452@rit.edu
% * date: 11/17/2024

% end section

%% Initialization
%requires these values to be opened
CA3intX;
CA3intY;
CA3x;
CA3y;

IL4intX;
IL4intY;
IL4x;
IL4y;

TX11intX;
TX11intY;
TX11x;
TX11y;

%define number of trials for the calculation
numTrials = 2000;
trialResults = zeros(1,numTrials);

% end section

%% Preforming Trials for the CA District 3 while making plot

%create figure showing test lines across district 
figure;
hold on;
title('California District 3 C(R) Approximation')

for k = 1:1:numTrials

    pIndex = randi(length(CA3intX));%randomizes the index that will be chosen for random P point 
    P = [CA3intX(pIndex), CA3intY(pIndex)]; % generates P point
    
    qIndex = randi(length(CA3intX))%randomizes the index that will be chosen for random Q point     
    Q = [CA3intX(qIndex), CA3intY(qIndex)]; %generates Q point
    
    %why do indecies start at 1 in matlab :( 
    [interX, interY] = polyxpoly( [P(1),Q(1)], [P(2),Q(2)], CA3x, CA3y);%detect an intersection

    trialResults(k) = isempty(interX);%return a 1 if theres no intersection

    plot([P(1),Q(1)], [P(2), Q(2)], 'LineWidth', 0.5);%plot the test line 

end
plot( CA3x, CA3y, 'Color', 'k', 'LineWidth', 2)
hold off;
% end section

%% Reporting Results for  CA District 3
ecc = sum(trialResults)/numTrials;

sprintf('\n After %i trials, C(R) for California District 3 is approximately %f\n\n', numTrials, ecc)

%end section



%% Preforming Trials for the IL District 4 while making plot
figure;
hold on;
title('Illinois District 4 C(R) Approximation')
for k = 1:1:numTrials

    pIndex = randi(length(IL4intX));
    P = [IL4intX(pIndex), IL4intY(pIndex)]; % generates P point
    
    qIndex = randi(length(IL4intX));
    Q = [IL4intX(qIndex), IL4intY(qIndex)]; %generates Q point
    
    
    [interX, interY] = polyxpoly( [P(1),Q(1)], [P(2),Q(2)], IL4x, IL4y);%detect an intersection

    trialResults(k) = isempty(interX);%return a 1 if theres no intersection

    plot([P(1),Q(1)], [P(2), Q(2)], 'LineWidth', 0.5);

end
plot( IL4x, IL4y, 'Color', 'k', 'LineWidth', 2);
hold off;
% end section

%% Reporting Results for IL District 4

ecc = sum(trialResults)/numTrials;

sprintf('\n After %i trials, C(R) for Illinois District 4 is approximately %f\n\n', numTrials, ecc)

%end section

%% Preforming Trials for the TX District 11 while making plot
figure;
hold on;
title('Texas District 11 C(R) Approximation')

for k = 1:1:numTrials

    pIndex = randi(length(TX11intX));
    P = [TX11intX(pIndex), TX11intY(pIndex)]; % generates P point
    
    qIndex = randi(length(TX11intX));
    
    Q = [TX11intX(qIndex), TX11intY(qIndex)]; %generates Q point
    
 
    [interX, interY] = polyxpoly( [P(1),Q(1)], [P(2),Q(2)], TX11x, TX11y);%detect an intersection

    trialResults(k) = isempty(interX);%return a 1 if theres no intersection

    plot([P(1),Q(1)], [P(2), Q(2)], 'LineWidth', 0.5);

end
plot( TX11x, TX11y, 'Color', 'k', 'LineWidth', 2);
hold off;
% end section

%% Reporting Results for TX District 11

ecc = sum(trialResults)/numTrials;

sprintf('\n After %i trials, C(R) for Texas District 11 is approximately %f\n\n', numTrials, ecc)

%end section