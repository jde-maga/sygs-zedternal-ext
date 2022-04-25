class SygExt_Skill_Sharpshooter_HighVelocity extends WMUpgrade_Skill;

var array<float> Damage;

static function ModifyDamageGiven(out int InDamage, int DefaultDamage, int upgLevel, optional Actor DamageCauser, optional KFPawn_Monster MyKFPM, optional KFPlayerController DamageInstigator, optional class<KFDamageType> DamageType, optional int HitZoneIdx, optional KFWeapon MyKFW)
{
	local float RangeFactor;

	if (MyKFPM != None && DamageInstigator != None && DamageInstigator.Pawn != None)
	{
		RangeFactor = VSize(DamageInstigator.Pawn.Location - MyKFPM.Location) / 100;
		InDamage += Round(float(DefaultDamage) * (default.Damage[upgLevel - 1] * RangeFactor));
	}
}

defaultproperties
{
	Damage(0)=0.05f
	Damage(1)=0.10f

	upgradeName="High Velocity"
    upgradeDescription(0)="For every <font color=\"#ffff00\">meter your shot travels</font>:\n> <font color=\"#66cc00\">+5%</font> <font color=\"#ff3399\">damage</font>"
    upgradeDescription(1)="For every <font color=\"#ffff00\">meter your shot travels</font>:\n> <font color=\"#b346ea\">+10%</font> <font color=\"#ff3399\">damage</font>"
	upgradeIcon(0)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_Velocity'
	upgradeIcon(1)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_Velocity_Deluxe'

	Name="Default__SygExt_Skill_Sharpshooter_HighVelocity"
}
