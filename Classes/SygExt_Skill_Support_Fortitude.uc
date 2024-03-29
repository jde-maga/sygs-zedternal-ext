class SygExt_Skill_Support_Fortitude extends WMUpgrade_Skill;

var array<int> Health;

static function ModifyHealth(out int InHealth, int DefaultHealth, int upgLevel)
{
	InHealth += default.Health[upgLevel - 1];
}

static simulated function InitiateWeapon(int upgLevel, KFWeapon KFW, KFPawn OwnerPawn)
{
	local SygExt_Skill_Support_Fortitude_Helper UPG;
	local bool bFound;

	if (KFPawn_Human(OwnerPawn) != None && OwnerPawn.Role == Role_Authority)
	{
		bFound = False;
		foreach OwnerPawn.ChildActors(class'SygExt_Skill_Support_Fortitude_Helper', UPG)
		{
			bFound = True;
			break;
		}

		if (!bFound)
		{
			UPG = OwnerPawn.Spawn(class'SygExt_Skill_Support_Fortitude_Helper', OwnerPawn);
			UPG.StartTimer(upgLevel > 1);
		}
	}
}

static simulated function DeleteHelperClass(Pawn OwnerPawn)
{
	local SygExt_Skill_Support_Fortitude_Helper UPG;

	if (OwnerPawn != None)
	{
		foreach OwnerPawn.ChildActors(class'SygExt_Skill_Support_Fortitude_Helper', UPG)
		{
			UPG.Destroy();
		}
	}
}

defaultproperties
{
	Health(0)=10
	Health(1)=25

	upgradeName="Fortitude"
    upgradeDescription(0)="> <font color=\"#66cc00\">+10</font> <font color=\"#ff3399\">health points</font>\n> <font color=\"#66cc00\">+0.5</font> <font color=\"#ff3399\">health points per second</font>"
    upgradeDescription(1)="> <font color=\"#b346ea\">+25</font> <font color=\"#ff3399\">health points</font>\n> <font color=\"#b346ea\">+1</font> <font color=\"#ff3399\">health point per second</font>"
	upgradeIcon(0)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_Fortitude'
	upgradeIcon(1)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_Fortitude_Deluxe'

	Name="Default__SygExt_Skill_Support_Fortitude"
}
