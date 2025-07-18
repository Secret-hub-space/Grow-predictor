local eggsFolder = workspace:WaitForChild("Dino Egg")

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "EggRandomizer_UI"
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local Button = Instance.new("TextButton")
Button.Parent = ScreenGui
Button.Size = UDim2.new(0, 200, 0, 50)
Button.Position = UDim2.new(0.5, -100, 0.5, -25)
Button.BackgroundColor3 = Color3.fromRGB(85, 170, 255)
Button.Text = "🎲 Randomize Egg 🎲"
Button.TextScaled = true
Button.TextColor3 = Color3.new(1,1,1)
Button.Font = Enum.Font.FredokaOne
Button.BorderSizePixel = 0

Button.MouseButton1Click:Connect(function()
    local eggs = eggsFolder:GetChildren()
    if #eggs == 0 then
        warn("❌ No eggs found in Dino Egg folder!")
        return
    end
    local randomEgg = eggs[math.random(1, #eggs)]
    game.StarterGui:SetCore("SendNotification", {
        Title = "🥚 Egg Randomizer",
        Text = "You got: " .. randomEgg.Name,
        Duration = 3
    })
    print("🎲 Random Egg:", randomEgg.Name)
    -- Optionally highlight it
    if randomEgg:IsA("BasePart") then
        randomEgg.BrickColor = BrickColor.Random()
    end
end)
