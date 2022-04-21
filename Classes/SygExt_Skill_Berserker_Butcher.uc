class SygExt_Skill_Berserker_Butcher extends WMUpgrade_Skill;

var array<float> MeleeSpeed, RateOfFire;

static simulated function ModifyMeleeAttackSpeedPassive(out float durationFactor, int upgLevel)
{
	durationFactor = 1.0f / (1.0f / durationFactor + default.MeleeSpeed[upgLevel - 1]);
}

static simulated function ModifyRateOfFirePassive(out float rateOfFireFactor, int upgLevel)
{
	rateOfFireFactor = 1.0f / (1.0f / rateOfFireFactor + default.RateOfFire[upgLevel - 1]);
}

defaultproperties
{
	MeleeSpeed(0)=0.25f
	MeleeSpeed(1)=1.00f
	RateOfFire(0)=0.15f
	RateOfFire(1)=0.50f

	upgradeName="Butcher"
	upgradeDescription(0)="> <font color=\"#66cc00\">+25%</font> <font color=\"#ff3399\">melee attack speed</font>\n> <font color=\"#66cc00\">+15%</font> <font color=\"#ff3399\">rate of fire</font>"
	upgradeDescription(1)="> <font color=\"#b346ea\">+100%</font> <font color=\"#ff3399\">melee attack speed</font>\n> <font color=\"#b346ea\">+50%</font> <font color=\"#ff3399\">rate of fire</font>"
	upgradeIcon(0)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_Butcher'
	upgradeIcon(1)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_Butcher_Deluxe'

	Name="Default__SygExt_Skill_Berserker_Butcher"
}
