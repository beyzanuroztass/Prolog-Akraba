# Prolog Akraba İlişkileri
İnsanların cinsiyetlerine işaret eden gerçeklerle (erkek ve kadın yüklemleri) birlikte, aynı insanların basit aile ilişkilerine dair yüklemler (ebeveyn) belirttim, kendi ailem üzerinden ve test aşamasını yaptım.

Yüklemler listesi (test1.pl dosyamız);

✔ anne(X,Y) : X, Y’nin annesiyse doğrudur.

✔ baba(X,Y) : X, Y’nin annesiyse doğrudur.

✔ ogul(X,Y) : X, Y’nin oğluysa doğrudur.

✔ kiz(X,Y) : X, Y’nin kızıysa doğrudur.

✔ kizkardes(X,Y) : X, Y’nin kız kardeşiyse doğrudur.

✔ erkekkardes(X,Y) : X, Y’nin erkek kardeşiyse doğrudur.

✔ kardes(X,Y) : X, Y’nin kız kardeşiyse ya da X, Y’nin erkek kardeşiyse doğrudur.

✔ buyukanne(X,Y) : X, Y’nin büyükannesiyse doğrudur. Yani; X, Y’nin annesinin
annesiyse ya da X, Y’nin babasının annesiyse doğrudur.

✔ dede(X,Y) : X, Y’nin dedesiyse doğrudur. Yani; X, Y’nin annesinin babasıysa
ya da X, Y’nin babasının babasıysa doğrudur.

✔ erkektorun(X,Y) : X, Y’nin erkek torunuysa doğrudur. Yani; Y, X’in büyükannesiyse
ya da Y, X’in dedesiyse ve X erkekse doğrudur.

✔ kiztorun(X,Y) : X, Y’nin kız torunuysa doğrudur. Yani; Y, X’in büyükannesiyse
ya da Y, X’in dedesiyse ve X kadınsa doğrudur.

✔ teyze(X,Y) : X, Y’nin teyzesiyse doğrudur. Yani; X, Y’nin annesinin kız
kardeşiyse doğrudur.

✔ hala(X,Y) : X, Y’nin halasıysa doğrudur. Yani; X, Y’nin babasının kız
kardeşiyse doğrudur.

✔ dayi(X,Y) : X, Y’nin dayısıysa doğrudur. Yani; X, Y’nin annesinin erkek
kardeşiyse doğrudur.

✔ amca(X,Y) : X, Y’nin amcasıysa doğrudur. Yani; X, Y’nin babasının erkek
kardeşiyse doğrudur.

✔ kizyegen(X,Y) : X, Y’nin kız yeğeniyse doğrudur. Yani; Y, X’in teyzesiyse veya
Y, X’in dayısıysa veya Y, X’in halasıysa veya Y, X’in amcasıysa ve
elbette X kadınsa doğrudur.

✔ erkekyegen(X,Y) : X, Y’nin erkek yeğeniyse doğrudur. Yani; Y, X’in teyzesiyse veya
Y, X’in dayısıysa veya Y, X’in halasıysa veya Y, X’in amcasıysa ve
X erkekse doğrudur.

✔ kuzen(X,Y) : X, Y’nin kuzeniyse doğrudur. Yani; X ve Y’nin ebeveynleri
kardeş ise doğrudur.

Not: kardes(X,Y) ve kuzen(X,Y) akrabalıklarının simetrik oluşuna dikkat edelim. Yani; X’in
Y ile ilişkisi o şekildeyse, Y’nin X ile ilişkisi de aynı şekildedir.

Ve “akrabalar.pl” adlı dosyamızının içeriğinden örnek gösterelim(Bu dosyayı üstte belirttiğimiz yüklemler
üzerinden yazıyoruz.);

anne(X,Y):- kadin(X),ebeveyn(X,Y).
(X,Y’nin annesi olabilmesi için X’in cinsiyetinin kadın olması (çünkü annedir) ve X,Y’nin
ebeveyni olması gerekmektedir. Ebeveyn ya anne ya da baba olacaktır. Burada da kadın
gerçeğini seçerek anne yaptık.)

baba(X,Y):- erkek(X),ebeveyn(X,Y).
(X,Y’nin babası olabilmesi için X’in cinsiyetinin erkek olması (çünkü babadır) ve X,Y’nin
ebeveyni olması gerekmektedir. Ebeveyn ya anne ya da baba olacaktır. Burada da erkek
gerçeğini seçerek baba yaptık.)

ogul(X,Y):- erkek(X),anne(Y,X).
ogul(X,Y):- erkek(X),baba(Y,X).
(X,Y’nin oğlu olabilmesi için X’in cinsiyetinin erkek olması (çünkü oğul) gerekmektedir ve
Y, X’nin hem annesi hem de babası olmak üzere iki olasılığı vardır. (Bu yüzden iki satırda
tanımladık. Çünkü projede “veya” kullanımına yer verilmemiştir.) İlk olasılık olarak
anneden gidelim Y, X’in annesi ve Y’nin cinsiyeti kadın ise X, Y’nin oğludur. İkinci olasılık
olarak babadan gidelim Y, X’in babası ve Y’nin cinsiyeti erkek ise X, Y’nin oğludur.
Bunlardan herhangi birini sağlıyorsa yüklem doğrudur.Burada Y ‘in cinsiyetini
belirtmememizin nedeni anne,baba ilişkilerini önceden tanımlamamız ve onların içinde
cinsiyetin belirtilmesidir.)

kizkardes(X,Y):- kadin(X),anne(Z,X),kiz(Y,Z),not(X==Y).
kizkardes(X,Y):- kadin(X),anne(Z,X),ogul(Y,Z),not(X==Y).
kizkardes(X,Y):- kadin(X),baba(Z,X),kiz(Y,Z),not(X==Y).
kizkardes(X,Y):- kadin(X),baba(Z,X),ogul(Y,Z),not(X==Y).
(kızkardeş olayı aynı anne veya babanın çocukları olması gerekir ikiside ve çocukları kız
veya oğul üzerinden gidilebilir. X,Y’nin kızkardeşi olabilmesi için X’in cinsiyetinin kadın
olması gerekmektedir ve kızkardeşe ulaşmanın anne ve baba üzerinden gitmek üzere 2
olasılığı aynı zamanda kız ve oğul üzerinden gitmek üzere 2 olasılığı toplam olasılığı 4’tür.
Bu yüzden 4 satırımız mevcut. (Çünkü projede “veya” kullanımına yer verilmemiştir.) Anne
ve kız ilişkisinden başlarsak Z,X’in annesi ve Y’de Z’nin kızı olursa X,Y’nin kızkardeşidir.
Anne ve oğul ilişkisinden başlarsak Z,X’in annesi ve Y’de Z’nin oğlu olursa X,Y’nin
kızkardeşidir. Baba ve kız ilişkisinden başlarsak Z,X’in babası ve Y’de Z’nin kızı olursa
X,Y’nin kızkardeşidir. Baba ve oğul ilişkisinden başlarsak Z,X’in babası ve Y’de Z’nin oğlu
olursa X,Y’nin kızkardeşidir.Bunlardan herhangi birini sağlıyorsa yüklem doğrudur. Burada
Y ve Z’nin cinsiyetini belirtmememizin nedeni anne,baba,kiz,ogul ilişkilerini önceden
tanımlamamız ve onların içinde cinsiyetin belirtilmesidir. not(X==Y) kullanmamızın nedeni
kendinide saymasıdır. Yani annen veya baban kardeşin olarak gözükebilir.)......


“test1.pl” dosyamızın içinde “akrabalar.pl” dosyasını çalıştıralım;

?- kiztorun(X,ramazan).
X = beyzanur ; X = amine ;
false.
Buradaki “false” başka olmadığını bittiğini gösterir.

Projem bu şekildedir. Sorularınız olursa iletebilirsiniz. Teşekkürler.
