util.AddNetworkString("durum_goster")
util.AddNetworkString("kalkan_komut")


local function spawnfix( ply )
    ply:SetNWBool("guvenli", true)
    if abluka.sihirbakanligi then ply:SetNWBool("bakanlik", true) end
    print(ply:Nick() .. " adlı oyuncunun okulu guvende gormesi saglandi")

    net.Start("durum_goster") 
    net.Send(ply)
end
hook.Add( "PlayerInitialSpawn", "spawnfixi", spawnfix )




net.Receive("kalkan_komut", function(len, ply)
if abluka.adminlistesi[ ply:GetUserGroup() ] then
    local s = ents.Create("ent_kalkan")
    s:SetKeyValue("spawnflags","8");
    s:SetMoveType(MOVETYPE_VPHYSICS)
    s:SetHealth(net.ReadFloat())
    s:SetMaxHealth(net.ReadFloat())
    s:SetModelScale( s:GetModelScale()*tonumber( 2 ), 0 )
    s:SetPos(ply:GetPos())
    s:SetColor(Color(150,150,150,254))
    s:Spawn()
   if IsValid(s:GetPhysicsObject()) then s:GetPhysicsObject():EnableMotion(false) end 

   function s:OnTakeDamage( dmg )
    s:TakePhysicsDamage( dmg )
    if ( s:Health() <= 0 ) then return end
    s:SetHealth( math.Clamp( s:Health() - dmg:GetDamage(), 0, s:GetMaxHealth() ) )
    if ( s:Health() <= 0 ) then
        s:Remove()
        PrintMessage( HUD_PRINTCENTER, "Kalkan Kırıldı!" )
   end
end

end
end)

