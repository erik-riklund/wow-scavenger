---@diagnostic disable: undefined-field, undefined-global

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

---@type table
local frame_position

--- ?
context.plugin:registerEventListener(
  'LOOT_OPENED',
  {
    identifier = 'HIDE_LOOT_FRAME',

    callback = function()
      frame_position = {
        LootFrame:GetPoint(ENUM.ANCHOR_POINT.TOPLEFT)
      }

      LootFrame:ClearAllPoints()
      LootFrame:SetClampedToScreen(false)

      LootFrame:SetPoint('TOPLEFT', UIParent, 'TOPRIGHT', 20, 0)
    end
  }
)

--- ?
context.plugin:registerChannelListener(
  'LOOT_PROCESSED',
  {
    identifier = 'SHOW_LOOT_FRAME',

    callback = function()
      if backbone.hasPlugin 'Spoils' then
        --Spoils is not completed, uncomment this section when it is.
        --context.plugin:removeChannelListener('LOOT_PROCESSED', 'SHOW_LOOT_FRAME')
      end

      LootFrame:ClearAllPoints()
      LootFrame:SetPoint(unpack(frame_position))
    end
  }
)
