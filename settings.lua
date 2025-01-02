---@class __scavenger
local context = select(2, ...)

--[[~ Updated: 2025/01/01 | Author(s): Gopher ]]
--
-- Scavenger - An autoloot addon for World of Warcraft.
--
--This program is free software: you can redistribute it and/or modify it under the terms
--of the GNU General Public License as published by the Free Software Foundation, either
--version 3 of the License, or (at your option) any later version.
--
--This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY;
--without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
--See the GNU General Public License <https://www.gnu.org/licenses/> for more details.

local ITEM_QUALITY = BNUM.ITEM_QUALITY
local REAGENT_TYPE = BNUM.REAGENT_TYPE

---
---!
---


-- context.addon:setDefaultSettings(
--   {
--     ---@class scavenger.quest-settings
--     quest = { loot_all = false },

--     ---@class scavenger.reagent-settings
--     reagents =
--     {
--       loot_fish = true,
--       quality_cap = ITEM_QUALITY.RARE,

--       ---@type number[]
--       lootable_subtypes =
--       {
--         REAGENT_TYPE.DUST,
--         REAGENT_TYPE.HERB,
--         REAGENT_TYPE.PIGMENT,
--         REAGENT_TYPE.LEATHER,
--         REAGENT_TYPE.METAL
--       }
--     },

--     ---@class scavenger.currency-settings
--     currency =
--     {
--       loot_coins = true,
--       gold_threshold = 50,
--       loot_currencies = true
--     },

--     ---@class scavenger.junk-settings
--     junk =
--     {
--       minimum_value = 100,
--       maximum_value = 99999
--     },

--     ---@class scavenger.gear-settings
--     gear =
--     {
--       enabled = true,
--       required_player_level = 60,
--       only_known = true,
--       current_expansion = false
--     },

--     ---@class scavenger.loot-filters
--     filters =
--     {
--       loot = context.loot,
--       ignore = context.ignore
--     }
--   }
-- )

-- TODO: implement interface panel integration.
