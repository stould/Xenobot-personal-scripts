--A script to use area spells (or non area spells)
-- Script takes care about:
-- 1) Players in range
-- 2) Minimum ammount of monsters
-- 3) Radius to check for players
-- 4) If the spell is safe cast
-- 5) If spell requires target
-- 6) Minimum mana to cast the spell
-- 7) Check for dangerous spots (like ladders), if this spot is in checkRadius, area spells are not used 

--Author: Vinicius Zibetti Resko

require "helper"

NO_TARGET = 0

-- loading the 'danger' spots that we should avoid using area spells
dangerFields = getDangerSpots()

-- Delay between ticks
delay = 50

local config = {
	attacks = {
		['exori'] = {
			minMonsters = 4, -- min numbers of monsters in order to cast the spell
			attackRadius = 1, -- range to count targets to attack
			checkRadius = 6, -- safe range to check for players (should always be larger or at least equal to spellRadius)
			isSafe = false, -- false -> spell may hit players; true -> cant shoot players
			needTarget = false, -- need to be targeted or not
			mana = 20 -- mana cost for the spell
		},
		['exori ico'] = {
			minMonsters = 1,
			attackRadius = 1,
			checkRadius = 1,
			isSafe = true,
			needTarget = true,
			mana = 30
		},
		['exori gran ico'] = {
			minMonsters = 1,
			attackRadius = 1,
			checkRadius = 1,
			isSafe = true,
			needTarget = true,
			mana = 30
		},
	}
}

-- check if a unit spot is safe or not
function isSafeSpot(x, y, z)
	for i = 1, table.getn(dangerFields.x) do
		if(dangerFields.x[i] == x and dangerFields.y[i] == y and dangerFields.z[i] == z) then
			return false
		end
	end
	return true
end

-- checking if the whole spot is safe
function isSafeArea(currentPosition, range)
	for i = -range,range do
		for j = -range,range do
			if(isSafeSpot(currentPosition.x + i, currentPosition.y + j, currentPosition.z) == false) then
				return false
			end
		end
	end
	return true
end

-- Returns the ammount of targets in the checkRadius
-- Returns player and monster counts
function getTargetCount(currentPosition, attackRadius, checkRadius)
	
	local monsters = 0
	local  players = 0
	
    for name, creature in Creature.iCreatures(checkRadius) do
		local distance = getDistanceBetween(creature:Position(), currentPosition)
		if creature:isPlayer() then
			players = players + 1
		end
		if(distance <= attackRadius)then
			if(not creature:isPlayer())then
				monsters = monsters + 1
			end
		end
	end
	return players, monsters
end

function run()
    for spell, spell_data in pairs(config.attacks) do
		if(isSafeArea(Self.Position(), spell_data.checkRadius)) then
			players, monsters = getTargetCount(Self.Position(), spell_data.attackRadius, spell_data.checkRadius)
			if(monsters >= spell_data.minMonsters) then
				if (spell_data.isSafe or players == 0) then
					if(Self.CanCastSpell(spell)) then
						if(spell_data.needTarget) then
							if(Self.TargetID() ~= NO_TARGET) then
								Self.Cast(spell, spell_data.mana)
							end
						else
							Self.Cast(spell, spell_data.mana)
						end
					end
				end
			end
		end
    end
end

while (true) do
	run()
    wait(delay)
end