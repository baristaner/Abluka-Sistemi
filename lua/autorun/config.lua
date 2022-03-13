AddCSLuaFile()

abluka = {}

abluka.simpleweather = false
abluka.sarkical = true
abluka.sihirbakanligi = true -- Bakanlık sistemini aktif eder 
abluka.totemhalo = false -- BAKANLIK TOTEMİNE BAKTIMI ETRAFI SARI OLUR SADECE BAKTIĞINDA FPS SORUNLARI YAŞATABİLİR 

/////////////////////////////////
// KALKAN      AYARLARI        //
/////////////////////////////////
abluka.kalkanmodel = "models/props_lab/blastdoor001c.mdl"
abluka.kalkancan = 750 -- Standart Canı Ayarlar koyucağınız kalkanların canlarını aşağıdan değiştirebilirsiniz

/////////////////////////////////
// YETKI     AYARLARI          //
/////////////////////////////////

abluka.adminlistesi = {
    ["superadmin"] = true,
	["Mod"] = true,
	["Admin"] = true,
	["Head Admin"] = true,
	["admin"] = true,
	["Admin +"] = true
}

abluka.meslekler = {
	TEAM_DUMBLEDORE,
	TEAM_VOLDEMORT
}

abluka.aydinlik = {
	[TEAM_CAYLAK] = true
}

abluka.karanlik = {
	[TEAM_SIVIL] = true
}


/////////////////////////////////
// POZISYON     AYARLARI       //
/////////////////////////////////
abluka.kapamapozisyonlari = {   -- Model,Koordinat(Pozisyon),Açı

{"models/hunter/plates/plate4x4.mdl","","-1115.996216 2870.020264 576.031250","0 0 0","90 0 0","150","1"}, -- Gryffinor Yatakhane
{"models/hunter/plates/plate4x4.mdl","","469.923645 2274.232422 792.029236","0 0 0","90 0 0","150","1"}, -- Ravenclaw Yatakhane
{"models/hunter/plates/plate4x4.mdl","","1213.412231 1415.373413 72.031250","0 0 0","180 0 90","150","1"}, -- Hufflepuff Yatakhane
{"models/hunter/plates/plate4x4.mdl","","-463.528320 1536.639160 -263.968750","0 0 0","90 0 0","150","1"}, -- Slytherin Yatakhane

}

abluka.kalkanpoziyonlari = {

{"-4135.839355 5612.613281 -51.968750","0 0 0","2",1500}, -- Pozisyon,Açı,Büyüklük,Can Şeklinde
{"-549.301636 4734.929688 9.721134","0 0 0","2",500},

}

/////////////////////////////////
// ABLUKA IZLEME     AYARLARI  //
/////////////////////////////////

abluka.izlemevector = Vector( -826.193787, 4785.672852, 666.715454 )
abluka.izlemeangle = Angle( 22.457670, 157.700684, 0.000000)

/////////////////////////////////
// ARAYÜZ     AYARLARI         //
/////////////////////////////////
abluka.arayuzusilmesuresi = 30 -- Sağdaki çıkan abluka başladı yazısının silinme süresi 

abluka.okulguvenderenk = Color(60,200,0,255)
abluka.okulkaranliktaraftarenk = Color(200,0,0,255)
abluka.bakanlikguvenderenk = Color(230,0,255,255) 
abluka.bakanlikkaranliktaraftarenk = Color(200,0,0,255)

abluka.karanlikisaret = true -- Sağ Altta 3-4 saniyelik karanlık işaret gösterir