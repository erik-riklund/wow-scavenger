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
---@type array<number>
---
context.loot =
{
  -- Classic

  6522,    -- Deviate Fish
  6359,    -- Firefin Snapper
  58503,   -- Hardened Walleye (quest item)
  13757,   -- Lightning Eel
  6358,    -- Oily Blackmouth
  13422,   -- Stonescale Eel
  58899,   -- Violet Perch (quest item)

  -- The Burning Crusade

  22572,   -- Mote of Air
  22573,   -- Mote of Earth
  22574,   -- Mote of Fire
  22575,   -- Mote of Life
  22576,   -- Mote of Mana
  22577,   -- Mote of Shadow
  22578,   -- Mote of Water

  -- Wrath of the Lich King

  52027,   -- Conqueror's Mark of Sanctification
  52030,   -- Conqueror's Mark of Sanctification (heroic)
  37700,   -- Crystallized Air
  37701,   -- Crystallized Earth
  37702,   -- Crystallized Fire
  37704,   -- Crystallized Life
  37703,   -- Crystallized Shadow
  37705,   -- Crystallized Water
  52026,   -- Protector's Mark of Sanctification
  52029,   -- Protector's Mark of Sanctification (heroic)
  52025,   -- Vanquisher's Mark of Sanctification
  52028,   -- Vanquisher's Mark of Sanctification (heroic)

  -- Cataclysm

  52328,   -- Volatile Air
  52327,   -- Volatile Earth
  52325,   -- Volatile Fire
  52329,   -- Volatile Life
  52326,   -- Volatile Water

  -- Warlords of Draenor

  120945,  -- Primal Spirit

  -- Legion

  137677,  -- Fel Blood (quest item)
  129894,  -- Stormscale Spark (quest item)
  124438,  -- Unbroken Claw
  124439,  -- Unbroken Tooth
  129888,  -- Undivided Hide (quest item)

  -- Shadowlands

  189864,  -- Anima Gossamer
  186204,  -- Anima-Stained Glass Shards
  184152,  -- Bottle of Diluted Anima-Wine
  184148,  -- Concealed Sinvyr Flask
  187322,  -- Crumbling Stone Tablet
  181551,  -- Depleted Stoneborn Heart
  185754,  -- Devoured Anima (quest item)
  187457,  -- Engraved Glass Pane
  187324,  -- Gnawed Ancient Idol
  186200,  -- Infused Dendrite
  188740,  -- Korthian Repository (quest item)
  181388,  -- Lush Marrowroot
  184307,  -- Maldraxxi Armor Scraps
  178061,  -- Malleable Flesh
  185751,  -- Mawsworn Emblem (quest item)
  184386,  -- Nascent Sporepod
  181642,  -- Novice Principles of Plaguistry
  186685,  -- Relic Fragment
  180009,  -- Resonating Anima Mote
  184770,  -- Roster of the Forgotten
  181969,  -- Rugged Carapace (quest item)
  187323,  -- Runic Diagram
  184146,  -- Singed Soul Shackles
  184306,  -- Soulcatching Sludge
  187460,  -- Strangely Intricate Key
  178550,  -- Tenebrous Truffle
  177061,  -- Twilight Bark
  187458,  -- Unearthed Teleporter Sigil
  181644,  -- Unlabeled Culture Jars
  187459,  -- Vial of Mysterious Liquid
  186202,  -- Wafting Koricone
  181643,  -- Weeping Corpseshroom

  -- Dragonflight

  202071,  -- Elemental Mote
  202070,  -- Exceptional Pelt
  200695,  -- Fangtooth Petals
  192615,  -- Fluorescent Fluid
  191100,  -- Fresh Game Meat (quest item)
  200704,  -- Gratona Seed
  192658,  -- High-Fiber Leaf
  200699,  -- Milkweed Fibers
  200553,  -- Panthis Nectar
  192545,  -- Primal Flame Fragment (quest item)
  200694,  -- River Bell Bulbs
  197754,  -- Salt Deposit
  199206,  -- Shattered Adamant Scales
  191541,  -- Shikaar Supplies (quest item)
  198349,  -- Stolen Dragonscale Supplies (quest item)
  200705,  -- Thaldraszus Root
  200701,  -- Titian Extract
  199204,  -- Torn Resilient Leather Scraps
  200703,  -- Vine Flower Fibers
  200222,  -- White Bell Pigment
  192636,  -- Woolly Mountain Pelt

  -- The War Within

  232047,  -- Chunk of Companion Experience (common)
  220737,  -- Storm Spirit (quest item)
}

-- [''] = true, -- 
