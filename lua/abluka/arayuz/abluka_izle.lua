
local function abluka_izle()
local izle = vgui.Create( "DFrame" )
izle:SetSize( ScrW() * 1,ScrH() * 1  )
izle:SetTitle( " " )
izle:SetDraggable( false )
izle:MakePopup()
izle:ShowCloseButton(false)
izle:Center(true)

function izle:Paint( w, h )
    local x, y = self:GetPos()
    if ( !IsValid( LocalPlayer() ) ) then return end
    local WPos = LocalPlayer():LocalToWorld(Vector( -826.193787, 4785.672852, 666.715454 ))

    render.RenderView( {
        origin = abluka.izlemevector,
        angles = abluka.izlemeangle,
        x = x, y = y,
        w = w, h = h
    } )
end



local kapat = vgui.Create( "DButton", izle ) 				
kapat:SetPos( x * 0.95, y * 0.01 )					
kapat:SetSize( x * 0.05, y * 0.05)					
kapat.DoClick = function()				
	izle:Close()			
end



kapat:TDLib()
kapat:ClearPaint()
:Circle(Color(40, 40, 40, 0))
:CircleFadeHover(Color(40,40,40,200), 15)
:Text("×", "Trebuchet48")

izle:TDLib()
:FadeIn()
:LinedCorners(Color(255,255,255,255))

end




hook.Add("OnPlayerChat", "gui_abluka_izle", function(ply, strText)
    if (ply ~= LocalPlayer()) then return end
    strText = string.lower(strText)

    if (strText == "!ablukaizle") then
        abluka_izle()
    end
end)

