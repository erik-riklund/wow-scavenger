---@class Scavenger
local context = select(2, ...)

--[[~ Updated: 2024/11/30 | Author(s): Gopher ]]

context.plugin:onReady (
  function ()
    local configPanel = ConfigPanel (context.plugin)

    configPanel:createHeader { label = 'quest/header', tooltip = true }
    configPanel:createToggle {
      setting = 'QUEST/LOOT_ALL', label = 'quest/loot-all', tooltip = true
    }

    configPanel:createHeader { label = 'tradeskill/header', tooltip = true }
    configPanel:createToggle {
      setting = 'TRADESKILL/LOOT_EATABLE_FISH', label = 'tradeskill/loot-eatable-fish', tooltip = true
    }

    
  end
)
