AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )
 
include('shared.lua')
 
function ENT:Initialize()
 
	self:SetModel( "models/shield/shield.mdl" )
	self:PhysicsInit( SOLID_VPHYSICS )
	self:SetMoveType( MOVETYPE_VPHYSICS )
	self:SetSolid( SOLID_VPHYSICS )
 
	local phys = self:GetPhysicsObject()
	if (phys:IsValid()) then phys:Wake() end
	self:SetUseType(SIMPLE_USE)
end
 
function ENT:Use(ply)
 if table.HasValue({TEAM_VOLDEMORT}, ply:Team()) and ply:GetNWBool("bakanlik",true) then
        self.Entity:Remove()
        ply:SetHealth(ply:GetMaxHealth() + 50)

        for k, v in pairs(player.GetAll()) do
            v:SetNWBool("bakanlik", false)
            v:ChatPrint("Sihir bakanlığı karanlık taraf tarafından ele geçirildi abluka başlatılabilir!")
            net.Start("durum_goster")
            net.Send(ply)
        end
else
        ply:ChatPrint("Bunu Sadece Lord Voldemort Yapabilir")
    end
end
function ENT:Think()
end

