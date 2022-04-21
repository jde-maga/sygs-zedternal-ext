class SygExt_Skill_Survivalist_AmmoVest extends WMUpgrade_Skill;

var array<float> Ammo;
var array<int> Weight;

static simulated function ModifySpareAmmoAmountPassive(out float spareAmmoFactor, int upgLevel)
{
	spareAmmoFactor += default.Ammo[upgLevel - 1];
}

static function ApplyWeightLimits(out int InWeightLimit, int DefaultWeightLimit, int upgLevel)
{
	InWeightLimit += default.Weight[upgLevel - 1];
}

defaultproperties
{
	Ammo(0)=0.40f
	Ammo(1)=1.00f
	Weight(0)=3
	Weight(1)=8

	upgradeName="Ammo Vest"
    upgradeDescription(0)="> <font color=\"#66cc00\">+4</font> <font color=\"#ff3399\">weight capacity</font>\n> <font color=\"#66cc00\">+40%</font> <font color=\"#ff3399\">max ammo</font>"
    upgradeDescription(1)="> <font color=\"#b346ea\">+12</font> <font color=\"#ff3399\">weight capaicty</font>\n> <font color=\"#b346ea\">+100%</font> <font color=\"#ff3399\">max ammo</font>"
	upgradeIcon(0)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_AmmoVest'
	upgradeIcon(1)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_AmmoVest_Deluxe'

	Name="Default__SygExt_Skill_Survivalist_AmmoVest"
}
