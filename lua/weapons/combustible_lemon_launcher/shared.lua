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
SWEP.Primary.Ammo = "RPG_Round" -- TO-THINK-ABOUT: combine ball as ammo?
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

