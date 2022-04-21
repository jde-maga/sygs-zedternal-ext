class SygExt_Skill_Survivalist_Emergency extends WMUpgrade_Skill;

var array<float> MaxSpeed;

static simulated function ModifySpeed(out float InSpeed, float DefaultSpeed, int upgLevel, KFPawn OwnerPawn)
{
	local float HalfHealth; 

	HalfHealth = OwnerPawn.HealthMax / 2;
	if(OwnerPawn.HealthMax < HalfHealth)
	{
		InSpeed += DefaultSpeed * default.MaxSpeed[upgLevel - 1] * (HalfHealth - OwnerPawn.Health) * ( 1 / HalfHealth);
	}
}

static simulated function InitiateWeapon(int upgLevel, KFWeapon KFW, KFPawn OwnerPawn)
{
	local WMUpgrade_Skill_Emergency_Helper UPG;
	local bool bFound;

	if (KFPawn_Human(OwnerPawn) != None && OwnerPawn.Role == Role_Authority)
	{
		bFound = False;
		foreach OwnerPawn.ChildActors(class'WMUpgrade_Skill_Emergency_Helper', UPG)
		{
			bFound = True;
			break;
		}

		if (!bFound)
			UPG = OwnerPawn.Spawn(class'WMUpgrade_Skill_Emergency_Helper', OwnerPawn);
	}
}

static simulated function DeleteHelperClass(Pawn OwnerPawn)
{
	local WMUpgrade_Skill_Emergency_Helper UPG;

	if (OwnerPawn != None)
	{
		foreach OwnerPawn.ChildActors(class'WMUpgrade_Skill_Emergency_Helper', UPG)
		{
			UPG.Destroy();
		}
	}
}

defaultproperties
{
	MaxSpeed(0)=0.5f
	MaxSpeed(1)=1.25f

	upgradeName="Emergency"
	upgradeDescription(0)="For each <font color=\"#ffff00\">percent of HP lost below 50% HP</font>:\n> <font color=\"#66cc00\">+1%</font> <font color=\"#ff3399\">movement speed</font>"
	upgradeDescription(1)="For each <font color=\"#ffff00\">percent of HP lost below 50% HP</font>\n> <font color=\"#b346ea\">+2.5%</font> <font color=\"#ff3399\">movement speed</font>"
	upgradeIcon(0)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_Emergency'
	upgradeIcon(1)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_Emergency_Deluxe'

	Name="Default__WMUpgrade_Skill_Emergency"
}
