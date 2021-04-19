local PointsLinkSetter = {}


--//TODO Add exceiption if Cooldown is less than 1
--//TODO add exception if points are nil
function PointsLinkSetter.LinkPoints(pA, pB, entryOffset, exitOffset, coolDown)
    local UnlinkPortalsEvent = script.Parent.UnlinkPortals

    local debounce = false
    coolDown = coolDown or 1
    entryOffset = entryOffset or CFrame.new(0,0,0)
    exitOffset = exitOffset or CFrame.new(0,0,0)

    local entryConnection = pA.Touched:Connect(function(touchedPart)
        local humanoid = touchedPart.Parent:FindFirstChildWhichIsA("Humanoid")
        if humanoid and debounce == false then
            debounce = true
            print(touchedPart)
            humanoid.RootPart.CFrame = pB.CFrame:ToWorldSpace(exitOffset)
            wait(coolDown)
            debounce = false
        end
    end)

    
    local exitConnection = pB.Touched:Connect(function(touchedPart)
        local humanoid = touchedPart.Parent:FindFirstChildWhichIsA("Humanoid")
        if humanoid and debounce == false then
            debounce = true
            print(touchedPart)
            humanoid.RootPart.CFrame = pA.CFrame:ToWorldSpace(entryOffset)
            wait(coolDown)
            debounce = false
        end
    end)

    UnlinkPortalsEvent.Event:Connect(function()
        entryConnection:Disconnect()
        exitConnection:Disconnect()
        print("disconnected")
    end)
    
end


return PointsLinkSetter