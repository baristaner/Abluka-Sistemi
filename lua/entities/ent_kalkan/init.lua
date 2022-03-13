
AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )

include( "shared.lua" )


function ENT:Initialize()
    self:SetModel( abluka.kalkanmodel )
    self:PhysicsInit( SOLID_VPHYSICS )
    self:SetMoveType( MOVETYPE_NONE )
    self:SetSolid( SOLID_VPHYSICS )
    self:SetMaterial( "models/props_combine/portalball001_sheet" )

    local PowerPhys = self:GetPhysicsObject()
    if IsValid( PowerPhys ) then
        PowerPhys:Wake()
    end
end



function ENT:OnTakeDamage( dmg )
    self:TakePhysicsDamage( dmg )
    if ( self:Health() <= 0 ) then return end
    self:SetHealth( math.Clamp( self:Health() - dmg:GetDamage(), 0, self:GetMaxHealth() ) )
        if ( self:Health() <= 0 ) then
        self:SetNWBool("kirildimi", true)
        ents.FindByClass( "ent_kalkan" )[1]:Remove()
        local BoomBoom4 = ents.Create( "env_explosion" )
            BoomBoom4:SetKeyValue( "spawnflags", 144 )
            BoomBoom4:SetKeyValue( "iMagnitude", 15 )
            BoomBoom4:SetKeyValue( "iRadiusOverride", 256 )
            BoomBoom4:SetPos( self:GetPos() )
            BoomBoom4:Spawn()
            BoomBoom4:Fire( "explode", "", 0 )
            PrintMessage( HUD_PRINTCENTER, "Kalkan Kırıldı!" )
            self:Ignite( 20, 250 )
            v:Input( "Lock" )
            v:Input( "Close" )

    end
end




function ENT:Touch(entity)
   
end