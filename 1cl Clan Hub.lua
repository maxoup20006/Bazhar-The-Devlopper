-- Gui to Lua
-- Version: 3.2

-- Instances:

local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local HitBox = Instance.new("TextButton")
local Bazhar6956 = Instance.new("TextLabel")
local Close = Instance.new("TextButton")
local TextButton = Instance.new("TextButton")
local Open = Instance.new("TextButton")

--Properties:

ScreenGui.Parent = game.CoreGui

Frame.Parent = ScreenGui
Frame.Active = true
Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderSizePixel = 3
Frame.Position = UDim2.new(0.395311236, 0, 0.384615391, 0)
Frame.Size = UDim2.new(0, 379, 0, 172)


HitBox.Name = "HitBox"
HitBox.Parent = Frame
HitBox.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
HitBox.BorderColor3 = Color3.fromRGB(255, 0, 0)
HitBox.BorderSizePixel = 3
HitBox.Position = UDim2.new(0, 0, 0.255813956, 0)
HitBox.Size = UDim2.new(0, 203, 0, 128)
HitBox.Font = Enum.Font.Arial
HitBox.Text = "Hitbox"
HitBox.TextColor3 = Color3.fromRGB(255, 0, 0)
HitBox.TextSize = 19.000

Bazhar6956.Name = "Bazhar#6956"
Bazhar6956.Parent = Frame
Bazhar6956.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Bazhar6956.BorderColor3 = Color3.fromRGB(255, 0, 0)
Bazhar6956.BorderSizePixel = 3
Bazhar6956.Size = UDim2.new(0, 379, 0, 39)
Bazhar6956.Font = Enum.Font.Arial
Bazhar6956.Text = "Bazhar#6956 The Developer"
Bazhar6956.TextColor3 = Color3.fromRGB(255, 0, 0)
Bazhar6956.TextSize = 19.000

Close.Name = "Close"
Close.Parent = Frame
Close.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Close.BorderColor3 = Color3.fromRGB(255, 0, 0)
Close.BorderSizePixel = 3
Close.Position = UDim2.new(0.905013204, 0, 0, 0)
Close.Size = UDim2.new(0, 36, 0, 20)
Close.Font = Enum.Font.Arial
Close.Text = "x"
Close.TextColor3 = Color3.fromRGB(255, 0, 0)
Close.TextSize = 14.000
Close.MouseButton1Click:connect(function()
	Frame.Visible = false
	Frame.Draggable = false
end)

TextButton.Parent = Frame
TextButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
TextButton.BorderColor3 = Color3.fromRGB(255, 0, 0)
TextButton.BorderSizePixel = 3
TextButton.Position = UDim2.new(0.535620034, 0, 0.255813956, 0)
TextButton.Size = UDim2.new(0, 176, 0, 128)
TextButton.Font = Enum.Font.Arial
TextButton.Text = "Esp"
TextButton.TextColor3 = Color3.fromRGB(255, 0, 0)
TextButton.TextSize = 19.000
TextButton.TextWrapped = true
TextButton.MouseButton1Click:connect(function()
	local VEC3 = Vector3.new
	local VEC2 = Vector2.new
	local COL3 = Color3.new
	local RGB = Color3.fromRGB
	local CFNEW = CFrame.new
	local INSTNEW = Instance.new
	local TBLINS = table.insert
	local Drawing_new = Drawing.new
	local Ray_new = Ray.new
	local TweenInfo_new = TweenInfo.new

	local Players = game:GetService("Players")
	local Workspace = game:GetService("Workspace")
	local RunService = game:GetService("RunService")
	local UserInputService = game:GetService("UserInputService")
	local TweenService = game:GetService("TweenService")
	local Camera = Workspace:FindFirstChildOfClass("Camera")

	local LocalPlayer = Players.LocalPlayer
	local Mouse = LocalPlayer:GetMouse()

	_G.PlayerLocation = function()
	--[[
	-- GLOBAL ESP
	local Humanoids = {}
	for i,v in pairs(Workspace:GetDescendants()) do
		if v:IsA("Humanoid") or v.Name == "Humanoid" then
			TBLINS(Humanoids, v.Parent)
		end
	end
	return Humanoids;
	]]--
		return Players:GetChildren();
	end

	CreateDrawing = function(ClassName)
		return function(Props)
			local Create = Drawing_new(ClassName)
			for i,v in pairs(Props) do
				Create[i] = v
			end
			return Create
		end
	end;

	local Drawings = {}
	function IsPartVisible(Part1, Part2)
		local CheckPart = INSTNEW("Part")
		CheckPart.Parent = Workspace
		CheckPart.Name = "CheckVisWall"
		CheckPart.Anchored = true
		CheckPart.CanCollide = false
		CheckPart.Transparency = 1
		CheckPart.Size = VEC3(1.5, 1.5, 1.5) * Part2.Size
		CheckPart.CFrame = Part2.CFrame

		local Ray = Ray_new(Part1.Position, (Part2.Position - Part1.Position).Unit * 9999)
		local part,position = workspace:FindPartOnRay(Ray, Part1.Parent)
		if part then
			if part.Name == CheckPart.Name then
				CheckPart:Destroy()
				return true
			end
		end
		CheckPart:Destroy()
		return false
	end

	function GetLookVectorAndOrigin(PART)
		local Origin = PART.CFrame
		local LookVector = PART.CFrame.lookVector * 100
		--local Direction = (LookVector - Origin.p).Unit * 100

		--local Ray = Ray.new(Origin.p, Direction)
		--local _, EndPosition = workspace:FindPartOnRay(Ray)

		return {
			Origin = Origin;
			EndPoint = LookVector;--Workspace:Raycast(Origin, Direction.p).Position;
		}
	end
	function Get8Corners(PART, OFF)
		if not OFF then OFF = VEC3(1, 1, 1) end
		local CornerVertices = {
			{1, 1, -1},  --v1 - top front right
			{1, -1, -1}, --v2 - bottom front right
			{-1, -1, -1},--v3 - bottom front left
			{-1, 1, -1}, --v4 - top front left

			{1, 1, 1},  --v5 - top back right
			{1, -1, 1}, --v6 - bottom back right
			{-1, -1, 1},--v7 - bottom back left
			{-1, 1, 1}  --v8 - top back left
		}
		local Vertices = {}
		local Size = PART.Size * OFF
		for _, Vector in pairs(CornerVertices) do
			TBLINS(Vertices, (PART.CFrame * CFNEW(Size .X/2 * Vector[1], Size .Y/2 * Vector[2], Size .Z/2 * Vector[3])).Position)
		end
		return Vertices
	end

	function tocam(pos)
		local PosChar, withinScreenBounds = Camera:WorldToViewportPoint(pos)
		return {VEC2(PosChar.X, PosChar.Y), withinScreenBounds}
	end
	function GetPropPC(inst, prop)
		local func, result = pcall(function()
			return inst[prop]
		end)
		if not func then
			return nil 
		else 
			return result 
		end
	end
	function Cleanup()
		for i,v in pairs(Drawings) do
			v:Remove()
			--table.remove(Drawings, i)
		end
		Drawings = {}
	end
	function Create3DVertex(PART, SETT)
		local VertexPositions = Get8Corners(PART, SETT.Offset)
		for i,v in pairs(Get8Corners(PART, VEC3(0.01, 0.01, 0.01))) do
			if not tocam(v)[2] then return end
		end
		local Thickness = SETT.Thickness
		local Transparency = SETT.Transparency
		local Visible = SETT.Visible
		local Color = SETT.Color
		local Filled = SETT.Filled
		local Positions = {
			{
				tocam(VertexPositions[5])[1];
				tocam(VertexPositions[6])[1];
				tocam(VertexPositions[2])[1];
				tocam(VertexPositions[1])[1];
			};
			{
				tocam(VertexPositions[7])[1];
				tocam(VertexPositions[8])[1];
				tocam(VertexPositions[4])[1];
				tocam(VertexPositions[3])[1];
			};
			{
				tocam(VertexPositions[1])[1];
				tocam(VertexPositions[2])[1];
				tocam(VertexPositions[3])[1];
				tocam(VertexPositions[4])[1];
			};
			{
				tocam(VertexPositions[5])[1];
				tocam(VertexPositions[6])[1];
				tocam(VertexPositions[7])[1];
				tocam(VertexPositions[8])[1];
			};
		}

		for i = 1,#Positions do
			local NewVertex = CreateDrawing("Quad") {
				["Visible"] = Visible;
				["Transparency"] = Transparency;
				["Thickness"] = Thickness;
				["Color"] = Color;
				["Filled"] = Filled;
				["PointA"] = Positions[i][1];
				["PointB"] = Positions[i][2];
				["PointC"] = Positions[i][3];
				["PointD"] = Positions[i][4];
			}
			Drawings[#Drawings + 1] = NewVertex
		end
	end


	--[[ Initialize ESP ]]--
	spawn(function()
		while true do
			Cleanup()

			local func, ok = pcall(function()
				for i,v in pairs(_G.PlayerLocation()) do
					if v.Name ~= LocalPlayer.Name then
						local Char = GetPropPC(v, "Character") or v or nil
						local TeamCheck = (GetPropPC(v, "Team") ~= LocalPlayer.Team) or (GetPropPC(v, "TeamColor") ~= LocalPlayer.TeamColor) or (LocalPlayer.Team == nil)
						if Char and TeamCheck then
							local Root = Char:FindFirstChild("HumanoidRootPart") or nil
							local Head = Char:FindFirstChild("Head") or nil

							if Root and Head and tocam(Head.Position)[2] then
								--[[ Vertex ]]--
								Create3DVertex(Root, {
									["Offset"] = VEC3(2.25, 3, 3);
									["Thickness"] = 1;
									["Transparency"] = 1;
									["Filled"] = false;
									["Visible"] = true;
									["Color"] = COL3 (255,0,0);
								}) 

								--[[ Health ]]--
								Create3DVertex(Root, {
									["Offset"] = VEC3(2.25, 3/100*Char.Humanoid.Health, 3);
									["Thickness"] = 1;
									["Transparency"] = 0.1;
									["Filled"] = true;
									["Visible"] = true;
									["Color"] = COL3 (255,0,0);
								})

								--[[ Tracer ]]--
								local ToCam = tocam(Head.Position)
								if ToCam[2] then
									local Mag = (LocalPlayer.Character.Head.Position - Head.Position).Magnitude
									local NewLine = CreateDrawing("Line") {
										["Visible"] = true;
										["Transparency"] = 1;
										["Thickness"] = 1;
										["Color"] = COL3 (255,0,0);
										["From"] = VEC2(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y * 0.80);
										["To"] = ToCam[1];
									}
									Drawings[#Drawings + 1] = NewLine
								end

								--[[ OverHead ]]--

								--[[ IsVisible ]]--
								local Color = COL3(1,0,0);
								for i,v in pairs(Char:GetChildren()) do
									if v:IsA("BasePart") then
										if IsPartVisible(LocalPlayer.Character.Head, v) then
											Color = COL3(0,1,0);
										end
									end
								end
								local PosPart = INSTNEW("Part")
								PosPart.CFrame = Head.CFrame
								PosPart.Size = VEC3(1,1,1)
								PosPart.Transparency = 1
								Create3DVertex(PosPart, {
									["Offset"] = VEC3(1,1,1);
									["Thickness"] = 1;
									["Transparency"] = 1;
									["Filled"] = false;
									["Visible"] = true;
									["Color"] = Color;
								})
								PosPart:Destroy()
							end
						end
					end
				end
				return true
			end)
			if not func then warn(ok) end

			RunService.RenderStepped:Wait()
		end
	end)
end)

Open.Name = "Open"
Open.Parent = ScreenGui
Open.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Open.BorderColor3 = Color3.fromRGB(255, 0, 0)
Open.BorderSizePixel = 3
Open.Position = UDim2.new(0, 0, 0.287625402, 0)
Open.Size = UDim2.new(0, 44, 0, 26)
Open.Font = Enum.Font.Arial
Open.Text = "Open"
Open.TextColor3 = Color3.fromRGB(255, 0, 0)
Open.TextSize = 14.000
Open.MouseButton1Click:connect(function()
	Open.Visible = false
	Frame.Draggable = true 
	Frame.Visible = true 
end)

-- Scripts:

local function PSXT_fake_script() -- HitBox.HitBox 
	local script = Instance.new('LocalScript', HitBox)

	script.Parent.MouseButton1Click:Connect(function()
		--- Made by Bazhar#6956
		_G.Size = 35 --Change to any size 100> Or else you will lag
		while true do
			for i,v in next, game:GetService('Players'):GetPlayers() do 
				if v ~= plr then 
					pcall(function()
						v.Character.HDetector.Size = Vector3.new(_G.Size, _G.Size, _G.Size, _G.Size) --Any size it's bypassed now
						v.Character.HDetector.Transparency=1
						v.Character.HDetector.Color = Color3.fromHSV(i,3,5,2)
						v.Character.HDetector.Massless = true--Really ez just makes it massless obv
					end)
				end
			end
			wait()
		end
	end)
end
coroutine.wrap(PSXT_fake_script)()
local function IBIWBBZ_fake_script() -- Frame.Frame Script 
	local script = Instance.new('LocalScript', Frame)

	script.Parent.Parent.Frame.Draggable = true 
end
coroutine.wrap(IBIWBBZ_fake_script)()
