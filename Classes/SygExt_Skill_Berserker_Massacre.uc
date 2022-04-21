class SygExt_Skill_Berserker_Massacre extends WMUpgrade_Skill;

var array<float> MeleeDamage, Damage;

static function ModifyDamageGiven(out int InDamage, int DefaultDamage, int upgLevel, optional Actor DamageCauser, optional KFPawn_Monster MyKFPM, optional KFPlayerController DamageInstigator, optional class<KFDamageType> DamageType, optional int HitZoneIdx, optional KFWeapon MyKFW)
{
	if (DamageType != None && static.IsMeleeDamageType(DamageType))
		InDamage += int(float(DefaultDamage) * default.MeleeDamage[upgLevel - 1]);
	else
		InDamage += int(float(DefaultDamage) * default.Damage[upgLevel - 1]);
}

defaultproperties
{
	Damage(0)=0.25f
	Damage(1)=0.75f
	MeleeDamage(0)=1.50f
	MeleeDamage(1)=0.75f

	upgradeName="Massacre"
	upgradeDescription(0)="> <font color=\"#66cc00\">+40%</font> <font color=\"#ff3399\">melee damage</font>\n> <font color=\"#66cc00\">+25%</font> <font color=\"#ff3399\">other damage</font>"
	upgradeDescription(1)="> <font color=\"#b346ea\">+150%</font> <font color=\"#ff3399\">melee damage</font>\n> <font color=\"#b346ea\">+75%</font> <font color=\"#ff3399\">other damage</font>"
	upgradeIcon(0)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_Massacre'
	upgradeIcon(1)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_Massacre_Deluxe'

	Name="Default__SygExt_Skill_Berserker_Massacre"
}
