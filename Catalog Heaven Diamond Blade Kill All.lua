task.wait(0.1) -- Small initial delay before anything else runs

local DiamondBladeName = "DiamondBlade" -- Diamond Blade name
local Player = game.Players.LocalPlayer
local PlayerName = Player.Name
local DiamondBlade = nil

-- Check if the player has the DiamondBlade in their backpack and move it to workspace
if game.Players.LocalPlayer.Backpack:FindFirstChild(DiamondBladeName) then
    game.Players.LocalPlayer.Backpack.DiamondBlade.Parent = workspace:FindFirstChild(PlayerName)
end

-- Function to check if player has DiamondBlade
local function checkDiamondBlade()
    if workspace:FindFirstChild(PlayerName) then
        DiamondBlade = workspace:FindFirstChild(PlayerName):FindFirstChild(DiamondBladeName)
    end
end

-- Loop through every player and make their torso move to the position of the DiamondBlade's right arm instantly
local function killAll()
    checkDiamondBlade()

    -- If the player doesn't have DiamondBlade, skip
    if not DiamondBlade then
        return
    end

    -- Move everyone's torso to the DiamondBlade's right arm position instantly
    for _, otherPlayer in pairs(game.Players:GetPlayers()) do
        if otherPlayer.Character and otherPlayer.Character:FindFirstChild("Torso") then
            local torso = otherPlayer.Character.Torso
            local rightArm = otherPlayer.Character:FindFirstChild("Right Arm")
            if rightArm then
                -- Set the torso CFrame to the position of the right arm instantly
                torso.CFrame = CFrame.new(workspace:FindFirstChild(PlayerName)["Right Arm"].Position)
            end
        end
    end
end

-- Run killAll function instantly
killAll()

--made by Cyclicallau
--discord: crazyladz
