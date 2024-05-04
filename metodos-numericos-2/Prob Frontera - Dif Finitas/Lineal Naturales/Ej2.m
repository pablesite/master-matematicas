alfa = 1 -1/(2* log (3));
beta = 0.5 -1/(6* log (3));
a=1;
b=3;
N=9;
[ri,yi] = DiFiLinealEj2 (a,b,alfa ,beta ,N)
%%
ex=@(r)1./(log(1/3)).*(log(r/3)-0.5.*log(r));
exacta=ex(ri);
Error=abs(exacta-yi);
[ri,yi,exacta,Error]
hold on
plot(ri,yi,'r-*')
plot(ri,exacta,'b')