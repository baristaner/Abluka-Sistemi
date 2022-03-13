AddCSLuaFile()

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
