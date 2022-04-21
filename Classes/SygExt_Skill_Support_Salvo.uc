class SygExt_Skill_Support_Salvo extends WMUpgrade_Skill;

var array<float> Bonus;

static function ModifyDamageGivenPassive(out float damageFactor, int upgLevel)
{
	damageFactor += default.Bonus[upgLevel - 1];
}

static simulated function ModifyRateOfFirePassive(out float rateOfFireFactor, int upgLevel)
{
	rateOfFireFactor = 1.0f / (1.0f / rateOfFireFactor + default.Bonus[upgLevel - 1]);
}

defaultproperties
{
	Bonus(0)=0.20f
	Bonus(1)=0.40f

	upgradeName="Salvo"
    upgradeDescription(0)="> <font color=\"#66cc00\">+20%</font> <font color=\"#ff3399\">damage</font>\n> <font color=\"#66cc00\">+20%</font> <font color=\"#ff3399\">rate of fire</font>"
    upgradeDescription(1)="> <font color=\"#b346ea\">+40%</font> <font color=\"#ff3399\">damage</font>\n> <font color=\"#b346ea\">+40%</font> <font color=\"#ff3399\">rate of fire</font>"
	upgradeIcon(0)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_Salvo'
	upgradeIcon(1)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_Salvo_Deluxe'

	Name="Default__SygExt_Skill_Support_Salvo"
}
