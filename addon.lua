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

---
---!
---
context.addon = backbone.registerAddon 'Scavenger'

---
---This channel is used to notify any listeners that the autoloot process is complete.
---It passes a payload consisting of an array with the loot slots that were not looted.
---
context.addon:createPublicChannel 'LOOT_PROCESSED'

---
---!
---
local itemHandler = backbone.requestService 'backbone.item-handler'

---
---!
---
---@type (fun(): boolean)[]
---
local handlers =
{

}
