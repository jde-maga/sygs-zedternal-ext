class SygExt_Skill_Berserker_BerserkerRage extends WMUpgrade_Skill;

var array<float> Damage, MeleeDamage;

static function ModifyDamageGiven(out int InDamage, int DefaultDamage, int upgLevel, optional Actor DamageCauser, optional KFPawn_Monster MyKFPM, optional KFPlayerController DamageInstigator, optional class<KFDamageType> DamageType, optional int HitZoneIdx, optional KFWeapon MyKFW)
{
	if (DamageInstigator != None && DamageInstigator.Pawn != None && WMPawn_Human(DamageInstigator.Pawn) != None && WMPawn_Human(DamageInstigator.Pawn).ZedternalArmor <= 0)
	{
		if (DamageType != None && static.IsMeleeDamageType(DamageType))
			InDamage += Round(float(DefaultDamage) * default.MeleeDamage[upgLevel - 1]);
		else
			InDamage += Round(float(DefaultDamage) * default.Damage[upgLevel - 1]);
	}
}

defaultproperties
{
	MeleeDamage(0)=0.5f
	MeleeDamage(1)=1.50f
	Damage(0)=0.25f
	Damage(1)=0.75f

	upgradeName="Berserker Rage"
	upgradeDescription(0)="While you have <font color=\"#ffff00\">no armor</font>:\n> <font color=\"#66cc00\">+50%</font> <font color=\"#ff3399\">melee damage</font>\n> <font color=\"#66cc00\">+25%</font> <font color=\"#ff3399\">other damage</font>"
	upgradeDescription(1)="While you have <font color=\"#ffff00\">no armor</font>:\n> <font color=\"#b346ea\">+150%</font> <font color=\"#ff3399\">melee damage</font>\n> <font color=\"#b346ea\">+75%</font> <font color=\"#ff3399\">other damage</font>"
	upgradeIcon(0)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_BerserkerRage'
	upgradeIcon(1)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_BerserkerRage_Deluxe'

	Name="Default__WMUpgrade_Skill_BerserkerRage"
}
