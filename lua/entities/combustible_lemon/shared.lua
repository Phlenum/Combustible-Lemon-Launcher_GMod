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

ENT.Type = "anim"
ENT.Base = "base_anim"
ENT.Mass = 1
ENT.Speed = 2000

function ENT:Initialize()
	self:SetModel("models/phlenum/entities/combustible_lemon.mdl")
	if(SERVER) then
		-- server initialization
		self:PhysicsInitSphere(SOLID_VPHYSICS, 3)
		self:SetMoveType(MOVETYPE_VPHYSICS)
		self:SetSolid(SOLID_VPHYSICS)
		local vel = self.Direction * self.Speed
		local phys = self:GetPhysicsObject()
		if(IsValid(phys)) then
			phys:Wake()
			phys:SetMass(self.Mass)
			local rand = math.random(0.1, 0.6)
			phys:ApplyForceOffset(vel, Vector(rand, rand, rand))
		end
	else
		-- client initialization
		self:DrawShadow(false)
	end
end

