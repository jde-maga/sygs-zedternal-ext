class SygExt_Skill_Commando_Watcher extends WMUpgrade_Skill;

var float CriticalHealth;
var array<float> Damage;

static function ModifyDamageGiven(out int InDamage, int DefaultDamage, int upgLevel, optional Actor DamageCauser, optional KFPawn_Monster MyKFPM, optional KFPlayerController DamageInstigator, optional class<KFDamageType> DamageType, optional int HitZoneIdx, optional KFWeapon MyKFW)
{
	if (MyKFPM != None && MyKFPM.Health <= int(float(MyKFPM.HealthMax) * default.CriticalHealth))
		InDamage += Round(float(DefaultDamage) * default.Damage[upgLevel - 1]);
}

static simulated function bool CanSeeEnemyHealth(int upgLevel, KFPawn OwnerPawn)
{
	return True;
}

defaultproperties
{
	CriticalHealth=0.15f
	Damage(0)=0.75f
	Damage(1)=4.00f

    upgradeDescription(0)="> <font color=\"#66cc00\">Can see enemy health</font>\n> <font color=\"#66cc00\">+75%</font> <font color=\"#ff3399\">damage</font> against enemies below <font color=\"#ffff00\">15% health</font>"
    upgradeDescription(1)="> <font color=\"#66cc00\">Can see enemy health</font>\n> <font color=\"#b346ea\">+400%</font> <font color=\"#ff3399\">damage</font> against enemies below <font color=\"#ffff00\">15% health</font>"
	upgradeName="Watcher"
	upgradeIcon(0)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_Watcher'
	upgradeIcon(1)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_Watcher_Deluxe'

	Name="Default__SygExt_Skill_Commando_Watcher"
}
