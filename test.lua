
local L_1_ = game:GetService("PhysicsService")
local L_2_ = game:GetService("RunService")
local L_3_ = game:GetService("UserInputService")
local L_4_ = game.Players.LocalPlayer
while (not L_4_.Character) do
	wait(0.5)
end
local L_5_ = ""
local L_6_ = require(game.ReplicatedStorage.Library.SHA1Module)
script.Parent:WaitForChild("CustomCamera", 60 * 5)
local L_7_ = 0
local L_8_ = false
local L_9_ = false
local L_10_ = false
local L_11_ = false
local L_12_ = true
local L_13_ = Vector3.new()
local L_14_ = 0
local L_15_ = 0
local L_16_ = 0
local L_17_ = 0
local L_18_ = 0
local L_19_ = 0
local L_20_ = false
local L_21_ = 0
local L_22_ = 0
local L_23_ = nil
local L_24_ = 0
local L_25_ = 0
local L_26_ = 0
local L_27_ = 0
local L_28_ = false
local L_29_ = false
local L_30_ = 0
local L_31_ = false
local L_32_ = false
local L_33_ = 1.0
local L_34_ = 0
local L_35_ = false
local L_36_ = -1
local L_37_ = 0
local L_38_ = false
local L_39_ = 0
local L_40_ = false
local L_41_ = false
local L_42_ = 0
local L_43_ = 0
local L_44_ = nil
local L_45_ = false
local L_46_ = 1
local L_47_ = false
local L_48_ = false
local L_49_
local L_50_ = false
local L_51_ = false
local L_52_ = Vector3.new()
local L_53_ = Vector3.new()
local L_54_ = 1
local L_55_ = nil
local L_56_ = 1
local L_57_ = nil
local L_58_ = nil
local L_59_ = nil
local L_60_ = nil
local L_61_ = nil
local L_62_ = nil
local L_63_ = nil
local L_64_ = CFrame.new()
local L_65_ = nil
local L_66_ = 0
local L_67_ = 0
local L_68_ = {}
local L_69_ = 0
local L_70_ = false
local L_71_ = {}
local L_72_ = false
local L_73_ = nil
local L_74_ = nil
local L_75_ = {}
local L_76_ = false
game.ReplicatedStorage.GunEvent.GunForceEnable.OnClientEvent:Connect(function()
	script.Configuration:WaitForChild("AutoEnable").Value = true
	while (not L_76_) do
		wait()
	end
	print("ENABLING GUN FROM FORCE ENABLE")
	script.Enabled.Value = true
	fc(L_56_, true)
	script.ForceRunning.Value = false
end)
local L_77_ = Instance.new("Folder")
L_77_.Name = "GunPlugins"
L_77_.Parent = script
print("Initializing Gun System")
function mc(L_100_arg1)
	local L_101_ = vb().GunInventory
	local L_102_ = L_101_:GetChildren()
	for L_103_forvar1 = 1, #L_102_ do
		local L_104_ = L_102_[L_103_forvar1]
		local L_105_ = L_104_:FindFirstChild("Slot")
		if (L_105_ ~= nil) then
			if (L_105_.Value == L_100_arg1) then
				return L_104_
			end
		end
	end
	return nil
end
function D(L_106_arg1)
	L_28_ = false
	local L_107_ = Qb():FindFirstChild("CurrentWeapon")
	if (L_107_ ~= nil) then
		L_107_:Destroy()
	end
	if (L_59_ ~= nil) then
		if (L_106_arg1 == nil or not L_106_arg1) then
			game.ReplicatedStorage.GunEvent.GunDestroy:FireServer()
		end
		L_59_ = nil
	end
end
local L_78_ = {}
function fc(L_108_arg1, L_109_arg2)
	L_109_arg2 = L_109_arg2 or false
	if (xc() == nil) then
		return
	end
	if (xc().Health <= 0) then
		return
	end
	if (L_108_arg1 == L_56_ and (L_58_ ~= nil and not L_109_arg2)) then
		return
	end
	if (mc(L_108_arg1) == nil and not L_109_arg2) then
		return
	end
	L_30_ = workspace.DistributedGameTime + script.Configuration.WeaponSwitchTransitionTime.Value
	L_68_ = {}
	local L_110_ = mc(L_108_arg1)
	if (L_110_ == nil) then
		return
	end
	local L_111_ = L_110_.Value
	if (L_111_ == nil) then
		return
	end
	L_35_ = true
	L_50_ = L_110_.Rechambering.Value
	L_40_ = false
	L_51_ = false
	L_23_ = nil
	L_68_ = {}
	if (L_58_ ~= nil and L_55_.Parent ~= nil) then
		fb(0)
	end
	D()
	if (L_111_ == nil or L_111_:FindFirstChild("ViewModel") == nil) then
		return
	end
	pcall(function()
		lc():FindFirstChild("CurrentSelected").Value = L_108_arg1
	end)
	local L_112_ = L_111_.ViewModel:Clone()
	local L_113_ = Instance.new("ObjectValue")
	L_113_.Name = "Pointer"
	L_113_.Value = L_111_
	L_113_.Parent = L_112_
	L_112_.Name = "CurrentWeapon"
	L_112_.Parent = Qb()
	local L_114_ = L_112_:GetDescendants()
	for L_123_forvar1, L_124_forvar2 in pairs(L_114_) do
		if (L_124_forvar2:IsA("BasePart")) then
			L_124_forvar2.CanCollide = false
			L_124_forvar2.Anchored = false
			L_124_forvar2.CastShadow = false
		end
	end
	L_77_:ClearAllChildren()
	local L_115_ = L_111_:FindFirstChild("Plugins")
	if (L_115_) then
		local L_125_ = L_115_:GetChildren()
		for L_126_forvar1, L_127_forvar2 in pairs(L_125_) do
			L_127_forvar2:Clone().Parent = L_77_
		end
	end
	L_57_ = L_56_
	L_56_ = L_108_arg1
	L_55_ = L_111_
	if (L_58_) then
		L_58_:Destroy()
	end
	L_58_ = L_112_
	script.CurrentWeapon.Value = L_55_
	game.ReplicatedStorage.GunEvent.ClientUpdate:FireServer(L_56_, script.Aimed.Value, L_32_, xc().JumpPower, Qb().CFrame, L_73_ ~= nil, L_75_["Temp1"] == L_75_["Temp2"])
	script.Events.OnGunChange:Fire(L_111_, L_58_, L_110_)
	for L_128_forvar1, L_129_forvar2 in pairs(L_78_) do
		L_129_forvar2:Disconnect()
	end
	L_78_ = {}
	table.insert(L_78_, L_110_.BulletsInMagazine.Changed:Connect(function()
	end))
	table.insert(L_78_, L_110_.BulletsInReserve.Changed:Connect(function()
	end))
	local L_116_ = L_55_
	game.ReplicatedStorage.GunEvent.GunCreate:FireServer(L_108_arg1)
	local L_117_ = {}
	local L_118_ = L_111_:FindFirstChild("Animations")
	for L_130_forvar1, L_131_forvar2 in pairs(L_118_:GetChildren()) do
		if (not L_71_[L_131_forvar2]) then
			L_71_[L_131_forvar2] = L_131_forvar2
			L_117_[#L_117_ + 1] = L_131_forvar2
		end
	end
	if (#L_117_ > 0) then
		game:GetService("ContentProvider"):PreloadAsync(L_117_)
	end
	local L_119_ = function()
		if (L_55_ ~= L_116_) then
			return L_55_
		end
		oc("Idle", true)
		fb(0)
		game:GetService("RunService").RenderStepped:wait()
	end
	L_72_ = true
	for L_132_forvar1 = 1, 3 do
		L_119_()
	end
	local L_120_ = 0
	while (L_60_ and L_60_.Length <= 0 and L_55_ == L_116_ and L_120_ < 16) do
		L_120_ = L_120_ + 1
		L_119_()
	end
	L_72_ = false
	if (L_55_ ~= L_116_) then
		return L_55_
	end
	local L_121_ = L_58_:FindFirstChild("HumanoidRootPart")
	if (L_121_ == nil) then
		return L_55_
	end
	if (L_58_:FindFirstChild("Weapon") and L_58_.Weapon:FindFirstChild("CAMERA") ~= nil) then
		local L_133_ = L_121_.CFrame
		local L_134_ = L_58_.Weapon.CAMERA.CFrame
		L_64_ = L_134_:toObjectSpace(L_133_)
	else
		L_64_ = CFrame.new(0, -2.125, 0)
	end
	if (L_58_:FindFirstChild("CameraBone")) then
		L_23_ = L_58_:FindFirstChild("CameraBone").CFrame:toObjectSpace(L_121_.CFrame)
	end
	if (L_55_ ~= L_116_) then
		return L_55_
	end
	oc("Draw", true)
	L_70_ = true
	L_35_ = false
	local L_122_ = nil
	if ((not Ub("Draw") or not Ub("Draw"):FindFirstChild("Initial")) and not L_111_.Sounds:FindFirstChild("Draw")) then
		L_122_ = script.Data.Draw:Clone()
	else
		if (L_111_.Sounds:FindFirstChild("Draw")) then
			L_122_ = L_111_.Sounds:FindFirstChild("Draw"):Clone()
		end
	end
	if (L_122_) then
		L_122_.Parent = L_58_.HumanoidRootPart
		if (not L_122_.Playing) then
			L_122_:Play()
		end
	end
	L_70_ = not L_122_
	L_59_ = vc():FindFirstChild("WorldModel")
	return L_55_
end
function Ub(L_135_arg1)
	if (not L_55_) then
		return nil
	end
	local L_136_ = L_55_:FindFirstChild("Animations")
	if (L_136_ == nil) then
		return nil
	end
	local L_137_ = L_55_.Animations:FindFirstChild(L_135_arg1)
	if (L_137_ == nil) then
		return nil
	end
	return L_137_
end
function x(L_138_arg1)
	if (L_138_arg1:IsA("BoolValue")) then
		return L_138_arg1.Value == true and 1 or 0
	end
	if (L_138_arg1:IsA("NumberValue") or L_138_arg1:IsA("IntValue")) then
		return L_138_arg1.Value
	end
	if (L_138_arg1:IsA("StringValue")) then
		local L_139_ = 0
		for L_140_forvar1 = 1, string.len(L_138_arg1.Value) do
			L_139_ = L_139_ + string.byte(string.sub(L_138_arg1.Value, L_140_forvar1, L_140_forvar1))
		end
		return L_139_
	end
	return 0
end
function l()
	j = true
	k()
	script.Events.OnGunAnimationFinish:Fire()
end
function k()
	local L_141_ = Ub(L_61_)
	if (L_141_) then
		local L_142_ = L_141_:FindFirstChild("Finished")
		if (L_142_ and L_142_.Value) then
			oc(L_142_.Value.Name)
			return
		end
	end
	if ((L_61_ == "Shoot" or L_61_ == "Draw" or L_61_ == "ReloadEnd" or L_61_ == "Reload") and L_50_) then
		F()
		return
	end
	if (L_61_ == "Shoot" or L_61_ == "Draw" or L_61_ == "ReloadEnd" or L_61_ == "Reload" or L_61_ == "Special") then
		oc("Idle", false, 0.0)
		jb()
		return
	end
	if (L_61_ == "Rechamber") then
		I()
		oc("Idle", false, 0.0)
		return
	end
	if (L_28_) then
		if (not L_29_) then
			oc("Idle", false, 0.0)
			ab()
			jb()
		else
			P()
		end
		return
	end
	if (not L_60_.Looped and (L_61_ == "Run" or L_61_ == "Idle")) then
		j = false
		L_60_.TimePosition = 0
		L_60_:Play()
		return
	end
	oc("Idle", false, 0.2)
end
function cb(L_143_arg1)
	return not L_143_arg1 or L_143_arg1 == "Run" or L_143_arg1 == "Idle"
end
local L_79_ = true
function oc(L_144_arg1, L_145_arg2, L_146_arg3, L_147_arg4, L_148_arg5)
	L_146_arg3 = L_146_arg3 and L_146_arg3 or 0
	L_147_arg4 = L_147_arg4 and L_147_arg4 or 1
	L_148_arg5 = L_148_arg5 and L_148_arg5 or nil
	if (L_144_arg1 == 'Draw') then
		L_34_ = 75
	end
	local L_149_ = L_144_arg1 ~= L_61_
	local L_150_ = cb(L_61_)
	local L_151_ = cb(L_144_arg1)
	local L_152_ = L_145_arg2 or L_79_ or not L_60_ or L_149_
	if (not L_152_) then
		return
	end
	local L_153_ = Ub(L_144_arg1)
	if (not L_153_) then
		return
	end
	local L_154_ = L_58_:FindFirstChild("Humanoid")
	if (not L_154_) then
		return
	end
	if (L_149_ and L_60_) then
		if (L_60_.Looped) then
			L_60_:Stop(L_146_arg3)
		else
			L_60_:Stop(0)
		end
	end
	if (L_151_) then
		L_40_ = false
	end
	local L_155_ = L_68_[L_153_]
	if (not L_155_ or L_155_.Length == 0) then
		L_155_ = L_154_:LoadAnimation(L_153_)
		L_68_[L_153_] = L_155_
	end
	L_60_ = L_155_
	L_61_ = L_144_arg1
	L_79_ = false
	L_60_.TimePosition = 0
	L_60_:Play(L_146_arg3, 1, L_147_arg4)
	if (L_151_) then
		L_60_.Looped = true
	end
	if (L_148_arg5 ~= nil) then
		L_60_.Looped = L_148_arg5
	end
	if (L_62_ ~= nil) then
		L_62_:Disconnect()
		L_63_:Disconnect()
	end
	L_62_ = L_60_.KeyframeReached:connect(h)
	L_63_ = L_60_.Stopped:Connect(l)
	script.Events.OnGunAnimationChange:Fire(L_153_, L_60_)
	L_70_ = true
end
function h(L_156_arg1)
	if (L_156_arg1 == "Reload") then
		ab()
	end
	if (L_156_arg1 == "Rechamber") then
		I()
	end
	if (string.len(L_156_arg1) > 0) then
		local L_157_ = L_61_..L_156_arg1
		kc(L_157_)
		L(L_156_arg1)
	end
end
function jb()
	L_51_ = false
	L_29_ = false
	L_40_ = false
	L_28_ = false
end
function F()
	L_40_ = true
	oc("Rechamber", true)
	kc("Rechamber")
	game.ReplicatedStorage.GunEvent.GunRechamber:FireServer()
end
function I()
	L_50_ = false
	L_40_ = false
	L_28_ = false
end
function ab()
	if (not L_28_) then
		return
	end
	local L_158_ = mc(L_56_)
	if (not L_158_) then
		return
	end
	local L_159_ = L_158_.BulletsInMagazine.Value
	local L_160_ = L_158_.BulletsInReserve.Value
	local L_161_ = L_55_.Stats.MagazineCapacity.Value
	local L_162_ = L_161_ - L_159_
	if (L_29_) then
		L_162_ = 1
	end
	if (L_160_ - L_162_ < 0) then
		L_162_ = L_160_
	end
	L_158_.BulletsInMagazine.Value = L_158_.BulletsInMagazine.Value + L_162_
	local L_163_ = L_158_.BulletsInReserve.Value >= math.pow(2, 30)
	if (not L_163_) then
		L_158_.BulletsInReserve.Value = L_158_.BulletsInReserve.Value - L_162_
	end
	game.ReplicatedStorage.GunEvent.GunReload:FireServer(L_29_)
end
function L(L_164_arg1)
	if (L_59_ == nil) then
		return
	end
	if (L_59_:FindFirstChild("Handle") == nil) then
		return
	end
	local L_165_ = Ub(L_61_) and Ub(L_61_):FindFirstChild(L_164_arg1)
	if (L_165_) then
		local L_166_ = L_165_:Clone()
		L_166_.Parent = vc():FindFirstChild("HumanoidRootPart")
		L_166_:Play()
		game.Debris:AddItem(L_166_, L_166_.TimeLength)
		if (game:GetService("SoundService").RespectFilteringEnabled) then
			game.ReplicatedStorage.GunEvent.GunRequestSound:FireServer(L_61_..L_165_.Name, true)
		end
		return L_166_
	end
	return nil
end
function kc(L_167_arg1, L_168_arg2, L_169_arg3, L_170_arg4)
	if (L_59_ == nil) then
		return
	end
	if (L_59_:FindFirstChild("Handle") == nil) then
		return
	end
	local L_171_ = nil
	local L_172_ = {}
	local L_173_ = L_59_.Handle:GetChildren()
	for L_174_forvar1 = 1, #L_173_ do
		local L_175_ = L_173_[L_174_forvar1]
		if (L_175_.Name == L_167_arg1) then
			L_172_[#L_172_ + 1] = L_175_
			if (not L_175_.Playing) then
				L_171_ = L_175_
			end
		end
	end
	if (L_171_ == nil and #L_172_ > 0) then
		L_171_ = L_172_[math.random(1, #L_172_)]
	end
	if (L_171_ ~= nil) then
		L_169_arg3 = L_169_arg3 and L_169_arg3 or 1.0
		L_170_arg4 = L_170_arg4 and L_170_arg4 or 1.0
		local L_176_ = L_171_:Clone()
		L_176_.Parent = vc().Head
		L_176_.PlaybackSpeed = L_171_.PlaybackSpeed * L_169_arg3
		L_176_.Volume = L_176_.Volume * L_170_arg4
		L_176_:Play()
		game:GetService("Debris"):AddItem(L_176_, L_176_.TimeLength)
		if (game:GetService("SoundService").RespectFilteringEnabled and L_167_arg1 ~= "FireSound") then
			game.ReplicatedStorage.GunEvent.GunRequestSound:FireServer(L_167_arg1)
		end
		return L_176_
	else
		return L(L_167_arg1)
	end
end
function i(L_177_arg1)
	if (L_59_ == nil) then
		return
	end
	if (L_59_:FindFirstChild("Handle") == nil) then
		return
	end
	local L_178_ = L_59_.Handle:FindFirstChild(L_177_arg1)
	if (L_178_ ~= nil) then
		L_178_:Stop()
	end
end
function lc()
	return game:GetService("Players").LocalPlayer
end
function vc()
	local L_179_ = lc()
	if (not L_179_) then
		return nil
	end
	return L_179_.Character
end
function L_57_()
	local L_180_ = vc()
	if (not L_180_) then
		return nil
	end
	return L_180_:FindFirstChild("HumanoidRootPart")
end
function xc()
	local L_181_ = vc()
	if (not L_181_) then
		return nil
	end
	return L_181_:WaitForChild("Humanoid", 60)
end
function Mb()
	if (script.DisabledGun.Value) then
		return false
	end
	return xc():GetState() == Enum.HumanoidStateType.FallingDown or xc():GetState() == Enum.HumanoidStateType.Climbing or xc():GetState() == Enum.HumanoidStateType.Ragdoll or xc():GetState() == Enum.HumanoidStateType.Jumping or xc():GetState() == Enum.HumanoidStateType.Freefall
end
function Ac()
	return script.Parent.CustomCamera
end
function g()
	return Ac().CurrentDirection.Value
end
function Qb()
	return game.Workspace.CurrentCamera
end
function L_76_()
	return game.Players.LocalPlayer:GetMouse()
end
function wc(L_182_arg1, L_183_arg2, L_184_arg3)
	L_184_arg3 = math.min(1, math.max(0, L_184_arg3))
	return L_182_arg1 + (L_183_arg2 - L_182_arg1) * L_184_arg3
end
function d(L_185_arg1)
	local L_186_ = script.Aimed.Value
	if (not script.DisabledGun.Value) then
		script.Aimed.Value = L_8_ and L_55_.Stats.Zoom.CanZoom.Value and not L_35_ and not L_48_
	end
	if (script.Spectating.Value ~= nil) then
		script.Aimed.Value = script.Spectating.Value.Aiming.Value
	end
	if (script.Aimed.Value ~= L_186_) then
		L_45_ = true
	end
	local L_187_ = L_55_.Stats.Zoom.AimSpeed.Value
	local L_188_ = Jb('AttachmentReticle')
	if (L_188_ and L_188_.Modifiers:FindFirstChild("AimSpeed")) then
		L_187_ = L_187_ * L_188_.Modifiers.AimSpeed.Value
	end
	local L_189_ = L_7_
	local L_190_ = -1
	if (not script.Aimed.Value or L_28_) then
		L_190_ = 1
	end
	L_189_ = L_189_ + (((1 / 10) * L_187_ * L_190_) * L_185_arg1)
	L_189_ = math.max(0, math.min(1, L_189_))
	L_7_ = L_189_
end
function e()
	local L_191_ = vc()
	if (L_191_ == nil) then
		return
	end
	local L_192_ = L_191_:FindFirstChild("Sound")
	if (L_192_ == nil) then
		return
	end
	local L_193_ = L_192_:FindFirstChild("LocalSound")
	if (L_193_ == nil) then
		return
	end
	if (Mb()) then
		return
	end
	local L_194_ = L_193_:FindFirstChild("FootStep")
	if (L_194_ == nil) then
		return
	end
	L_193_.FootStep.Value = true
end
function f()
	L_43_ = 1 / 20
end
local L_80_ = 0
local L_81_ = 0
local L_82_ = 0
local L_83_ = 0
local L_84_ = 0
local L_85_ = 0
local L_86_ = 0
local L_87_ = 0
local L_88_ = Vector3.new()
function fb(L_195_arg1)
	if (L_55_ == nil) then
		return
	end
	local L_196_ = vc():FindFirstChild("HumanoidRootPart")
	if (L_196_ == nil) then
		return
	end
	local L_197_ = vc():FindFirstChild("LowerTorso")
	if (not L_197_) then
		return
	end
	L_24_ = wc(L_24_, 0, 0.2)
	L_27_ = wc(L_27_, 0, 0.2)
	L_25_ = L_25_ - 0.2
	L_26_ = L_26_ + L_25_
	if (L_26_ < 0) then
		L_26_ = 0
		L_25_ = 0
	end
	L_43_ = L_43_ - (1 / 180)
	L_42_ = L_42_ + L_43_
	if (L_42_ < 0 or script.DisabledGun.Value) then
		L_43_ = 0
		L_42_ = 0
	end
	if (L_42_ > 1) then
		L_42_ = 1
	end
	L_82_ = wc(L_82_, 0, 0.15)
	L_83_ = wc(L_83_, 0, 0.15)
	local L_198_ = wc(1 / 256, 1 / 48, L_7_)
	L_82_ = L_82_ - math.rad(Ac().MouseDeltaX.Value) * L_198_
	L_83_ = L_83_ - math.rad(Ac().MouseDeltaY.Value) * L_198_
	L_84_ = wc(L_84_, L_82_, 0.3)
	L_85_ = wc(L_85_, L_83_, 0.3)
	if (L_35_) then
		L_34_ = 75
	elseif (L_48_) then
		L_34_ = wc(L_34_, 75, 0.1)
	else
		L_34_ = wc(L_34_, 0, 0.2)
	end
	if (L_58_ == nil or L_58_:FindFirstChild("HumanoidRootPart") == nil) then
		return
	end
	L_58_.HumanoidRootPart.Anchored = true
	L_58_.PrimaryPart = L_58_.HumanoidRootPart
	local L_199_ = 2
	L_80_ = L_80_ + (L_15_ * (L_20_ and 0 or 1))
	local L_200_ = math.cos(L_80_ / L_199_)
	local L_201_ = math.abs(math.sin(L_80_ / L_199_))
	L_16_ = L_200_
	L_17_ = L_201_
	local L_202_ = 0.9
	if ((L_87_ > L_202_ and L_200_ < L_202_) or (L_87_ < -L_202_ and L_200_ > -L_202_)) then
		e()
	end
	L_87_ = L_200_
	L_22_ = wc(L_22_, L_15_, 0.1)
	local L_203_ = wc(0.3, 0.06, 1.0 - L_7_)
	local L_204_ = L_203_ * L_22_ * L_33_
	L_16_ = L_16_ * L_204_
	L_17_ = L_17_ * L_204_
	local L_205_ = 1.0 - math.pow(1.0 - math.abs(L_17_), 2)
	local L_206_ = (L_196_.Position.Z - L_197_.Position.Z) * L_203_
	local L_207_ = Vector3.new(L_16_ * 0.88, (L_17_ * 0.7) - L_206_, 0)
	L_81_ = L_81_ + (L_11_ and 0.1 or 1)
	local L_208_ = L_41_ and 4.5 or 1
	L_18_ = math.cos((L_81_ / 240) * L_208_)
	L_19_ = math.cos((L_81_ / 120) * L_208_)
	L_207_ = L_207_ + Vector3.new(L_18_ * L_203_ * 0.05, L_19_ * L_203_ * 0.05, 0)
	local L_209_ = Vector3.new(-L_16_ * 0.7 + (L_18_ * L_203_ * 0.2), -L_17_ * 0.7 + (L_19_ * L_203_ * 0.2), 0)
	if (not script.DisabledGun.Value) then
		local L_220_ = L_209_.X * 0.1
		local L_221_ = L_209_.Y * 0.1
	end
	if (not L_38_ and not xc().Sit) then
		Ac().BobOffset.Value = Vector3.new(L_16_ * 3, L_17_ * 3, 0)
	else
		L_16_ = 0
		L_17_ = 0
		L_207_ = Vector3.new()
		Ac().BobOffset.Value = Vector3.new()
	end
	local L_210_ = Ac().Center.Value
	if (L_38_ or L_41_ or lc():WaitForChild("GunDrawDisabled").Value or L_72_ or L_34_ > 40) then
		L_210_ = L_210_ - Ac().CurrentDirection.Value * 32
	end
	L_210_ = L_210_ + Vector3.new(0, -L_42_, 0)
	local L_211_ = CFrame.new(L_210_) * CFrame.fromEulerAnglesYXZ(Ac().CameraPitch.Value + Ac().CameraPitch.Offset.Value - math.rad(L_34_), Ac().CameraYaw.Value + Ac().CameraYaw.Offset.Value, 0)
	L_211_ = L_211_ * CFrame.new(Ac().BobOffset.Value)
	L_58_.HumanoidRootPart.CFrame = L_211_
	local L_212_ = L_55_.Stats.Offset.Value
	local L_213_ = CFrame.new(L_212_ * Vector3.new(L_7_, L_7_, L_7_))
	local L_214_ = L_55_.Stats.Offset.ZoomOffset.Value
	local L_215_ = 1
	local L_216_ = Jb("AttachmentReticle")
	if (L_216_ and L_216_.Modifiers:FindFirstChild("ZoomOffset")) then
		L_214_ = L_216_.Modifiers.ZoomOffset.Value
	end
	if (L_216_ and L_216_.Modifiers:FindFirstChild("IdleMultiplier")) then
		L_215_ = wc(1, L_216_.Modifiers.IdleMultiplier.Value, 1.0 - L_7_)
	end
	L_213_ = L_213_ + Vector3.new(0, 0, -L_214_ * (1.0 - L_7_))
	L_213_ = L_213_ + Vector3.new(0, 0, L_24_ / 24 * wc(0.4, 1.0, L_7_))
	L_213_ = L_213_ * CFrame.fromEulerAnglesXYZ(-L_17_ * 0.25 + (L_24_ / 600), -L_16_ * 0.125, 0)
	L_213_ = L_213_ * CFrame.new(L_207_ * L_215_)
	L_213_ = L_213_ * CFrame.fromEulerAnglesYXZ(L_85_, L_84_, 0)
	L_58_.HumanoidRootPart.CFrame = L_58_.HumanoidRootPart.CFrame * L_213_ * L_64_
	local L_217_ = CFrame.new()
	for L_222_forvar1, L_223_forvar2 in pairs(L_58_:GetChildren()) do
		if (L_223_forvar2.Name == 'AttachmentWorldData') then
			local L_224_ = L_223_forvar2:FindFirstChild('AttachmentCamera')
			if (L_224_ and L_58_.Weapon:FindFirstChild("CAMERA")) then
				local L_225_ = L_58_.Weapon.CAMERA.CFrame
				local L_226_ = CFrame.new(L_224_.CFrame.Position)
				L_217_ = L_226_:toObjectSpace(L_225_)
			end
		end
	end
	local L_218_ = CFrame.new(L_217_.Position * Vector3.new(1.0 - L_7_, 1.0 - L_7_, 1.0 - L_7_))
	L_58_.HumanoidRootPart.CFrame = L_218_ * L_58_.HumanoidRootPart.CFrame
	if (L_23_) then
		local L_227_ = L_58_:FindFirstChild("CameraBone")
		local L_228_ = L_58_:FindFirstChild("HumanoidRootPart")
		if (L_227_ and L_228_) then
			local L_229_ = L_227_.CFrame
			local L_230_ = L_229_:toObjectSpace(L_228_.CFrame)
			local L_231_ = L_230_:toObjectSpace(L_23_)
			Ac().CameraOffsetMatrix.Value = L_231_
		elseif (not L_228_) then
			fc(L_56_, true)
		end
	else
		Ac().CameraOffsetMatrix.Value = CFrame.new()
	end
	local L_219_ = 128 / L_55_.Stats.Accuracy.Value
	L_219_ = L_219_ + (db() / L_55_.Stats.Accuracy.RunModifier.Value) * 24
	if (L_31_) then
		L_219_ = L_219_ / L_55_.Stats.Accuracy.CrouchModifier.Value
	end
	L_219_ = wc(L_219_ / L_55_.Stats.Accuracy.AimModifier.Value, L_219_, L_7_ * L_7_)
	L_219_ = L_219_ + L_24_
	L_86_ = wc(L_86_, L_219_, 0.1)
	L_41_ = L_7_ < 0.02 and wb()
	if (L_65_ ~= nil) then
		local L_232_ = L_86_ * 3
		L_65_.Center.Visible = (L_7_ > 0.1) or (L_38_ and not L_41_)
		L_65_.Scope.Visible = true
		L_65_.Scope.Position = UDim2.new(0.5, 0, 0.5, _G.IS_PLAYING_CONSOLE() and 0 or -18)
		local L_233_ = L_52_ + Ac().CurrentDirection.Value * 1024
		local L_234_ = Ray.new(L_52_, L_233_ - L_52_)
		local L_235_, L_236_, L_237_ = nil
		if (workspace:FindFirstChild("world_assets")) then
			L_235_, L_236_, L_237_ = workspace:FindPartOnRayWithWhitelist(L_234_, {
				workspace.Terrain,
				workspace:FindFirstChild("world_assets"):FindFirstChild("StaticObjects")
			})
		else
			L_235_, L_236_, L_237_ = workspace:FindPartOnRayWithIgnoreList(L_234_, {
				workspace.Terrain,
				vc(),
				Qb(),
				game.Workspace:FindFirstChild("IgnoreList")
			})
		end
		local L_238_ = Qb():WorldToScreenPoint(L_236_)
		local L_239_ = Qb():WorldToScreenPoint(L_233_)
		L_53_ = L_236_
		L_88_ = wc(L_88_, L_238_, 0.4)
		L_65_.ReticleOffset.Position = UDim2.new(0, L_88_.X, 0, L_88_.Y)
		L_65_.Center.Position = UDim2.new(0, L_239_.X - 1, 0, L_239_.Y)
		local L_240_ = wc((1 - L_7_) * 4, 12, Vector2.new(L_88_.X - L_239_.X, L_88_.Y - L_239_.Y).Magnitude / 32)
		L_65_.ReticleOffset.Size = UDim2.new(0, L_240_, 0, L_240_)
		L_65_.ReticleOffset.ImageTransparency = (L_38_ and 0 or 1) * (1.0 - L_7_)
		local L_241_ = wb() and math.max(0, math.min(1, (L_7_ - 0.001) * 5)) or 1
		L_65_.Scope.ImageTransparency = L_241_
		L_65_.Scope.Frame1.BackgroundTransparency = L_241_
		L_65_.Scope.Frame2.BackgroundTransparency = L_241_
		L_65_.Scope.Frame3.BackgroundTransparency = L_241_
		L_65_.Scope.Frame4.BackgroundTransparency = L_241_
		local L_242_ = L_65_:FindFirstChild("Center")
		if (L_242_ ~= nil) then
			L_242_.BottomHair.Position = UDim2.new(0.5, 0, 0.5, L_232_)
			L_242_.TopHair.Position = UDim2.new(0.5, 0, 0.5, -(L_232_ - 1))
			L_242_.LeftHair.Position = UDim2.new(0.5, -(L_232_ - 1), 0.5, 0)
			L_242_.RightHair.Position = UDim2.new(0.5, L_232_, 0.5, 0)
		end
	end
end
function Jb(L_243_arg1)
	local L_244_ = mc(L_56_)
	if (not L_244_) then
		return
	end
	local L_245_ = L_244_:FindFirstChild(L_243_arg1)
	if (not L_245_) then
		return
	end
	return L_245_.Value
end
function m()
	local L_246_ = mc(L_56_)
	if (not L_246_) then
		return {}
	end
	local L_247_ = {}
	for L_248_forvar1, L_249_forvar2 in pairs(L_246_:GetChildren()) do
		if (L_249_forvar2:IsA("ObjectValue") and L_249_forvar2.Value and string.find(L_249_forvar2.Name, "Attachment")) then
			L_247_[#L_247_ + 1] = L_249_forvar2.Value
		end
	end
	return L_247_
end
function r()
	if (script.Enabled.Value) then
		return
	end
	script.Enabled.Value = true
end
function y()
	if (not script.Enabled.Value) then
		return
	end
	script.Enabled.Value = false
end
function P()
	local L_250_ = 1.0
	local L_251_ = mc(L_56_)
	if (not L_251_) then
		return
	end
	if (L_251_.BulletsInReserve.Value > 0 and L_251_.BulletsInMagazine.Value < L_55_.Stats.MagazineCapacity.Value and not L_51_) then
		if (L_55_.Stats.NeedsAmmo:FindFirstChild("RequiresManualRechamber") and L_55_.Stats.NeedsAmmo.RequiresManualRechamber.Value) then
			if (L_251_.BulletsInMagazine.Value == 0) then
				L_50_ = true
			end
		end
		local L_252_ = L_55_.Stats.NeedsAmmo:FindFirstChild("ReloadSingularBullet")
		if (not L_252_ or not L_252_.Value) then
			if (L_251_.BulletsInMagazine.Value == 0 and L_55_.Animations:FindFirstChild("ReloadEmpty") ~= nil) then
				oc("ReloadEmpty", false, 0.0, L_250_)
				kc("ReloadEmptySound", false, L_250_)
			else
				oc("Reload", false, 0.0, L_250_)
				kc("ReloadSound", false, L_250_)
			end
			if (not string.find(L_61_, "Reload")) then
				L_28_ = true
				ab()
				oc("Idle")
				L_28_ = false
				jb()
				return false
			end
		else
			L_29_ = true
			if (L_28_) then
				oc("ReloadLoop", true, 0.1, L_250_)
				L_60_.Looped = false
				kc("ReloadLoop", false, L_250_)
			else
				oc("ReloadStart", false, 0.1, L_250_)
				kc("ReloadStart", false, L_250_)
			end
		end
		return true
	else
		if (L_29_) then
			L_60_:Stop()
			oc("ReloadEnd", true, 0.1, L_250_)
			kc("ReloadEnd", false, L_250_)
		end
		jb()
	end
	return false
end
function N()
	if (not L_28_ and L_55_ ~= nil) then
		if (script.Configuration.CanRunWhileReloading.CancelRunOnReload.Value) then
			L_32_ = false
		end
		L_29_ = false
		if (P()) then
			L_28_ = true
		end
	end
end
function J()
	if (not L_28_) then
		return
	end
	L_28_ = false
	L_29_ = false
	i("ReloadSound")
	oc("Idle", true)
end
function Nb(L_253_arg1)
	if (cc() ~= vc()) then
		return
	end
	if (script.DisabledGun.Value) then
		return
	end
	if (Ac().ForceFreeMouse.Value) then
		return
	end
	if (L_253_arg1 == 0) then
		L_9_ = true
	end
	if (L_253_arg1 == 1) then
		L_8_ = true
	end
end
function Pb(L_254_arg1)
	if (cc() ~= vc()) then
		return
	end
	if (script.DisabledGun.Value) then
		return
	end
	local L_255_ = mc(L_56_)
	if (not L_255_) then
		return
	end
	if (L_254_arg1 == 0) then
		L_9_ = false
		local L_256_ = script.Configuration.AutoReload.Value
		if (L_55_ ~= nil and L_255_.BulletsInMagazine.Value == 0 and L_256_) then
			N()
		end
	end
	if (L_254_arg1 == 1) then
		L_8_ = false
	end
end
function bc(L_257_arg1, L_258_arg2)
	if (cc() ~= vc()) then
		return
	end
	if (script.DisabledGun.Value) then
		return
	end
	if (not L_257_arg1) then
		return
	end
	local L_259_ = L_257_arg1.KeyCode
	if (lc().PlayerGui:FindFirstChild("PauseGui") ~= nil) then
		return
	end
	if (Ac().ForceFreeMouse.Value) then
		return
	end
	if (L_259_ == Enum.KeyCode.Unknown) then
		return
	end
	local L_260_ = L_4_.Spectator.Spectating.Value and true or false
	if (script.Enabled.Value and L_259_ == Enum.KeyCode.LeftShift and not L_260_) then
		if (L_55_ ~= nil) then
			local L_261_ = wb()
			if ((L_261_ and not L_8_) or not L_261_) then
				L_8_ = false
				L_31_ = false
			end
		end
		L_11_ = true
		L_32_ = true
		script.Events.OnPlayerRequestSprinting:Fire()
		if (L_32_ and script.Configuration.CanRunWhileReloading.CancelReloadOnRun.Value) then
			J()
		end
	end
	if (not L_258_arg2) then
		if (L_259_ == Enum.KeyCode.P) then
			r()
		end
		if (L_259_ == Enum.KeyCode.L and script.Configuration.UserCanDisable.Value) then
			y()
		end
		if (L_259_ == Enum.KeyCode.V and script.Configuration.AllowThirdPerson.Value and script.Enabled.Value) then
			L_38_ = not L_38_
		end
		if (script.Enabled.Value and not L_260_) then
			if (L_259_ == Enum.KeyCode.LeftControl) then
				L_31_ = true
			end
			if (L_259_ == Enum.KeyCode.C) then
				L_31_ = not L_31_
			end
			if (L_259_ == Enum.KeyCode.R) then
				N()
			end
		end
	end
	if (L_259_ == Enum.KeyCode.W) then
		L_10_ = true
	end
end
function Sb(L_262_arg1, L_263_arg2)
	if (cc() ~= vc()) then
		return
	end
	if (L_4_.Spectator.Spectating.Value) then
		return false
	end
	if (script.DisabledGun.Value) then
		return
	end
	if (L_262_arg1.KeyCode == Enum.KeyCode.Space) then
		L_12_ = true
	end
	local L_264_ = L_262_arg1.KeyCode
	if (L_264_ == Enum.KeyCode.W) then
		L_10_ = false
	end
	if (L_263_arg2) then
		return
	end
	if (L_264_ == Enum.KeyCode.Unknown) then
		return
	end
	if (L_264_ == Enum.KeyCode.LeftShift) then
		L_11_ = false
	end
	if (L_264_ == Enum.KeyCode.LeftControl) then
		L_31_ = false
	end
end
function n()
	script.Died.Value = true
	L_41_ = false
	L_7_ = 1
	Ac().CameraOffset.Value = 0
	Ac().CameraPitch.Value = 0
	D()
	pcall(function()
		if (L_65_ ~= nil) then
			L_65_.Scope.Visible = false
		end
	end)
end
local L_89_ = nil
function A()
	if (not script.Enabled.Value) then
		return
	end
	L_66_ = 0
	xc().Died:Connect(n)
	Ac().CameraOffset.Value = 0
	Ac().CameraOffset.CanZoom.Value = false
	Ac().CameraPitch.Maximum.Value = math.pi / 2 - 0.1
	Ac().CameraPitch.Minimum.Value = -math.pi / 2 + 0.1
	Ac().CameraPitch.Value = 0
	Ac().CameraYaw.Offset.Value = 0
	Ac().CameraPitch.Offset.Value = 0
	Ac().Enabled.Value = true
	if (L_58_) then
		L_58_:Destroy()
	end
	L_55_ = nil
	L_58_ = nil
	L_56_ = 1
	L_45_ = true
	L_7_ = 0
	L_8_ = false
	fc(1, true)
	L_31_ = false
	xc().AutoRotate = false
	L_12_ = true
	if (L_89_ ~= nil) then
		L_89_:Disconnect()
	end
	L_89_ = xc().Changed:connect(function(L_265_arg1)
		if (L_265_arg1 == "Jump" or L_265_arg1 == "JumpReplicate") then
			if (xc().Jump) then
				local L_266_ = L_39_ > 0 and L_46_ <= 0 or L_31_ or (not L_12_ and not script.Configuration.AllowAutoJump.Value)
				if (L_266_) then
					L_39_ = 3
					xc().Jump = false
					L_31_ = false
				else
					L_46_ = L_46_ - 0.5
				end
				if (L_265_arg1 == "JumpReplicate") then
					L_12_ = false
				end
			else
				L_12_ = false
			end
		end
	end)
	if (L_44_ ~= nil) then
		L_44_:Disconnect()
		L_44_ = nil
	end
	L_44_ = xc().StateChanged:Connect(function(L_267_arg1, L_268_arg2)
		if (L_268_arg2 == Enum.HumanoidStateType.Freefall) then
			L_20_ = true
		end
		if (L_267_arg1 == Enum.HumanoidStateType.Freefall and L_268_arg2 ~= Enum.HumanoidStateType.Freefall) then
			L_20_ = false
			f()
		end
	end)
	script.Events.OnRespawn:Fire()
end
function z(L_269_arg1)
	if (L_269_arg1 == nil) then
		L_269_arg1 = L_56_
	end
	local L_270_ = mc(L_269_arg1)
	if (L_270_ == nil) then
		return false
	end
	if (not script.CanShoot.Value or script.DisabledGun.Value) then
		return false
	end
	local L_271_ = L_270_.BulletsInMagazine.Value
	if (L_269_arg1 == L_56_) then
		L_271_ = L_270_.BulletsInMagazine.Value
	end
	if (L_271_ <= 0 and L_270_.Value.Stats.NeedsAmmo.Value) then
		return false
	end
	if (game.Workspace.DistributedGameTime - L_30_ < 0) then
		return false
	end
	if (L_59_ == nil) then
		return false
	end
	return true
end
function v(L_272_arg1)
	L_272_arg1 = L_272_arg1 or false
	L_37_ = 15
	if (L_272_arg1) then
		script.Data.Headshot:Play()
	else
		script.Data.Hitmarker:Play()
	end
end
function wb()
	if (L_55_.Stats.Scoped.Value) then
		return true
	end
	local L_273_ = Jb('AttachmentReticle')
	if (L_273_ and L_273_.Modifiers:FindFirstChild("Scoped") and L_273_.Modifiers.Scoped.Value) then
		return true
	end
	return false
end
function w()
	local L_274_ = (L_55_.Stats:FindFirstChild("Special") and L_55_.Stats.Special.Value) and true or false
	if (L_274_) then
		return "Special"
	end
	local L_275_ = script.Events.IsAimed:Invoke()
	local L_276_ = Jb("AttachmentReticle")
	if (L_275_ and L_276_) then
		local L_277_ = Ub("Shoot"..L_276_.AttachmentType.Value)
		if (L_277_) then
			return L_277_.Name
		end
	end
	return "Shoot"
end
function t()
	L_32_ = false
	if (L_61_ == "ReloadEnd") then
		return
	end
	if (L_29_ and L_40_) then
		L_51_ = true
		return
	end
	if (L_40_) then
		return
	end
	if (not L_40_ and L_50_) then
		if (L_28_) then
			L_51_ = true
		else
			F()
		end
		return
	end
	local L_278_ = mc(L_56_)
	if (not L_278_) then
		return
	end
	if (L_278_.Rechambering.Value) then
		L_50_ = true
		return
	end
	local L_279_ = 1.0
	local L_280_ = L_55_.Stats.RPM.Value * L_279_
	L_30_ = game.Workspace.DistributedGameTime + (1.0 / (L_280_ / 60))
	local L_281_ = L_55_.Stats:FindFirstChild("NeedsAmmo") and L_55_.Stats:FindFirstChild("NeedsAmmo").Value
	if (L_281_) then
		L_278_.BulletsInMagazine.Value = L_278_.BulletsInMagazine.Value - 1
	end
	if (not L_55_.Stats.Auto.Value) then
		L_9_ = false
	end
	local L_282_ = 0
	for L_291_forvar1, L_292_forvar2 in pairs(L_55_.Stats:GetDescendants()) do
		L_282_ = L_282_ + x(L_292_forvar2)
	end
	oc(w(), true, 0.0, L_279_, false)
	if (L_55_.Stats:FindFirstChild("NeedsAmmo")) then
		if (L_55_.Stats.NeedsAmmo:FindFirstChild("RequiresManualRechamber") and L_55_.Stats.NeedsAmmo.RequiresManualRechamber.Value) then
			L_50_ = true
		end
	end
	local L_283_ = m()
	local L_284_ = nil
	local L_285_ = true
	for L_293_forvar1, L_294_forvar2 in pairs(L_283_) do
		local L_295_ = L_294_forvar2.Modifiers:FindFirstChild("ShootSound")
		if (L_295_) then
			L_284_ = L_295_
		end
		local L_296_ = L_294_forvar2.Modifiers:FindFirstChild("MuzzleFlash")
		if (L_296_ and not L_296_.Value) then
			L_285_ = false
		end
	end
	if (not L_284_) then
		kc("FireSound", false, L_279_)
	else
		local L_297_ = L_284_:Clone()
		L_297_.Parent = vc().Head
		L_297_:Play()
		game:GetService("Debris"):AddItem(L_297_, L_297_.TimeLength)
		kc("FireSound", false, L_279_, 0.1)
	end
	L_24_ = L_55_.Stats.Recoil.Value * 20
	L_25_ = L_55_.Stats.Recoil.Value * wc(0.9, 1.1, math.random())
	L_27_ = L_27_ + ((math.random() - math.random()) * ((L_55_.Stats.Recoil.Value) * 0.33))
	if (L_58_:FindFirstChild("Weapon") and L_285_) then
		_G.muzzleFlash(lc(), (L_38_ and L_59_ or L_58_.Weapon):FindFirstChild("Main"), true)
	end
	local L_286_ = L_55_.Stats.Pellets.Value
	local L_287_ = L_55_.Stats.Accuracy.Value
	if (L_31_) then
		L_287_ = L_287_ * L_55_.Stats.Accuracy.CrouchModifier.Value
	end
	if (L_14_ > 0.1) then
		L_287_ = L_287_ * L_55_.Stats.Accuracy.RunModifier.Value
	end
	if (Mb()) then
		local L_298_ = L_55_.Stats.Accuracy:FindFirstChild("JumpModifier")
		if (L_298_ ~= nil) then
			L_287_ = L_287_ * L_298_.Value
		else
			L_287_ = L_287_ * 0.25
		end
	end
	local L_288_ = 1.0 - L_7_
	local L_289_ = 1.0 - math.pow(L_288_, 14)
	L_287_ = L_287_ * wc(L_55_.Stats.Accuracy.AimModifier.Value, 1, L_289_)
	if (L_7_ > 0.7) then
		L_287_ = L_287_
	end
	local L_290_ = (L_55_.Stats:FindFirstChild("Special") and L_55_.Stats.Special.Value) and true or false
	if (L_55_.Stats:FindFirstChild("Melee") and L_55_.Stats:FindFirstChild("Melee").Value) then
		local L_299_ = Instance.new("BindableEvent")
		L_299_.Event:Connect(function()
			wait(0.1)
			local L_300_ = require(game.ReplicatedStorage.Library:WaitForChild("MeleeModule"))
			local L_301_, L_302_, L_303_, L_304_, L_305_, L_306_ = L_300_:TestMelee(game.Players.LocalPlayer, L_55_)
			if (L_302_) then
				game.ReplicatedStorage.GunEvent["GunMelee"]:FireServer(L_301_, L_302_, L_303_, L_304_, L_305_, L_306_)
			end
		end)
		L_299_:Fire()
		L_299_:Destroy()
	else
		local L_307_ = L_69_
		L_69_ = L_69_ + 1
		game.ReplicatedStorage.GunEvent.GunFire:FireServer(L_307_, L_52_, Ac().CurrentDirection.Value, L_287_, L_56_, L_55_, L_55_.Stats.RPM.Value, not L_38_, L_282_)
		local L_308_ = (L_55_.Stats.BulletSettings:FindFirstChild("ServerSided") and L_55_.Stats.BulletSettings:FindFirstChild("ServerSided").Value)
		if (not L_308_ and not L_290_) then
			local L_309_ = Random.new(L_307_)
			for L_310_forvar1 = 1, L_286_ do
				local L_311_ = L_55_.Stats.BulletSettings.MaxDistance.Value
				local L_312_ = (L_309_:NextNumber() - L_309_:NextNumber()) / L_287_
				local L_313_ = (L_309_:NextNumber() - L_309_:NextNumber()) / L_287_
				local L_314_ = (L_309_:NextNumber() - L_309_:NextNumber()) / L_287_
				local L_315_ = g() + Vector3.new(L_312_, L_313_, L_314_)
				local L_316_ = L_52_
				local L_317_ = L_315_ * L_311_
				local L_318_ = require(game.ReplicatedStorage.Library.BulletModule)
				local L_319_ = Instance.new("BindableEvent")
				L_319_.Event:Connect(function()
					local L_320_, L_321_, L_322_, L_323_, L_324_, L_325_ = L_318_:BulletSimulation(lc(), L_316_, L_315_, L_55_, false)
					local L_326_ = L_322_ and L_322_.Position or nil
					game.ReplicatedStorage.GunEvent.BulletHole:FireServer(L_307_, L_316_ + L_317_, L_322_, L_323_, L_324_, L_325_, L_326_)
				end)
				L_319_:Fire()
				L_319_:Destroy()
			end
		end
	end
end
function cc()
	local L_327_ = vc()
	if (script.Spectating.Value ~= nil) then
		local L_328_ = script.Spectating.Value.Character
		if (L_328_ ~= nil) then
			L_327_ = L_328_
		end
	end
	return L_327_
end
function vb()
	if (script.Spectating.Value ~= nil) then
		return script.Spectating.Value
	end
	return lc()
end
local L_90_ = false
function O()
	if (script.Enabled.Value) then
		L_90_ = true
		script.DisabledGun.Value = false
		L_12_ = true
		A()
	else
		if (L_90_) then
			if (L_58_ ~= nil) then
				L_58_:Destroy()
			end
			if (L_59_ ~= nil) then
				L_59_:Destroy()
			end
			if (L_65_) then
				L_65_:Destroy()
				L_65_ = nil
			end
			script.CurrentWeapon.Value = nil
			Ac().Enabled.Value = false
		end
		while (xc() == nil) do
			wait(0.1)
		end
		xc().AutoRotate = true
		L_90_ = false
	end
end
local L_91_ = lc().Team
local L_92_ = 0
function u(L_329_arg1)
	local L_330_ = L_329_arg1 * 60
	L_21_ = L_21_ + L_330_
	L_37_ = L_37_ - L_330_
	L_39_ = L_39_ - L_330_
	if (not L_73_) then
		return
	end
	if (not script.Enabled.Value) then
		return
	end
	if (xc() == nil or xc().Health <= 0) then
		return
	end
	L_59_ = vc():FindFirstChild("WorldModel")
	L_46_ = math.min(1, math.max(-1, L_46_ + L_329_arg1 * 1.2))
	if (not xc().Sit) then
		xc().JumpPower = wc(18, 25, L_46_ * 1.3)
	end
	local L_331_ = mc(L_56_)
	if (L_331_ ~= nil and L_331_.Value ~= L_55_) then
		print("Server sided inventory is not the same!")
		fc(L_56_, true)
	elseif (L_331_ == nil) then
		fc(1, true)
	end
	if (tick() - L_92_ > 1) then
		L_92_ = tick()
		L_66_ = L_66_ + L_330_
	end
	if (L_35_ or L_48_) then
		return
	end
	if (vc():FindFirstChild("HumanoidRootPart") == nil) then
		return
	end
	if (not L_65_ or not L_65_.Parent) then
		L_65_ = script.Data.Crosshair:Clone()
		L_65_.Parent = lc().PlayerGui
	else
		L_65_.Hitmarker.Visible = L_37_ > 0
		L_65_.Enabled = script.Enabled.Value
	end
	if (L_45_ or tick() - L_67_ > 0.1) then
		L_67_ = tick()
		L_45_ = false
		game.ReplicatedStorage.GunEvent.ClientUpdate:FireServer(L_56_, script.Aimed.Value, L_32_, xc().JumpPower, Qb().CFrame, L_73_ ~= nil, L_75_["Temp1"] == L_75_["Temp2"])
		if (xc().JumpPower > 30) then
			xc().JumpPower = 30
		end
	end
	if (lc().Team ~= L_91_) then
		L_91_ = lc().Team
		if (game.Teams:FindFirstChild('Spectator') and L_91_ == game.Teams.Spectator) then
			script.Enabled.Value = false
			script.Enabled.Value = true
			return
		end
		if (L_55_ ~= nil and L_55_:FindFirstChild("ViewModel") ~= nil) then
			fc(L_56_)
		else
			fc(1)
		end
	end
	if (L_55_ == nil or #L_55_:GetChildren() == 0) then
		return
	end
	if (L_9_) then
		if (z()) then
			if (not L_28_ or (L_28_ and L_29_)) then
				t()
			end
		else
			local L_337_ = mc(L_56_)
			if (not L_337_) then
				return
			end
			if (L_337_.BulletsInMagazine.Value == 0 and L_59_ ~= nil and L_55_.Stats.NeedsAmmo.Value) then
				kc("DrySound")
				L_9_ = false
			end
		end
		script.Events.OnPlayerRequestShoot:Fire()
	end
	if ((L_31_ or not L_10_ or L_41_) and not Mb()) then
		L_32_ = false
	end
	L_33_ = 1.0
	local L_332_ = L_32_
	local L_333_ = not script.Configuration.CanRunWhileReloading.Value and L_28_
	if (L_32_ and not L_333_ and not script.Aimed.Value and L_34_ < 1) then
		L_33_ = L_33_ * script.Configuration.BaseWalkSpeed.SprintModifier.Value
	end
	if (vc():FindFirstChild("Animate") ~= nil) then
		if (vc().Animate:FindFirstChild("Crouch") ~= nil) then
			vc().Animate.Crouch.Value = L_31_
			if (L_31_) then
				L_33_ = L_33_ * script.Configuration.BaseWalkSpeed.CrouchModifier.Value
			end
		end
	end
	local L_334_ = 1
	if (L_55_ ~= nil and L_55_.Stats:FindFirstChild("SpeedMultiplier") ~= nil) then
		L_334_ = L_55_.Stats.SpeedMultiplier.Value
	end
	local L_335_ = xc()
	if (L_335_ ~= nil) then
		local L_338_ = L_335_:FindFirstChild("CanMove")
		if ((L_338_ ~= nil and L_338_.Value) or L_338_ == nil) then
			local L_339_ = wc(0.5, 1.0, L_46_ + 1.0)
			local L_340_ = script.Configuration.BaseWalkSpeed.Value
			local L_341_ = script.Configuration.BaseWalkSpeed.AimModifier.Value
			local L_342_ = L_340_ * wc(1, L_341_, (1.0 - L_7_) * (L_20_ and 0 or 1))
			L_335_.WalkSpeed = L_342_ * L_33_ * L_339_ * L_334_
		end
	end
	local L_336_ = vc():FindFirstChild("Animate")
	if (L_336_ and L_336_:FindFirstChild("Pitch") and L_336_:FindFirstChild("Yaw") and L_336_:FindFirstChild("GunType")) then
		L_336_.Pitch.Value = math.deg(Ac().GetPitch:Invoke())
		L_336_.Yaw.Value = math.deg(Ac().GetYaw:Invoke())
		L_336_.GunType.Value = L_55_.Stats.HoldAnimation.Value
		if (script.Aimed.Value) then
			L_336_.GunType.Value = L_336_.GunType.Value.."Aim"
		end
	end
	if (not L_59_ or not L_59_.Parent) then
		L_59_ = vc():FindFirstChild("WorldModel")
	end
	if (L_34_ < 40 and L_70_) then
		L_70_ = false
		local L_343_ = kc("Initial")
		if (L_343_) then
			L_343_.Parent = L_58_.HumanoidRootPart
		end
	end
	script.Events.OnStep:Fire(L_329_arg1)
end
local L_93_ = 0
function db()
	return math.max(L_14_, L_93_)
end
function kb(L_344_arg1, L_345_arg2)
	if (L_344_arg1 == nil) then
		return
	end
	if (L_344_arg1:IsA("BasePart")) then
		L_344_arg1.LocalTransparencyModifier = L_345_arg2
	end
	local L_346_ = L_344_arg1:GetChildren()
	for L_347_forvar1 = 1, #L_346_ do
		local L_348_ = L_346_[L_347_forvar1]
		local L_349_ = false
		kb(L_348_, L_345_arg2)
	end
end
local L_94_ = 0
local L_95_ = 0
local L_96_ = nil
local L_97_ = nil
function c(L_350_arg1)
	if (L_96_ ~= nil) then
		L_96_:Disconnect()
	end
	if (L_97_ ~= nil) then
		L_97_:Disconnect()
	end
	if (L_350_arg1 == lc()) then
		return
	end
	L_96_ = L_350_arg1.CurrentSelected.Changed:Connect(function(L_351_arg1)
		fc(L_351_arg1, true)
	end)
	L_97_ = L_350_arg1.Character.ChildAdded:Connect(function(L_352_arg1)
		kb(L_352_arg1, 0.0)
	end)
end
function q(L_353_arg1)
	L_73_ = workspace.CurrentCamera.CFrame
end
function p(L_354_arg1)
	L_74_ = workspace.CurrentCamera.CFrame
	L_75_["Temp1"] = L_73_
	L_75_["Temp2"] = L_74_
end
function o(L_355_arg1)
	local L_356_ = L_355_arg1 * 60
	if (not script.Enabled.Value) then
		return
	end
	if (vc():FindFirstChild("HumanoidRootPart") == nil or xc() == nil or xc().Health <= 0) then
		return
	end
	if (L_55_ == nil or #L_55_:GetChildren() == 0) then
		return
	end
	local L_357_ = L_55_.Stats.Zoom.SensitivityMultiplier.Value
	local L_358_ = Jb('AttachmentReticle')
	if (L_358_ and L_358_.Modifiers:FindFirstChild("SensitivityMultiplier")) then
		L_357_ = L_357_ * L_358_.Modifiers.SensitivityMultiplier.Value
	end
	Ac().Enabled.Value = true
	Ac().MouseLookEnabled.Value = true
	local L_359_ = wc(script.Configuration.AimedSensitivityMultiplier.Value * L_357_, 1, L_7_)
	Ac().Sensitivity.Value = script.Configuration.Sensitivity.Value / L_359_
	local L_360_ = cc()
	if (L_360_:FindFirstChild("Head") ~= nil) then
		L_47_ = Ac().CameraOffset.Value < 1 and (Ac().CurrentPosition.Value - L_360_.Head.Position).magnitude < 8
		if (L_360_ ~= L_49_) then
			c(vb())
		end
		if (L_47_) then
			kb(cc(), 1.0)
		else
			kb(cc(), 0.0)
		end
	end
	local L_361_ = L_32_
	if (script.Spectating.Value ~= nil) then
		L_361_ = script.Spectating.Value.Running.Value
	end
	if (script.DisabledGun.Value and L_361_) then
		L_14_ = 0.32
	end
	local L_362_ = nil
	if (L_361_ and not L_28_ and not L_40_ and not script.Aimed.Value and not Mb() and L_34_ < 1 and db() > 0.25) then
		L_362_ = true
	end
	if (L_61_ == "Run") then
		if (not L_361_ or script.Aimed.Value or Mb() or db() <= 0.02) then
			L_362_ = false
		end
	end
	if (not cb(L_61_)) then
		L_362_ = nil
	end
	if (L_362_ ~= nil) then
		oc(L_362_ and "Run" or "Idle", false, 0.2)
	end
	d(L_356_)
	if (L_55_ ~= nil and L_55_:FindFirstChild("Stats") ~= nil and xc().Health > 0) then
		local L_363_ = script.Configuration.HeightStandOffset.Value
		local L_364_ = script.Configuration.HeightCroughOffset.Value
		local L_365_ = L_31_ and L_364_ or L_363_
		if (L_36_ == -1) then
			L_36_ = L_365_
		end
		L_36_ = wc(L_36_, L_365_, 0.15)
		local L_366_ = 0
		local L_367_ = xc().Sit and 12 or 3.5
		if (L_38_) then
			if (wb()) then
				L_366_ = wc(0, L_367_, L_7_)
			else
				L_366_ = L_367_
			end
		end
		Ac().CameraOffset.Value = L_366_
		Ac().CameraPitch.Offset.Value = 0
		local L_368_ = cc()
		if (not script.DisabledGun.Value) then
			local L_374_ = L_368_:FindFirstChild("HumanoidRootPart")
			if (L_374_ ~= nil) then
				local L_376_ = L_374_.Position
				L_52_ = L_376_ + Vector3.new(0, L_36_ - L_42_ * 2, 0)
			end
			if (not L_38_) then
				Ac().Center.Value = L_52_
			else
				local L_377_ = wc(0.75, 1, L_7_)
				if (wb()) then
					L_377_ = wc(0, 1, L_7_)
				end
				L_377_ = L_377_ * 1.5
				local L_378_ = -Ac().CameraYaw.Value
				Ac().Center.Value = L_52_ + Vector3.new(math.cos(L_378_) * L_377_, L_377_ * 0.7, math.sin(L_378_) * L_377_)
			end
			local L_375_ = _G.IS_PLAYING_CONSOLE() and 0.5 or 1.0
			Ac().CameraPitch.Value = Ac().CameraPitch.Value + math.rad(L_25_ * L_375_ * wc(L_7_, 1.0, 0.75))
			Ac().CameraYaw.Value = Ac().CameraYaw.Value + math.rad(L_27_ * L_375_ * wc(L_7_, 1.0, 0.4))
		end
		local L_369_ = 1.0 - math.pow(1.0 - L_7_, 2.5)
		local L_370_ = L_55_.Stats.Zoom.Value
		local L_371_ = Jb('AttachmentReticle')
		if (L_371_ and L_371_.Modifiers:FindFirstChild("FOV")) then
			L_370_ = L_371_.Modifiers:FindFirstChild("FOV").Value
		end
		local L_372_ = 1
		if (L_371_ and L_371_.Modifiers:FindFirstChild("FOVMultiplier")) then
			L_372_ = mc(L_56_).AttachmentReticle.Value.Modifiers.FOVMultiplier.Value
		end
		Ac().CameraFOV.Value = wc(L_370_ * L_372_, 65, L_369_)
		L_93_ = L_14_
		L_14_ = (Ac().Center.Value - L_13_).Magnitude
		local L_373_ = Ac().Center.Value - L_13_
		L_373_ = L_373_ - Vector3.new(0, L_373_.Y, 0)
		L_15_ = (L_373_).Magnitude
		L_13_ = Ac().Center.Value
		if (L_368_ == vc()) then
			if (not xc().Sit and script.RotateCharacter.Value) then
				local L_379_ = CFrame.fromEulerAnglesXYZ(0, Ac().CameraYaw.Value, 0)
				vc().HumanoidRootPart.CFrame = CFrame.new(vc().HumanoidRootPart.CFrame.p) * L_379_
			end
			L_49_ = nil
		else
			local L_380_ = Ac()
			local L_381_ = vb().CameraYaw.Value
			local L_382_ = vb().CameraPitch.Value
			L_94_ = L_94_ + (L_381_ - L_94_) * 0.4
			L_95_ = L_95_ + (L_382_ - L_95_) * 0.4
			L_380_.CameraYaw.Value = L_94_
			L_380_.CameraPitch.Value = L_95_
			L_380_.CameraYaw.Offset.Value = 0
			L_380_.CameraPitch.Offset.Value = 0
			L_49_ = L_368_
		end
	end
	fb(L_356_)
	script.Events.OnRender:Fire(L_355_arg1)
end
function s()
	print("Starting Gun System")
	game.ReplicatedStorage:WaitForChild("GunData", 600)
	lc().CharacterAdded:connect(function(L_383_arg1)
		local L_384_ = L_383_arg1:WaitForChild("Humanoid", 1)
		A()
		local L_385_ = xc():FindFirstChild("CanMove")
		if (L_385_ == nil) then
			local L_386_ = Instance.new("BoolValue")
			L_386_.Value = true
			L_386_.Name = "CanMove"
			L_386_.Parent = xc()
		end
	end)
	script.Enabled.Changed:connect(O)
	O()
	if (script.Configuration.AutoEnable.Value) then
		script.Enabled.Value = true
	end
	game:GetService("UserInputService").InputBegan:Connect(function(L_387_arg1, L_388_arg2)
		if (L_3_.MouseBehavior ~= Enum.MouseBehavior.LockCenter) then
			return
		end
		if L_387_arg1.UserInputType == Enum.UserInputType.MouseButton1 then
			Nb(0)
		end
		if L_387_arg1.UserInputType == Enum.UserInputType.MouseButton2 then
			Nb(1)
		end
	end)
	game:GetService("UserInputService").InputEnded:Connect(function(L_389_arg1, L_390_arg2)
		if L_389_arg1.UserInputType == Enum.UserInputType.MouseButton1 then
			Pb(0)
		end
		if L_389_arg1.UserInputType == Enum.UserInputType.MouseButton2 then
			Pb(1)
		end
	end)
	L_3_.InputBegan:connect(bc)
	L_3_.InputEnded:connect(Sb)
	game:GetService("RunService"):BindToRenderStep("GunRendering1", Enum.RenderPriority.Camera.Value - 1024, o)
	game:GetService("RunService"):BindToRenderStep("GunRendering2", Enum.RenderPriority.Camera.Value, q)
	game:GetService("RunService"):BindToRenderStep("GunRendering3", Enum.RenderPriority.Camera.Value + math.huge, p)
	game:GetService("RunService").Heartbeat:Connect(u)
	while (not vc()) do
		wait()
	end
	wait(0.5)
	L_76_ = true
	print("Gun System started")
end
s()
script.Events.Ready.OnInvoke = function()
	if (cc() ~= vc()) then
		return false
	end
	if (L_4_.Spectator.Spectating.Value) then
		return false
	end
	if (script:FindFirstChild("DisabledGun") ~= nil and script.DisabledGun.Value) then
		return false
	end
	if (not script.Enabled.Value) then
		return false
	end
	return true
end
script.Events.CanShootGun.OnInvoke = function(L_391_arg1)
	return z(L_391_arg1)
end
script.Events.GetCurrentGunSlot.OnInvoke = function()
	return L_56_
end
script.Events.GetCurrentInventoryData.OnInvoke = function()
	return mc(L_56_)
end
script.Events.GetCurrentGunData.OnInvoke = function()
	return L_55_
end
script.Events.GetGunAnimation.OnInvoke = function()
	return L_60_
end
script.Events.GetWorldLookAtPos.OnInvoke = function()
	return L_53_
end
script.Events.GetGunAnimationName.OnInvoke = function()
	return L_61_
end
script.Events.SetAimed.Event:Connect(function(L_392_arg1)
	L_8_ = L_392_arg1 == true
end)
script.Events.SetSprinting.Event:Connect(function(L_393_arg1)
	L_393_arg1 = L_393_arg1 == true
	L_10_ = L_393_arg1
	L_32_ = L_393_arg1
end)
script.Events.GetSpeed.OnInvoke = function()
	return L_14_
end
script.Events.IsMobile.OnInvoke = function()
	return script:WaitForChild("Mobile").Value
end
script.Events.GetAimTween.OnInvoke = function()
	return 1.0 - L_7_
end
script.Events.IsJumping.OnInvoke = function()
	return Mb()
end
script.Events.IsThirdPerson.OnInvoke = function()
	return L_38_
end
script.Events.IsSprinting.OnInvoke = function()
	return L_32_
end
script.Events.IsReloading.OnInvoke = function()
	return L_28_
end
script.Events.IsAimed.OnInvoke = function()
	return L_8_
end
script.Events.PlayGunSound.Event:Connect(function(L_394_arg1)
	pcall(function()
		local L_395_ = 0
		while (L_59_ == nil and L_395_ < 100) do
			wait()
			L_395_ = L_395_ + 1
		end
		if (L_59_ == nil) then
			return
		end
		kc(L_394_arg1)
	end)
end)
script.Events.SetGunAnimation.Event:Connect(function(L_396_arg1)
	oc(L_396_arg1, true, 0)
end)
script.Events.TakeoutWeapon.Event:Connect(function(L_397_arg1, L_398_arg2)
	L_398_arg2 = L_398_arg2 or false
	if (not script.Enabled.Value and script.Configuration.AutoEnable.Value) then
		script.Enabled.Value = true
	end
	J()
	fc(L_397_arg1, L_398_arg2)
end)
script.Events.SetBlocked.Event:Connect(function(L_399_arg1)
	L_48_ = L_399_arg1
end)
game.ReplicatedStorage.GunEvent.GunForceTakeout.OnClientEvent:Connect(function(L_400_arg1)
	print("Server force gun change. "..tostring(L_400_arg1).." / "..tostring(L_56_))
	script.Enabled.Value = true
	if (L_400_arg1 == L_56_) then
		return
	end
	fc(L_400_arg1, true)
end)
game.ReplicatedStorage:WaitForChild("GunSystemSetCharacterRotate").OnClientEvent:Connect(function(L_401_arg1)
	script.RotateCharacter.Value = L_401_arg1
end)
game.ReplicatedStorage.GunEvent.GunForceDisable.OnClientEvent:Connect(function()
	script.Enabled.Value = false
end)
game.ReplicatedStorage.GunEvent.GunForceRefresh.OnClientEvent:Connect(function()
	local L_402_ = mc(L_56_)
	if (L_402_ == nil) then
		return
	end
	if (not L_55_) then
		script.Events.TakeoutWeapon:Fire(1, true)
	end
	if (not L_55_) then
		return
	end
end)
game.ReplicatedStorage.GunEvent.GunForceHitmarker.OnClientEvent:Connect(function(L_403_arg1)
	v(L_403_arg1)
end)
wait(1)
local function L_98_func(L_404_arg1, L_405_arg2, L_406_arg3)
	print(L_404_arg1)
	return L_404_arg1 == Enum.UserInputState.Begin and L_405_arg2 or L_406_arg3
end
local L_99_ = game:GetService('ContextActionService')
L_99_:BindActionAtPriority('ControllerReload', function(L_407_arg1, L_408_arg2)
	L_98_func(L_408_arg2, bc, Sb)({
		KeyCode = Enum.KeyCode.R
	}, false)
	return Enum.ContextActionResult.Pass
end, false, 1, Enum.KeyCode.ButtonX)
L_99_:BindAction('ControllerLeftclick', function(L_409_arg1, L_410_arg2)
	L_98_func(L_410_arg2, Nb, Pb)(0)
	return Enum.ContextActionResult.Pass
end, false, Enum.KeyCode.ButtonR2)
L_99_:BindAction('ControllerRightclick', function(L_411_arg1, L_412_arg2)
	L_98_func(L_412_arg2, Nb, Pb)(1)
	return Enum.ContextActionResult.Pass
end, false, Enum.KeyCode.ButtonL2)
L_99_:BindActionAtPriority('ControllerJump', function(L_413_arg1, L_414_arg2)
	L_98_func(L_414_arg2, bc, Sb)({
		KeyCode = Enum.KeyCode.Space
	}, false)
	return Enum.ContextActionResult.Pass
end, false, Enum.ContextActionPriority.High.Value, Enum.KeyCode.ButtonA)
L_99_:BindActionAtPriority('ControllerCrouch', function(L_415_arg1, L_416_arg2)
	L_98_func(L_416_arg2, bc, Sb)({
		KeyCode = Enum.KeyCode.C
	}, false)
	return Enum.ContextActionResult.Pass
end, false, 1, Enum.KeyCode.ButtonB)
L_99_:BindActionAtPriority('ControllerSprint', function(L_417_arg1, L_418_arg2)
	L_98_func(L_418_arg2, bc, Sb)({
		KeyCode = Enum.KeyCode.LeftShift
	}, false)
	if (L_418_arg2 == Enum.UserInputState.Begin) then
		if (L_10_) then
			Sb({
				KeyCode = Enum.KeyCode.W
			}, false)
		else
			bc({
				KeyCode = Enum.KeyCode.W
			}, false)
		end
	end
	return Enum.ContextActionResult.Pass
end, false, 1, Enum.KeyCode.ButtonL3)
L_99_:BindActionAtPriority('ControllerKnife', function(L_419_arg1, L_420_arg2)
	L_98_func(L_420_arg2, bc, Sb)({
		KeyCode = Enum.KeyCode.F
	}, false)
	return Enum.ContextActionResult.Pass
end, false, 1, Enum.KeyCode.ButtonR3)
if L_4_.PlayerGui:FindFirstChild("MobileUI") then
	local L_421_ = L_4_.PlayerGui.MobileUI:WaitForChild("Frame")
	local L_422_ = L_421_:FindFirstChild("AimButton")
	local L_423_ = L_421_:FindFirstChild("CrouchButton")
	local L_424_ = L_421_:FindFirstChild("ReloadButton")
	local L_425_ = L_421_:FindFirstChild("ShootButton")
	L_422_.MouseButton1Down:Connect(function()
		if L_8_ == false then
			Nb(1)
		else
			Pb(1)
		end
	end)
	L_423_.MouseButton1Down:Connect(function()
		bc({
			KeyCode = Enum.KeyCode.C
		}, false)
	end)
	L_424_.MouseButton1Down:Connect(function()
		bc({
			KeyCode = Enum.KeyCode.R
		}, false)
	end)
	L_425_.MouseButton1Down:Connect(function()
		Nb(0)
	end)
	game:GetService("UserInputService").InputEnded:Connect(function(L_426_arg1, L_427_arg2)
		Pb(0)
	end)
end
script.SystemLoaded.Value = true
print("Gun Script compiled")