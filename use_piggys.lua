--Just an Use & Drop piggys script

--Author: unknown

Module.New("Use&Drop", function(Piggy)
    local cont = Container.GetFirst()  
    while (cont:isOpen()) do  
        for spot = 0, cont:ItemCount() do  
            local item = cont:GetItemData(spot)  
            if (item.id == 2995) then  
                if (item.count > 0) then
                    cont:UseItem(spot)
                end
            end  
        end  
        cont = cont:GetNext()  
    end
	
    if (Self.ItemCount(2996) > 0) then
        Self.DropItems(Self.Position().x, Self.Position().y, Self.Position().z, 2996)
    end 

    Piggy:Delay(2000)

end)