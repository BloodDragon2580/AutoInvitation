local L = LibStub("AceLocale-3.0"):GetLocale("AutoInvitation", false)

local triggers={"+","inv"}
local o=CreateFrame("Frame")
local index = GetChannelName("General")
o:SetScript("OnEvent",function(_,e,m,s,_,_,_,_,_,id)
   if (e=="CHAT_MSG_WHISPER") or index then
      for _,t in ipairs(triggers) do
         if m:lower():find(t) then
            InviteUnit(s)
            break
          end
        end
      end
    end)
local state=false

SlashCmdList.AIONE = function()
   state=not state if state then
      print(L["auto-inviting"])
      o:RegisterEvent("CHAT_MSG_WHISPER")
      o:RegisterEvent("CHAT_MSG_CHANNEL")
    else print(L["No-longer"])
      o:UnregisterEvent("CHAT_MSG_WHISPER")
      o:UnregisterEvent("CHAT_MSG_CHANNEL")
     end
   end
SLASH_AIONE1 = "/airaid"
