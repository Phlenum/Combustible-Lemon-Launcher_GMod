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

ENT.PrintName = "Combustible Lemon"
ENT.Type = "anim"
ENT.Base = "base_anim"
ENT.Mass = 1
ENT.Speed = 2000
ENT.Blast = 150

function ENT:SetupDataTables()
	self:NetworkVar("Entity", 0, "Inflictor")
	self:NetworkVar("Vector", 0, "Direction")
end

function ENT:Initialize()
	self:SetModel("models/phlenum/entities/combustible_lemon.mdl")
	self:PhysicsInitSphere(5.5, "metal")
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)
	local vel = self:GetDirection() * self.Speed
	local phys = self:GetPhysicsObject()
	if(IsValid(phys)) then
		phys:Wake()
		phys:SetMass(self.Mass)
		phys:SetVelocity(vel)
	end
	self:SetLocalVelocity(vel)
end

function ENT:PhysicsCollide(data, phys)
	local effectdata = EffectData()
	local position = self:GetPos()
	local inflictor = self:GetInflictor()
	local owner = self:GetOwner()
	effectdata:SetOrigin(position)
	util.Effect("Explosion", effectdata)
	util.BlastDamage(inflictor, owner, position, self.Blast, self.Blast)
	SafeRemoveEntity(self)
end

