class SygExt_Skill_Support_Barrage extends WMUpgrade_Skill;

var array<float> Damage;
var int RadiusSQ;

static function ModifyDamageGiven(out int InDamage, int DefaultDamage, int upgLevel, optional Actor DamageCauser, optional KFPawn_Monster MyKFPM, optional KFPlayerController DamageInstigator, optional class<KFDamageType> DamageType, optional int HitZoneIdx, optional KFWeapon MyKFW)
{
	local WMUpgrade_Skill_Barrage_Helper UPG;

	if (MyKFPM != None && DamageInstigator != None && DamageInstigator.Pawn != None && VSizeSQ(DamageInstigator.Pawn.Location - MyKFPM.Location) <= default.RadiusSQ)
	{
		InDamage += Round(float(DefaultDamage) * default.Damage[upgLevel - 1]);
		if (InDamage > 5)
		{
			UPG = GetHelper(DamageInstigator.Pawn);
			if (UPG != None)
				UPG.CreateEffect();
		}
	}
}

static function WMUpgrade_Skill_Barrage_Helper GetHelper(Pawn OwnerPawn)
{
	local WMUpgrade_Skill_Barrage_Helper UPG;

	if (KFPawn_Human(OwnerPawn) != None)
	{
		foreach OwnerPawn.ChildActors(class'WMUpgrade_Skill_Barrage_Helper', UPG)
		{
			return UPG;
		}

		//Should have one
		UPG = OwnerPawn.Spawn(class'WMUpgrade_Skill_Barrage_Helper', OwnerPawn);
	}

	return UPG;
}

static simulated function DeleteHelperClass(Pawn OwnerPawn)
{
	local WMUpgrade_Skill_Barrage_Helper UPG;

	if (OwnerPawn != None)
	{
		foreach OwnerPawn.ChildActors(class'WMUpgrade_Skill_Barrage_Helper', UPG)
		{
			UPG.Destroy();
		}
	}
}

defaultproperties
{
	Damage(0)=0.35f;
	Damage(1)=1.0f;
	RadiusSQ=50000;

	upgradeName="Barrage"
    upgradeDescription(0)="Against <font color=\"#ffff00\">point blank ZEDs</font> :\n> <font color=\"#66cc00\">+35%</font> <font color=\"#ff3399\">damage</font>"
	upgradeDescription(1)="Against <font color=\"#ffff00\">point blank ZEDs</font> :\n> <font color=\"#b346ea\">+100%</font> <font color=\"#ff3399\">damage</font>"
	upgradeIcon(0)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_Barrage'
	upgradeIcon(1)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_Barrage_Deluxe'

	Name="Default__SygExt_Skill_Support_Barrage"
}
