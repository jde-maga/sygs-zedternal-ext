class SygExt_Skill_Support_Destruction extends WMUpgrade_Skill;

static simulated function InitiateWeapon(int upgLevel, KFWeapon KFW, KFPawn OwnerPawn)
{
	local SygExt_Skill_Support_Destruction_Helper UPG;
	local bool bFound;

	if (KFPawn_Human(OwnerPawn) != None && OwnerPawn.Role == Role_Authority)
	{
		bFound = False;
		foreach OwnerPawn.ChildActors(class'SygExt_Skill_Support_Destruction_Helper', UPG)
		{
			bFound = True;
			break;
		}

		if (!bFound)
		{
			UPG = OwnerPawn.Spawn(class'SygExt_Skill_Support_Destruction_Helper', OwnerPawn);
			UPG.bDeluxe = (upgLevel > 1);
		}
	}
}

static simulated function DeleteHelperClass(Pawn OwnerPawn)
{
	local SygExt_Skill_Support_Destruction_Helper UPG;

	if (OwnerPawn != None)
	{
		foreach OwnerPawn.ChildActors(class'SygExt_Skill_Support_Destruction_Helper', UPG)
		{
			UPG.Destroy();
		}
	}
}

defaultproperties
{
	upgradeName="Destruction"
    upgradeDescription(0)="> During a <font color=\"#ffff00\">ZED time</font>:\n> ZEDs within <font color=\"#66cc00\">10 meters</font> <font color=\"#ff3399\">are knocked out</font>"
    upgradeDescription(1)="> During a <font color=\"#ffff00\">ZED time</font>:\n> ZEDs within <font color=\"#b346ea\">the map</font> <font color=\"#ff3399\">are knocked out</font>"
	upgradeIcon(0)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_Cripple'
	upgradeIcon(1)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_Cripple_Deluxe'

	Name="Default__SygExt_Skill_Support_Destruction"
}
