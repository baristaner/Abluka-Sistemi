util.AddNetworkString("abluka_ekran")
util.AddNetworkString("abluka_baslat")
util.AddNetworkString("kalkan_cikart")
util.AddNetworkString("abluka_bitsin")
util.AddNetworkString("abluka_bitir")
util.AddNetworkString("okul_guvende")
util.AddNetworkString("okul_guvende_degil")
util.AddNetworkString("bakanlik_guvende")
util.AddNetworkString("bakanlik_guvende_degil")
util.AddNetworkString("kapilari_kapat")
util.AddNetworkString("kapilari_sil")


local oyuncu = FindMetaTable( "Entity" )

function oyuncu:Aydinlikmi()
    if abluka.aydinlik[self:Team()] then return true end
end

function oyuncu:Karanlikmi()
    if abluka.karanlik[self:Team()] then return true end
end


net.Receive( "abluka_baslat", function( len, ply )
	if abluka.adminlistesi[ ply:GetUserGroup() ] or table.HasValue(abluka.meslekler, ply:Team()) then
        if ply:GetNWBool("bakanlik",false) then else ply:ChatPrint("İznin yok veya Sihir Bakanlığı Ele Geçirilmemiş!") 
        hook.Add("PlayerShouldTakeDamage","dost_atesi",function( victim, pl )
        if pl:IsPlayer() then
         if( pl:Aydinlikmi() == victim:Aydinlikmi() )then 
        if( pl:Karanlikmi() == victim:Karanlikmi() )then 
        pl:ChatPrint("Dostuna vurdun : "..victim:Nick())
        return false
        end
        end
        end
 
        return true 
        end)
		for k,v in pairs(player.GetAll()) do
		net.Start("abluka_ekran") 
        net.Send(v)
        v:ChatPrint("ABLUKA BAŞLADI!") 
        if abluka.simpleweather then SW.SetTime( 0 ); end
    end
    end
end
end )

net.Receive( "abluka_bitsin", function( len, ply )
	if abluka.adminlistesi[ ply:GetUserGroup() ] or table.HasValue(abluka.meslekler, ply:Team()) then
        hook.Remove("PlayerShouldTakeDamage","dost_atesi")
        local sil = ents.FindByClass( "ent_kalkan" ) 
        for k, v in pairs(sil) do
        SafeRemoveEntity(v) 
        end
		for k,v in pairs(player.GetAll()) do
		net.Start("abluka_bitir") 
        net.Send(v)
        v:ChatPrint("ABLUKA BİTİRİLDİ!") 
         if abluka.simpleweather then SW.SetTime( 12 ); end
    end
end
end )

net.Receive( "okul_guvende", function( len, ply )
	if abluka.adminlistesi[ ply:GetUserGroup() ] or table.HasValue(abluka.meslekler, ply:Team()) then
		for k,v in pairs(player.GetAll()) do
	    v:SetNWBool( "guvenli", true )
        v:ChatPrint("Okulu Guvenli!") 
        net.Start("durum_goster") 
        net.Send(ply)
    end
end
end )

net.Receive( "okul_guvende_degil", function( len, ply )
	if abluka.adminlistesi[ ply:GetUserGroup() ] or table.HasValue(abluka.meslekler, ply:Team()) then
		for k,v in pairs(player.GetAll()) do
	    v:SetNWBool( "guvenli", false )
        v:ChatPrint("Okulu Karanlik Taraf Ele Gecirdi!") 
        BroadcastLua( [[RunConsoleCommand("guvendemi_hud_calistir")]] )
        net.Start("durum_goster") 
        net.Send(ply)
    end
end
end )

net.Receive( "bakanlik_guvende", function( len, ply )
    if abluka.adminlistesi[ ply:GetUserGroup() ] or table.HasValue(abluka.meslekler, ply:Team()) then
        for k,v in pairs(player.GetAll()) do
        v:SetNWBool( "bakanlik", true )
        v:ChatPrint("Sihir Bakanlığı Güvenli!") 
        net.Start("durum_goster") 
        net.Send(ply)
    end
end
end )

net.Receive( "bakanlik_guvende_degil", function( len, ply )
    if abluka.adminlistesi[ ply:GetUserGroup() ] or table.HasValue(abluka.meslekler, ply:Team()) then
        for k,v in pairs(player.GetAll()) do
        v:SetNWBool( "bakanlik", false )
        v:ChatPrint("Sihir bakanlığı karanlık taraf tarafından ele geçirildi!") 
        net.Start("durum_goster") 
        net.Send(ply)
    end
end
end )

net.Receive("kalkan_cikart", function(len, ply)
if abluka.adminlistesi[ ply:GetUserGroup() ] then
	for k, v in pairs(abluka.kalkanpoziyonlari) do
	local p = ents.Create("ent_kalkan")
    p:SetKeyValue("spawnflags","8");
    p:SetMoveType(MOVETYPE_VPHYSICS)
    p:SetHealth(v[4])
    p:SetMaxHealth( v[4] )
    p:SetModelScale( p:GetModelScale()*tonumber(v[3]), 0 )
    p:SetPos(Vector(v[1])+Vector(v[2]))
    p:SetColor(Color(150,150,150,254))
    p:Spawn()
   if IsValid(p:GetPhysicsObject()) then p:GetPhysicsObject():EnableMotion(false) end 

   function p:OnTakeDamage( dmg )
   	p:TakePhysicsDamage( dmg )
    if ( p:Health() <= 0 ) then return end
    p:SetHealth( math.Clamp( p:Health() - dmg:GetDamage(), 0, p:GetMaxHealth() ) )
   	if ( p:Health() <= 0 ) then
   		p:Remove()
   		PrintMessage( HUD_PRINTCENTER, "Kalkan Kırıldı!" )
   end
end

end
end
end)


net.Receive("kapilari_sil", function(len, ply)
if abluka.adminlistesi[ ply:GetUserGroup() ] then
local sil = ents.FindByModel( "models/hunter/plates/plate4x4.mdl" ) 
for k, v in pairs(sil) do
SafeRemoveEntity(v) 
end
end
end)
 
net.Receive("kapilari_kapat", function(len, ply)          
if abluka.adminlistesi[ ply:GetUserGroup() ] then
    for k, v in pairs(abluka.kapamapozisyonlari) do
    local p = ents.Create("prop_physics")
    p:SetModel(v[1])
    p:SetKeyValue("spawnflags","8");
    p:SetMoveType(MOVETYPE_VPHYSICS)
    p:SetAngles(Angle(v[5]))
    p:SetMaterial("models/effects/comball_sphere")
    p:SetModelScale( p:GetModelScale()*tonumber(v[7]), 0 )
    p:PhysicsInit( SOLID_VPHYSICS )
    p:SetSolid( SOLID_VPHYSICS )
    p:SetPos(Vector(v[3])+Vector(v[4]))
    p:SetColor(Color(150,150,150,254))
    p:Spawn()
   if IsValid(p:GetPhysicsObject()) then p:GetPhysicsObject():EnableMotion(false) end 
end
end
end)