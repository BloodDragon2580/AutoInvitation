local L = LibStub("AceLocale-3.0"):GetLocale("AutoInvitation", false)

local triggers={"+","inv"}
local f=CreateFrame("Frame")
local index = GetChannelName("General")
local state=false
f:SetScript("OnEvent",function(_,e,m,s,_,_,_,_,_,id)
    if GetNumGroupMembers() < 5 then
        if (e=="CHAT_MSG_WHISPER") or index then
            for _,t in ipairs(triggers) do
                if m:lower():find(t) then
                    InviteUnit(s)
                    break
                end
            end
        end
    else
        state=false
        print(L["Full-party"])
        f:UnregisterEvent("CHAT_MSG_WHISPER")
        f:UnregisterEvent("CHAT_MSG_CHANNEL")
    end
end)
SlashCmdList.AI = function()
    state=not state
    if state then
        print(L["auto-inviting"])
        f:RegisterEvent("CHAT_MSG_WHISPER")
        f:RegisterEvent("CHAT_MSG_CHANNEL")
    else
        print(L["No-longer"])
        f:UnregisterEvent("CHAT_MSG_WHISPER")
        f:UnregisterEvent("CHAT_MSG_CHANNEL")
    end
end
SLASH_AI1 = "/ai"