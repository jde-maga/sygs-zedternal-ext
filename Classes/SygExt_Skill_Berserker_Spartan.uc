class SygExt_Skill_Berserker_Spartan extends WMUpgrade_Skill;

var array<float> FireRate;

static simulated function bool IsUnAffectedByZedTime(int upgLevel, KFPawn OwnerPawn)
{
	return True;
}

static simulated function GetZedTimeModifier(out float InModifier, int upgLevel, KFWeapon KFW)
{
	local name StateName;

	if (KFW != None)
	{
		StateName = KFW.GetStateName();
		if (class'ZedternalReborn.WMWeaponStates'.static.IsWeaponAttackState(StateName))
		{
			if (KFWeap_MeleeBase(KFW) != None)
				InModifier += default.FireRate[upgLevel - 1];
		}
	}
}

static simulated function RevertUpgradeChanges(Pawn OwnerPawn)
{
	if (KFPawn_Human(OwnerPawn) != None)
			KFPawn_Human(OwnerPawn).bMovesFastInZedTime = False;
}

defaultproperties
{
	FireRate(0)=0.75f
	FireRate(1)=1.5f

	upgradeName="Spartan"
	upgradeDescription(0)="During <font color=\"#ffff00\">ZED Time</font>:\n> <font color=\"#66cc00\">Move in real time</font>\n> <font color=\"#66cc00\">+75%</font> <font color=\"#ff3399\">melee attack speed</font>"
	upgradeDescription(1)="During ZED Time:\n> <font color=\"#66cc00\">Move in real time</font>\n> <font color=\"#b346ea\">+150%</font> <font color=\"#ff3399\">melee attack speed</font>"
	upgradeIcon(0)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_Spartan'
	upgradeIcon(1)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_Spartan_Deluxe'

	Name="Default__WMUpgrade_Skill_Spartan"
}
