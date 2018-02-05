--Just a Helper script

--Author: Vinicius Zibetti Resko


-- Function to help hunt_knight.lua script
-- Returns dangeroues spots (x,y,z,'label')[]
function getDangerSpots()
	local dangerFields = {
		x = {},
		y = {},
		z = {},
		label = {},
	}
	table.insert(dangerFields.x, 33235)
	table.insert(dangerFields.y, 31921)
	table.insert(dangerFields.z, 12)
	table.insert(dangerFields.label, "shubaraks ladder 12")
	
	table.insert(dangerFields.x, 33235)
	table.insert(dangerFields.y, 31923)
	table.insert(dangerFields.z, 13)
	table.insert(dangerFields.label, "shubaraks ladder 13")
	
	table.insert(dangerFields.x, 33519)
	table.insert(dangerFields.y, 31210)
	table.insert(dangerFields.z, 7)
	table.insert(dangerFields.label, "ground the hive")
	
	table.insert(dangerFields.x, 33510)
	table.insert(dangerFields.y, 31192)
	table.insert(dangerFields.z, 7)
	table.insert(dangerFields.label, "ground the hive")
	
	return dangerFields
end

