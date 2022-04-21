class SygExt_Skill_SWAT_RapidAssault extends WMUpgrade_Skill;

var array<float> RateOfFire;
var array<float> MeleeSpeed;

static simulated function ModifyRateOfFirePassive(out float rateOfFireFactor, int upgLevel)
{
	rateOfFireFactor = 1.0f / (1.0f / rateOfFireFactor + default.RateOfFire[upgLevel - 1]);
}

static simulated function ModifyMeleeAttackSpeedPassive(out float durationFactor, int upgLevel)
{
	durationFactor = 1.0f / (1.0f / durationFactor + default.MeleeSpeed[upgLevel - 1]);
}

defaultproperties
{
    MeleeSpeed(0)=0.2f
    MeleeSpeed(1)=0.4f
	RateOfFire(0)=0.6f
	RateOfFire(1)=1.2f

	upgradeName="Rapid Assault"

    upgradeDescription(0)="> <font color=\"#66cc00\">+20%</font> <font color=\"#ff3399\">melee attack speed</font>\n> <font color=\"#66cc00\">+40%</font> <font color=\"#ff3399\">rate of fire</font>"
	upgradeDescription(1)="> <font color=\"#b346ea\">+60%</font> <font color=\"#ff3399\">melee attack speed</font>\n> <font color=\"#b346ea\">+120%</font> <font color=\"#ff3399\">rate of fire</font>"
	upgradeIcon(0)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_RapidAssault'
	upgradeIcon(1)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_RapidAssault_Deluxe'

	Name="Default__SygExt_Skill_SWAT_RapidAssault"
}
