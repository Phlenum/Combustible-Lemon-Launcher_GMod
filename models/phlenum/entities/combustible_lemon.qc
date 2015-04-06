//
// Combustible Lemon Launcher (GMOD) by Phil Julian Meyer is licensed under a 
// Creative Commons Attribution-ShareAlike 4.0 International License
//

$modelname "phlenum/entities/combustible_lemon.mdl"

$bodygroup "studio"
{
	studio "combustible_lemon_ref.smd"
}

$cdmaterials "phlenum/entities"
$surfaceprop "metal"
$contents "solid"

$sequence "idle" "combustible_lemon_ref.smd" {
	fps 30
	activity "ACT_IDLE" 1
}

