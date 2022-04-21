class SygExt_Skill_Survivalist_Strength extends WMUpgrade_Skill;

var array<int> Bonus;

static function ApplyWeightLimits(out int InWeightLimit, int DefaultWeightLimit, int upgLevel)
{
	InWeightLimit += default.Bonus[upgLevel - 1];
}

defaultproperties
{
	Bonus(0)=5
	Bonus(1)=12

	upgradeName="Strength"
    upgradeDescription(0)="> <font color=\"#66cc00\">+5</font> <font color=\"#ff3399\">weight capacity</font>"
    upgradeDescription(1)="> <font color=\"#b346ea\">+12</font> <font color=\"#ff3399\">weight capacity</font>"
	upgradeIcon(0)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_Strength'
	upgradeIcon(1)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_Strength_Deluxe'

	Name="Default__WMUpgrade_Skill_Strength"
}
