class SygExt_Skill_Berserker_Tempest extends WMUpgrade_Skill;

var array<float> Damage, MeleeDamage;

static function ModifyDamageGiven(out int InDamage, int DefaultDamage, int upgLevel, optional Actor DamageCauser, optional KFPawn_Monster MyKFPM, optional KFPlayerController DamageInstigator, optional class<KFDamageType> DamageType, optional int HitZoneIdx, optional KFWeapon MyKFW)
{
	if (DamageInstigator != None && DamageInstigator.Pawn != None && VSizeSq(DamageInstigator.Pawn.Velocity) != 0)
	{
		if (DamageType != None && static.IsMeleeDamageType(DamageType))
			InDamage += int(float(DefaultDamage) * default.MeleeDamage[upgLevel - 1]);
		else
			InDamage += int(float(DefaultDamage) * default.Damage[upgLevel - 1]);
	}
}

defaultproperties
{
	Damage(0)=0.25f
	Damage(1)=0.60f
	MeleeDamage(0)=0.40f
	MeleeDamage(1)=1.00f

	upgradeName="Tempest"
	upgradeDescription(0)="When you are <font color=\"#ffff00\">moving</font>:\n> <font color=\"#66cc00\">+40%</font> <font color=\"#ff3399\">melee damage</font>\n> <font color=\"#66cc00\">+25%</font> <font color=\"#ff3399\">other damage</font>"
	upgradeDescription(1)="When you are <font color=\"#ffff00\">moving</font>:\n> <font color=\"#b346ea\">+100%</font> <font color=\"#ff3399\">melee damage</font>\n> <font color=\"#b346ea\">+60%</font> <font color=\"#ff3399\">other damage</font>"
	upgradeIcon(0)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_Tempest'
	upgradeIcon(1)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_Tempest_Deluxe'

	Name="Default__WMUpgrade_Skill_Tempest"
}
