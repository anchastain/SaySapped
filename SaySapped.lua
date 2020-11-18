local SaySapped = CreateFrame("Frame")
SaySapped.playername = UnitName("player")

SaySapped:SetScript("OnEvent", function(self, evt)
    if( evt == "COMBAT_LOG_EVENT_UNFILTERED" )then
        local _, event, _, _, sourceName, _, _, _, dstName, _,_,spellId = CombatLogGetCurrentEventInfo()

        if( (spellId == 6770)
            and (dstName == SaySapped.playername)
            and (event == "SPELL_AURA_APPLIED" or event == "SPELL_AURA_REFRESH")
            )then
            SendChatMessage("Sapped by: "..(sourceName or "(unknown)"),"SAY")
            DEFAULT_CHAT_FRAME:AddMessage("Sapped by: "..(sourceName or "(unknown)"))
        end

    end
end)

SaySapped:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
DEFAULT_CHAT_FRAME:AddMessage("SaySapped loaded")
