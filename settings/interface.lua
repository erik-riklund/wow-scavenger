---@class Scavenger
local context = select(2, ...)

--[[~ Updated: 2024/11/30 | Author(s): Gopher ]]

context.plugin:onReady (
  function ()
    local configPanel = backbone.requestService (
      'Backbone.ConfigPanel', context.plugin
    )

    ---
    --- 
    ---

    configPanel.category:createHeader ({
      text = context.plugin:getLocalizedString 'quest/header',
      tooltip = context.plugin:getLocalizedString 'quest/header-tooltip'
    })
    
    configPanel.category:createToggle ({
      setting = 'QUEST/LOOT_ALL',
      label = context.plugin:getLocalizedString 'quest/loot-all',
      tooltip = context.plugin:getLocalizedString 'quest/loot-all-tooltip'
    })

    configPanel.category:createHeader ({
      text = context.plugin:getLocalizedString 'tradeskill/header',
      tooltip = context.plugin:getLocalizedString 'tradeskill/header-tooltip'
    })

    configPanel.category:createToggle ({
      setting = 'TRADESKILL/LOOT_EATABLE_FISH',
      label = context.plugin:getLocalizedString 'tradeskill/loot-eatable-fish',
      tooltip = context.plugin:getLocalizedString 'tradeskill/loot-eatable-fish-tooltip'
    })
  end
)
