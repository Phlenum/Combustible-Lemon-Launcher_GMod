//
// Combustible Lemon Launcher (GMOD) by Phil Julian Meyer is licensed under a 
// Creative Commons Attribution-ShareAlike 4.0 International License
//

$modelname "phlenum/weapons/w_combustible_lemon_launcher.mdl"
$scale 5

$bodygroup "studio"
{
	studio "w_combustible_lemon_launcher_ref.smd"
}

$cdmaterials "phlenum/weapons"
$surfaceprop "metal"
$contents "solid"

$attachment "muzzle" "ValveBiped.Muzzle" 0 0 0

$sequence "idle" "w_combustible_lemon_launcher_ref.smd" {
	fps 30
	"ACT_VM_IDLE" 1
}

$collisionmodel "w_combustible_lemon_launcher_ref.smd" {
	$mass 1.2
	$concave
}

