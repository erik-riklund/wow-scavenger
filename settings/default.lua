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

backbone.registerDefaultSettings(
  context.plugin,
  {
    ---@class QuestLootOptions
    QUEST =
    {
      --Autoloot all quest items?
      LOOT_ALL = false
    },
  
    ---@class TradeskillLootOptions
    TRADESKILL =
    {
      --Determines the quality cap for lootable tradeskill items.
      QUALITY_CAP = ENUM.ITEM_QUALITY.RARE,
  
      --Determines the tradeskill item subtypes that should be looted.
      LOOTABLE_SUBTYPES = {
        [ENUM.TRADESKILL_SUBTYPE.ENCHANTING]  = true,
        [ENUM.TRADESKILL_SUBTYPE.HERB]        = true,
        [ENUM.TRADESKILL_SUBTYPE.INSCRIPTION] = true,
        [ENUM.TRADESKILL_SUBTYPE.LEATHER]     = true,
        [ENUM.TRADESKILL_SUBTYPE.METALS]      = true
      },
  
      --If enabled, fish used for cooking will be looted.
      LOOT_FISH = true
    },
  
    ---@class CurrencyLootOptions
    CURRENCY =
    {
      --If enabled, money will be looted.
      LOOT_COINS = true,
  
      --Defines the maximum amount of gold to loot.
      GOLD_THRESHOLD = 50,
  
      --If enabled, currencies will be looted.
      LOOT_CURRENCIES = true
    },
  
    ---@class JunkLootOptions
    JUNK =
    {
      --The minimum value (in copper) of poor quality items to loot.
      MINIMUM_VALUE = 100,
  
      --The maximum value (in copper) of poor quality items to loot.
      MAXIMUM_VALUE = 99999
    },
  
    ---@class GearLootOptions
    GEAR = 
    {
      --Loot soulbound weapons and armor?
      ENABLED = true,
  
      --The character's required minimum level for this to be active.
      PLAYER_LEVEL = 60,
  
      --If enabled, only items with known appearances will be looted.
      ONLY_KNOWN = true,
  
      --If enabled, items from the current expansion will be looted.
      CURRENT_EXPANSION = false
    },
  
    ---@class LootFilters
    FILTERS = { LOOT = context.loot, IGNORE = context.ignore }
  }
)
