class SygExt_Skill_Survivalist_ColdRiposte extends WMUpgrade_Skill;

static function ModifyDamageTaken(out int InDamage, int DefaultDamage, int upgLevel, KFPawn OwnerPawn, optional class<DamageType> DamageType, optional Controller InstigatedBy, optional KFWeapon MyKFW)
{
	local SygExt_Skill_Survivalist_ColdRiposte_Helper UPG;

	if (InDamage > 0)
	{
		UPG = GetHelper(OwnerPawn, upgLevel);
		if (UPG != None && UPG.bReady)
			UPG.Explosion();
	}
}

static function SygExt_Skill_Survivalist_ColdRiposte_Helper GetHelper(KFPawn OwnerPawn, int upgLevel)
{
	local SygExt_Skill_Survivalist_ColdRiposte_Helper UPG;

	if (KFPawn_Human(OwnerPawn) != None)
	{
		foreach OwnerPawn.ChildActors(class'SygExt_Skill_Survivalist_ColdRiposte_Helper', UPG)
		{
			return UPG;
		}

		//Should have one
		UPG = OwnerPawn.Spawn(class'SygExt_Skill_Survivalist_ColdRiposte_Helper', OwnerPawn);
		UPG.bDeluxe = (upgLevel > 1);
	}

	return UPG;
}

static simulated function DeleteHelperClass(Pawn OwnerPawn)
{
	local SygExt_Skill_Survivalist_ColdRiposte_Helper UPG;

	if (OwnerPawn != None)
	{
		foreach OwnerPawn.ChildActors(class'SygExt_Skill_Survivalist_ColdRiposte_Helper', UPG)
		{
			UPG.Destroy();
		}
	}
}

defaultproperties
{
	upgradeName="Cold Riposte"
    upgradeDescription(0)="When you <font color=\"#ffff00\">take damage</font>:\n> <font color=\"#66cc00\">Trigger a 10 meters ice nova</font> with a <font color=\"#ffff00\">15 seconds cooldown</font>"
    upgradeDescription(1)="When you <font color=\"#ffff00\">take damage</font>:\n> <font color=\"#66cc00\">Trigger a</font> <font color=\"#b346ea\">25 meters</font> <font color=\"#66cc00\">ice nova</font> with a <font color=\"#ffff00\">15 seconds cooldown</font>"
	upgradeIcon(0)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_ColdRiposte'
	upgradeIcon(1)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_ColdRiposte_Deluxe'

	Name="Default__WMUpgrade_Skill_ColdRiposte"
}
