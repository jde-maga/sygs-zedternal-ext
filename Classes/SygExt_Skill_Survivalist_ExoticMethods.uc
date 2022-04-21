class SygExt_Skill_Survivalist_ExoticMethods extends WMUpgrade_Skill;

var array<float> Damage;

static function ModifyDamageGiven(out int InDamage, int DefaultDamage, int upgLevel, optional Actor DamageCauser, optional KFPawn_Monster MyKFPM, optional KFPlayerController DamageInstigator, optional class<KFDamageType> DamageType, optional int HitZoneIdx, optional KFWeapon MyKFW)
{
	if (DamageType != None && ClassIsChildOf(DamageType, class'KFDT_EMP') || ClassIsChildOf(DamageType, class'KFDT_Freeze'))
		InDamage += int(float(DefaultDamage) * default.Damage[upgLevel - 1]);
}

defaultproperties
{
	Damage(0)=2.00f
	Damage(1)=5.00f

	upgradeName="Exotic Methods"
	upgradeDescription(0)="> <font color=\"#66cc00\">+200%</font> <font color=\"#ff3399\">EMP damage</font>\n> <font color=\"#66cc00\">+200%</font> <font color=\"#ff3399\">ice damage</font>"
    upgradeDescription(1)="> <font color=\"#b346ea\">+500%</font> <font color=\"#ff3399\">EMP damage</font>\n> <font color=\"#b346ea\">+500%</font> <font color=\"#ff3399\">ice damage</font>"
	upgradeIcon(0)=Texture2D'ZedternalReborn_Resource.Perks.UI_Perk_Survivalist_Rank_0'
	upgradeIcon(1)=Texture2D'ZedternalReborn_Resource.Perks.UI_Perk_Survivalist_Rank_0'

	Name="Default__WMUpgrade_Skill_Massacre"
}
