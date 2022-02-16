--Debiddo bootstrap
DebiddosSharedMaterials = true
DebiddoNAME = {}
DebiddoCATEGORY = {}
DebiddoID = {}
DebiddoWORKSHOPID = {}

CreateConVar( "sv_debiddo_npc_base_health", "100", FCVAR_GAMEDLL, "Changes the base health for the newler HL2 based NPCs by Debiddo\nUsually Citizens have: <base>*0.8\nCombine NPCs have <base>*1.1\n", "1", "2147483648" )
local sv_debiddo_npc_base_health = GetConVar( "sv_debiddo_npc_base_health" )

function DebiddoPM( DebiddoNAME, DebiddoID )
	list.Set( "PlayerOptionsModel", DebiddoNAME, "models/debiddo/"..DebiddoID.."/pm.mdl" )
	player_manager.AddValidModel( DebiddoNAME, "models/debiddo/"..DebiddoID.."/pm.mdl" )
	player_manager.AddValidHands( DebiddoNAME, "models/debiddo/"..DebiddoID.."/c_arms.mdl", 0, 0 )
end

function DebiddoHL2NPC( t, class )
	list.Set( "NPC", class or t.Class, t )
end

function DebiddoNPC( DebiddoNAME, DebiddoID, DebiddoCATEGORY )
	DebiddoHL2NPC( {
		Name = DebiddoNAME.." (Friendly)",
		Class = "npc_citizen",
		KeyValues = { citizentype = CT_REBEL, SquadName = "Rebel" },
		Model = "models/debiddo/"..DebiddoID.."/npc.mdl",
		Weapons = { "weapon_stunstick", "weapon_crowbar", "weapon_pistol", "weapon_357", "weapon_smg1", "weapon_ar2", "weapon_shotgun", "weapon_rpg" },
		Health = (sv_debiddo_npc_base_health:GetInt() * 0.8),
		Category = DebiddoCATEGORY
	}, "npc_"..DebiddoID.."_f" )
	DebiddoHL2NPC( {
		Name = DebiddoNAME.." (Hostile)",
		Class = "npc_combine_s",
		KeyValues = { SquadName = "overwatch"},
		Model = "models/debiddo/"..DebiddoID.."/npc_c.mdl",
		Weapons = { "weapon_stunstick", "weapon_pistol", "weapon_357", "weapon_smg1", "weapon_ar2", "weapon_shotgun" },
		Health = (sv_debiddo_npc_base_health:GetInt() * 1.1),
		Numgrenades = "4",
		Category = DebiddoCATEGORY
	}, "npc_"..DebiddoID.."_h" )
end
