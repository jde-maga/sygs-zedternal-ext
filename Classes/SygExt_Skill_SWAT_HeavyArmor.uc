class SygExt_Skill_SWAT_HeavyArmor extends WMUpgrade_Skill;

var array<float> Armor;

static function ModifyArmor(out int MaxArmor, int DefaultArmor, int upgLevel)
{
	MaxArmor += Round(float(DefaultArmor) * default.Armor[upgLevel - 1]);
}

defaultproperties
{
	Armor(0)=0.3f
	Armor(1)=0.75f

	upgradeName="Heavy Armor"
	upgradeDescription(0)="> <font color=\"#66cc00\">+30<font color=\"#66cc00\"> <font color=\"#ff3399\">Armor</font>"
	upgradeDescription(1)="> <font color=\"#b346ea\">+75<font color=\"#66cc00\"> <font color=\"#ff3399\">Armor</font>"
	upgradeIcon(0)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_HeavyArmor'
	upgradeIcon(1)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_HeavyArmor_Deluxe'

	Name="Default__SygExt_Skill_SWAT_HeavyArmor"
}
