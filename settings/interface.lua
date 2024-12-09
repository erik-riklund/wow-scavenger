---@class Scavenger
local context = select(2, ...)

--[[~ Updated: 2024/11/30 | Author(s): Gopher ]]

context.plugin:onReady (
  function ()
    local manager = backbone.requestService
      'ConfigManager' --[[@as Backbone.ConfigManager]]



    -- local _, category = SettingsManager (context.plugin)

    -- category:createCheckbox {
    --   variable = 'QUEST/LOOT_ALL', label = '?',
    --   tooltip = '?'
    -- }
  end
)
