class SygExt_Skill_Commando_MachineGunner extends WMUpgrade_Skill;

var array<float> Damage;

static function ModifyDamageGiven(out int InDamage, int DefaultDamage, int upgLevel, optional Actor DamageCauser, optional KFPawn_Monster MyKFPM, optional KFPlayerController DamageInstigator, optional class<KFDamageType> DamageType, optional int HitZoneIdx, optional KFWeapon MyKFW)
{
	local WMUpgrade_Skill_GunMachine_Helper UPG;

	if (DamageInstigator.Pawn != None && MyKFPM != None)
	{
		UPG = GetHelper(DamageInstigator.Pawn);
		if (UPG != None)
		{
			if (UPG.bActive)
				InDamage += Round(float(DefaultDamage) * default.Damage[upgLevel - 1]);

			if ((MyKFPM.Health - InDamage) <= 0)
				UPG.SetActive();
		}
	}
}

static function WMUpgrade_Skill_GunMachine_Helper GetHelper(Pawn OwnerPawn)
{
	local WMUpgrade_Skill_GunMachine_Helper UPG;

	if (KFPawn_Human(OwnerPawn) != None)
	{
		foreach OwnerPawn.ChildActors(class'WMUpgrade_Skill_GunMachine_Helper', UPG)
		{
			return UPG;
		}

		//Should have one
		UPG = OwnerPawn.Spawn(class'WMUpgrade_Skill_GunMachine_Helper', OwnerPawn);
	}

	return UPG;
}

static simulated function DeleteHelperClass(Pawn OwnerPawn)
{
	local WMUpgrade_Skill_GunMachine_Helper UPG;

	if (OwnerPawn != None)
	{
		foreach OwnerPawn.ChildActors(class'WMUpgrade_Skill_GunMachine_Helper', UPG)
		{
			UPG.Destroy();
		}
	}
}

defaultproperties
{
	Damage(0)=0.35f
	Damage(1)=0.75f
	upgradeName="Machine Gunner"
    upgradeDescription(0)=" After <font color=\"#ffff00\">Killing a ZED</font>:\n > <font color=\"#66cc00\">+35%</font> <font color=\"#ff3399\">damage</font> for <font color=\"#ffff00\">5 seconds</font>"
    upgradeDescription(1)="After <font color=\"#ffff00\">killing a ZED</font>:\n> <font color=\"#b346ea\">+75%</font> <font color=\"#ff3399\">damage</font> for <font color=\"#ffff00\">5 seconds</font>"
	upgradeIcon(0)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_GunMachine'
	upgradeIcon(1)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_GunMachine_Deluxe'

	Name="Default__SygExt_Skill_Commando_MachineGunner"
}
