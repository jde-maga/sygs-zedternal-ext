class SygExt_Skill_Commando_Overload extends WMUpgrade_Skill;

var array<float> MagCapacity, MaxAmmo;

static simulated function ModifyMagSizeAndNumberPassive(out float magazineCapacityFactor, int upgLevel)
{
	magazineCapacityFactor += default.MagCapacity[upgLevel - 1];
}

static simulated function ModifySpareAmmoAmountPassive(out float spareAmmoFactor, int upgLevel)
{
	spareAmmoFactor += default.MaxAmmo[upgLevel - 1];
}

defaultproperties
{
	MagCapacity(0)=0.25f
	MagCapacity(1)=0.50f
	MaxAmmo(0)=0.25f
	MaxAmmo(1)=0.50f
    upgradeDescription(0)="> <font color=\"#66cc00\">+25%</font> <font color=\"#ff3399\">magazine size</font>\n> <font color=\"#66cc00\">+25%</font> <font color=\"#ff3399\">max ammo</font>"
    upgradeDescription(1)="> <font color=\"#b346ea\">+50%</font> <font color=\"#ff3399\">magazine size</font>\n> <font color=\"#b346ea\">+50%</font> <font color=\"#ff3399\">max ammo</font>"
	upgradeName="Overload"
	upgradeIcon(0)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_Overload'
	upgradeIcon(1)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_Overload_Deluxe'

	Name="Default__WMUpgrade_Skill_Overload"
}
