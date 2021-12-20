class SygExt_Skill_Berserker_Dreadnaught extends WMUpgrade_Skill;

var array<float> Health;

static function ModifyHealth(out int InHealth, int DefaultHealth, int upgLevel)
{
	InHealth += Round(float(DefaultHealth) * default.Health[upgLevel - 1]);
}

defaultproperties
{
	Health(0)=0.25f
	Health(1)=0.6f

	upgradeName="Dreadnaught"
	upgradeDescription(0)="> <font color=\"#66cc00\">+25</font> <font color=\"#ff3399\">health points</font>"
	upgradeDescription(1)="> <font color=\"#b346ea\">+60</font> <font color=\"#ff3399\">health points</font>"
	upgradeIcon(0)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_Dreadnaught'
	upgradeIcon(1)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_Dreadnaught_Deluxe'

	Name="Default__WMUpgrade_Skill_Dreadnaught"
}
