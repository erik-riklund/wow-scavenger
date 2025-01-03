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
---@type number[]
---
context.ignore =
{
  -- Classic --

  8150,    -- Deeprock Salt
  15417,   -- Devilsaur Leather
  7392,    -- Green Whelp Scale
  12809,   -- Guardian Stone
  4235,    -- Heavy Hide
  783,     -- Light Hide
  4232,    -- Medium Hide
  8171,    -- Rugged Hide
  8169,    -- Thick Hide
  5785,    -- Thick Murloc Scale
  15419,   -- Warbear Leather

  -- The Burning Crusade --

  25707,   -- Fel Hide

  -- Wrath of the Lich King

  36908,   -- Frost Lotus

  -- Legion --
  
  124116,  -- Felhide
  124106,  -- Felwort
  124444,  -- Infernal Brimstone

  -- Dragonflight --
  
  193258,  -- Fire-Infused Hide
  201406,  -- Glowing Titan Orb
  193255,  -- Pristine Vorquin Horn
  193254,  -- Rockfang Leather
  193252,  -- Salamanther Scales
  201405,  -- Tuft of Primal Wool
  193256,  -- Windsong Plumage

  -- The War Within --

  218338,  -- Bottled Storm
  218339,  -- Burning Cinderbee Setae
  225768,  -- Crusty Darkmoon Card
  222533,  -- Goldengill Trout
  218337,  -- Honed Bone Shards
  220138,  -- Nibbling Minnow
  220142,  -- Quiet River Bass
  220141,  -- Specular Rainbowfish
}

-- [''] = true, -- 
