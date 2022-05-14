class SygExt_Skill_Gunslinger_Skirmisher extends WMUpgrade_Skill;

var array<float> MoveSpeed;

static simulated function ModifySpeedPassive(out float speedFactor, int upgLevel)
{
	speedFactor += default.MoveSpeed[upgLevel - 1];
}

static simulated function InitiateWeapon(int upgLevel, KFWeapon KFW, KFPawn OwnerPawn)
{
	local SygExt_Skill_Gunslinger_Skirmisher_Helper UPG;

	if (KFPawn_Human(OwnerPawn) != None && OwnerPawn.Role == Role_Authority)
	{
		foreach OwnerPawn.ChildActors(class'SygExt_Skill_Gunslinger_Skirmisher_Helper', UPG)
            return;

		UPG = OwnerPawn.Spawn(class'SygExt_Skill_Gunslinger_Skirmisher_Helper', OwnerPawn);
		UPG.StartTimer(upgLevel > 1);
	}
}

static simulated function DeleteHelperClass(Pawn OwnerPawn)
{
	local SygExt_Skill_Gunslinger_Skirmisher_Helper UPG;

	if (OwnerPawn != None)
	{
		foreach OwnerPawn.ChildActors(class'SygExt_Skill_Gunslinger_Skirmisher_Helper', UPG)
		{
			UPG.Destroy();
		}
	}
}

defaultproperties
{
	MoveSpeed(0)=0.05f
	MoveSpeed(1)=0.15f

	upgradeName="Skirmisher"
    upgradeDescription(0)="> <font color=\"#66cc00\">+5%</font> <font color=\"#ff3399\">movement speed</font>\n> <font color=\"#66cc00\">+1</font> <font color=\"#ff3399\">health points per second</font>"
    upgradeDescription(1)="> <font color=\"#b346ea\">+15%</font> <font color=\"#ff3399\">movement speed</font>\n> <font color=\"#b346ea\">+2</font> <font color=\"#ff3399\">health points per second</font>"
	upgradeIcon(0)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_Skirmisher'
	upgradeIcon(1)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_Skirmisher_Deluxe'

	Name="Default__SygExt_Skill_Gunslinger_Skirmisher"
}
