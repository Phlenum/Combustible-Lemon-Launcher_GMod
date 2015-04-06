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

AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

function SWEP:Initialize()
	self.Weapon:SetHoldType(self.HoldType)
	self.Weapon:SetDeploySpeed(0.3)
	if CLIENT then
		self.WepSelectIcon = surface.GetTextureID("vgui/hud/combustible_lemon_launcher")
	end
end

function SWEP:PrimaryAttack()
	-- since we don't have magazines here check for the whole ammo
	if(self:Ammo1() <= 0) then
		self:EmitSound("Weapon_Pistol.Empty")
		return false
	end
	self:TakePrimaryAmmo(1)
	self:SetNextPrimaryFire(CurTime() + self.Primary.Delay)
	self:SendWeaponAnim(ACT_VM_PRIMARYATTACK)
	self:EmitSound(self.Primary.Sound)

	local lemon = ents.Create("combustible_lemon")
	local aimvec = self.Owner:GetAimVector()
	lemon:SetPos(self.Weapon:GetAttachment(self.Weapon:LookupAttachment("muzzle")).Pos)
	lemon:SetOwner(self.Owner)
	lemon:SetInflictor(self)
	lemon:SetDirection(aimvec)
	lemon:SetAngles(aimvec:Angle())
	lemon:Spawn()
	lemon:Activate()
	return true
end

