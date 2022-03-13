x = ScrW()
y = ScrH()

surface.CreateFont("derma_fontumuz", { 
	font = "Harry P",
	size = x * 0.020,
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

local function abluka_adminmenu()
local a = vgui.Create( "DFrame" )
a:SetSize( x * 0.40, y * 0.70  )
a:SetTitle( " " )
a:SetDraggable( true )
a:MakePopup()
a:ShowCloseButton(false)
a:Center(true)

local kapatmabuton = vgui.Create( "DButton", a ) 				
kapatmabuton:SetPos( x * 0.35, y * 0.01 )					
kapatmabuton:SetSize( x * 0.05, y * 0.05)					
kapatmabuton.DoClick = function()				
	a:Close()			
end

local buton = vgui.Create( "DButton", a)
buton:SetPos( x * 0.01, y * 0.08 )					
buton:SetSize( x * 0.38, y * 0.05)					
buton.DoClick = function()				
	a:Close()	
    net.Start("abluka_baslat")
    net.SendToServer() 
    net.Start("kapilari_kapat")
    net.SendToServer() 
    --

end

local buton2 = vgui.Create( "DButton", a)
buton2:SetPos( x * 0.01, y * 0.14 )					
buton2:SetSize( x * 0.38, y * 0.05)					
buton2.DoClick = function()				
	a:Close()
	net.Start("abluka_bitsin")
    net.SendToServer() 	
    net.Start("kapilari_sil")
    net.SendToServer() 				
end

local buton3 = vgui.Create( "DButton", a)
buton3:SetPos( x * 0.01, y * 0.20 )					
buton3:SetSize( x * 0.38, y * 0.05)					
buton3.DoClick = function()				
	a:Close()	
	net.Start("kalkan_cikart")
    net.SendToServer() 		
end

local buton4 = vgui.Create( "DButton", a)
buton4:SetPos( x * 0.01, y * 0.35 )                 
buton4:SetSize( x * 0.38, y * 0.05)                 
buton4.DoClick = function()             
    a:Close()   
    net.Start("okul_guvende")
    net.SendToServer()      
end

local buton5 = vgui.Create( "DButton", a)
buton5:SetPos( x * 0.01, y * 0.41 )                 
buton5:SetSize( x * 0.38, y * 0.05)                 
buton5.DoClick = function()             
    a:Close()   
    net.Start("okul_guvende_degil")
    net.SendToServer()      
end

local buton6 = vgui.Create( "DButton", a)
buton6:SetPos( x * 0.01, y * 0.47 )                 
buton6:SetSize( x * 0.38, y * 0.05)                 
buton6.DoClick = function()             
    a:Close()   
    net.Start("bakanlik_guvende")
    net.SendToServer()      
end

local buton7 = vgui.Create( "DButton", a)
buton7:SetPos( x * 0.01, y * 0.53 )                 
buton7:SetSize( x * 0.38, y * 0.05)                 
buton7.DoClick = function()             
    a:Close()   
    net.Start("bakanlik_guvende_degil")
    net.SendToServer()      
end


kapatmabuton:TDLib()
kapatmabuton:ClearPaint()
:Circle(Color(40, 40, 40, 0))
:CircleFadeHover(Color(40,40,40,200), 15)
:Text("×", "Trebuchet48")


a:TDLib()
:FadeIn()

a:ClearPaint()
:Background(Color(0, 0, 0,250), 0)
:Outline(Color(200,0,0), 2)

buton:TDLib()
buton:ClearPaint()
    :Background(Color(100,0,0))
    :LinedCorners()
    :TiledMaterial(Material("materials/baristaner/abluka/olumyadigarlari.png"), 45, 40, Color(255, 255, 255, 255))
    :BarHover(Color(255, 255, 255, 255), 3)
    :Text("Abluka Baslat", "derma_fontumuz", Color(255, 255, 255), TEXT_ALIGN_LEFT, 5)

buton2:TDLib()
buton2:ClearPaint()
    :Background(Color(100,0,0))
    :LinedCorners()
    :TiledMaterial(Material("materials/baristaner/abluka/olumyadigarlari.png"), 45, 40, Color(255, 255, 255, 255))
    :BarHover(Color(255, 255, 255, 255), 3)
    :Text("Abluka Bitir", "derma_fontumuz", Color(255, 255, 255), TEXT_ALIGN_LEFT, 5)

buton3:TDLib()
buton3:ClearPaint()
    :Background(Color(100,0,0))
    :LinedCorners()
    :TiledMaterial(Material("materials/baristaner/abluka/olumyadigarlari.png"), 45, 40, Color(255, 255, 255, 255))
    :BarHover(Color(255, 255, 255, 255), 3)
    :Text("Kalkan Yerlestir", "derma_fontumuz", Color(255, 255, 255), TEXT_ALIGN_LEFT, 5)

buton4:TDLib()
buton4:ClearPaint()
    :Background(Color(100,0,0))
    :LinedCorners()
    :TiledMaterial(Material("materials/baristaner/abluka/olumyadigarlari.png"), 45, 40, Color(255, 255, 255, 255))
    :BarHover(Color(255, 255, 255, 255), 3)
    :Text("Okul Guvenli", "derma_fontumuz", Color(255, 255, 255), TEXT_ALIGN_LEFT, 5)    

buton5:TDLib()
buton5:ClearPaint()
    :Background(Color(100,0,0))
    :LinedCorners()
    :TiledMaterial(Material("materials/baristaner/abluka/olumyadigarlari.png"), 45, 40, Color(255, 255, 255, 255))
    :BarHover(Color(255, 255, 255, 255), 3)
    :Text("Okul Karanlik Tarafta", "derma_fontumuz", Color(255, 255, 255), TEXT_ALIGN_LEFT, 5)   

buton6:TDLib()
buton6:ClearPaint()
    :Background(Color(100,0,0))
    :LinedCorners()
    :TiledMaterial(Material("materials/baristaner/abluka/olumyadigarlari.png"), 45, 40, Color(255, 255, 255, 255))
    :BarHover(Color(255, 255, 255, 255), 3)
    :Text("Bakanlik Guvende", "derma_fontumuz", Color(255, 255, 255), TEXT_ALIGN_LEFT, 5)    

buton7:TDLib()
buton7:ClearPaint()
    :Background(Color(100,0,0))
    :LinedCorners()
    :TiledMaterial(Material("materials/baristaner/abluka/olumyadigarlari.png"), 45, 40, Color(255, 255, 255, 255))
    :BarHover(Color(255, 255, 255, 255), 3)
    :Text("Bakanlik Karanlik Tarafta", "derma_fontumuz", Color(255, 255, 255), TEXT_ALIGN_LEFT, 5)    
end

hook.Add("OnPlayerChat", "gui_abluka", function(ply, strText)
    if (ply ~= LocalPlayer()) then return end
    strText = string.lower(strText)

    if (strText == "!abluka") and abluka.adminlistesi[ ply:GetUserGroup() ] or table.HasValue(abluka.meslekler, ply:Team()) then
        abluka_adminmenu()
    end
end)