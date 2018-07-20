%size(trLb(:,1))
%%%%%%%%%%%%input para%%%%%%%%%%%%%%%%%%%
[rnd_trD, rnd_trLb, rnd_valD, rnd_valLb, rnd_trRegs, rnd_valRegs] = HW2_Utils.getPosAndRandomNeg();
%n = size(rnd_trLb(:,1));
%n=n(:,1);
%k = 2;
%d = size(rnd_trD(:,1));
%d = d(:,1);
%max_epoch = 40;
datasetLbl = rnd_trLb;
datasetD = rnd_trD;
%keySet = [-1 1];
%valSet = [1 2];
%w = zeros(d,k);
%mapper = containers.Map(keySet, valSet);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%tuning para%%%%%%%%%%%%%%%%%%%
eta0 = 1;
eta1 = 100;
C = 10;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%sgd
quadProg
wQuad;
biasQuad;
%%
HW2_Utils.genRsltFile(wQuad, biasQuad, 'val' ,'op');
[AP, prec, recall]= HW2_Utils.cmpAP('op', 'val');
AP
prec
recall