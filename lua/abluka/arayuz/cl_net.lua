surface.CreateFont("abluka_fontumuz_guvende", { 
	font = "Harry P",
	size = x * 0.021,
	weight = 100,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = true,
	additive = false,
	outline = true,
}) 


net.Receive("durum_goster",function(len , ply )
local ply = LocalPlayer()
hook.Add("HUDPaint", "okul_guvendemi",function()
if ply:GetNWBool("guvenli",true) then
    draw.SimpleText("Okul Guvende","abluka_fontumuz_guvende",x * 0.89, y * 0.28,abluka.okulguvenderenk)
else
	draw.SimpleText("Okul Karanlik Tarafta","abluka_fontumuz_guvende",x * 0.86, y * 0.28,abluka.okulkaranliktaraftarenk)
end
if ply:GetNWBool("bakanlik",true) then
   draw.SimpleText("Bakanlık Güvende","abluka_fontumuz_guvende",x * 0.89, y * 0.32,abluka.bakanlikguvenderenk)
else
	draw.SimpleText("Bakanlik Karanlik Tarafta","abluka_fontumuz_guvende",x * 0.84, y * 0.32,abluka.bakanlikkaranliktaraftarenk)
end
end)
end)
