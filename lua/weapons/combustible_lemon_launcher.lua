--[[
	The MIT License (MIT)
	Copyright (c) 2015 Phil Julian Meyer
	Permission is hereby granted, free of charge, to any person obtaining a copy
	of this software and associated documentation files (the "Software"), to deal
	in the Software without restriction, including without limitation the rights
	to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
	copies of the Software, and to permit persons to whom the Software is
	furnished to do so, subject to the following conditions:
	
	The above copyright notice and this permission notice shall be included in
	all copies or substantial portions of the Software.
	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
	IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
	FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
	AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
	LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
	OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
	THE SOFTWARE.
--]]

AddCSLuaFile()

SWEP.PrintName = "Combustible Lemon Launcher"
SWEP.Author = "Phlenum"
SWEP.Contact = "@Phlenum"
SWEP.Purpose = "I'm gonna get my engineers to invent a combustible lemon that burns your house down! - Cave Johnson"
SWEP.Instructions = "Primary attack to shoot combustible lemons"
SWEP.Spawnable = true
SWEP.Category = "Phlenum Weapons"
SWEP.Slot = 4
SWEP.UseHands = true
SWEP.HoldType = "crossbow"

SWEP.Primary.Delay = 0.3
SWEP.Primary.ClipSize = -1
SWEP.Primary.DefaultClip = 30
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = "RPG_Round"
SWEP.Primary.Sound = Sound("")

-- for now don't include a secondary attack
SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = "none"

SWEP.ViewModel = "models/phlenum/weapons/c_combustible_lemon_launcher.mdl"
SWEP.WorldModel = "models/phlenum/weapons/w_combustible_lemon_launcher.mdl"

if(CLIENT) then
	SWEP.WepSelectIcon = surface.GetTextureID("vgui/hud/combustible_lemon_launcher")
end

list.Add("NPCUsableWeapons", {
		class = "combustible_lemon_launcher",
		title = SWEP.PrintName
	})

function SWEP:Initialize()
	self:SetHoldType(self.HoldType)
	self:SetDeploySpeed(0.3)
	if(SERVER) then
		self:SetNPCFireRate(3)
		self:SetNPCMinBurst(0)
		self:SetNPCMaxBurst(0)
	end
end

function SWEP:PrimaryAttack()
	-- since we don't have magazines here check for the whole ammo
	if(self:GetOwner():IsPlayer() and self:Ammo1() <= 0) then
		self:EmitSound("Weapon_Pistol.Empty")
		return false
	end
	if(self:GetOwner():IsPlayer()) then
		self:TakePrimaryAmmo(1)
	end
	self:SetNextPrimaryFire(CurTime() + self.Primary.Delay)
	self:SendWeaponAnim(ACT_VM_PRIMARYATTACK)
	self:EmitSound(self.Primary.Sound)

	if(SERVER) then
		local lemon = ents.Create("combustible_lemon")
		local aimvec = self:GetOwner():GetAimVector()
		lemon:SetPos(self:GetAttachment(self.Weapon:LookupAttachment("muzzle")).Pos)
		lemon:SetOwner(self:GetOwner())
		lemon:SetInflictor(self)
		lemon:SetDirection(aimvec)
		lemon:SetAngles(aimvec:Angle())
		lemon:Spawn()
		lemon:Activate()
	end
	return true
end

