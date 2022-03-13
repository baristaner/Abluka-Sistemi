--include("baristaner/config.lua")

if SERVER then
	AddCSLuaFile("abluka/arayuz/fonksiyonlar.lua")
	AddCSLuaFile("abluka/arayuz/cl_arayuz_abluka.lua")
	AddCSLuaFile("abluka/arayuz/vgui.lua")
	AddCSLuaFile("abluka/arayuz/abluka_izle.lua")
	AddCSLuaFile("abluka/arayuz/cl_net.lua")

	include("abluka/sunucu/sv_abluka.lua")
	include("abluka/sunucu/sv_sistem.lua")
end

if CLIENT then

	include("abluka/arayuz/fonksiyonlar.lua")	
	include("abluka/arayuz/cl_arayuz_abluka.lua")
	include("abluka/arayuz/vgui.lua")	
	include("abluka/arayuz/abluka_izle.lua")
	include("abluka/arayuz/cl_net.lua")
end