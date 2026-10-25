-- Delta Executor CFrame Speed Boost Script
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

-- Configuration
local BOOST_SPEED = 20 -- Adjust this number to go faster or slower
local toggle = true    -- Set to false if you want to turn it off

-- Speed Loop
local connection
connection = RunService.Heartbeat:Connect(function(deltaTime)
    if not toggle then 
        connection:Disconnect()
        return 
    end
    
    local character = LocalPlayer.Character
    if character then
        local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        
        -- Only boost if the player is actively moving/trying to walk
        if humanoidRootPart and humanoid and humanoid.MoveDirection.Magnitude > 0 then
            -- Moves your CFrame forward in the direction you are walking
            humanoidRootPart.CFrame = humanoidRootPart.CFrame + (humanoid.MoveDirection * BOOST_SPEED * deltaTime)
        end
    end
end)
