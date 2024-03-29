class SygExt_Skill_Support_Tenacity extends WMUpgrade_Skill;

var array<float> Damage;

static function ModifyDamageGiven(out int InDamage, int DefaultDamage, int upgLevel, optional Actor DamageCauser, optional KFPawn_Monster MyKFPM, optional KFPlayerController DamageInstigator, optional class<KFDamageType> DamageType, optional int HitZoneIdx, optional KFWeapon MyKFW)
{
	local WMUpgrade_Skill_Tenacity_Helper UPG;

	if (DamageInstigator != None && KFPawn(DamageInstigator.Pawn) != None && MyKFPM != None && (MyKFPM.Health - InDamage) <= 0)
	{
		UPG = GetHelper(KFPawn(DamageInstigator.Pawn));
		if (UPG != None)
			UPG.SetActive();
	}
}

static function ModifyDamageTaken(out int InDamage, int DefaultDamage, int upgLevel, KFPawn OwnerPawn, optional class<DamageType> DamageType, optional Controller InstigatedBy, optional KFWeapon MyKFW)
{
	local WMUpgrade_Skill_Tenacity_Helper UPG;

	if (OwnerPawn != None)
	{
		UPG = GetHelper(OwnerPawn);
		if (UPG != None && UPG.bActive)
			InDamage -= Round(float(DefaultDamage) * default.Damage[upgLevel - 1]);
	}
}

static function WMUpgrade_Skill_Tenacity_Helper GetHelper(KFPawn OwnerPawn)
{
	local WMUpgrade_Skill_Tenacity_Helper UPG;

	if (KFPawn_Human(OwnerPawn) != None)
	{
		foreach OwnerPawn.ChildActors(class'WMUpgrade_Skill_Tenacity_Helper', UPG)
		{
			return UPG;
		}

		//Should have one
		UPG = OwnerPawn.Spawn(class'WMUpgrade_Skill_Tenacity_Helper', OwnerPawn);
	}

	return UPG;
}

static simulated function DeleteHelperClass(Pawn OwnerPawn)
{
	local WMUpgrade_Skill_Tenacity_Helper UPG;

	if (OwnerPawn != None)
	{
		foreach OwnerPawn.ChildActors(class'WMUpgrade_Skill_Tenacity_Helper', UPG)
		{
			UPG.Destroy();
		}
	}
}

defaultproperties
{
	Damage(0)=0.5f
	Damage(1)=0.15f

	upgradeName="Tenacity"
    upgradeDescription(0)="After <font color=\"#ffff00\">killing a ZED</font>:\n> <font color=\"#66cc00\">+5%</font> <font color=\"#ff3399\">damage resistance</font> for <font color=\"#ffff00\">5 seconds</font>"
    upgradeDescription(1)="After <font color=\"#ffff00\">killing a ZED</font>:\n> <font color=\"#b346ea\">+15%</font> <font color=\"#ff3399\">damage resistance</font> for <font color=\"#ffff00\">5 seconds</font>"
	upgradeIcon(0)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_Tenacity'
	upgradeIcon(1)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_Tenacity_Deluxe'

	Name="Default__SygExt_Skill_Support_Tenacity"
}
