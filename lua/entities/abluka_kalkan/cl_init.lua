include( "shared.lua" )

surface.CreateFont( "BlahBlah2", {
	font = "Arial",
	extended = false,
	size = 35,
	weight = 1000,
    shadow = true,
    outline = false
} )

function ENT:Draw()
    self:DrawModel()

    local k = self:GetPos()

    local aci = self:GetAngles()
    aci:RotateAroundAxis( aci:Forward(), 90 )
    aci:RotateAroundAxis( aci:Up(), 90 )
    aci.y = LocalPlayer():EyeAngles().y - 90
	if LocalPlayer():GetPos():DistToSqr( self:GetPos() ) < 1000 * 1000 then
		cam.Start3D2D( k + Vector( -50, 0, 10 ), Angle( 0, aci.y, 90 ), .15 )
			draw.RoundedBox( 5, - 180, - 500, 350, 50, Color( 0, 0, 0, 230 ) )
			draw.RoundedBox( 5, - 180 + 2, - 500 + 2, math.Clamp( self:Health() / self:GetMaxHealth() * 350, 0, 350 ), 50 - 2, Color( 150, 0, 0, 230 ) )
			draw.DrawText( self:Health() .. "%", "BlahBlah2", 5, - 490, Color( 255, 255, 255, 255 ), TEXT_ALIGN_CENTER )
		cam.End3D2D()
	end
end
