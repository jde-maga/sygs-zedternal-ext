class SygExt_Skill_Commando_CallOut extends WMUpgrade_Skill;

var array<float> Damage;

static simulated function bool IsCallOutActive(int upgLevel, KFPawn OwnerPawn)
{
	return True;
}

static simulated function ModifyCloakDetectionRange(out float InRange, float DefaultRange, int upgLevel)
{
    if (upgLevel == 2)
    {
        InRange = 999999.0f;
    }
}

static function ModifyDamageGiven(out int InDamage, int DefaultDamage, int upgLevel, optional Actor DamageCauser, optional KFPawn_Monster MyKFPM, optional KFPlayerController DamageInstigator, optional class<KFDamageType> DamageType, optional int HitZoneIdx, optional KFWeapon MyKFW)
{
	InDamage += Round(float(DefaultDamage) * default.Damage[upgLevel - 1]);
}

defaultproperties
{
	Damage(0)=0.1f
	Damage(1)=0.25f

	upgradeName="Call Out"
    upgradeDescription(0)="Within <font color=\"#ffff00\">20 meters</font>:\n> <font color=\"#66cc00\">See cloaked ZEDs</font>"
    upgradeDescription(1)="Within <font color=\"#b346ea\">the map</font>:\n> <font color=\"#66cc00\">See cloaked ZEDs</font>"
	upgradeIcon(0)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_CallOut'
	upgradeIcon(1)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_CallOut_Deluxe'

	Name="Default__SygExt_Skill_Commando_CallOut"
}
