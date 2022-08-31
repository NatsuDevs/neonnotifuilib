local Notif = {}

local NotificationHolder = Instance.new("Frame")
local UIListLayout = Instance.new("UIListLayout")
local UIPadding = Instance.new("UIPadding")
local NotificationFrame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local Title = Instance.new("TextLabel")
local Description = Instance.new("TextLabel")
local DurationFrame = Instance.new("Frame")
local UICorner_2 = Instance.new("UICorner")

if (not game.CoreGui:FindFirstChild("Neon Notif V2")) then
    local proguieznoob = Instance.new("ScreenGui")
    proguieznoob.Name = "Neon Notif V2"
    proguieznoob.Parent = game.CoreGui
    proguieznoob.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    NotificationHolder.Name = "NotificationHolder"
    NotificationHolder.Parent = game.CoreGui:FindFirstChild("Neon Notif V2")
    NotificationHolder.AnchorPoint = Vector2.new(0, 0.5)
    NotificationHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    NotificationHolder.BackgroundTransparency = 1.000
    NotificationHolder.Position = UDim2.new(0, 0, 0.5, 0)
    NotificationHolder.Size = UDim2.new(0.800000012, 0, 1, 0)

    UIListLayout.Parent = NotificationHolder
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Bottom
    UIListLayout.Padding = UDim.new(0, 4)

    UIPadding.Parent = NotificationHolder
    UIPadding.PaddingBottom = UDim.new(0, 9)
    UIPadding.PaddingLeft = UDim.new(0, 10)
end

-- End

function Notif:Create(text, des, dur)
    text = text or "Neon Hub"
    des = des or "Bro forgotted to make Description"
    dur = dur or 5
    NotificationFrame.Name = "NotificationFrame"
    NotificationFrame.Parent = game.CoreGui:FindFirstChild("Neon Notif V2"):FindFirstChild("NotificationHolder")
    NotificationFrame.BackgroundColor3 = Color3.fromRGB(38, 38, 38)
    NotificationFrame.Size = UDim2.new(0,0,0,50)
    NotificationFrame.ClipsDescendants = true
    
    UICorner.CornerRadius = UDim.new(0, 4)
    UICorner.Parent = NotificationFrame
    
    Title.Name = "Title"
    Title.Parent = NotificationFrame
    Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Title.BackgroundTransparency = 1.000
    Title.BorderColor3 = Color3.fromRGB(27, 42, 53)
    Title.Position = UDim2.new(0.03, 0, 0, 0)
    Title.Size = UDim2.new(0.961111128, 0, 0.57, 0)
    Title.Font = Enum.Font.GothamBold
    Title.Text = text
    Title.TextColor3 = Color3.fromRGB(214, 214, 214)
    Title.TextSize = 14.000
    Title.TextXAlignment = Enum.TextXAlignment.Left
    
    Description.Name = "Description"
    Description.Parent = NotificationFrame
    Description.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Description.BackgroundTransparency = 1.000
    Description.BorderColor3 = Color3.fromRGB(27, 42, 53)
    Description.Position = UDim2.new(0.03, 0, 0.349999994, 0)
    Description.Size = UDim2.new(0.961111128, 0, 0.540000021, 0)
    Description.Font = Enum.Font.GothamMedium
    Description.Text = des
    Description.TextColor3 = Color3.fromRGB(214, 214, 214)
    Description.TextSize = 14.000
    Description.TextXAlignment = Enum.TextXAlignment.Left
    
    DurationFrame.Name = "DurationFrame"
    DurationFrame.Parent = NotificationFrame
    DurationFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    DurationFrame.BorderSizePixel = 0
    DurationFrame.Position = UDim2.new(0, 0, 0.980000019, 0)
    DurationFrame.Size = UDim2.new(1, 0, 0, 1)
    
    UICorner_2.CornerRadius = UDim.new(0, 4)
    UICorner_2.Parent = DurationFrame 

    local NotifText = Description
    local TextBounds = NotifText.TextBounds

    coroutine.wrap(function()
    local InTween = game:GetService("TweenService"):Create(NotificationFrame, TweenInfo.new(.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {Size = UDim2.new(0, TextBounds.X + 50, 0, 50)})
    InTween:Play()
    InTween.Completed:Wait()

    local LineTween = game:GetService("TweenService"):Create(DurationFrame, TweenInfo.new(dur, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {Size = UDim2.new(0, 0, 0, 1)})
    LineTween:Play()
    LineTween.Completed:Wait()

    local OutTween = game:GetService("TweenService"):Create(NotificationFrame, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {Size = UDim2.new(0, 0, 0, 38)})
    OutTween:Play()
    OutTween.Completed:Wait(0.2)
    Title:Destroy()
    Description:Destroy()
    NotificationFrame:Destroy()
    end)()
end

return Notif
