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

include("shared.lua")

ENT.Blast = 150

function ENT:SetDirection(dir)
	self.Direction = dir
end

function ENT:SetInflictor(ent)
	self.Inflictor = ent
end

function ENT:PhysicsCollide(data, phys)
	local effectdata = EffectData()
	local position = self:GetPos()
	local inflictor = self.Inflictor
	local owner = self:GetOwner()
	
	--[[
		In case these become invalid the entity is the attacker 
		and/or the inflictor
		]]--
	if(not IsValid(owner)) then
		owner = self
	end
	if(not IsValid(inflictor)) then
		inflictor = self
	end

	effectdata:SetOrigin(position)
	util.Effect("Explosion", effectdata)
	util.BlastDamage(inflictor, owner, position, self.Blast, self.Blast)
	util.Decal("Scorch", data.HitPos + data.HitNormal, data.HitPos - data.HitNormal)
	SafeRemoveEntity(self)
end

