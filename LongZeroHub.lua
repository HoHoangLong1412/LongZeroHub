local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()

-- =============================================
-- CÀI ĐẶT GIAO DIỆN FREEMIUM
-- =============================================
local ThemeColors = {
    Main = Color3.fromRGB(0, 170, 255),    -- Màu xanh dương
    Accent = Color3.fromRGB(255, 85, 255), -- Màu hồng
    Text = Color3.fromRGB(255, 255, 255)   -- Màu trắng
}

-- Icon góc trái với hiệu ứng
local ScreenGui = Instance.new("ScreenGui")
local ImageButton = Instance.new("ImageButton")
ScreenGui.Name = "LongZeroIcon"
ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

ImageButton.Name = "MainIcon"
ImageButton.Parent = ScreenGui
ImageButton.BackgroundTransparency = 1
ImageButton.Position = UDim2.new(0, 15, 0, 15)
ImageButton.Size = UDim2.new(0, 60, 0, 60)
ImageButton.Image = "rbxassetid://122437318850869"
ImageButton.ImageColor3 = ThemeColors.Main
ImageButton.Draggable = true

-- Hiệu ứng icon
ImageButton.MouseEnter:Connect(function()
    game:GetService("TweenService"):Create(ImageButton, TweenInfo.new(0.3), {Size = UDim2.new(0, 70, 0, 70)}):Play()
end)
ImageButton.MouseLeave:Connect(function()
    game:GetService("TweenService"):Create(ImageButton, TweenInfo.new(0.3), {Size = UDim2.new(0, 60, 0, 60)}):Play()
end)

-- =============================================
-- CỬA SỔ CHÍNH FREEMIUM
-- =============================================
local Window = Rayfield:CreateWindow({
    Name = "🌀 LongZero Hub | Blox Fruits (Freemium)",
    LoadingTitle = "🔄 Đang tải LongZero Hub...",
    LoadingSubtitle = "✨ Phiên bản miễn phí - By LongZero",
    LoadingImage = "rbxassetid://122437318850869",
    ConfigurationSaving = { Enabled = false },
    Discord = { Enabled = true, Invite = "https://discord.gg/XygASqN4" },
    KeySystem = false
})

-- =============================================
-- TAB SCRIPT FREEMIUM
-- =============================================
local Tabs = {
    Script = Window:CreateTab("📜 Script Blox Fruits", 122437318850869)
}

Tabs.Script:CreateSection("🌟 Tổng Hợp Script Miễn Phí")

local function RunScript(scriptName, scriptURL, extraSetup)
    Rayfield:Notify({
        Title = "🌀 ĐANG CHẠY",
        Content = scriptName.." đang khởi động...\nChờ xíu nha :3",
        Duration = 4,
        Image = "rbxassetid://122437318850869"
    })
    
    local success, err = pcall(function()
        if extraSetup then extraSetup() end
        loadstring(game:HttpGet(scriptURL))()
    end)
    
    if not success then
        Rayfield:Notify({
            Title = "❌ LỖI",
            Content = "Không chạy được "..scriptName..": "..tostring(err),
            Duration = 6
        })
    end
end

-- Danh sách script Freemium
local FreeScripts = {
    {
        Name = "🌊 Arceney Hub Free",
        Desc = "Auto Farm, Sea Event",
        URL = "https://raw.githubusercontent.com/Yumiara/Python/main/BloxFruit-XYZ.lua"
    },
    {
        Name = "⚡ Aurora Hub Free",
        Desc = "Auto Farm, Rain Fruit",
        URL = "https://raw.githubusercontent.com/Jadelly261/BloxFruits/main/Aurora"
    },
    {
        Name = "🐉 REDZ Hub Free",
        Desc = "Auto Farm cơ bản",
        URL = "https://raw.githubusercontent.com/newredz/BloxFruits/main/FreeVersion.lua"
    },
    {
        Name = "🌸 Yuri Hub Free",
        Desc = "Gravity Auto Farm",
        URL = "https://raw.githubusercontent.com/Jadelly261/BloxFruits/main/YuriMain"
    }
}

for _, script in pairs(FreeScripts) do
    Tabs.Script:CreateButton({
        Name = script.Name,
        Description = script.Desc,
        Callback = function()
            RunScript(script.Name, script.URL)
        end
    })
end

-- =============================================
-- THÔNG BÁO KHỞI ĐỘNG
-- =============================================
Rayfield:Notify({
    Title = "🌀 LONGZERO FREEMIUM",
    Content = "Đã sẵn sàng!\nChọn script miễn phí để bắt đầu :3",
    Duration = 5,
    Image = "rbxassetid://122437318850869"
})

-- Hiệu ứng click icon
ImageButton.MouseButton1Click:Connect(function()
    game:GetService("TweenService"):Create(ImageButton, TweenInfo.new(0.2), {Size = UDim2.new(0, 65, 0, 65)}):Play()
    task.wait(0.2)
    game:GetService("TweenService"):Create(ImageButton, TweenInfo.new(0.2), {Size = UDim2.new(0, 60, 0, 60)}):Play()
end)