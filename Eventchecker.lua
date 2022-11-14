-- [[The table containing the payload [key] = "value" of Type generated by the events PLAYER_INTERACTION_MANAGER_FRAME_SHOW and PLAYER_INTERACTION_MANAGER_FRAME_HIDE.]]
local WhatType = {

	[0] = "None",
	[1] = "TradePartner",
	[2] = "Item",
	[3] = "Gossip",
	[4] = "QuestGiver",
	[5] = "Merchant",
	[6] = "TaxiNode",
	[7] = "Trainer",
	[8] = "Banker",
	[9] = "AlliedRaceDetailsGiver",
	[10] = "GuildBanker",
	[11] = "Registrar",
	[12] = "Vendor",
	[13] = "PetitionVendor",
	[14] = "TabardVendor",
	[15] = "TalentMaster",
	[16] = "SpecializationMaster",
	[17] = "MailInfo",
	[18] = "SpiritHealer",
	[19] = "AreaSpiritHealer",
	[20] = "Binder",
	[21] = "Auctioneer",
	[22] = "StableMaster",
	[23] = "BattleMaster",
	[24] = "Transmogrifier",
	[25] = "LFGDungeon",
	[26] = "VoidStorageBanker",
	[27] = "BlackMarketAuctioneer",
	[28] = "AdventureMap",
	[29] = "WorldMap",
	[30] = "GarrArchitect",
	[31] = "GarrTradeskill",
	[32] = "GarrMission",
	[33] = "ShipmentCrafter",
	[34] = "GarrRecruitment",
	[35] = "GarrTalent",
	[36] = "Trophy",
	[37] = "PlayerChoice",
	[38] = "ArtifactForge",
	[39] = "ObliterumForge",
	[40] = "ScrappingMachine",
	[41] = "ContributionCollector",
	[42] = "AzeriteRespec",
	[43] = "IslandQueue",
	[44] = "ItemInteraction",
	[45] = "ChromieTime",
	[46] = "CovenantPreview",
	[47] = "AnimaDiversion",
	[48] = "LegendaryCrafting",
	[49] = "WeeklyRewards",
	[50] = "Soulbind",
	[51] = "CovenantSanctum",
	[52] = "NewPlayerGuide",
	[53] = "ItemUpgrade",
	[54] = "AdventureJournal",
	[55] = "Renown",
	[56] = "AzeriteForge",
	[57] = "PerksProgramVendor",
	[58] = "ProfessionsCraftingOrder",
	[59] = "Professions",
	[60] = "ProfessionsCustomerOrder",
	[61] = "TraitSystem",
	[62] = "BarbersChoice",
	[63] = "JailersTowerBuffs",
	[64] = "MajorFactionRenown"

}

local Eventchecker = {};
-- [[Many of the overlap events were removed. Some, and even though the event Type payloads are assigned to the new "PLAYER_INTERACTION_MANAGER_FRAME" events, no longer exist in the game. I have included as many of the remaining events as I could discover, though I am sure I missed some. The point of this is to illustrate that both the new "PLAYER_INTERACTION_MANAGER_FRAME" events and the old events are firing simultaneusly. It is my theory that this overlap is contributing to the taint problem many AddOn authors are experiencing with previously reliable functions. It's just a theory. Regardless, the fact that there is overlap is downright sloppy.]]
-- [[When active, the AddOn will be on the lookout for the events defined by the World of Warcraft API events, both new and old.]]
function Eventchecker:OnLoad()
	self:RegisterEvent("PLAYER_INTERACTION_MANAGER_FRAME_SHOW");
	self:RegisterEvent("PLAYER_INTERACTION_MANAGER_FRAME_HIDE");
	self:RegisterEvent("ADVENTURE_MAP_OPEN");
	self:RegisterEvent("ADVENTURE_MAP_CLOSE");
	self:RegisterEvent("ALLIED_RACE_OPEN");
	self:RegisterEvent("ALLIED_RACE_CLOSE");
	self:RegisterEvent("AUCTION_HOUSE_SHOW");
	self:RegisterEvent("AUCTION_HOUSE_CLOSED");
	self:RegisterEvent("AZERITE_ESSENCE_FORGE_OPEN");
	self:RegisterEvent("AZERITE_ESSENCE_FORGE_CLOSE");
	self:RegisterEvent("BANKFRAME_OPENED");
	self:RegisterEvent("BANKFRAME_CLOSED");
	self:RegisterEvent("BARBER_SHOP_OPEN");
	self:RegisterEvent("BARBER_SHOP_CLOSE");
	self:RegisterEvent("BLACK_MARKET_OPEN");
	self:RegisterEvent("BLACK_MARKET_CLOSE");
	self:RegisterEvent("GARRISON_ARCHITECT_OPENED");
	self:RegisterEvent("GARRISON_ARCHITECT_CLOSED");
	self:RegisterEvent("GARRISON_RECRUITMENT_NPC_OPENED");
	self:RegisterEvent("GARRISON_RECRUITMENT_NPC_CLOSED");
	self:RegisterEvent("GARRISON_SHIPYARD_NPC_OPENED");
	self:RegisterEvent("GARRISON_SHIPYARD_NPC_CLOSED");
	self:RegisterEvent("GARRISON_TALENT_NPC_OPENED");
	self:RegisterEvent("GARRISON_TALENT_NPC_CLOSED");
	self:RegisterEvent("GARRISON_TRADESKILL_NPC_CLOSED");
	self:RegisterEvent("GOSSIP_SHOW");
	self:RegisterEvent("GOSSIP_CLOSED");
	self:RegisterEvent("GUILDBANKFRAME_OPENED");
	self:RegisterEvent("GUILDBANKFRAME_CLOSED");
	self:RegisterEvent("GUILD_REGISTRAR_SHOW");
	self:RegisterEvent("GUILD_REGISTRAR_CLOSED");
	self:RegisterEvent("MAIL_SHOW");
	self:RegisterEvent("MAIL_CLOSED");
	self:RegisterEvent("MERCHANT_SHOW");
	self:RegisterEvent("MERCHANT_CLOSED");
	self:RegisterEvent("PET_STABLE_SHOW");
	self:RegisterEvent("PET_STABLE_CLOSED");
	self:RegisterEvent("SHIPMENT_CRAFTER_OPENED");
	self:RegisterEvent("SHIPMENT_CRAFTER_CLOSED");
	self:RegisterEvent("TAXIMAP_OPENED");
	self:RegisterEvent("TAXIMAP_CLOSED");
	self:RegisterEvent("TRADE_SHOW");
	self:RegisterEvent("TRADE_CLOSED");
	self:RegisterEvent("TRADE_SKILL_SHOW");
	self:RegisterEvent("TRADE_SKILL_CLOSE");
	self:RegisterEvent("TRAINER_SHOW");
	self:RegisterEvent("TRAINER_CLOSED");
	self:RegisterEvent("TRANSMOGRIFY_OPEN");
	self:RegisterEvent("TRANSMOGRIFY_CLOSE");
	self:SetScript("OnEvent", self.OnEvent);
end
-- [[The tables containing an array of events, or just one event in two of the tables. The "PLAYER_INTERACTION_MANAGER_FRAME" events are isolated from the other registered events by being assigned to their own tables.]]
local beginNewEvent = {
	PLAYER_INTERACTION_MANAGER_FRAME_SHOW = true
};

local endNewEvent = {
	PLAYER_INTERACTION_MANAGER_FRAME_HIDE = true
};

local beginOldEvent = {
	ADVENTURE_MAP_OPEN = true,
	ALLIED_RACE_OPEN = true,
	AUCTION_HOUSE_SHOW = true,
	AZERITE_ESSENCE_FORGE_OPEN = true,
	BANKFRAME_OPENED = true,
	BARBER_SHOP_OPEN = true,
	BLACK_MARKET_OPEN = true,
	GARRISON_ARCHITECT_OPENED = true,
	GARRISON_RECRUITMENT_NPC_OPENED = true,
	GARRISON_SHIPYARD_NPC_OPENED = true,
	GARRISON_TALENT_NPC_OPENED = true,
	GOSSIP_SHOW = true,
	GUILDBANKFRAME_OPENED = true,
	GUILD_REGISTRAR_SHOW = true,
	MAIL_SHOW = true,
	MERCHANT_SHOW = true,
	PET_STABLE_SHOW = true,
	SHIPMENT_CRAFTER_OPENED = true,
	TAXIMAP_OPENED = true,
	TRADE_SHOW = true,
	TRADE_SKILL_SHOW = true,
	TRAINER_SHOW = true,
	TRANSMOGRIFY_OPEN = true
};

local endOldEvent = {
	ADVENTURE_MAP_CLOSE = true,
	ALLIED_RACE_CLOSE = true,
	AUCTION_HOUSE_CLOSED = true,
	AZERITE_ESSENCE_FORGE_CLOSE = true,
	BANKFRAME_CLOSED = true,
	BARBER_SHOP_CLOSE = true,
	BLACK_MARKET_CLOSE = true,
	GARRISON_ARCHITECT_CLOSED = true,
	GARRISON_RECRUITMENT_NPC_CLOSED = true,
	GARRISON_SHIPYARD_NPC_CLOSED = true,
	GARRISON_TALENT_NPC_CLOSED = true,
	GARRISON_TRADESKILL_NPC_CLOSED = true,
	GOSSIP_CLOSED = true,
	GUILDBANKFRAME_CLOSED = true,
	GUILD_REGISTRAR_CLOSED = true,
	MAIL_CLOSED = true,
	MERCHANT_CLOSED = true,
	PET_STABLE_CLOSED = true,
	SHIPMENT_CRAFTER_CLOSED = true,
	TAXIMAP_CLOSED = true,
	TRADE_CLOSED = true,
	TRADE_SKILL_CLOSE = true,
	TRAINER_CLOSED = true,
	TRANSMOGRIFY_CLOSE = true
};
-- [[The function set in motion once one, or more, of the registered events fires.]]
function Eventchecker:OnEvent(event, ...)
-- [[The if elsif statement which executes when the new "PLAYER_INTERACTION_MANAGER_FRAME" events fire.]]
	if beginNewEvent[event]
-- [["We got one!" Sorry, couldn't help the Ghostbuster reference.]]
	then
 -- [[PLAYER_INTERACTION_MANAGER_FRAME_SHOW has one payload: Type. Get the Type payload from "function Eventchecker:OnEvent(event, ...)" where PLAYER_INTERACTION_MANAGER_FRAME_SHOW is the "event", and represent the Type payload with the word "checkevent".]]
		local checkevent = ...
		if checkevent then
 -- [[Assuming the Type payload now represented by "checkevent" is a string, this converts that text string to a number.]]
			local check = tonumber(checkevent)
 -- [[Compares the number represented by "check" to the key elements in the table "WhatType" and advances only if there is a value.]]
			if WhatType[check] ~= nil then
 -- [[the '[key] = "value"' in "WhatType" has "[key]" compared to data in "check", which is the event Type payload, then prints "value".]]
				for key, value in pairs(WhatType) do
					if check == key then
					print("|cff00ff00Opening fired the new #|r".." "..(key).." ".."|cff00ff00=|r".." "..(value).." ".."|cff00ff00Player Interaction Type|r")
					end
				end
-- [[Just in case that the Type payload returns something not on the "WhatType" list.]]
			else
				if check then
					print("|cffff00ffOpening fired the new #|r".." "..(check).." ".."|cffff00ffPlayer Interaction Type and it's not on the list|r")
				end
			end
		end
-- [[Just repeats the code above for "function Eventchecker:OnEvent(event, ...)" where PLAYER_INTERACTION_MANAGER_FRAME_HIDE is the "event".]]
	elseif endNewEvent[event] then
		local checkevent = ...
		if checkevent then
			local check = tonumber(checkevent)
			if WhatType[check] ~= nil then
				for key, value in pairs(WhatType) do
					if check == key then
					print("|cff00ff00Closing fired the new #|r".." "..(key).." ".."|cff00ff00=|r".." "..(value).." ".."|cff00ff00Player Interaction Type|r")
					end
				end
			else 
				if check then
					print("|cffff00ffClosinging fired the new #|r".." "..(check).." ".."|cffff00ffPlayer Interaction Type and it's not on the list|r")
				end
			end
		end
	end
-- [[The if elseif statemet which address the old events. This part shows the overlap. The code does not bother with event payloads and simply lists the events by name when called. Most events fire in matched pairs, one to open and one to close.]]
	if beginOldEvent[event] then
		print("|cff00ffffOpening fired the old|r".." "..(event).." ".."|cff00ffffAPI Event|r")
	elseif endOldEvent[event] then
		print("|cff00ffffClosing fired the old|r".." "..(event).." ".."|cff00ffffAPI Event|r")
	end
end

local CheckerDisplay = Mixin(CreateFrame("FRAME"), Eventchecker);
CheckerDisplay:OnLoad();



