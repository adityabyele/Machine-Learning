%%%%%%%%%%%%%%%Q3.1.2%%%%%%%%%%%%%%%%%%%
n = size(trLb(:,1));
n = n(:,1);
H = (diag(trLb)*trD'*trD*diag(trLb));
C = 0.1;
f = ones(n,1);
A =[];
b=[];
Aeq = trLb';
beq = zeros(1,1);
lb = zeros(n,1);
ub = C.*ones(n,1);
alpha = quadprog(H,-1.*f,A,b,Aeq, beq,lb,ub);

%%%%%%%%%%%%Q3.1.3%%%%%%%%%%%%%%%%%%%%%%%
wQuad = (trLb'*diag(alpha)*trD')';
wQuad;
bias = trLb - trD'*wQuad;
bias = bias(1,1);
%%
tmpOp = trD'*wQuad + bias;
ans = sign(tmpOp);
szSet = size(trLb(:,1));
szSet = szSet(:,1);
acc = nnz(ans == trLb)/szSet;
acc;


%preds = zeros(szSet);
%count = 0;
%for i=1:szSet
    %if(tmpOp<0)
     %   predQ(i) = 1
    %else
     %   predQ(i) = -1;
    %end    
    %if(predQ(i) == valLb(i))       
        %count = count+1;
    %end
%end
%predError = (szSet - count)/szSet;
%acc = 1-predError
%%
tmpOp = valD'*wQuad + bias;
ans = sign(tmpOp);
szSet = size(valLb(:,1));
szSet = szSet(:,1);
acc = nnz(ans == valLb)/szSet
predictedNo = szSet - nnz(ans == valLb);
actualNo = nnz(valLb==-1);
predictedYes = nnz(ans == valLb);
actualYes = nnz(valLb==1);
confusionMatrix = zeros(2,2);
%confusionMatrix(1,1)=
%confusionMatrix(1,2)=
%confusionMatrix(2,1)=
%confusionMatrix(2,2)=
objVal = f'*(alpha) - alpha'*H*alpha/2;
%vecnorm(wQuad)/2 + sum(max((1 - valLb'*diag(valD'*wQuad + bias))',0))
objVal
%%
supps = valD'*wQuad + bias;
numOfSupVec = nnz((supps < 1) & (supps > -1));
numOfSupVec
%%
confusionmat(valLb, ans)