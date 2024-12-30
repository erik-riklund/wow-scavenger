--[[~ Updated: 2024/12/28 | Author(s): Gopher ]]
--
-- Scavenger - An enhanced autoloot addon for "Turtle WoW".
--
--This program is free software: you can redistribute it and/or modify it under the terms
--of the GNU General Public License as published by the Free Software Foundation, either
--version 3 of the License, or (at your option) any later version.
--
--This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY;
--without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
--See the GNU General Public License <https://www.gnu.org/licenses/> for more details.

local addon = backbone.registerAddon 'Scavenger'
addon:createPublicChannel('LOOT_PROCESSED')


