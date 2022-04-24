class SygExt_Skill_Sharpshooter_Camper extends WMUpgrade_Skill;

var array<float> Damage;

static function ModifyDamageGiven(out int InDamage, int DefaultDamage, int upgLevel, optional Actor DamageCauser, optional KFPawn_Monster MyKFPM, optional KFPlayerController DamageInstigator, optional class<KFDamageType> DamageType, optional int HitZoneIdx, optional KFWeapon MyKFW)
{
	if (DamageInstigator != None && DamageInstigator.Pawn != None && VSizeSq(DamageInstigator.Pawn.Velocity) <= 0)
		InDamage += Round(float(DefaultDamage) * default.Damage[upgLevel - 1]);
}

defaultproperties
{
	Damage(0)=0.35f
	Damage(1)=1.00f

	upgradeName="Camper"
    upgradeDescription(0)="While <font color=\"#ffff00\">stationary</font>:\n> <font color=\"#66cc00\">+35%</font> <font color=\"#ff3399\">damage</font>"
    upgradeDescription(1)="While <font color=\"#ffff00\">stationary</font>:\n> <font color=\"#b346ea\">+100%</font> <font color=\"#ff3399\">damage</font>"
	upgradeIcon(0)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_Sniper'
	upgradeIcon(1)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_Sniper_Deluxe'

	Name="Default__WMUpgrade_Skill_Sniper"
}
