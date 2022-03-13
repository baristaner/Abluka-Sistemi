ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.Author = "baristaner."

ENT.Spawnable = false
ENT.AdminOnly = true

ENT.PrintName = "Kalkan"
ENT.Category = "Abluka Sistemi"

ENT.PowerHealth = abluka.kalkancan

function ENT:SetupDataTables()
    self:NetworkVar( "Bool", 0, "PlayerRepairing" )
end
