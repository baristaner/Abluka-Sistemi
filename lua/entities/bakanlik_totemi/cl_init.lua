include('shared.lua')

surface.CreateFont("bakanlik_totem", { 
	font = "Harry P",
	size = ScrW() * 0.055,
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

if abluka.totemhalo then
hook.Add( "PreDrawHalos", "bakanlik_totemi", function()
    if IsValid(LocalPlayer():GetEyeTrace().Entity) and LocalPlayer():GetEyeTrace().Entity:GetClass()=="bakanlik_totemi" then
        halo.Add( { LocalPlayer():GetEyeTrace().Entity }, Color( 255,215,0 ), 5, 5, 5 )
    end
end )
end

function ENT:Initialize()
	self.csModel = ClientsideModel("models/shield/shield.mdl")
end

function ENT:Draw()

    local aci = (CurTime() * 90 ) % 360
    local genis = math.sin(CurTime() * 3) * 5

	self.csModel:SetPos(self:GetPos())
	self.csModel:SetAngles(Angle(0,aci,0))

	if ( IsValid( self ) && LocalPlayer():GetPos():Distance( self:GetPos() ) < 500 ) then

         local ang = Angle( 0, ( LocalPlayer():GetPos() - self:GetPos() ):Angle()[ "yaw" ], ( LocalPlayer():GetPos() - self:GetPos() ):Angle()[ "pitch" ] ) + Angle( 0, 90, 90 )

        cam.IgnoreZ( false )
        cam.Start3D2D( self:GetPos() + Vector( -1, 0, 30 ), ang, .1 )

            draw.RoundedBox(0,-230,-48,440,90, Color(0, 0, 0, 150))
            draw.SimpleTextOutlined( self:GetNWString( "HeaderText", "Bakanlik Totemi" ), "bakanlik_totem", -10, 0, Color( 2361, 666, 650, 255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, .5, Color( 0, 0, 0, 255 ) )
        cam.End3D2D()

    end
end

function ENT:OnRemove()
	self.csModel:Remove()
end

