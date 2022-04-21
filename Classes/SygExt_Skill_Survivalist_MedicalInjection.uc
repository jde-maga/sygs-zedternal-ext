class SygExt_Skill_Survivalist_MedicalInjection extends WMUpgrade_Skill;

static simulated function InitiateWeapon(int upgLevel, KFWeapon KFW, KFPawn OwnerPawn)
{
	local SygExt_Skill_Survivalist_MedicalInjection_Helper UPG;
	local bool bFound;

	if (KFPawn_Human(OwnerPawn) != None && OwnerPawn.Role == Role_Authority)
	{
		bFound = False;
		foreach OwnerPawn.ChildActors(class'SygExt_Skill_Survivalist_MedicalInjection_Helper', UPG)
		{
			bFound = True;
			break;
		}

		if (!bFound)
		{
			UPG = OwnerPawn.Spawn(class'SygExt_Skill_Survivalist_MedicalInjection_Helper', OwnerPawn);
			UPG.StartTimer(upgLevel > 1);
		}
	}
}

static simulated function DeleteHelperClass(Pawn OwnerPawn)
{
	local SygExt_Skill_Survivalist_MedicalInjection_Helper UPG;

	if (OwnerPawn != None)
	{
		foreach OwnerPawn.ChildActors(class'SygExt_Skill_Survivalist_MedicalInjection_Helper', UPG)
		{
			UPG.Destroy();
		}
	}
}

defaultproperties
{
	upgradeName="Medical Injection"
    upgradeDescription(0)="For each <font color=\"#ffff00\">percent of HP lost below 50% HP</font>:\n> <font color=\"#66cc00\">+0.06</font> <font color=\"#ff3399\">health points per second</font>"
    upgradeDescription(1)="For each <font color=\"#ffff00\">percent of HP lost below 50% HP</font>:\n> <font color=\"#b346ea\">+0.16</font> <font color=\"#ff3399\">health points per second</font>"
	upgradeIcon(0)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_MedicalInjection'
	upgradeIcon(1)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_MedicalInjection_Deluxe'

	Name="Default__SygExt_Skill_Survivalist_MedicalInjection"
}
