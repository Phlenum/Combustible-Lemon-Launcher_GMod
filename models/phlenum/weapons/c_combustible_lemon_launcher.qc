//
// Combustible Lemon Launcher (GMOD) by Phil Julian Meyer is licensed under a 
// Creative Commons Attribution-ShareAlike 4.0 International License
//

$modelname "phlenum/weapons/c_combustible_lemon_launcher.mdl"
$include "c_arms_definebones.qci"

$bodygroup "studio"
{
	studio "c_combustible_lemon_launcher_ref.smd"
}

$cdmaterials "phlenum/weapons"
$surfaceprop "metal"
$contents "solid"

$attachment "muzzle" "ValveBiped.Muzzle" 0 0 0

$sequence "draw" "c_combustible_lemon_launcher_anims/draw.smd" {
	fps 30
	"ACT_VM_DRAW" 1
}

$sequence "idle" "c_combustible_lemon_launcher_anims/idle.smd" {
	fps 30
	"ACT_VM_IDLE" 1
	loop
}

$sequence "fire" "c_combustible_lemon_launcher_anims/fire.smd" {
	fps 30
	"ACT_VM_PRIMARYATTACK" 1
}

$sequence "idleempty" "c_combustible_lemon_launcher_anims/idleempty.smd" {
	fps 30
	"ACT_VM_IDLE_EMPTY" 1
	loop
}

$sequence "holster" "c_combustible_lemon_launcher_anims/holster.smd" {
	fps 30
	"ACT_VM_HOLSTER" 1
}

