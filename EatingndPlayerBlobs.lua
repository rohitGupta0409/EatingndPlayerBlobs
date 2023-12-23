local EatingBlobs = game.ReplicatedStorage.eatingblobs
local SpawnArea = workspace:WaitForChild("spawns")
local SpawnAreaBG = workspace:WaitForChild("spawnsBG")
local VIpSpawn = workspace:WaitForChild("VipArea").VipSpawn

local EatingBlobsFol = workspace:WaitForChild("EatingBlobs")
local EatingBlobsFolBG = workspace:WaitForChild("EatingBlobsBG")
local EatingBlobsVIP = workspace:WaitForChild("EatingBlobsVIP")

local WaitingArea = workspace:WaitForChild("Wait")

local ReferncePart = workspace:WaitForChild("ReferencePart")
local ReferncePartBG = workspace:WaitForChild("ReferencePartBG")
local ReferncePartVIP = workspace:WaitForChild("ReferencePartVIP")

local Ts = game:GetService("TweenService")
local RPS = game.ReplicatedStorage
local CS = game:GetService("CollectionService")
local MPS = game:GetService("MarketplaceService")
local SS = game:GetService("SoundService")
local ss = game:GetService("ServerStorage")
local Player = game:GetService("Players")
local DS = game:GetService("DataStoreService")
local RS = game:GetService("RunService")

local PlayersSize = DS:GetOrderedDataStore("PlayersSize")
local PlayersKill =DS:GetOrderedDataStore("PlayersKill")

local CoinSound = SS:WaitForChild("Coin")

local playersScoreFold = ss:WaitForChild("PlayersScoreFol")

local BotsFol = workspace:WaitForChild("Bots")

local PlayRE = RPS:WaitForChild("UIEvents").PlayRE
local DeathPlayRE = RPS:WaitForChild("UIEvents").DeathPlayRE
local RevivedRE = RPS.UIEvents:FindFirstChild("Revived")
local ScoreRE = RPS.UIEvents:FindFirstChild("ScoreRE")
local PassPurchaseRE = RPS.UIEvents.PassPurchaseRE
local PlayerAddedGLBre = RPS.UIEvents.PlayerAddedGLB
local KillDeclareRE = RPS.UIEvents.KillDeclareRE
local RankShareRE = RPS.UIEvents.RankShare
local VIPCheckRe = RPS.UIEvents.VIPCheck


local GoldMultiply, SizeMultiply, ingameVIPpassPurhcaseSuccess, ingameMagnetarpassPurhcaseSuccess, newPlayerKillsScoresTable
local inGameGoldPass, inGameSizePass

local SoulModule = require(ss:WaitForChild("Modules").Soul)


for i =1, 3 do
	
	if i == 1 then
		
		for _, spawnLocation in ipairs(SpawnArea:GetChildren()) do
			
			if spawnLocation.Name == "SpawnArea2" or "SpawnArea3" then
				
				local total = spawnLocation.Name == "SpawnArea2" and math.random(2500,3000) or math.random(1500,2000)

				for i = 0, total,1 do

					local eatingBlobs = game.ReplicatedStorage.eatingblobs:Clone()
					eatingBlobs.Name = i
					eatingBlobs.Anchored = true
					eatingBlobs.CanCollide = false
					eatingBlobs.Parent = EatingBlobsFol

					local r, g, b = math.random(0, 255), math.random(0, 255), math.random(0, 255);
					local color = Color3.fromRGB(r, g, b);

					eatingBlobs.Color = color

					local offset
					
					if spawnLocation.Name == "SpawnArea2" then
						
						offset = Vector3.new(math.random(-228,228), 0, math.random(-254,254))
					else
						offset = Vector3.new(math.random(-156,156),0,math.random(-228,228))
					end

					eatingBlobs.Size = eatingBlobs.Size + (eatingBlobs.Size * math.random(0.25,0.75))
					eatingBlobs.CFrame = spawnLocation.CFrame + offset
					eatingBlobs.CFrame = CFrame.new(eatingBlobs.CFrame.X,ReferncePart.CFrame.Y,eatingBlobs.CFrame.Z)

					CS:AddTag(eatingBlobs,"Blob")

				end
			end
		end
	else
		if i == 2 then
			
			for _, spawnLocation in ipairs(SpawnAreaBG:GetChildren()) do
				
				if spawnLocation.Name == "SpawnAreaBG2" then
					
					
					for i = 0, math.random(2500,3500) do
						
						local eatingBlobs = game.ReplicatedStorage.eatingblobs:Clone()
						eatingBlobs.Name = i
						eatingBlobs.Anchored = true
						eatingBlobs.CanCollide = false
						eatingBlobs.Parent = EatingBlobsFolBG

						local r, g, b = math.random(0, 255), math.random(0, 255), math.random(0, 255);
						local color = Color3.fromRGB(r, g, b);

						eatingBlobs.Color = color

						local offset

						if spawnLocation.Name == "SpawnAreaBG1" then
							offset = Vector3.new(math.random(-140,140),0,math.random(-140,140))
						elseif spawnLocation.Name == "SpawnAreaBG2" then
							offset = Vector3.new(math.random(-252,252),0,math.random(-222,222))
						elseif spawnLocation.Name == "SpawnAreaBG3" then
							offset = Vector3.new(math.random(-153,153),0,math.random(-116,116))	
						end

						eatingBlobs.Size = eatingBlobs.Size + (eatingBlobs.Size * math.random(0.25,0.75))
						eatingBlobs.CFrame = spawnLocation.CFrame + offset
						eatingBlobs.CFrame = CFrame.new(eatingBlobs.CFrame.X,ReferncePartBG.CFrame.Y,eatingBlobs.CFrame.Z)
					end
				else
					for i = 0, math.random(1500,2500) do
						
						local eatingBlobs = game.ReplicatedStorage.eatingblobs:Clone()
						eatingBlobs.Name = i
						eatingBlobs.Anchored = true
						eatingBlobs.CanCollide = false
						eatingBlobs.Parent = EatingBlobsVIP

						local r, g, b = math.random(0, 255), math.random(0, 255), math.random(0, 255);
						local color = Color3.fromRGB(r, g, b);

						eatingBlobs.Color = color

						local offset

						if spawnLocation.Name == "SpawnAreaBG1" then
							offset = Vector3.new(math.random(-140,140),0,math.random(-140,140))
						elseif spawnLocation.Name == "SpawnAreaBG2" then
							offset = Vector3.new(math.random(-252,252),0,math.random(-222,222))
						elseif spawnLocation.Name == "SpawnAreaBG3" then
							offset = Vector3.new(math.random(-153,153),0,math.random(-116,116))	
						end

						eatingBlobs.Size = eatingBlobs.Size + (eatingBlobs.Size * math.random(0.25,0.75))
						eatingBlobs.CFrame = spawnLocation.CFrame + offset
						eatingBlobs.CFrame = CFrame.new(eatingBlobs.CFrame.X,ReferncePartBG.CFrame.Y,eatingBlobs.CFrame.Z)
					end
				end
			end
		else
			print("vip spawn blobs")
			for i = 1, math.random(1500,2000) do
				
				local eatingBlobs = game.ReplicatedStorage.eatingblobs:Clone()
				eatingBlobs.Name = i
				eatingBlobs.Anchored = true
				eatingBlobs.CanCollide = false
				eatingBlobs.Parent = EatingBlobsFol

				local r, g, b = math.random(0, 255), math.random(0, 255), math.random(0, 255);
				local color = Color3.fromRGB(r, g, b);

				eatingBlobs.Color = color

				local offset = Vector3.new(math.random(-187,187),0,math.random(-121,121))
				
				eatingBlobs.Size = eatingBlobs.Size + (eatingBlobs.Size * math.random(0.25,0.75))
				eatingBlobs.CFrame = VIpSpawn.CFrame + offset
				eatingBlobs.CFrame = CFrame.new(eatingBlobs.CFrame.X,ReferncePartVIP.CFrame.Y,eatingBlobs.CFrame.Z)
			end
		end
	end
end


local function CollectBlobs(char)
	
	local player = Player:FindFirstChild(char.Name)
	local notPassInc = 1
	
	local SizeGamepass = MPS:UserOwnsGamePassAsync(player.UserId,667314694)
	
	if not SizeMultiply then
		
		notPassInc = 2
	end
		
	local PlayerBlob = char:WaitForChild(char.Name)

	PlayerBlob.Touched:Connect(function(hit)
		
		if hit.Name == "SpawnArea" then return end
		
		if hit:IsDescendantOf(EatingBlobsFol) or hit:IsDescendantOf(EatingBlobsFolBG) then
			
			local playerScoreInt = ss.PlayersScoreFol:FindFirstChild(PlayerBlob.Parent.Name):FindFirstChild("Score")
			local playerSizeInt = ss.PlayersScoreFol:FindFirstChild(PlayerBlob.Parent.Name):FindFirstChild("Size")

			
			CoinSound:Play()
			local EatingBlobTween = Ts:Create(hit,TweenInfo.new(0.2,Enum.EasingStyle.Linear,Enum.EasingDirection.Out),{Size = hit.Size - hit.Size})
			EatingBlobTween:Play()

			EatingBlobTween.Completed:Connect(function()

				hit:Destroy()
			end)
			
			local player = game.Players:FindFirstChild(char.Name)
			
			local SizeInc = math.random(1,4) * (SizeMultiply or 1)

			ScoreRE:Fire(player, "EatingBlob", char, nil, SizeMultiply, GoldMultiply, inGameGoldPass,inGameSizePass,SizeInc)
			
			local Size
			
			
			if playerSizeInt.Value > 10000 then
				Size = SizeInc * 0.00005
			elseif playerSizeInt.Value > 3100 then
				Size = .002 * SizeInc
			elseif playerSizeInt.Value > 3000 then
				Size = .05 * SizeInc
			elseif playerSizeInt.Value > 2300 then
				Size = .005 * SizeInc
			elseif playerSizeInt.Value > 2000 then
				Size = .05 * SizeInc
			elseif playerSizeInt.Value > 1500 then
				Size = .02 * SizeInc
			elseif playerSizeInt.Value > 1000 then
				Size = .03 * SizeInc
			elseif playerSizeInt.Value > 500 then
				Size = .01 * SizeInc
			elseif playerSizeInt.Value > 200 then
				Size = .01 * SizeInc
			elseif playerSizeInt.Value > 100 then
				Size = .02 * SizeInc
			elseif playerSizeInt.Value > 50 then
				Size = .02 * SizeInc
			elseif playerSizeInt.Value < 50 then
				Size = .1 * SizeInc
			end

			if playerSizeInt.Value >= 1000 then
				char.Humanoid.WalkSpeed = 12
			elseif playerSizeInt.Value >= 500 then
				char.Humanoid.WalkSpeed = 14
			elseif playerSizeInt.Value >= 200 then
				char.Humanoid.WalkSpeed = 16
			end
									
			local SpawnShield = PlayerBlob:FindFirstChild("SpawnShield")

			local playerSizetween = Ts:Create(PlayerBlob,TweenInfo.new(0.1,Enum.EasingStyle.Linear,Enum.EasingDirection.Out),{Size = PlayerBlob.Size + Vector3.new(Size,Size,Size)})
			playerSizetween:Play()

			playerSizetween.Completed:Connect(function()

				local playerLastSizeX = ss.PlayersScoreFol:FindFirstChild(char.Name):FindFirstChild("PlayerLastSizeX")
				playerLastSizeX.Value = PlayerBlob.Size.X

			end)
		else
			
			if CS:HasTag(hit,"Ball") then
								
				local CheckPlayer = game.Players:FindFirstChild(hit.Name)
				if not CheckPlayer then
															
					local Shield
					pcall(function()
						
						Shield = hit.Shield

					end)
					
					if not Shield then
						
						pcall(function()
							
							hit.Parent:Remove()
						end)
						return
					end
					
					if Shield.Value == true then return end
					
					
					local hitSize = ss.PlayersScoreFol:FindFirstChild(hit.Name):FindFirstChild("Size")
					local hitScore = ss.PlayersScoreFol:FindFirstChild(hit.Name):FindFirstChild("Score")
					local PlayerSize = ss.PlayersScoreFol:FindFirstChild(PlayerBlob.Parent.Name):FindFirstChild("Size")
					local PlayerSize2 = RPS.PlayerScoreFoldRPS:FindFirstChild(PlayerBlob.Parent.Name):FindFirstChild("Size")
					local PlayerScore = ss.PlayersScoreFol:FindFirstChild(PlayerBlob.Parent.Name):FindFirstChild("Score")

					if hitSize ~= nil then
						
						if PlayerSize.Value > hitSize.Value then
							
							local success, Error = pcall(function()
								hit.Parent:Destroy()
							end)
							
							task.spawn(function()
								
								KillDeclareRE:FireAllClients(player.Name,hit.Name)
								SoulModule.CreateSoul(hit)
							end)
							
							if Error then
								
								print("Bot Cant Be destroyed Because of "..Error)
								return
							end

							local PlayerKillsInt = ss.PlayersScoreFol:FindFirstChild(PlayerBlob.Parent.Name):FindFirstChild("Kills")
							local TotalKills = ss.PlayersScoreFol:FindFirstChild(PlayerBlob.Name):FindFirstChild("TotalKills")
							local PlayerKillIntRPS = RPS.PlayerScoreFoldRPS:FindFirstChild(PlayerBlob.Name).Kills
							local GroundType = ss.PlayersScoreFol:FindFirstChild(char.Name):FindFirstChild("GroundType")
							
							PlayerKillsInt.Value += 1
							PlayerKillIntRPS.Value += 1
							
							PlayerSize.Value += hitSize.Value
							PlayerSize2.Value = PlayerSize.Value
							
							TotalKills.Value += 1
							
							local Size
							
							if PlayerSize.Value >= 1000 then
								Size = hitSize.Value * .001
							elseif PlayerSize.Value >= 5000 and PlayerSize.Value <10000 then
								Size = hitSize.Value * .001
							elseif PlayerSize.Value >= 2300 and PlayerSize.Value <= 5000 then
								Size = hitSize.Value * .005
							elseif PlayerSize.Value <= 2300 and PlayerSize.Value >= 2000 then
								Size = hitSize.Value * .01
								if Size > 6 then
									Size = 6
								end
								print(Size)
							elseif PlayerSize.Value <= 2000 and PlayerSize.Value >= 1500 then
								Size = hitSize.Value * .003
							elseif PlayerSize.Value <= 1500 and PlayerSize.Value >= 1000 then
								Size = hitSize.Value * .004
							elseif PlayerSize.Value <= 1000 and PlayerSize.Value >= 500 then
								Size = hitSize.Value * .006
							elseif PlayerSize.Value <= 500 and PlayerSize.Value >= 200 then 						
								Size = hitSize.Value * .005
							elseif PlayerSize.Value <= 200 and PlayerSize.Value >= 100 then
								Size = hitSize.Value * .024
							elseif PlayerSize.Value <= 100 and PlayerSize.Value >= 50 then
								Size = hitSize.Value * .022
							elseif PlayerSize.Value <= 50 and PlayerSize.Value >= 0 then
								Size = hitSize.Value * .044						
							end

							if PlayerSize.Value >= 1000 then
								char.Humanoid.WalkSpeed = 12
							elseif PlayerSize.Value >= 500 then
								char.Humanoid.WalkSpeed = 14
							elseif PlayerSize.Value >= 200 then
								char.Humanoid.WalkSpeed = 16
							end
							
							local SpawnShield = PlayerBlob:FindFirstChild("SpawnShield")
							
							local playerSizetween = Ts:Create(PlayerBlob,TweenInfo.new(0.1,Enum.EasingStyle.Linear,Enum.EasingDirection.Out),{Size = PlayerBlob.Size + Vector3.new(Size,Size,Size)})
							playerSizetween:Play()
							
							if SpawnShield then
								
								Ts:Create(SpawnShield,TweenInfo.new(0.1,Enum.EasingStyle.Linear,Enum.EasingDirection.Out),{Size = SpawnShield.Size + Vector3.new(Size,Size,Size)}):Play()
							end
							
							playerSizetween.Completed:Connect(function()

								local playerLastSizeX = ss.PlayersScoreFol:FindFirstChild(PlayerBlob.Parent.Name):FindFirstChild("PlayerLastSizeX")
								playerLastSizeX.Value = PlayerBlob.Size.X

							end)
						end
					else
						pcall(function()
							hit.Parent:Destroy()
							print("Error bot deleted by player")
						end)
					end
				else
					
					local hitSize = ss.PlayersScoreFol:FindFirstChild(hit.Name):FindFirstChild("Size")
					local hitScore = ss.PlayersScoreFol:FindFirstChild(hit.Name):FindFirstChild("Score")
					local PlayerSize = ss.PlayersScoreFol:FindFirstChild(PlayerBlob.Parent.Name):FindFirstChild("Size")
					local PlayerScore = ss.PlayersScoreFol:FindFirstChild(PlayerBlob.Parent.Name):FindFirstChild("Score")

					if CheckPlayer then
						
						local Shield = hit.Shield
						if Shield.Value == true then print("shield true") return end
						
						local playerScoreInt = ss.PlayersScoreFol:FindFirstChild(PlayerBlob.Parent.Name):FindFirstChild("Score")
						local playerSizeInt = ss.PlayersScoreFol:FindFirstChild(PlayerBlob.Parent.Name):FindFirstChild("Size")
						local playerSizeInt2 = RPS.PlayerScoreFoldRPS:FindFirstChild(PlayerBlob.Parent.Name):FindFirstChild("Size")

						if PlayerSize.Value > hitSize.Value then
							
							hit.Parent:FindFirstChild("Humanoid").Health = 0
							
							pcall(function()
								hit:Remove()
							end)
							
							task.spawn(function()
								
								KillDeclareRE:FireAllClients(player.Name,hit.Name)
								SoulModule.CreateSoul(hit)
							end)

							local PlayerKillsInt = ss.PlayersScoreFol:FindFirstChild(PlayerBlob.Parent.Name):FindFirstChild("Kills")
							local TotalKills = ss.PlayersScoreFol:FindFirstChild(PlayerBlob.Name):FindFirstChild("TotalKills")
							local PlayerKillIntRPS = RPS.PlayerScoreFoldRPS:FindFirstChild(PlayerBlob.Name).Kills							
							local GroundType = ss.PlayersScoreFol:FindFirstChild(char.Name):FindFirstChild("GroundType")
							
							PlayerKillsInt.Value += 1
							PlayerKillIntRPS.Value += 1
							playerSizeInt.Value += hitSize.Value
							playerSizeInt2.Value = PlayerSize.Value
							
							TotalKills.Value += 1

							local Size

							if PlayerSize.Value >= 2300 then
								Size = .2
							elseif PlayerSize.Value <= 2300 and PlayerSize.Value >= 2000 then
								Size = hitSize.Value * .03
							elseif PlayerSize.Value <= 2000 and PlayerSize.Value >= 1500 then
								Size = hitSize.Value * .003
							elseif PlayerSize.Value <= 1500 and PlayerSize.Value >= 1000 then
								Size = hitSize.Value * .004
							elseif PlayerSize.Value <= 1000 and PlayerSize.Value >= 500 then
								Size = hitSize.Value * .006
							elseif PlayerSize.Value <= 500 and PlayerSize.Value >= 200 then 						
								Size = hitSize.Value * .005
							elseif PlayerSize.Value <= 200 and PlayerSize.Value >= 100 then
								Size = hitSize.Value * .024
							elseif PlayerSize.Value <= 100 and PlayerSize.Value >= 50 then
								Size = hitSize.Value * .022
							elseif PlayerSize.Value <= 50 and PlayerSize.Value >= 0 then
								Size = hitSize.Value * .044						
							end					
							if playerSizeInt.Value >= 1000 then
								char.Humanoid.WalkSpeed = 12
							elseif playerSizeInt.Value >= 500 then
								char.Humanoid.WalkSpeed = 14
							elseif playerSizeInt.Value >= 200 then
								char.Humanoid.WalkSpeed = 16
							end
							
							local SpawnShield = PlayerBlob:FindFirstChild("SpawnShield")

							local playerSizetween = Ts:Create(PlayerBlob,TweenInfo.new(0.1,Enum.EasingStyle.Linear,Enum.EasingDirection.Out),{Size = PlayerBlob.Size + Vector3.new(Size,Size,Size)})
							playerSizetween:Play()
							
							if SpawnShield then

								Ts:Create(SpawnShield,TweenInfo.new(0.1,Enum.EasingStyle.Linear,Enum.EasingDirection.Out),{Size = SpawnShield.Size + Vector3.new(Size,Size,Size)}):Play()
							end
							
							playerSizetween.Completed:Connect(function()

								local playerLastSizeX = ss.PlayersScoreFol:FindFirstChild(PlayerBlob.Parent.Name):FindFirstChild("PlayerLastSizeX")

								playerLastSizeX.Value = PlayerBlob.Size.X
	
							end)
						end
					else
						print("not a desendat bot")
					end
				end
			end
		end
		return
	end)
end


EatingBlobsFol.ChildRemoved:Connect(function(child)

	task.wait(2)

	local eatingBlobs = game.ReplicatedStorage.eatingblobs:Clone()
	eatingBlobs.Name = child.Name

	local eatingBlobsPrevSize = eatingBlobs.Size

	eatingBlobs.Size = Vector3.new(0.001,0.001,0.001)

	eatingBlobs.Anchored = true
	eatingBlobs.CanCollide = false
	eatingBlobs.Parent = EatingBlobsFol

	local r, g, b = math.random(0, 255), math.random(0, 255), math.random(0, 255);
	local color = Color3.fromRGB(r, g, b);

	eatingBlobs.Color = color
	eatingBlobs.CFrame = child.CFrame + Vector3.new(math.random(-10,10),0,math.random(-10,10))

	Ts:Create(eatingBlobs,TweenInfo.new(0.5,Enum.EasingStyle.Linear,Enum.EasingDirection.Out),{Size = eatingBlobsPrevSize + (eatingBlobsPrevSize * math.random(0.25,0.75))}):Play()

	eatingBlobs.Touched:Connect(function(hit)
		
		local success, Error = pcall(function()
			
			if hit.Parent:FindFirstChild("Humanoid") then

				local EatingBlobTween = Ts:Create(eatingBlobs,TweenInfo.new(0.2,Enum.EasingStyle.Linear,Enum.EasingDirection.Out),{Size = eatingBlobs.Size - eatingBlobs.Size})
				EatingBlobTween:Play()
				EatingBlobTween.Completed:Connect(function()

					eatingBlobs:Destroy()
				end)
			end
		end)
		
		if not success then
			pcall(function()
				hit:Destroy()
				hit.Parent:Destroy()
			end)
		end
	end)
	return
end)


EatingBlobsFolBG.ChildRemoved:Connect(function(child)

	task.wait(2)

	local eatingBlobs = game.ReplicatedStorage.eatingblobs:Clone()
	eatingBlobs.Name = child.Name

	local eatingBlobsPrevSize = eatingBlobs.Size

	eatingBlobs.Size = Vector3.new(0.001,0.001,0.001)

	eatingBlobs.Anchored = true
	eatingBlobs.CanCollide = false
	eatingBlobs.Parent = EatingBlobsFolBG

	local r, g, b = math.random(0, 255), math.random(0, 255), math.random(0, 255);
	local color = Color3.fromRGB(r, g, b);

	eatingBlobs.Color = color
	eatingBlobs.CFrame = child.CFrame + Vector3.new(math.random(-10,10),0,math.random(-10,10))


	Ts:Create(eatingBlobs,TweenInfo.new(0.5,Enum.EasingStyle.Linear,Enum.EasingDirection.Out),{Size = eatingBlobsPrevSize + (eatingBlobsPrevSize * math.random(0.25,0.75))}):Play()

	eatingBlobs.Touched:Connect(function(hit)

		local success, Error = pcall(function()

			if hit.Parent:FindFirstChild("Humanoid") then

				local EatingBlobTween = Ts:Create(eatingBlobs,TweenInfo.new(0.2,Enum.EasingStyle.Linear,Enum.EasingDirection.Out),{Size = eatingBlobs.Size - eatingBlobs.Size})
				EatingBlobTween:Play()
				EatingBlobTween.Completed:Connect(function()

					eatingBlobs:Destroy()
				end)
			end
		end)

		if not success then
			pcall(function()
				
				if not game.Players:FindFirstChild(hit.Name) then
					hit:Destroy()
					hit.Parent:Destroy()	
				end
			end)
		end
	end)
	return
end)

EatingBlobsVIP.ChildRemoved:Connect(function(child)

	task.wait(2)

	local eatingBlobs = game.ReplicatedStorage.eatingblobs:Clone()
	eatingBlobs.Name = child.Name

	local eatingBlobsPrevSize = eatingBlobs.Size

	eatingBlobs.Size = Vector3.new(0.001,0.001,0.001)

	eatingBlobs.Anchored = true
	eatingBlobs.CanCollide = false
	eatingBlobs.Parent = EatingBlobsVIP

	local r, g, b = math.random(0, 255), math.random(0, 255), math.random(0, 255);
	local color = Color3.fromRGB(r, g, b);

	eatingBlobs.Color = color
	eatingBlobs.CFrame = child.CFrame + Vector3.new(math.random(-10,10),0,math.random(-10,10))


	Ts:Create(eatingBlobs,TweenInfo.new(0.5,Enum.EasingStyle.Linear,Enum.EasingDirection.Out),{Size = eatingBlobsPrevSize + (eatingBlobsPrevSize * math.random(0.25,0.75))}):Play()

	eatingBlobs.Touched:Connect(function(hit)

		local success, Error = pcall(function()

			if hit.Parent:FindFirstChild("Humanoid") then

				local EatingBlobTween = Ts:Create(eatingBlobs,TweenInfo.new(0.2,Enum.EasingStyle.Linear,Enum.EasingDirection.Out),{Size = eatingBlobs.Size - eatingBlobs.Size})
				EatingBlobTween:Play()
				EatingBlobTween.Completed:Connect(function()

					eatingBlobs:Destroy()
				end)
			end
		end)

		if not success then
			pcall(function()

				if not game.Players:FindFirstChild(hit.Name) then
					hit:Destroy()
					hit.Parent:Destroy()	
				end
			end)
		end
	end)
	return
end)

local function ReceiveRank(PlayerKillsScoresTable)
	newPlayerKillsScoresTable = PlayerKillsScoresTable
end

RankShareRE.Event:Connect(ReceiveRank)

local function createScoreTag(char)
	
	local playerBlob = char:FindFirstChild(char.Name)
	local player = game.Players:FindFirstChild(char.Name)
	
	local Scoretag = RPS.UIs.ScoreTag:Clone()
	Scoretag.Name = "ScoreTag"
	Scoretag.Adornee = playerBlob
	Scoretag.Parent = playerBlob

	local playerSizeInt = ss.PlayersScoreFol:FindFirstChild(char.Name):WaitForChild("Size")
	local NameLabel = Scoretag.NameLabel
	NameLabel.Text = char.Name
	
	RS.Heartbeat:Connect(function()
		local success, Error = pcall(function()
			local check = Scoretag.Parent.Parent.Parent
		end)

		if success then
			
			if newPlayerKillsScoresTable then
				for rank, v in ipairs(newPlayerKillsScoresTable) do
					
					if v.Key == player.UserId then
						if rank > 3 then
							Scoretag.RankText.Visible = true
							Scoretag.RankText.Text = rank
							Scoretag.RankImage.Visible = false
						else
							Scoretag.RankText.Visible = false
							local RankImage = Scoretag.RankImage
							RankImage.Visible = true
							if rank == 1 then
								RankImage.Image = "rbxassetid://15715300181"
							elseif rank == 2 then
								RankImage.Image = "rbxassetid://15715307415"
							else
								RankImage.Image = "rbxassetid://15715311329"
							end
						end
					end
				end 
			end
			Scoretag.Score.Text = playerSizeInt.Value
		else
			return
		end
	end)
end

local function PlaySpawn(player,Type)
	
	local CanSetSize = ss.PlayersScoreFol:FindFirstChild(player.Name):FindFirstChild("CanSetSize")
	CanSetSize.Value = false
	
	local Hum = player.Character.Humanoid
	Hum.WalkSpeed = 18
	

	local playerScoresFold = ss.PlayersScoreFol:FindFirstChild(player.Name)
	
	local GroundType = ss.PlayersScoreFol:FindFirstChild(player.Name):FindFirstChild("GroundType")
	local GroundType2 = GroundType ~= nil and RPS.PlayerScoreFoldRPS:FindFirstChild(player.Name).GroundType or nil
	
	local playerSizeInt = ss.PlayersScoreFol:FindFirstChild(player.Name):FindFirstChild("Size")
	local playerKillsInt = ss.PlayersScoreFol:FindFirstChild(player.Name):FindFirstChild("Kills")
	local playerSizeInt2 = RPS.PlayerScoreFoldRPS:FindFirstChild(player.Name):FindFirstChild("Size")
	local playerKillsInt2 = RPS.PlayerScoreFoldRPS:FindFirstChild(player.Name):FindFirstChild("Kills")

	playerSizeInt.Value = 0
	playerKillsInt.Value = 0
	playerSizeInt2.Value = 0
	playerKillsInt2.Value = 0	
	
	local playerBlob = player.Character:FindFirstChild(player.Name)

	local Success = pcall(function()
		
		playerBlob.Size = Vector3.new(2,2,2)
	end)	
	
	if not Success then
		print("not success")
		player:LoadCharacter()
		playerBlob = player.Character:FindFirstChild(player.Name)
	end
	

	local SpawnShield = playerBlob:FindFirstChild("SpawnShield")
	
	if SpawnShield then
		SpawnShield.Transparency = 0
	else
		local newSpawnShield = Instance.new("Part")
		newSpawnShield.Shape = Enum.PartType.Ball
		newSpawnShield.Size = playerBlob.Size + Vector3.new(2,2,2)
		newSpawnShield.Material = Enum.Material.ForceField
		newSpawnShield.Color = Color3.fromRGB(3, 14, 165)
		newSpawnShield.CFrame = playerBlob.CFrame
		newSpawnShield.Name = "SpawnShield"
		newSpawnShield.CanCollide = false
		newSpawnShield.Transparency = 0
		newSpawnShield.Parent = playerBlob

		local weld = Instance.new("Weld",playerBlob)
		weld.Part0 = playerBlob
		weld.Part1 = newSpawnShield
	end	
	if not GroundType then
		GroundType = Instance.new("StringValue",playerScoresFold)
		GroundType.Name = "GroundType"
		
		GroundType2 = GroundType:Clone()
		GroundType2.Parent = RPS.PlayerScoreFoldRPS:FindFirstChild(player.Name)  ---this secong ground type is being used by client to fire a server from respawn script. The first one is in server and the GLB script using it 
	end
	
	GroundType.Value = Type
	GroundType2.Value = Type
	
	local char = player.Character
	
	task.spawn(function()

		createScoreTag(char)
	end)
	
	if GroundType.Value == "MG" then
		local totalSpawn = workspace:WaitForChild("SpawnLocations"):GetChildren()

		local randomSpawn = math.random(1,#totalSpawn)
		
		local X = workspace:WaitForChild("SpawnLocations"):FindFirstChild(randomSpawn).Position.X
		local Z = workspace:WaitForChild("SpawnLocations"):FindFirstChild(randomSpawn).Position.Z
		local Y = workspace:WaitForChild("SpawnLocations"):FindFirstChild(randomSpawn).Position.Y
		
		char:MoveTo(Vector3.new(X,Y,Z))
	else
		if GroundType.Value == "BG" then
			
			local totalSpawn = workspace:WaitForChild("SpawnLocationsBG"):GetChildren()

			local randomSpawn = math.random(1,#totalSpawn)
			
			local X = workspace:WaitForChild("SpawnLocationsBG"):FindFirstChild(randomSpawn).Position.X
			local Z = workspace:WaitForChild("SpawnLocationsBG"):FindFirstChild(randomSpawn).Position.Z
			local Y = workspace:WaitForChild("SpawnLocationsBG"):FindFirstChild(randomSpawn).Position.Y

			char:MoveTo(Vector3.new(X,Y,Z))
		end
	end
	
	char.Humanoid.WalkSpeed = 18
	CollectBlobs(char)
	

	task.spawn(function()
		PlayerGamePass(player)
	end)
	
	task.wait(2)
	
	local Waiting = RPS.PlayerScoreFoldRPS:FindFirstChild(player.Name):FindFirstChild("Waiting")
	Waiting.Value = false
	
	task.wait(7)
	
	pcall(function()
		local Shield = player.Character:FindFirstChild(player.Name).Shield
		Shield.Value = false
		SpawnShield:Destroy()
	end)
	return
end

local function PlayRespawn(player,Type)
	
	local Hum = player.Character.Humanoid
	Hum.WalkSpeed = 18
	
	local GroundType = ss.PlayersScoreFol:FindFirstChild(player.Name):FindFirstChild("GroundType")
	GroundType.Value = Type
	
	local GroundType2 = RPS.PlayerScoreFoldRPS:FindFirstChild(player.Name):FindFirstChild("GroundType")
	GroundType2.Value = Type
	
	local CanSetSize = ss.PlayersScoreFol:FindFirstChild(player.Name):FindFirstChild("CanSetSize")
	CanSetSize.Value = false
	
	local playerSizeInt = ss.PlayersScoreFol:FindFirstChild(player.Name):FindFirstChild("Size")
	local playerKillsInt = ss.PlayersScoreFol:FindFirstChild(player.Name):FindFirstChild("Kills")
	
	local playerSizeInt2 = RPS.PlayerScoreFoldRPS:FindFirstChild(player.Name):FindFirstChild("Size")
	local playerKillsInt2 = RPS.PlayerScoreFoldRPS:FindFirstChild(player.Name):FindFirstChild("Kills")
	
	playerSizeInt.Value = 0
	playerKillsInt.Value = 0
	playerSizeInt2.Value = 0
	playerKillsInt2.Value = 0
	
	player:LoadCharacter()
	
	local playerBlob = player.Character:FindFirstChild(player.Name)
	local success = pcall(function()
		playerBlob.Size = Vector3.new(2,2,2)
	end)
	
	local SpawnShield = playerBlob:FindFirstChild("SpawnShield")
	SpawnShield.Transparency = 0

	local char = player.Character
	
	task.spawn(function()

		createScoreTag(char)
	end)
	
	if GroundType.Value == "MG" then
		local totalSpawn = workspace:WaitForChild("SpawnLocations"):GetChildren()

		local randomSpawn = math.random(1,#totalSpawn)


		local totalSpawn = workspace:WaitForChild("SpawnLocationsBG"):GetChildren()

		local randomSpawn = math.random(1,#totalSpawn)
		local X = workspace:WaitForChild("SpawnLocations"):FindFirstChild(randomSpawn).Position.X
		local Z = workspace:WaitForChild("SpawnLocations"):FindFirstChild(randomSpawn).Position.Z
		local Y = workspace:WaitForChild("SpawnLocations"):FindFirstChild(randomSpawn).Position.Y + 2

		char:MoveTo(Vector3.new(X,Y,Z))		
	else
		if GroundType.Value == "BG" then

			local totalSpawn = workspace:WaitForChild("SpawnLocationsBG"):GetChildren()

			local randomSpawn = math.random(1,#totalSpawn)
			local X = workspace:WaitForChild("SpawnLocationsBG"):FindFirstChild(randomSpawn).Position.X
			local Z = workspace:WaitForChild("SpawnLocationsBG"):FindFirstChild(randomSpawn).Position.Z
			local Y = workspace:WaitForChild("SpawnLocationsBG"):FindFirstChild(randomSpawn).Position.Y + 2

			char:MoveTo(Vector3.new(X,Y,Z))
		end
	end
	
	CollectBlobs(char)
	
	task.spawn(function()
		PlayerGamePass(player)
	end)
	
	task.wait(10)
	
	if not player.Character:FindFirstChild(player.Name) then return end
	local Shield = player.Character:FindFirstChild(player.Name):WaitForChild("Shield")
	Shield.Value = false
	SpawnShield:Destroy()
	return
end

local function PlayerRevive(player,Type)
	

	local GroundType = ss.PlayersScoreFol:FindFirstChild(player.Name):FindFirstChild("GroundType")
	GroundType.Value = Type
	
	local GroundType2 = RPS.PlayerScoreFoldRPS:FindFirstChild(player.Name):FindFirstChild("GroundType")
	GroundType2.Value = Type
	
	local CanSetSize = ss.PlayersScoreFol:FindFirstChild(player.Name):FindFirstChild("CanSetSize")
	CanSetSize.Value = true
	
	player:LoadCharacter()
	
	local playerBlob = player.Character:FindFirstChild(player.Name)

	local SpawnShield = playerBlob:FindFirstChild("SpawnShield")
	SpawnShield.Transparency = 0
	
	local char = player.Character
	
	task.spawn(function()
		
		createScoreTag(char)
	end)
	
	if GroundType.Value == "MG" then
		local totalSpawn = workspace:WaitForChild("SpawnLocations"):GetChildren()

		local randomSpawn = math.random(1,#totalSpawn)

		local totalSpawn = workspace:WaitForChild("SpawnLocations"):GetChildren()

		local randomSpawn = math.random(1,#totalSpawn)
		local X = workspace:WaitForChild("SpawnLocations"):FindFirstChild(randomSpawn).Position.X
		local Z = workspace:WaitForChild("SpawnLocations"):FindFirstChild(randomSpawn).Position.Z
		local Y = workspace:WaitForChild("SpawnLocations"):FindFirstChild(randomSpawn).Position.Y + 2

		char:MoveTo(Vector3.new(X,Y,Z))		
	else
		if GroundType.Value == "BG" then

			local totalSpawn = workspace:WaitForChild("SpawnLocationsBG"):GetChildren()

			local randomSpawn = math.random(1,#totalSpawn)
			local X = workspace:WaitForChild("SpawnLocationsBG"):FindFirstChild(randomSpawn).Position.X
			local Z = workspace:WaitForChild("SpawnLocationsBG"):FindFirstChild(randomSpawn).Position.Z
			local Y = workspace:WaitForChild("SpawnLocationsBG"):FindFirstChild(randomSpawn).Position.Y + 2

			char:MoveTo(Vector3.new(X,Y,Z))
		end
	end
	
	CollectBlobs(char)
	
	task.spawn(function()
		PlayerGamePass(player)
	end)
	
	task.wait(10)
	
	if not player.Character:FindFirstChild(player.Name) then return end ----this is because if player dies after respawing under 5 sec then this stop it so does cause any error
	local Shield = player.Character:FindFirstChild(player.Name).Shield
	Shield.Value = false
	SpawnShield:Destroy()
	return
end


---GamePass Check

local function VIPcheck(player)
	
	print("checking pass")
	print(ingameVIPpassPurhcaseSuccess)
	if MPS:UserOwnsGamePassAsync(player.UserId,665386971) or ingameVIPpassPurhcaseSuccess then
		
		local Shield = player.Character:FindFirstChild(player.Name).Shield
		
		if Shield then
			if Shield.Value == false then
				Shield.Value = true
			else
				Shield.Value = false
			end
		end
		return true
	else
		return false
	end
end

VIPCheckRe.OnServerInvoke = VIPcheck

function PlayerGamePass(player)
		
	local GroundType = ss.PlayersScoreFol:FindFirstChild(player.Name):FindFirstChild("GroundType")
	
	local playerBlob = workspace:WaitForChild(player.Name):FindFirstChild(player.Name)

	local Gold, HasGoldPass = pcall(function()

		return MPS:UserOwnsGamePassAsync(player.UserId,665853189)
	end)
	
	local Size, HasSizePass = pcall(function()

		return MPS:UserOwnsGamePassAsync(player.UserId,667314694)
	end)
	
	local Magnetar, HasMagnetarPass = pcall(function()

		return MPS:UserOwnsGamePassAsync(player.UserId,665944144)
	end)
	
	local VIPPass, HasVIPPass = pcall(function()

		return MPS:UserOwnsGamePassAsync(player.UserId,665386971)
	end)

	if Gold and HasGoldPass then
		
		GoldMultiply = 2
		
	else
		GoldMultiply = nil

	end
	
	if Size and HasSizePass then

		SizeMultiply = 2

	else
		SizeMultiply = nil

	end
	
	local function EatingBlobForMagnetar(player,hit,playerBlob)
		
		local char = workspace:WaitForChild(player.Name)
		
		local MagneticSpace = char:FindFirstChild(player.Name):FindFirstChild("MagneticSphere")
		local SpawnShield = playerBlob:FindFirstChild("SpawnShield")
		
		if not MagneticSpace then
			
			MagneticSpace = Instance.new("Part",playerBlob)
			MagneticSpace.Shape = Enum.PartType.Ball
			MagneticSpace.CanCollide = false
			MagneticSpace.Anchored = false
			MagneticSpace.Size = Vector3.new(12,12,12)
			MagneticSpace.Transparency = 1
			MagneticSpace.Position = playerBlob.Position
			MagneticSpace.Name = "MagneticSphere"

			local weld = Instance.new("WeldConstraint",playerBlob)
			weld.Part0 = playerBlob
			weld.Part1 = MagneticSpace

			MagneticSpace.Parent = playerBlob
		end
		
		local playerSizeInt = ss.PlayersScoreFol:FindFirstChild(player.Name):FindFirstChild("Size")

		
		CoinSound:Play()
		local EatingBlobTween = Ts:Create(hit,TweenInfo.new(0.2,Enum.EasingStyle.Linear,Enum.EasingDirection.Out),{Size = hit.Size - hit.Size})
		EatingBlobTween:Play()
		
		EatingBlobTween.Completed:Connect(function()

			hit:Destroy()
		end)

		local player = game.Players:FindFirstChild(char.Name)
		
		local SizeInc = math.random(1,4) * (SizeMultiply or 1)
		ScoreRE:Fire(player, "EatingBlob", char, nil, SizeMultiply, GoldMultiply, inGameGoldPass,inGameSizePass,SizeInc)
		
		local size = .1
		
		if playerSizeInt.Value > 10000 then
			Size = SizeInc * 0.00005
		elseif playerSizeInt.Value > 3100 then
			Size = .002 * SizeInc
		elseif playerSizeInt.Value > 3000 then
			Size = .05 * SizeInc
		elseif playerSizeInt.Value > 2300 then
			Size = .005 * SizeInc
		elseif playerSizeInt.Value > 2000 then
			Size = .05 * SizeInc
		elseif playerSizeInt.Value > 1500 then
			Size = .02 * SizeInc
		elseif playerSizeInt.Value > 1000 then
			Size = .03 * SizeInc
		elseif playerSizeInt.Value > 500 then
			Size = .01 * SizeInc
		elseif playerSizeInt.Value > 200 then
			Size = .01 * SizeInc
		elseif playerSizeInt.Value > 100 then
			Size = .02 * SizeInc
		elseif playerSizeInt.Value > 50 then
			Size = .02 * SizeInc
		elseif playerSizeInt.Value < 50 then
			Size = .1 * SizeInc
		end
				
		if playerSizeInt.Value >= 1000 then
			char.Humanoid.WalkSpeed = 12
		elseif playerSizeInt.Value >= 500 then
			char.Humanoid.WalkSpeed = 14
		elseif playerSizeInt.Value >= 200 then
			char.Humanoid.WalkSpeed = 16
		end
		
		local playerSizetween = Ts:Create(playerBlob,TweenInfo.new(0.1,Enum.EasingStyle.Linear,Enum.EasingDirection.Out),{Size = playerBlob.Size + Vector3.new(size,size,size)})
		playerSizetween:Play()

		Ts:Create(MagneticSpace,TweenInfo.new(0.1,Enum.EasingStyle.Linear,Enum.EasingDirection.Out),{Size = MagneticSpace.Size + Vector3.new(size,size,size)}):Play()

		playerSizetween.Completed:Connect(function()

			local playerLastSizeX = ss.PlayersScoreFol:FindFirstChild(char.Name):FindFirstChild("PlayerLastSizeX")
			playerLastSizeX.Value = playerBlob.Size.X
		end)
	end
	
	if Magnetar and HasMagnetarPass or ingameMagnetarpassPurhcaseSuccess then
		
		
		local MagneticSpace = Instance.new("Part")
		MagneticSpace.Shape = Enum.PartType.Ball
		MagneticSpace.CanCollide = false
		MagneticSpace.Anchored = false
		MagneticSpace.Size = Vector3.new(12,12,12)
		MagneticSpace.Transparency = 1
		MagneticSpace.Position = playerBlob.Position
		MagneticSpace.Name = "MagneticSphere"
		
		local weld = Instance.new("WeldConstraint",playerBlob)
		weld.Part0 = playerBlob
		weld.Part1 = MagneticSpace
		
		MagneticSpace.Parent = playerBlob
		
		MagneticSpace.Touched:Connect(function(hit)
			
			if hit:IsDescendantOf(EatingBlobsFol) or hit:IsDescendantOf(EatingBlobsFolBG) then
				
				Ts:Create(hit,TweenInfo.new(0.5,Enum.EasingStyle.Linear,Enum.EasingDirection.Out),{Position = playerBlob.Position}):Play()
				EatingBlobForMagnetar(player,hit,playerBlob,MagneticSpace)
			end
		end)
	end
	
	
	if VIPPass and HasVIPPass or ingameVIPpassPurhcaseSuccess then
		
		print("now have VIP pass")
		SizeMultiply = 2
		GoldMultiply = 2
		
		local MagneticSpace = Instance.new("Part")
		MagneticSpace.Shape = Enum.PartType.Ball
		MagneticSpace.CanCollide = false
		MagneticSpace.Anchored = false
		MagneticSpace.Size = Vector3.new(12,12,12)
		MagneticSpace.Transparency = 1
		MagneticSpace.Position = playerBlob.Position

		local weld = Instance.new("WeldConstraint",playerBlob)
		weld.Part0 = playerBlob
		weld.Part1 = MagneticSpace

		MagneticSpace.Parent = playerBlob

		MagneticSpace.Touched:Connect(function(hit)

			if hit:IsDescendantOf(EatingBlobsFol) then

				Ts:Create(hit,TweenInfo.new(0.5,Enum.EasingStyle.Linear,Enum.EasingDirection.Out),{Position = playerBlob.Position}):Play()
				EatingBlobForMagnetar(player,hit,playerBlob,MagneticSpace)
			end
		end)
	end
end

PlayRE.OnServerEvent:Connect(PlaySpawn)
RevivedRE.OnServerEvent:Connect(PlayerRevive)
DeathPlayRE.OnServerEvent:Connect(PlayRespawn)
PassPurchaseRE.OnServerEvent:Connect(function(player,ID)
	
	print(ID)
	print("pass purchase complete")
	if ID == 665853189 then
		inGameGoldPass = 2
		PlayerGamePass(player)
	elseif ID == 667314694 then
		inGameSizePass = 2
		PlayerGamePass(player)
	elseif ID == 665944144 then
		ingameMagnetarpassPurhcaseSuccess = true
		PlayerGamePass(player)
	elseif ID == 665386971 then
		ingameVIPpassPurhcaseSuccess = true
		print(ingameVIPpassPurhcaseSuccess)
		PlayerGamePass(player)
	end
end)

local connection
connection = game.Players.PlayerAdded:Connect(function(player)
	
	print("player added")
	
	local TotalSize = ss.PlayersScoreFol:WaitForChild(player.Name):FindFirstChild("TotalSize")
	local TotalKills = ss.PlayersScoreFol:WaitForChild(player.Name):FindFirstChild("TotalKills")
	
	local Key = player.UserId

	if not TotalSize then
		TotalSize = Instance.new("IntValue",ss.PlayersScoreFol:FindFirstChild(player.Name))
		TotalSize.Name = "TotalSize"

		local success, PlayerTotalSize = pcall(function()

			return PlayersSize:GetAsync(Key)
		end)

		TotalSize.Value = PlayerTotalSize
	end
	
	if not TotalKills then
		TotalKills = Instance.new("IntValue",ss.PlayersScoreFol:FindFirstChild(player.Name))
		TotalKills.Name = "TotalKills"

		local success, PlayerTotalKills = pcall(function()

			return PlayersKill:GetAsync(Key)
		end)

		TotalKills.Value = PlayerTotalKills
	end
	
	PlayerAddedGLBre:Fire(player)
	
	local PlayerAddedBool = RPS:WaitForChild("UIValues").PlayerAddedValue.Value -- UI Stuff
	
	player:LoadCharacter()

	local char = player.Character

	PlayerAddedBool.Value = false
	player.CharacterAdded:Once(function()
		char.Humanoid.WalkSpeed = 0
	end)	
	local randomLocation = math.random(1,#WaitingArea:GetChildren())

	local choosenLocation = WaitingArea:FindFirstChild(randomLocation)
	char:MoveTo(choosenLocation.Position + Vector3.new(math.random(1,10),0,math.random(1,10)))
	CollectBlobs(char)
end)
