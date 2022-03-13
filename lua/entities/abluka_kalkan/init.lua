
AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )

include( "shared.lua" )


function ENT:Initialize()
    self:SetModel( "models/props_lab/blastdoor001c.mdl")
    self:PhysicsInit( SOLID_VPHYSICS )
    self:SetMoveType( MOVETYPE_NONE )
    self:SetSolid( SOLID_VPHYSICS )
    self:SetHealth(abluka.kalkancan)
    self:SetMaxHealth( abluka.kalkancan)
    self:SetMaterial( "models/props_combine/portalball001_sheet" )
    self:SetModelScale( 2 )

    local PowerPhys2 = self:GetPhysicsObject()
    if IsValid( PowerPhys2 ) then
        PowerPhys2:Wake()
    end
end



function ENT:OnTakeDamage( dmg )
    self:TakePhysicsDamage( dmg )
    if ( self:Health() <= 0 ) then return end
    self:SetHealth( math.Clamp( self:Health() - dmg:GetDamage(), 0, self:GetMaxHealth() ) )
        if ( self:Health() <= 0 ) then
        self:SetNWBool("kirildimi", true)
        ents.FindByClass( "abluka_kalkan" )[1]:Remove()
        local BoomBoom5 = ents.Create( "env_explosion" )
            BoomBoom5:SetKeyValue( "spawnflags", 144 )
            BoomBoom5:SetKeyValue( "iMagnitude", 15 )
            BoomBoom5:SetKeyValue( "iRadiusOverride", 256 )
            BoomBoom5:SetPos( self:GetPos() )
            BoomBoom5:Spawn()
            BoomBoom5:Fire( "explode", "", 0 )
            PrintMessage( HUD_PRINTCENTER, "Kalkan Kırıldı!" )

    end
end




function ENT:Touch(entity)
   
end