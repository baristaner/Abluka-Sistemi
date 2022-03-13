local x = ScrW()
local y = ScrH()
local ply = LocalPlayer()
bg = Color(0,0,0,200)

surface.CreateFont("abluka_fontumuz", { 
	font = "Harry P",
	size = x * 0.038,
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

//////////////////////////////////////////////////
// FONKSIYONLAR                                 //
//////////////////////////////////////////////////
local function cizgilikutu(x, y, w, h )
	surface.SetDrawColor( Color(200,0,0,255) )
    surface.DrawOutlinedRect(x,y,w,h )
    draw.RoundedBox(0,x,y,w,h,Color(0,0,0,205))
end

local function cizgi(x, y, w, h )
	surface.SetDrawColor( Color(200,200,200,255) )
    surface.DrawOutlinedRect(x,y,w,h )
    draw.RoundedBox(0,x,y,w,h,Color(0,0,0,100))
end
local function simge(x, y, w, h, Material)
	surface.SetDrawColor( 255, 255, 255, 255 )
    surface.SetMaterial( Material );
    surface.DrawTexturedRect(x,y,w,h)
end


local baslat = SysTime()

local function simge_animasyon(x, y, w, h, Material)
	if SysTime() - baslat > 5 then baslat = SysTime() end
	surface.SetDrawColor( 255, 255, 255, Lerp( SysTime() - baslat, 0, 255 ) )
    surface.SetMaterial( Material );
    surface.DrawTexturedRect(x,y,w,h)
end

//////////////////////////////////////////////////
// FONKSIYONLAR                                 //
//////////////////////////////////////////////////

net.Receive("abluka_ekran",function(len)
hook.Add("HUDPaint", "abluka_hud", function()
    
	if SysTime() - baslat > 2 then
		baslat = SysTime()
	end
    cizgilikutu(x * 0.83, y * 0.36, x * 0.18, y * 0.13)
    simge_animasyon(x * 0.84, y * 0.40, x * 0.18, y * 0.12,Material("materials/baristaner/abluka/elder-wand-png-2.png"))
    draw.SimpleText("Abluka ","abluka_fontumuz",x * 0.84, y * 0.37,Color(200,0,0,Lerp( SysTime() - baslat, 0, 255 )))
    draw.SimpleText("Basladi","abluka_fontumuz",x * 0.92, y * 0.37,Color(255,255,255,Lerp( SysTime() - baslat, 0, 255 )))

end )

if abluka.karanlikisaret then
hook.Add("HUDPaint", "karanlikisaret", function()
    simge_animasyon(x * 0.88, y * 0.84, x * 0.10, y * 0.15,Material("materials/baristaner/abluka/karanlik_isaret_abluka.png"))
end )
end

    if abluka.sarkical then surface.PlaySound( "baristaner_abluka/abluka.mp3" ) end

    timer.Create( "hudusil", abluka.arayuzusilmesuresi, 1, function()  hook.Remove("HUDPaint", "abluka_hud") end )
    timer.Create( "isaretisil", 3, 1, function() hook.Remove("HUDPaint", "karanlikisaret") end )
end)

net.Receive("abluka_bitir",function(len)
    RunConsoleCommand("stopsound")
    hook.Remove("HUDPaint", "abluka_hud")
    hook.Remove("HUDPaint", "karanlikisaret")
end)







