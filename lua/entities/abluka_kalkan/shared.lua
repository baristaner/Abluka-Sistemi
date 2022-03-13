ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.Author = "baristaner."

ENT.Spawnable = true
ENT.AdminOnly = true

ENT.PrintName = "Koruyucu Kalkan"
ENT.Category = "Abluka Sistemi"

ENT.Can = abluka.kalkancan

function ENT:SetupDataTables()
    self:NetworkVar( "Bool", 0, "PlayerRepairing" )
end
