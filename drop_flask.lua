--Just an Drop Flask script

--Author: unknown

function dropItem(id, cnt) 
    local cont = Container.GetFirst() 
    while (cont:isOpen()) do 
        for spot = 0, cont:ItemCount() do 
            local item = cont:GetItemData(spot) 
            if (item.id == id and item.count >= cnt) then 
                    cont:MoveItemToGround(spot, Self.Position().x, Self.Position().y, Self.Position().z) 
                    return true 
            end 
        end 
        cont = cont:GetNext() 
    end
    return false 
end 


while (true) do 
    if (dropItem(285,20)) then
        wait(30000, 45000) -- Since we've already dropped a stack, wait a bit of time before trying to drop another
    else
        wait(2000) -- havent dropped shit, wait2 seconds and try again. No need for randomization since we didn't do anything
    end
end  