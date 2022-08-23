local UILib = loadstring(game:HttpGet('https://raw.githubusercontent.com/inceldom/kinx/main/ui'))()

local win = UILib:Window("Bare.Lua",Color3.fromRGB(44, 120, 224), Enum.KeyCode.RightControl)

local T1 = win:Tab("LocalPlayer")
local T2 = win:Tab("Locations")
local T3 = win:Tab("Locks & Antis")
local L4 = win:Tab("Auto Buys")
local T5 = win:Tab("TextScripts")
local T6 = win:Tab("Animations")
local T7 = win:Tab("Toggles")
local T8 = win:Tab("Credits")
--// LocalPlayer \\
T1:Button("Fly (X)", function()
local plr = game.Players.LocalPlayer
	local mouse = plr:GetMouse()
	local Humanoid = game.Players.LocalPlayer.Character.Humanoid or game.Players.LocalPlayer.Character.humanoid  

	localplayer = plr

	if workspace:FindFirstChild("Core") then
		workspace.Core:Destroy()
	end

	local Core = Instance.new("Part")
	Core.Name = "Core"
	Core.Size = Vector3.new(0.05, 0.05, 0.05)

	spawn(function()
		Core.Parent = workspace
		local Weld = Instance.new("Weld", Core)
		Weld.Part0 = Core
		Weld.Part1 = localplayer.Character.LowerTorso
		Weld.C0 = CFrame.new(0, 0, 0)
	end)

	workspace:WaitForChild("Core")

	local torso = workspace.Core
	flying = true
	local speed=10
	local keys={a=false,d=false,w=false,s=false} 
	local e1
	local e2
	local function start()
		local pos = Instance.new("BodyPosition",torso)
		local gyro = Instance.new("BodyGyro",torso)
		pos.Name="EPIXPOS"
		pos.maxForce = Vector3.new(math.huge, math.huge, math.huge)
		pos.position = torso.Position
		gyro.maxTorque = Vector3.new(9e9, 9e9, 9e9) 
		gyro.cframe = torso.CFrame
		repeat
			wait()
			Humanoid.PlatformStand=true
			local new=gyro.cframe - gyro.cframe.p + pos.position
			if not keys.w and not keys.s and not keys.a and not keys.d then
				speed=5
			end
			if keys.w then 
				new = new + workspace.CurrentCamera.CoordinateFrame.lookVector * speed
				speed=speed+0
			end
			if keys.s then 
				new = new - workspace.CurrentCamera.CoordinateFrame.lookVector * speed
				speed=speed+0
			end
			if keys.d then 
				new = new * CFrame.new(speed,0,0)
				speed=speed+0
			end
			if keys.a then 
				new = new * CFrame.new(-speed,0,0)
				speed=speed+0
			end
			if speed>10 then
				speed=5
			end
			pos.position=new.p
			if keys.w then
				gyro.cframe = workspace.CurrentCamera.CoordinateFrame*CFrame.Angles(-math.rad(speed*0),0,0)
			elseif keys.s then
				gyro.cframe = workspace.CurrentCamera.CoordinateFrame*CFrame.Angles(math.rad(speed*0),0,0)
			else
				gyro.cframe = workspace.CurrentCamera.CoordinateFrame
			end
		until flying == false
		if gyro then gyro:Destroy() end
		if pos then pos:Destroy() end
		flying=false
		Humanoid.PlatformStand=false
		speed=10
	end
	e1=mouse.KeyDown:connect(function(key)
		if not torso or not torso.Parent then flying=false e1:disconnect() e2:disconnect() return end
		if key=="w" then
			keys.w=true
		elseif key=="s" then
			keys.s=true
		elseif key=="a" then
			keys.a=true
		elseif key=="d" then
			keys.d=true
		elseif key=="x" then
			if flying==true then
				flying=false
			else
				flying=true
				start()
			end
		end
	end)
	e2=mouse.KeyUp:connect(function(key)
		if key=="w" then
			keys.w=false
		elseif key=="s" then
			keys.s=false
		elseif key=="a" then
			keys.a=false
		elseif key=="d" then
			keys.d=false
		end
	end)
	start()
end)

T1:Button("Cframe speed (L)", function()
    	repeat
		wait()
	until game:IsLoaded()
	local L_134_ = game:service('Players')
	local L_135_ = L_134_.LocalPlayer
	repeat
		wait()
	until L_135_.Character
	local L_136_ = game:service('UserInputService')
	local L_137_ = game:service('RunService')
	getgenv().Multiplier = 6
	local L_138_ = true
	local L_139_
	L_136_.InputBegan:connect(function(L_140_arg0)
		if L_140_arg0.KeyCode == Enum.KeyCode.LeftBracket then
			Multiplier = Multiplier + 0.01
			print(Multiplier)
			wait(0.2)
			while L_136_:IsKeyDown(Enum.KeyCode.LeftBracket) do
				wait()
				Multiplier = Multiplier + 0.01
				print(Multiplier)
			end
		end
		if L_140_arg0.KeyCode == Enum.KeyCode.RightBracket then
			Multiplier = Multiplier - 0.01
			print(Multiplier)
			wait(0.2)
			while L_136_:IsKeyDown(Enum.KeyCode.RightBracket) do
				wait()
				Multiplier = Multiplier - 0.01
				print(Multiplier)
			end
		end
		if L_140_arg0.KeyCode == Enum.KeyCode.L then
			L_138_ = not L_138_
			if L_138_ == true then
				repeat
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame + game.Players.LocalPlayer.Character.Humanoid.MoveDirection * Multiplier
					game:GetService("RunService").Stepped:wait()
				until L_138_ == false
			end
		end
	end)
end)

T1:Button("Headless (Not Fe)
game.Players.LocalPlayer.Character.Head.Transparency = 1
game.Players.LocalPlayer.Character.Head.Transparency = 1
for i,v in pairs(game.Players.LocalPlayer.Character.Head:GetChildren()) do
if (v:IsA("Decal")) then
v.Transparency = 1
end
end
end)

T1:Button("Korblox (Not Fe)
local ply = game.Players.LocalPlayer
local chr = ply.Character
chr.RightLowerLeg.MeshId = "902942093"
chr.RightLowerLeg.Transparency = "1"
chr.RightUpperLeg.MeshId = "http://www.roblox.com/asset/?id=902942096"
chr.RightUpperLeg.TextureID = "http://roblox.com/asset/?id=902843398"
chr.RightFoot.MeshId = "902942089"
chr.RightFoot.Transparency = "1"
end)

T1:Button("Normall Size", function()
game.Players.LocalPlayer.Character.Humanoid.BodyDepthScale:Destroy()
game.Players.LocalPlayer.Character.Humanoid.BodyWidthScale:Destroy()
end)

T1:Button("Anti Fling", function()
-- // Constants \\ --
-- [ Services ] --
local Services = setmetatable({}, {__index = function(Self, Index)
    local NewService = game.GetService(game, Index)
    if NewService then
    Self[Index] = NewService
    end
    return NewService
    end})
    
    -- [ LocalPlayer ] --
    local LocalPlayer = Services.Players.LocalPlayer
    
    -- // Functions \\ --
    local function PlayerAdded(Player)
       local Detected = false
       local Character;
       local PrimaryPart;
    
       local function CharacterAdded(NewCharacter)
           Character = NewCharacter
           repeat
               wait()
               PrimaryPart = NewCharacter:FindFirstChild("HumanoidRootPart")
           until PrimaryPart
           Detected = false
       end
    
       CharacterAdded(Player.Character or Player.CharacterAdded:Wait())
       Player.CharacterAdded:Connect(CharacterAdded)
       Services.RunService.Heartbeat:Connect(function()
           if (Character and Character:IsDescendantOf(workspace)) and (PrimaryPart and PrimaryPart:IsDescendantOf(Character)) then
               if PrimaryPart.AssemblyAngularVelocity.Magnitude > 50 or PrimaryPart.AssemblyLinearVelocity.Magnitude > 100 then
                   if Detected == false then
                       game.StarterGui:SetCore("ChatMakeSystemMessage", {
                           Text = "Fling Exploit detected, Player: " .. tostring(Player);
                           Color = Color3.fromRGB(255, 200, 0);
                       })
                   end
                   Detected = true
                   for i,v in ipairs(Character:GetDescendants()) do
                       if v:IsA("BasePart") then
                           v.CanCollide = false
                           v.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
                           v.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                           v.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0)
                       end
                   end
                   PrimaryPart.CanCollide = false
                   PrimaryPart.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
                   PrimaryPart.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                   PrimaryPart.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0)
               end
           end
       end)
    end
    
    -- // Event Listeners \\ --
    for i,v in ipairs(Services.Players:GetPlayers()) do
       if v ~= LocalPlayer then
           PlayerAdded(v)
       end
    end
    Services.Players.PlayerAdded:Connect(PlayerAdded)
    
    local LastPosition = nil
    Services.RunService.Heartbeat:Connect(function()
       pcall(function()
           local PrimaryPart = LocalPlayer.Character.PrimaryPart
           if PrimaryPart.AssemblyLinearVelocity.Magnitude > 250 or PrimaryPart.AssemblyAngularVelocity.Magnitude > 250 then
               PrimaryPart.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
               PrimaryPart.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
               PrimaryPart.CFrame = LastPosition
    
               game.StarterGui:SetCore("ChatMakeSystemMessage", {
                   Text = "You were flung. Neutralizing velocity.";
                   Color = Color3.fromRGB(255, 0, 0);
               })
           elseif PrimaryPart.AssemblyLinearVelocity.Magnitude < 50 or PrimaryPart.AssemblyAngularVelocity.Magnitude > 50 then
               LastPosition = PrimaryPart.CFrame
           end
       end)
    end)
end) 
--// Locations \\
T2:Button("Gas Station", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(251.35238647460938, 57.04527282714844, -1322.81689453125)
end)

T2:Button("Bank", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(166.28688049316406, 57.088783264160156, -864.1776733398438)
end)

T2:Button("Food Shop #1", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(728.9451904296875, 58.38800048828125, -754.3079833984375)
end)

T2:Button("Food Shop #2", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(193.73574829101562, 97.959716796875, -442.79888916015625)
end)

T2:Button("Casino", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(38.57560729980469, 57.21971130371094, -1554.7340087890625)
end)

L2:Button("Da Museum", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-19.95099449157715, 58.21583938598633, -806.3642578125)
end)

T2:Button("Police Department", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-56.4112548828125, 98.22455596923828, -359.8275146484375)
end)

T2:Button("Uphill", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(275.2709655761719, 96.58828735351562, -291.25738525390625)
end)

T2:Button("Downhill", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(464.64056396484375, 57.32100296020508, -1319.4542236328125)
end)

T2:Button("BasketBall Zone", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(856.2247924804688, 57.52113723754883, -1015.0812377929688)
end)

T2:Button("Skate/Bike Zone", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(868.444091796875, 57.52492141723633, -872.446044921875)
end)

T2:Button("Da Subway", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(784.2250366210938, 27.68659210205078, -1395.35205078125)
end)

T2:Button("Playground", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(288.8774719238281, 57.04527282714844, -1008.0798950195312)
end)

T2:Button("Hood Shoes #1", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(378.0566101074219, 57.006988525390625, -1218.5455322265625)
end)

T2:Button("Hood Shoes #2", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(633.2849731445312, 57.00699996948242, -1248.6353759765625)
end)

T2:Button("Fitness", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(305.62237548828125, 96.19100952148438, -516.0923461914062)
end)

T2:Button("Bank Safe", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(58.150272369384766, 25.807445526123047, -641.7559814453125)
end)

T2:Button("Movie", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-98.15323638916016, 58.931514739990234, -1566.93896484375)
end)

T2:Button("Ferris wheel", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(547.2867431640625, 49.00687789916992, -724.6683959960938)
end)

T2:Button("Forest Shop", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(653.4906005859375, 46.20603942871094, -664.1094970703125)
end)

T2:Button("Space Shop", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(155.66314697265625, 57.33079147338867, -1080.136474609375)
end)

T2:Button("Stomp Ranking", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(160.75672912597656, 57.3307991027832, -1105.8277587890625)
end)

T2:Button("Nokiyuh", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-6.953981399536133, 57.045284271240234, -1116.19775390625)
end)

T2:Button("Hospital", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(9.528947830200195, 57.689735412597656, -1251.01953125)
end)

T2:Button("BackRooms", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(48270.28515625, 10815.830078125, -47573.82421875)
end)
--// Locks Antis \\

--// Auto Buys \\
L4:Button("[Shotgun] - $1250", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(453.30096435546875, 57.32101058959961, -1313.5517578125)
wait(0.5)
fireclickdetector(game.Workspace.Ignored.Shop['[Shotgun] - $1250'].ClickDetector)
end)

L4:Button("[AR] - $1000", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(447.1031188964844, 57.32100296020508, -1315.8282470703125)
wait(0.5)
fireclickdetector(game.Workspace.Ignored.Shop['[AR] - $1000'].ClickDetector)
end)

L4:Button("[SMG] - $750", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(451.9969482421875, 57.32100296020508, -1326.0694580078125)
wait(0.5)
fireclickdetector(game.Workspace.Ignored.Shop['[SMG] - $750'].ClickDetector)
end)

L4:Button("[AK47] - $2250", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(467.4230651855469, 57.32100296020508, -1325.867919921875)
wait(0.5)
fireclickdetector(game.Workspace.Ignored.Shop['[AK47] - $2250'].ClickDetector)
end)

L4:Button("[Silencer] - $550", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(481.25054931640625, 57.321014404296875, -1323.2132568359375)
wait(0.5)
fireclickdetector(game.Workspace.Ignored.Shop['[Silencer] - $550'].ClickDetector)
end)

L4:Button("[TacticalShotgun] - $1750", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(286.9109802246094, 96.58830261230469, -295.2744445800781)
wait(0.5)
fireclickdetector(game.Workspace.Ignored.Shop['[TacticalShotgun] - $1750'].ClickDetector)
end)

L4:Button("[P90] - $1000", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(295.38726806640625, 96.58830261230469, -286.4902648925781)
wait(0.5)
fireclickdetector(game.Workspace.Ignored.Shop['[P90] - $1000'].ClickDetector)
end)

L4:Button("[Glock] - $500", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(256.9055480957031, 96.5882797241211, -294.6165466308594)
wait(0.5)
fireclickdetector(game.Workspace.Ignored.Shop['[P90] - $500'].ClickDetector)
end)

L4:Button("[SilencerAR] - $1250", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new()
wait(0.5)
fireclickdetector(game.Workspace.Ignored.Shop['[SilencerAR] - $1250'].ClickDetector)
end)

L4:Button("[Revolver] - $1300", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(222.4960174560547, 57.045284271240234, -1163.6673583984375)
wait(0.5)
fireclickdetector(game.Workspace.Ignored.Shop['[Revolver] - $1300'].ClickDetector)
end)

L4:Button("[Double-Barrel SG] - $1400", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(341.2994384765625, 57.04527282714844, -1754.213134765625)
wait(0.5)
fireclickdetector(game.Workspace.Ignored.Shop['[Double-Barrel SG] - $1400'].ClickDetector)
end)

L4:Button("[LMG] - $3750", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-67.29669952392578, 58.14947509765625, -797.7573852539062)
wait(0.10)
fireclickdetector(game.Workspace.Ignored.Shop['[LMG] - $3750'].ClickDetector)
end)

L4:Button("[RPG] - $65000", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(507.5495910644531, 22.167884826660156, -1489.756103515625)
wait(0.5)
fireclickdetector(game.Workspace.Ignored.Shop['[RPG] - $65000'].ClickDetector)
end)

L4:Button("[Cranberry] - $3", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(203.66172790527344, 97.959716796875, -438.0301818847656)
wait(0.5)
fireclickdetector(game.Workspace.Ignored.Shop['[Cranberry] - $3'].ClickDetector)
end)

L4:Button("[Hamburger] - $10", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(194.100341796875, 97.959716796875, -439.07623291015625)
wait(0.5)
fireclickdetector(game.Workspace.Ignored.Shop['[Hamburger] - $10'].ClickDetector)
end)

L4:Button("[Pizza] - $5", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(183.60867309570312, 97.959716796875, -439.14630126953125)
wait(0.5)
fireclickdetector(game.Workspace.Ignored.Shop['[Pizza] - $5'].ClickDetector)
end)

L4:Button("[Siopao] - $5", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(172.57022094726562, 97.959716796875, -437.90081787109375)
wait(0.5)
fireclickdetector(game.Workspace.Ignored.Shop['[Siopao] - $5'].ClickDetector)
end)

L4:Button("[Baguette] - $10", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(242.4909210205078, 57.51060485839844, -1385.7935791015625)
wait(0.5)
fireclickdetector(game.Workspace.Ignored.Shop['[Baguette] - $10'].ClickDetector)
end)

L4:Button("[Siopao] - $5", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(262.1666259765625, 57.51060485839844, -1386.399169921875)
wait(0.5)
fireclickdetector(game.Workspace.Ignored.Shop['[Siopao] - $5'].ClickDetector)
end)

L4:Button("[Taco] - $4", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(519.196044921875, 57.006988525390625, -1142.716064453125)
wait(0.5)
fireclickdetector(game.Workspace.Ignored.Shop['[Taco] - $4'].ClickDetector)
end)

L4:Button("[Hamburger] - $10", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(512.1172485351562, 57.006988525390625, -1142.4970703125)
wait(0.5)
fireclickdetector(game.Workspace.Ignored.Shop['[Hamburger] - $10'].ClickDetector)
end)

L4:Button("[Lettuce] - $5", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new()
wait(0.5)
fireclickdetector(game.Workspace.Ignored.Shop['[Lettuce] - $5'].ClickDetector)
end)

L4:Button("[HotDog] - $8", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(719.8515625, 58.38800048828125, -734.10546875)
wait(0.5)
fireclickdetector(game.Workspace.Ignored.Shop['[HotDog] - $8'].ClickDetector)
end)

L4:Button("[Donut] - $5", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(720.240478515625, 58.38800048828125, -743.4869384765625)
wait(0.5)
fireclickdetector(game.Workspace.Ignored.Shop['[Donut] - $5'].ClickDetector)
end)

L4:Button("[Apple] - $10", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(720.1979370117188, 58.38800048828125, -754.0709228515625)
wait(0.5)
fireclickdetector(game.Workspace.Ignored.Shop['[Apple] - $10'].ClickDetector)
end)

L4:Button("[Apple] - $10", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(519.1726684570312, 96.19100952148438, -340.7403869628906)
wait(0.5)
fireclickdetector(game.Workspace.Ignored.Shop['[Apple] - $10'].ClickDetector)
end)

L4:Button("[Medium Armor] - $1000", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-84.20211029052734, 98.22455596923828, -344.6927795410156)
wait(0.5)
fireclickdetector(game.Workspace.Ignored.Shop['[Medium] - $1000'].ClickDetector)
end)

L4:Button("[High-Medium Armor] - $2300", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(121.64204406738281, 137.50457763671875, -1184.443115234375)
wait(0.5)
fireclickdetector(game.Workspace.Ignored.Shop['[High-Medium Armor] - $2300'].ClickDetector)
end)

L4:Button("[Medium Armor] - $1000", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(637.4496459960938, 57.867645263671875, -1340.7147216796875)
wait(0.5)
fireclickdetector(game.Workspace.Ignored.Shop['[Medium Armor] - $1000'].ClickDetector)
end)

L4:Button("[Surgeon Mask] - $25", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(423.25469970703125, 57.04527282714844, -998.1131591796875)
wait(0.5)
fireclickdetector(game.Workspace.Ignored.Shop['[Surgeon Mask] - $25'].ClickDetector)
end)

L4:Button("[Knife] - $150", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(423.21343994140625, 57.04527282714844, -1019.2634887695312)
wait(0.5)
fireclickdetector(game.Workspace.Ignored.Shop['[Knife] - $150'].ClickDetector)
end)

L4:Button("[Breathing Mask] - $60", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-101.71206665039062, 98.22455596923828, -344.80242919921875)
wait(0.5)
fireclickdetector(game.Workspace.Ignored.Shop['[Breathing Mask] - $60'].ClickDetector)
end)

L4:Button("[Weights] - $120", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(284.0898132324219, 120.48011016845703, -525.2183227539062)
wait(0.5)
fireclickdetector(game.Workspace.Ignored.Shop['[Weights] - $120'].ClickDetector)
end)

L4:Button("[HeavyWeights] - $250", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(278.20599365234375, 120.4801025390625, -524.6353759765625)
wait(0.5)
fireclickdetector(game.Workspace.Ignored.Shop['[HeavyWeights] - $250'].ClickDetector)
end)
--// TextScripts \\

T5:Textbox("Cash Amount",true, function(t)
local args = {
    [1] = "DropMoney",
    [2] = t
    }
            
game:GetService("ReplicatedStorage"):FindFirstChild(".gg/untitledhood"):FireServer(unpack(args))
end)

T5:Textbox("MaxZoom",true, function(t)
player.CameraMaxZoomDistance = t
end)

T5:Textbox("Goto (Full Name)",true, function(t)
local p1 = game.Players.LocalPlayer.Character.HumanoidRootPart
local p2 = t
local pos = p1.CFrame

p1.CFrame = game.Players[p2].Character.HumanoidRootPart.CFrame

wait(math.huge)

p1.CFrame = pos
end)

--// Animations \\
T6:Button("Astronaut", function()
local Animate = game.Players.LocalPlayer.Character.Animate
Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=891621366"
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=891633237"
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=891667138"
Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=891636393"
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=891627522"
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=891609353"
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=891617961"
game.Players.LocalPlayer.Character.Humanoid.Jump = true
end)

T6:Button("Bubbly", function()
local Animate = game.Players.LocalPlayer.Character.Animate
Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=910004836"
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=910009958"
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=910034870"
Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=910025107"
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=910016857"
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=910001910"
Animate.swimidle.SwimIdle.AnimationId = "http://www.roblox.com/asset/?id=910030921"
Animate.swim.Swim.AnimationId = "http://www.roblox.com/asset/?id=910028158"
game.Players.LocalPlayer.Character.Humanoid.Jump = true
end)

T6:Button("Cartoony", function()
local Animate = game.Players.LocalPlayer.Character.Animate
Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=742637544"
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=742638445"
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=742640026"
Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=742638842"
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=742637942"
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=742636889"
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=742637151"
game.Players.LocalPlayer.Character.Humanoid.Jump = true
end)

T6:Button("Elder", function()
local Animate = game.Players.LocalPlayer.Character.Animate
Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=845397899"
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=845400520"
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=845403856"
Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=845386501"
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=845398858"
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=845392038"
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=845396048"
game.Players.LocalPlayer.Character.Humanoid.Jump = true
end)

T6:Button("Knight", function()
local Animate = game.Players.LocalPlayer.Character.Animate
Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=657595757"
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=657568135"
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=657552124"
Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=657564596"
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=658409194"
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=658360781"
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=657600338"
game.Players.LocalPlayer.Character.Humanoid.Jump = true
end)

T6:Button("Levitation", function()
local Animate = game.Players.LocalPlayer.Character.Animate
Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=616006778"
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=616008087"
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=616013216"
Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=616010382"
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=616008936"
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=616003713"
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=616005863"
game.Players.LocalPlayer.Character.Humanoid.Jump = true
end)

T6:Button("Mage", function()
local Animate = game.Players.LocalPlayer.Character.Animate
Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=707742142"
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=707855907"
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=707897309"
Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=707861613"
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=707853694"
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=707826056"
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=707829716"
game.Players.LocalPlayer.Character.Humanoid.Jump = true
end)

T6:Button("Ninja", function()
local Animate = game.Players.LocalPlayer.Character.Animate
Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=656117400"
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=656118341"
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=656121766"
Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=656118852"
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=656117878"
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=656114359"
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=656115606"
game.Players.LocalPlayer.Character.Humanoid.Jump = true
end)

T6:Button("Pirate", function()
local Animate = game.Players.LocalPlayer.Character.Animate
Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=750781874"
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=750782770"
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=750785693"
Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=750783738"
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=750782230"
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=750779899"
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=750780242"
game.Players.LocalPlayer.Character.Humanoid.Jump = true
end)

T6:Button("Robot", function()
local Animate = game.Players.LocalPlayer.Character.Animate
Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=616088211"
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=616089559"
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=616095330"
Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=616091570"
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=616090535"
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=616086039"
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=616087089"
game.Players.LocalPlayer.Character.Humanoid.Jump = true
end)

T6:Button("Stylish", function()
local Animate = game.Players.LocalPlayer.Character.Animate
Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=616136790"
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=616138447"
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=616146177"
Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=616140816"
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=616139451"
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=616133594"
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=616134815"
game.Players.LocalPlayer.Character.Humanoid.Jump = true
end)

T6:Button("SuperHero", function()
local Animate = game.Players.LocalPlayer.Character.Animate
Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=616111295"
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=616113536"
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=616122287"
Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=616117076"
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=616115533"
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=616104706"
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=616108001"
game.Players.LocalPlayer.Character.Humanoid.Jump = true
end)

T6:Button("Toy", function()
local Animate = game.Players.LocalPlayer.Character.Animate
Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=782841498"
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=782845736"
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=782843345"
Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=782842708"
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=782847020"
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=782843869"
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=782846423"
game.Players.LocalPlayer.Character.Humanoid.Jump = true
end)

T6:Button("Vampire", function()
local Animate = game.Players.LocalPlayer.Character.Animate
Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=1083445855"
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=1083450166"
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=1083473930"
Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=1083462077"
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=1083455352"
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=1083439238"
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=1083443587"
game.Players.LocalPlayer.Character.Humanoid.Jump = true
end)

T6:Button("Werewolf", function()
local Animate = game.Players.LocalPlayer.Character.Animate
Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=1083195517"
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=1083214717"
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=1083178339"
Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=1083216690"
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=1083218792"
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=1083182000"
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=1083189019"
game.Players.LocalPlayer.Character.Humanoid.Jump = true
end)

T6:Button("Zombie", function()
local Animate = game.Players.LocalPlayer.Character.Animate
Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=616158929"
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=616160636"
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=616168032"
Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=616163682"
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=616161997"
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=616156119"
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=616157476"
game.Players.LocalPlayer.Character.Humanoid.Jump = true
end)

--// Toggles \\
T7:Toggle("Auto Stomp",false, function(t)
	if t then
getgenv().l = true
while getgenv().l do
wait(0.0001)
local args = {
    [1] = "Stomp"
}

game:GetService("ReplicatedStorage"):FindFirstChild(".gg/untitledhood"):FireServer(unpack(args))
end
else
getgenv().l = false
while getgenv().l do
wait(0.0001)
local args = {
    [1] = "Stomp"
}

game:GetService("ReplicatedStorage"):FindFirstChild(".gg/untitledhood"):FireServer(unpack(args))
end
end
end)
--// Credits \\
T8:Label("Ui Lib : Kinx Hub")

T8:Label("Scripts : beru#2160")

T8:Label("Scripts : Lare#7058")

T8:Label("Owner : beru#2160")

T8:Label("Co-Owner : Lare#7058")
