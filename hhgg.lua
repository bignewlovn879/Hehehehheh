
highChestOnly = true
godsChalicSniper = false
repeat task.wait(4) until game:IsLoaded()
local PlaceID = game.PlaceId
local AllIDs = {}
local foundAnything = ""
local actualHour = os.date("!*t").hour
local Deleted = false
local File = pcall(function()
    AllIDs = game:GetService('HttpService'):JSONDecode(readfile("NotSameServers.json"))
end)
if not File then
    table.insert(AllIDs, actualHour)
    writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
end
function TPReturner()
    local Site;
    if foundAnything == "" then
        Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
    else
        Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
    end
    local ID = ""
    if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
        foundAnything = Site.nextPageCursor
    end
    local num = 0;
    for i,v in pairs(Site.data) do
        local Possible = true
        ID = tostring(v.id)
        if tonumber(v.maxPlayers) > tonumber(v.playing) then
            for _,Existing in pairs(AllIDs) do
                if num ~= 0 then
                    if ID == tostring(Existing) then
                        Possible = false
                    end
                else
                    if tonumber(actualHour) ~= tonumber(Existing) then
                        local delFile = pcall(function()
                            delfile("NotSameServers.json")
                            AllIDs = {}
                            table.insert(AllIDs, actualHour)
                        end)
                    end
                end
                num = num + 1
            end
            if Possible == true then
                table.insert(AllIDs, ID)
                wait()
                pcall(function()
                    writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
                    wait()
                    game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
                end)
                wait(4)
            end
        end
    end
end

function Teleport()
    while wait() do
        pcall(function()
            TPReturner()
            if foundAnything ~= "" then
                TPReturner()
            end
        end)
    end
end
local veryImportantWaitTime = 0.5
task.spawn(function()
    while task.wait(veryImportantWaitTime) do
        pcall(function()
            for i,v in pairs(game.CoreGui:GetDescendants()) do
                pcall(function()
                    if string.find(v.Name,"ErrorMessage") then
                        if string.find(v.Text,"Security kick") then
                            veryImportantWaitTime = 1e9
                            Teleport()
                        end
                    end
                end)
            end
        end)
    end
end)

local AllowRunService = true
local AllowRunServiceBind = Instance.new("BindableFunction")
function AllowRunServiceBind.OnInvoke(args)
    if args == "BẬT" then
        AllowRunService = true
    elseif args == "OFF" then
        AllowRunService = false
    end
   function two(gotoCFrame) --- Tween
      pcall(function()
          game.Players.LocalPlayer.Character.Humanoid.Sit = false
          game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
      end)
      if (game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart.Position - gotoCFrame.Position).Magnitude <= 200 then
          pcall(function() 
              tweenz:Cancel()
          end)
          game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart.CFrame = gotoCFrame
      else
          local tween_s = game:service"TweenService"
          local info = TweenInfo.new((game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart.Position - gotoCFrame.Position).Magnitude/325, Enum.EasingStyle.Linear)
           tween, err = pcall(function()
              tweenz = tween_s:Create(game.Players.LocalPlayer.Character["HumanoidRootPart"], info, {CFrame = gotoCFrame})
              tweenz:Play()
          end)
          if not tween then return err end
      end
      function _TweenCanCle()
          tweenz:Cancel()
      end
  
end

local DiscordLib = {}
	local TweenService = game:GetService("TweenService")
	local Balaraja = Instance.new("ScreenGui")
	
	Balaraja.Name = "Balaraja"
    Balaraja.Parent = game.CoreGui
    Balaraja.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
local NotiFrame = Instance.new("Frame")
	NotiFrame.Name = "NotiFrame"
	NotiFrame.Parent = Balaraja
	NotiFrame.AnchorPoint = Vector2.new(0.5, 0.5)
	NotiFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	NotiFrame.BackgroundTransparency = 1
	NotiFrame.Position = UDim2.new(1.2, 0, 0.0613496937, 0)
	NotiFrame.Size = UDim2.new(0, 1632, 0 , 100)

	local Notilistlayout = Instance.new("UIListLayout")

	Notilistlayout.Name = "Notilistlayout"
	Notilistlayout.Parent = NotiFrame
	Notilistlayout.FillDirection = Enum.FillDirection.Vertical
	Notilistlayout.SortOrder = Enum.SortOrder.LayoutOrder
	Notilistlayout.Padding = UDim.new(0, 5)

	function DiscordLib:Notification(text,text2,delays,logo)
		if logo == nil then
			logo = ""
		end
		if delays == nil then
			delays = 1
		end
		local TitleFrame = Instance.new("Frame")

		TitleFrame.Name = "TitleFrame"
		TitleFrame.Parent = NotiFrame
		TitleFrame.BackgroundColor3 = Color3.fromRGB(35,35,35)
		TitleFrame.Size = UDim2.new(0, 0, 0, 0)

		local Main_UiStroke = Instance.new("UIStroke")

		Main_UiStroke.Thickness = 1
		Main_UiStroke.Name = ""
		Main_UiStroke.Parent = TitleFrame
		Main_UiStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
		Main_UiStroke.LineJoinMode = Enum.LineJoinMode.Round
		Main_UiStroke.Color = Color3.fromRGB(255, 255, 255)
		Main_UiStroke.Transparency = 0

		TitleFrame:TweenSizeAndPosition(UDim2.new(0, 250-10, 0, 70),  UDim2.new(0.5, 0, 0.5,0), "Out", "Back", 0.3, true)

		local ConnerTitile = Instance.new("UICorner")

		ConnerTitile.CornerRadius = UDim.new(0, 4)
		ConnerTitile.Name = "ConnerTitile"
		ConnerTitile.Parent = TitleFrame

		local imagenoti = Instance.new("ImageLabel")

		imagenoti.Name = "imagenoti"
		imagenoti.Parent = TitleFrame
		imagenoti.AnchorPoint = Vector2.new(0.5, 0.5)
		imagenoti.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		imagenoti.Position = UDim2.new(0.135999978, 0, 0.5, 0)
		imagenoti.Size = UDim2.new(0, 50, 0, 50)
		imagenoti.BackgroundTransparency = 1
		imagenoti.Image = "http://www.roblox.com/asset/?id="..tostring(logo)

		local txdlid = Instance.new("TextLabel")
		local LableFrame = Instance.new("Frame")

		txdlid.Name = "txdlid"
		txdlid.Parent = TitleFrame
		txdlid.BackgroundColor3 = Color3.fromRGB(85, 170, 255)
		txdlid.BackgroundTransparency = 1.000
		txdlid.Position = UDim2.new(0.25, 0, 0.15, 0)
		txdlid.Size = UDim2.new(0, 175, 0, 24)
		txdlid.Font = Enum.Font.LuckiestGuy	
		txdlid.TextColor3 = Color3.fromRGB(85, 170, 255)
		txdlid.TextSize = 13.000
		txdlid.Text = text
		txdlid.TextXAlignment = Enum.TextXAlignment.Left

		LableFrame.Name = "LableFrame"
		LableFrame.Parent = TitleFrame
		LableFrame.AnchorPoint = Vector2.new(0.5, 0.5)
		LableFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		LableFrame.BackgroundTransparency = 1.000
		LableFrame.Position = UDim2.new(0.625999987, 0, 0.620000005, 0)
		LableFrame.Size = UDim2.new(0, 175, 0, 25)

		local TextNoti = Instance.new("TextLabel")

		TextNoti.Name = "TextNoti"
		TextNoti.Parent = LableFrame
		TextNoti.Active = true
		TextNoti.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TextNoti.BackgroundTransparency = 1.000
		TextNoti.Size = UDim2.new(0, 175, 0, 25)
		TextNoti.Font = Enum.Font.GothamBlack
		TextNoti.Text = text2
		TextNoti.TextScaled = true
		TextNoti.TextColor3 = Color3.fromRGB(255, 255, 255)
		TextNoti.TextSize = 12.000
		TextNoti.TextXAlignment = Enum.TextXAlignment.Left

		repeat wait() until TitleFrame.Size == UDim2.new(0, 250-10, 0, 70)

		local Time = Instance.new("Frame")
		local UICorner = Instance.new("UICorner")
		local UIPadding = Instance.new("UIPadding")

		Time.Name = "Time"
		Time.Parent = TitleFrame
		Time.Active = true
		Time.BackgroundColor3 = Color3.fromRGB(85, 170, 255)
		Time.BorderSizePixel = 0
		Time.Position = UDim2.new(0.0320000015, 0, 0.870000005, 0)
		Time.Size = UDim2.new(0, 236, 0, 3)

		UICorner.Parent = Time
		UICorner.CornerRadius = UDim.new(0, 7)
		UICorner.Name = ""

		UIPadding.Parent = NotiFrame
		UIPadding.PaddingLeft = UDim.new(0, 15)
		UIPadding.PaddingTop = UDim.new(0, 15)

		TweenService:Create(
			Time,
			TweenInfo.new(tonumber(delays), Enum.EasingStyle.Linear, Enum.EasingDirection.InOut),
			{Size = UDim2.new(0, 0, 0, 3)} -- UDim2.new(0, 128, 0, 25)
		):Play()
		delay(tonumber(delays),function()
			TweenService:Create(
				imagenoti,
				TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut),
				{ImageTransparency = 1} -- UDim2.new(0, 128, 0, 25)
			):Play()
			TweenService:Create(
				TextNoti,
				TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut),
				{TextTransparency = 1} -- UDim2.new(0, 128, 0, 25)
			):Play()
			TweenService:Create(
				txdlid,
				TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut),
				{TextTransparency = 1} -- UDim2.new(0, 128, 0, 25)
			):Play()
			wait(0.3)
			TweenService:Create(
				TitleFrame,
				TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.InOut),
				{Size = UDim2.new(0, 0, 0, 70)} -- UDim2.new(0, 128, 0, 25)
			):Play()
			wait(0.3)
			TitleFrame:Destroy()
		end
		)
	end 
	DiscordLib:Notification("Thông Báo" , "Nhận Cay Thuê Ae Nao Cần IB Zalo 0763122380" , 6 ,16158296328 )
	DiscordLib:Notification("Thông Báo" , "Script Premium Farm Chets By Duy Hub Vn" , 6 ,16158296328 )
    local CoreGui = game:GetService("StarterGui")
    CoreGui:SetCore("SendNotification", {
        Title = "FARM CHETS PREMIUM",
        Text = "BY DUY HUB VN ",
        Icon = "rbxthumb://type=Asset&id=16158296328&w=150&h=150",
        Duration = math.huge,
        Callback = AllowRunServiceBind,
        Button1 = "BẬT",
        Button2 = "OFF",
    })
end


task.spawn(function()
    while task.wait() do
        task.spawn(function()
            if godsChalicSniper == true then
                if stuff then
                    AllowRunService = false
                end
            end
        end)
    end
end)

local CoreGui = game:GetService("StarterGui")
CoreGui:SetCore("SendNotification", {
    Title = "FARM CHETS PREMIUM",
    Text = "BY DUY HUB VN",
    Icon = "rbxthumb://type=Asset&id=16158296328&w=150&h=150",
    Duration = math.huge,
    Callback = AllowRunServiceBind,
    Button1 = "BẬT",
    Button2 = "OFF",
})
task.spawn(function()
    while true and task.wait(.5) do
        if AllowRunService == true then
            local ohString1 = "SetTeam"
            local ohString2 = "Marines"

            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(ohString1, ohString2)
        end
    end
end)

task.spawn(function()
    while true and task.wait() do
        if AllowRunService == true then
            if highChestOnly == false then
                local hasChar = game.Players.LocalPlayer:FindFirstChild("Character")
                if not game.Players.LocalPlayer.Character then
        
                else
                    local hasCrewTag = game.Players.LocalPlayer.Character:FindFirstChild("CrewBBG",true)
                    if hasCrewTag then hasCrewTag:Destroy() end
                    local hasHumanoid = game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
                    if hasHumanoid then
                        local Chest = game.Workspace:FindFirstChild("Chest4") or game.Workspace:FindFirstChild("Chest3") or game.Workspace:FindFirstChild("Chest2") or game.Workspace:FindFirstChild("Chest1") or game.Workspace:FindFirstChild("Chest")
                        
                        if Chest then
                            game.Players.LocalPlayer.Character:PivotTo(Chest:GetPivot())
                            firesignal(Chest.Touched,game.Players.LocalPlayer.Character.HumanoidRootPart)
                        else
                            Teleport()
                            break
                        end
                    end 
                end
            elseif highChestOnly == true then
                local hasChar = game.Players.LocalPlayer:FindFirstChild("Character")
                if not game.Players.LocalPlayer.Character then
        
                else
                    local hasCrewTag = game.Players.LocalPlayer.Character:FindFirstChild("CrewBBG",true)
                    if hasCrewTag then hasCrewTag:Destroy() end
                    local hasHumanoid = game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
                    if hasHumanoid then
                        local Chest = game.Workspace:FindFirstChild("Chest4") or game.Workspace:FindFirstChild("Chest3") or game.Workspace:FindFirstChild("Chest2")
                        
                        if Chest then
                            game.Players.LocalPlayer.Character:PivotTo(Chest:GetPivot())
                            firesignal(Chest.Touched,game.Players.LocalPlayer.Character.HumanoidRootPart)
                        else
                            Teleport()
                            break
                        end
                    end 
                end
            end
        end
    end
end)