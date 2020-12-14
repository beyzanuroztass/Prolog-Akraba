anne(X,Y):- kadin(X),ebeveyn(X,Y).
baba(X,Y):- erkek(X),ebeveyn(X,Y).
ogul(X,Y):- erkek(X),anne(Y,X).
ogul(X,Y):- erkek(X),baba(Y,X).
kiz(X,Y):- kadin(X),anne(Y,X).
kiz(X,Y):- kadin(X),baba(Y,X).
kizkardes(X,Y):- kadin(X),anne(Z,X),kiz(Y,Z),not(X==Y).
kizkardes(X,Y):- kadin(X),anne(Z,X),ogul(Y,Z),not(X==Y).
kizkardes(X,Y):- kadin(X),baba(Z,X),kiz(Y,Z),not(X==Y).
kizkardes(X,Y):- kadin(X),baba(Z,X),ogul(Y,Z),not(X==Y).
erkekkardes(X,Y):- erkek(X),anne(Z,X),kiz(Y,Z),not(X==Y).
erkekkardes(X,Y):- erkek(X),anne(Z,X),ogul(Y,Z),not(X==Y).
erkekkardes(X,Y):- erkek(X),baba(Z,X),kiz(Y,Z),not(X==Y).
erkekkardes(X,Y):- erkek(X),baba(Z,X),ogul(Y,Z),not(X==Y).
kardes(X,Y):- anne(Z,X),kiz(Y,Z),not(X==Y).
kardes(X,Y):- anne(Z,X),ogul(Y,Z),not(X==Y).
kardes(X,Y):- baba(Z,X),kiz(Y,Z),not(X==Y).
kardes(X,Y):- baba(Z,X),ogul(Y,Z),not(X==Y).
buyukanne(X,Y):- kadin(X),anne(X,Z),kiz(Y,Z).
buyukanne(X,Y):- kadin(X),anne(X,Z),ogul(Y,Z). 
buyukanne(X,Y):- kadin(X),baba(X,Z),kiz(Y,Z).
buyukanne(X,Y):- kadin(X),baba(X,Z),ogul(Y,Z). 
dede(X,Y):- erkek(X),anne(X,Z),kiz(Y,Z).
dede(X,Y):- erkek(X),anne(X,Z),ogul(Y,Z). 
dede(X,Y):- erkek(X),baba(X,Z),kiz(Y,Z).
dede(X,Y):- erkek(X),baba(X,Z),ogul(Y,Z). 
erkektorun(X,Y):-erkek(X),ebeveyn(Z,X),ebeveyn(Y,Z).
kiztorun(X,Y):-kadin(X),ebeveyn(Z,X),ebeveyn(Y,Z).
teyze(X,Y):- kadin(X),anne(Z,Y),kizkardes(Z,X).
hala(X,Y):- kadin(X),baba(Z,Y),kizkardes(X,Z).
dayi(X,Y):- erkek(X),anne(Z,Y),erkekkardes(X,Z).
amca(X,Y):- erkek(X),baba(Z,Y),erkekkardes(X,Z).
kizyegen(X,Y):- kadin(X),teyze(Y,X).
kizyegen(X,Y):- kadin(X),dayi(Y,X).
kizyegen(X,Y):- kadin(X),hala(Y,X).
kizyegen(X,Y):- kadin(X),amca(Y,X).
erkekyegen(X,Y):- erkek(X),teyze(Y,X).
erkekyegen(X,Y):- erkek(X),dayi(Y,X).
erkekyegen(X,Y):- erkek(X),hala(Y,X).
erkekyegen(X,Y):- erkek(X),amca(Y,X).
kuzen(X,Y):- ebeveyn(Z,X),ebeveyn(K,Y),kardes(Z,K).









