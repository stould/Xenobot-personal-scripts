--Just a rune maker script
-- Makes blank runes if it is needed, then make the rune you want.

--Author: Vinicius Zibetti Resko

-- Blank Rune ID
blank_rune_ID = 3147

-- Making the rune itself
function make_rune(spell_name, mana_cost)
	if Self.ItemCount(blank_rune_ID) == 0 then
		Self.Say("adori blank", 10)
	else
		if(Self.Mana() >= mana_cost) then
			Self.Say(spell_name, 10)
		end
	end
end

while (true) do
	-- Check if you have enough soul points
	if(Self.Soul() > 2) then
		make_rune("adori mas frigo", 530)
		sleep(1000)
	else
		break
	end
end