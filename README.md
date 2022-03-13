# Abluka-Sistemi


[![Abluka Sistemi](https://img.youtube.com/vi/kgfFoBtIu1A/0.jpg)](https://www.youtube.com/watch?v=kgfFoBtIu1A)



+ Kapı kapama nasıl yapılır ?
- addons\baristaner_abluka\lua\autorun\config.lua'dan abluka.kapamapozisyonlari kısmına bakıyoruz.Bu bir tablo { } arasına istediğimiz
kadar kapı koyabiliriz örnek : {"models/hunter/plates/plate4x4.mdl","","-1115.996216 2870.020264 576.031250","0 0 0","90 0 0","150","1"}, -- Gryffinor Yatakhane
Model,boş,Koordinat,0 0 0,Açı(xyz),150,1 bunlardan kesin olarak kendinize göre değiştirmeniz için model,koorinat ve açıyı düzenleyin.
Koordinat almak için koymak istediğiniz bölgeye gidip oyundan getpos yazın tablonun içine VİRGÜLSÜZ! şekilde koyun.

+ Kalkan ekleme nasıl yapılır
- Aynı kapı eklemek gibi fakat daha basit addons\baristaner_abluka\lua\autorun\config.lua'dan abluka.kalkanpoziyonlari bunun tablo sıralaması şu şekilde
Koordinat(Pozisyon),Açı,Büyüklük,Can Şeklinde.
Ayrıyetten Q'dan çıkarılabilir configden ayarlanılabilir bi kalkan var

+ Ölülerin abluka izleme şeyi nasıl çalışıyor?
- Oyuncuların chate !ablukaizle yazmaları yeter ama bölgeyi seçmek için configden abluka.izlemevector,abluka.izlemeangel kısmın editlemeniz gerek
kameranın koyulucağı bölgeye uçup konsola getpos yazın pos ve ang olarak 2 ayrı şey vericek posu abluka.izlemevector'e VİRGÜLLÜ BİR ŞEKİLDE aynı şekile angle'a yapın 
Örnek ; 
abluka.izlemevector = Vector( -826.193787, 4785.672852, 666.715454 )
abluka.izlemeangle = Angle( 22.457670, 157.700684, 0.000000)

+ Admin menüsüne nasıl erişilir 
- !abluka yazarak

+Admin yetkileri nereden ayarlanır ?
- Config abluka.adminlistesi


Sistemi Özetleyecek Olursak

* Abluka Başladığında Sağda ayarlanabilir süreli bi yazı çıkıyor ve şarkı başlıyor hava kararıyor.
* Abluka başladığında ölenler geri gelemesin diye otomatik olarak haritanın belirli yerlerine koyabiliceğiniz kapılar yatakhaneler vesaire çıkışı kapar.
* Okulun girişlerini kapatabiliceğiniz ayarlanabilir canlı kalkan sistemi büyüler ile hasar verip kırılması.
* Ölen oyuncular sıkılmasın diye abluka izleme komutu.
* Oyuncuların ekranında gözüken okulun ve bakanlığın güvende olup olmadığını belirten arayüz 
* Admin menüsü abluka başlatma bitirme kalkan yerleştirme okul ve bakanlık durum belirleme 
* Bakanlık totemi sadece voldemortun kullanabildiği e tuşuna basınca bakanlığı ele geçirip ablukanın başlatabilinmesini sağlaması bakanlık ele geçirilmeden abluka başlatılmıyor.


