class SygExt_Skill_Berserker_Dreadnaught extends WMUpgrade_Skill;

var array<int> Health;

static function ModifyHealth(out int InHealth, int DefaultHealth, int upgLevel)
{
	InHealth += default.Health[upgLevel -1];
}

defaultproperties
{
	Health(0)=25
	Health(1)=60

	upgradeName="Dreadnaught"
	upgradeDescription(0)="> <font color=\"#66cc00\">+25</font> <font color=\"#ff3399\">health points</font>"
	upgradeDescription(1)="> <font color=\"#b346ea\">+60</font> <font color=\"#ff3399\">health points</font>"
	upgradeIcon(0)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_Dreadnaught'
	upgradeIcon(1)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_Dreadnaught_Deluxe'

	Name="Default__SygExt_Skill_Berserker_Dreadnaught"
}
