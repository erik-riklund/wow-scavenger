---@class Scavenger
local context = select(2, ...)

--[[~ Updated: 2024/11/30 | Author(s): Gopher ]]

context.plugin:onReady (
  function ()
    local config = backbone.requestService (
      'Backbone.ConfigPanel', context.plugin
    )

    config.category:createHeader ({
      text = context.plugin:getLocalizedString 'quest/header',
      tooltip = context.plugin:getLocalizedString 'quest/header-tooltip'
    })
    
    config.category:createToggle ({
      variable = 'QUEST/LOOT_ALL',
      label = context.plugin:getLocalizedString 'quest/loot-all',
      tooltip = context.plugin:getLocalizedString 'quest/loot-all-tooltip'
    })

    config.category:createHeader ({
      text = context.plugin:getLocalizedString 'tradeskill/header',
      tooltip = context.plugin:getLocalizedString 'tradeskill/header-tooltip'
    })

    config.category:createToggle ({
      variable = 'TRADESKILL/LOOT_EATABLE_FISH',
      label = context.plugin:getLocalizedString 'tradeskill/loot-eatable-fish',
      tooltip = context.plugin:getLocalizedString 'tradeskill/loot-eatable-fish-tooltip'
    })

    -- ...
  end
)
