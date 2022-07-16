--table.insert(DebiddoID, "DebiddoIDG end")

--for n, f in ipairs( DebiddoIDG ) do
--	print(n, f)
--end

-- Clear table for sake of our memory alocation
--DebiddoID = nil

--[[ FIXME: isso permitirá adicionar qualquer coisa que seja proveniente do meu workflow
for n, f in ipairs( DebiddoID ) do
	if SERVER then resource.AddWorkshop(DebiddoWORKSHOPID[n])
	elseif CLIENT and DebiddosSharedMaterials then
		MsgC( Color( 35, 245, 13 ), "["..DebiddoNAME[n].."] Loaded!\n" )
	end
	DebiddoPM( DebiddoNAME[n], DebiddoID[n] )
	DebiddoNPC( DebiddoNAME[n], DebiddoID[n], DebiddoCATEGORY[n] )
end

--[[ Isso deve ser executado no final de tudo
for n, f in ipairs( DebiddoID ) do
	if SERVER then resource.AddWorkshop(DebiddoWORKSHOP[n])
  elseif CLIENT and DebiddoAddon then
		MsgC( Color( 35, 245, 13 ), "["..DebiddoNAME[n].."] Loaded!\n" )
  end

	-- Isso precisa ser movido para lua/client:
	--MsgC( Color( 255, 30, 30 ), "["..DebiddoNAME[n].."] material path not found!\n["..DebiddoNAME[n].."] you may have missing files! check if you are subcribed to my shared textures!\n["..DebiddoNAME[n].."] download here:\n["..DebiddoNAME[n].."] https://steamcommunity.com/sharedfiles/filedetails/?id=2086033839\n")

	--list.Set( "PlayerOptionsModel", DebiddoNAME[n], "models/debiddo/"..DebiddoID[n].."/pm.mdl" )
	--player_manager.AddValidModel( DebiddoNAME[n], "models/debiddo/"..DebiddoID[n].."/pm.mdl" )
	--player_manager.AddValidHands( DebiddoNAME[n], "models/debiddo/"..DebiddoID[n].."/c_arms.mdl", 0, 0 )

	-- Exemplo de adiçãode NPC via loop
  DebiddoHL2NPC( {
		Name = DebiddoNAME[n].." (Friendly)",
		Class = "npc_citizen",
		KeyValues = { citizentype = CT_REBEL, SquadName = "Rebel" },
		Model = "models/debiddo/"..DebiddoID[n].."/npc.mdl",
		Weapons = DebiddoWeapons,
		Health = (100 * 0.8),
		Category = DebiddoCATEGORY[n]
	}, "npc_"..DebiddoID[n].."_f" )
	DebiddoHL2NPC( {
		Name = DebiddoNAME[n].." (Hostile)",
		Class = "npc_combine_s",
		KeyValues = { SquadName = "overwatch"},
		Model = "models/debiddo/"..DebiddoID[n].."/npc_c.mdl",
		Weapons = DebiddoWeapons,
		Health = (100 * 1.1),
		Numgrenades = "4",
		Category = DebiddoCATEGORY[n]
	}, "npc_"..DebiddoID[n].."_h" )
end
--]]

-- Clean Tables
DebiddoNAME       = nil
DebiddoCATEGORY   = nil
DebiddoID         = nil
DebiddoWORKSHOPID = nil
DebiddoPREFIX     = nil
