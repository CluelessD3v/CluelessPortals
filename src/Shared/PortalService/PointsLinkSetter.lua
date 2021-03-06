local PointsLinkSetter = {}
function PointsLinkSetter.LinkPoints(pA, pB, entryOffset, exitOffset, coolDown)
    local debounce = false
    coolDown = coolDown or 1
    entryOffset = entryOffset or CFrame.new(0,0,0)
    exitOffset = exitOffset or CFrame.new(0,0,0)

    pA.Touched:Connect(function(touchedPart)
        local humanoid = touchedPart.Parent:FindFirstChildWhichIsA("Humanoid")
        if humanoid and debounce == false then
            debounce = true
            print(touchedPart)
            humanoid.RootPart.CFrame = pB.CFrame:ToWorldSpace(exitOffset)
            wait(coolDown)
            debounce = false
        end
    end)

    
    pB.Touched:Connect(function(touchedPart)
        local humanoid = touchedPart.Parent:FindFirstChildWhichIsA("Humanoid")
        if humanoid and debounce == false then
            debounce = true
            print(touchedPart)
            humanoid.RootPart.CFrame = pA.CFrame:ToWorldSpace(entryOffset)
            wait(coolDown)
            debounce = false
        end
    end)
end


return PointsLinkSetter