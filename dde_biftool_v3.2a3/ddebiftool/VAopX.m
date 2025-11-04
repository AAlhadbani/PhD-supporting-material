function y=VAopX(A,x,op)
%% vectorized matrix multiplication/linear system solving
%
% function y=VAopX(A,x,op)
%
%applies matrix operation (y=A*x or y=A\x) to higher dim arrays A(1:na1,1:na2,k),
%and x(1:nx1,1:nx2,k) or x(1:nx1,k), returning 
%y(:,:,k)=A(:,:,k) op x(:,:,k) or
%y(:,k)=A(:,:,k) op x(:,k) or
%where k can be a higher dimensional index, all dimensions of A and x have
%to match: no "scalar" expansion is done except for the second dimension of x.
%
%op can be a symbol: op='*', '\'.
%
%Relies on sparse_blkdiag, works also for larger numbers of
%dimensions. May be more efficient than loops if na1,na2 are small but na3 is
%large.
%
%
% (c) DDE-Biftool v3.2a3 2019-09-14 (76060b1c6081bc0c98a69a8b0829d26a658fc9d6)

%
%%
dima=size(A);
dimx=size(x);
ndimx=length(dimx);
ndima=length(dima);
isvec=0;
if ndimx==ndima-1
    %2nd Arg is vector
    isvec=1;
    x=reshape(x,[dimx(1),1,dimx(2:end)]);
    dimx=[dimx(1),1,dimx(2:end)];
    ndimx=ndimx+1;
end
nveca=prod(dima(3:end));
nvecx=prod(dimx(3:end));
Ar=reshape(A,[dima(1),dima(2),nveca]);
xr=reshape(x,[dimx(1),dimx(2),nvecx]);
if op=='*'
    yr=full(sparse_blkdiag(Ar)*sparse_blkdiag(xr,[0,0],0));
    if isvec
        y=reshape(yr,[dima(1),dimx(3:end)]);
    else
        y=reshape(yr,[dima(1),dimx(2:end)]);
    end        
elseif op=='\'
    yr=full(sparse_blkdiag(Ar)\sparse_blkdiag(xr,[0,0],0));
    if isvec
        y=reshape(yr,[dima(2),dimx(3:end)]);
    else
        y=reshape(yr,[dima(2),dimx(2:end)]);
    end        
else
    error('VAopX: operation "%s" not implemented\n',op);
end
end
