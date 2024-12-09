---@class Scavenger
local context = select(2, ...)

--[[~ Updated: 2024/12/04 | Author(s): Gopher ]]

--Scavenger - A World of Warcraft Addon
--Copyright (C) 2024 Erik Riklund (Gopher)
--
--This program is free software: you can redistribute it and/or modify it under the terms
--of the GNU General Public License as published by the Free Software Foundation, either
--version 3 of the License, or (at your option) any later version.
--
--This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY;
--without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
--See the GNU General Public License <https://www.gnu.org/licenses/> for more details.

---@type number
local itemCount

---@type number
local slotsCleared

---@type Vector
local remainingSlots

---@type table<LOOT_SLOT_TYPE, LootHandler>
---Handlers responsible for processing different types of loot slots.
local handlers =
{
  ---@type LootHandler
  [ENUM.LOOT_SLOT_TYPE.ITEM] = function(slotInfo)
    local filters = context.plugin:getSetting 'FILTERS' --[[@as LootFilters]]
    local itemInfo = backbone.getItemInfo (slotInfo.link)

    --Items listed in the ignore filter should not be looted.
    if filters.IGNORE[itemInfo.id] then return false end

    --Items listed in the custom loot filter will be looted.
    if filters.LOOT[itemInfo.id] then return true end

    --Quest items are looted if `LOOT_ALL` is enabled, or if it's the only item that dropped.
    if slotInfo.isQuestItem then
      local options = context.plugin:getSetting 'QUEST' --[[@as QuestLootOptions]]
      return (options.LOOT_ALL or backbone.getLootCount() == 1)
    end

    --Poor quality items are looted if they are within the specified minimum and maximum value range.
    if itemInfo.quality == ENUM.ITEM_QUALITY.POOR then
      local options = context.plugin:getSetting 'JUNK' --[[@as JunkLootOptions]]
      return (itemInfo.sellPrice >= options.MINIMUM_VALUE and itemInfo.sellPrice <= options.MAXIMUM_VALUE)
    end

    --Tradeskill items are looted if their subtype is listed as lootable or if it's a cooking reagent
    --from fishing (with fishing loot enabled), and the item quality is below the set quality cap.
    if itemInfo.typeId == ENUM.ITEM_CLASS.TRADEGOODS then
      local options = context.plugin:getSetting 'TRADESKILL' --[[@as TradeskillLootOptions]]

      return (options.LOOTABLE_SUBTYPES[itemInfo.subtypeId] or (itemInfo.subtypeId == ENUM.TRADESKILL_SUBTYPE.COOKING
        and backbone.isFishingLoot() and options.LOOT_EATABLE_FISH)) and itemInfo.quality < options.QUALITY_CAP
    end

    --Soulbound armor and weapons are looted based on a number of variables.
    --
    --* The player's level must be at or above the specified required level (default: 60).
    --* Gear from the current expansion is only looted if explicitly enabled (default: disabled).
    --* When `ONLY_KNOWN` is enabled, the item's appearance must be known (default: enabled).
    if
      (itemInfo.typeId == ENUM.ITEM_CLASS.ARMOR or itemInfo.typeId == ENUM.ITEM_CLASS.WEAPON)
        and itemInfo.bindType == ENUM.ITEM_BIND.ON_ACQUIRE
    then
      local options = context.plugin:getSetting 'GEAR' --[[@as GearLootOptions]]

      if options.ENABLED and UnitLevel 'player' >= options.PLAYER_LEVEL then
        return (options.CURRENT_EXPANSION or itemInfo.expansionId < backbone.currentExpansion)
            and (not options.ONLY_KNOWN or C_TransmogCollection.PlayerHasTransmogByItemInfo (itemInfo.link))
      end
    end

    return false --the item did not match any of the required criteria.
  end,

  ---@type LootHandler
  [ENUM.LOOT_SLOT_TYPE.MONEY] = function(slot_info)
    --If enabled, coins are looted when the value is below the set threshold.
    local options = context.plugin:getSetting 'CURRENCY' --[[@as CurrencyLootOptions]]
    if not options.LOOT_COINS then return false end

    local cash = strsplit('\n', slot_info.name)
    local amount, value = strsplit(' ', cash)
    return (value ~= 'Gold' or tonumber(amount) < options.GOLD_THRESHOLD)
  end,

  ---@type LootHandler
  [ENUM.LOOT_SLOT_TYPE.CURRENCY] = function(slot_info)
    -- Currencies are looted if enabled and not listed in the ignore list.
    local options = context.plugin:getSetting 'CURRENCY' --[[@as CurrencyLootOptions]]
    if not options.LOOT_CURRENCIES then return false end

    local filters = context.plugin:getSetting 'FILTERS' --[[@as LootFilters]]
    return not filters.IGNORE[slot_info.currencyId]
  end
}

--- ?
context.plugin:registerEventListener(
  'LOOT_OPENED',
  {
    identifier = 'LOOT_OPENED',

    ---@param autoloot boolean
    callback = function (autoloot)
      slotsCleared = 0
      itemCount = backbone.getLootCount()

      remainingSlots = new 'Vector'

      for index = 1, itemCount do
        local slotInfo = backbone.getLootSlotInfo (index)
  
        if not slotInfo.locked and slotInfo.slotType ~= ENUM.LOOT_SLOT_TYPE.NONE then
          if autoloot or (not autoloot and handlers[slotInfo.slotType](slotInfo)) then
            backbone.lootSlot(index) -- loot the current slot.
          else
            ---@class LootableSlot
            local slot = { index = index, info = slotInfo }
              
            remainingSlots:insertElement (slot)
          end
        end
      end

      if remainingSlots:getSize() == itemCount then
        context.plugin:invokeChannelListeners ('LOOT_PROCESSED', remainingSlots)
      end
    end
  }
)

---
context.plugin:registerEventListener(
  'LOOT_SLOT_CLEARED',
  {
    identifier = 'LOOT_SLOT_CLEARED',
    callback = function ()
      slotsCleared = slotsCleared + 1

      local remaining_slots_count = remainingSlots:getSize()
      if remaining_slots_count > 0 and itemCount - slotsCleared == remaining_slots_count then
        context.plugin:invokeChannelListeners ('LOOT_PROCESSED', remainingSlots)
      end
    end
  }
)
