%size(trLb(:,1))
%%%%%%%%%%%%input para%%%%%%%%%%%%%%%%%%%
n = size(trLb(:,1));
n=n(:,1)
k = 2;
d = size(trD(:,1));
d = d(:,1);
max_epoch = 2000;
datasetLbl = trLb;
datasetD = trD;
keySet = [-1 1];
valSet = [1 2];
w = zeros(d,k);
mapper = containers.Map(keySet, valSet);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%tuning para%%%%%%%%%%%%%%%%%%%
eta0 = 1;
eta1 = 100;
C = 10;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
sgd
wFinal;
%%
xPred =  trD;
trueVal = trLb;
keySet = [-1 1];
valSet = [1 2];
rev_mapper = containers.Map(valSet, keySet);
wPred = wFinal;
calcPredError
%%
xPred =  valD;
trueVal = valLb;
keySet = [-1 1];
valSet = [1 2];
rev_mapper = containers.Map(valSet, keySet);
wPred = wFinal;
calcPredError
%%
sum(vecnorm(wFinal).^2)
%%
%size(trLb(:,1))
%%%%%%%%%%%%input para%%%%%%%%%%%%%%%%%%%
n = size(valLb(:,1));
n=n(:,1)
k = 2;
d = size(valD(:,1));
d = d(:,1);
max_epoch = 2000;
datasetLbl = valLb;
datasetD = valD;
keySet = [-1 1];
valSet = [1 2];
w = wFinal;
mapper = containers.Map(keySet, valSet);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%tuning para%%%%%%%%%%%%%%%%%%%
eta0 = 1;
eta1 = 100;
C = 10;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
sgd
wFinal;
%%
xPred =  valD;
keySet = [-1 1];
valSet = [1 2];
rev_mapper = containers.Map(valSet, keySet);
wPred = wFinal;
predictor