class SygExt_Skill_SWAT_BatteringRam extends WMUpgrade_Skill;

var float Speed;

static simulated function bool IsUnAffectedByZedTime(int upgLevel, KFPawn OwnerPawn)
{
	return True;
}

static simulated function bool ShouldKnockDownOnBump(int upgLevel, KFPawn_Monster KFPM, KFPawn OwnerPawn)
{
	if (OwnerPawn.WorldInfo.TimeDilation < 1)
	{
		return True;
	}
	return False;
}

static simulated function ModifySpeed(out float InSpeed, float DefaultSpeed, int upgLevel, KFPawn OwnerPawn)
{
	if (WMPawn_Human(OwnerPawn) != None && WMPawn_Human(OwnerPawn).ZedternalArmor <= 0 && upgLevel == 2)
		InSpeed += DefaultSpeed * default.Speed;
}


static simulated function RevertUpgradeChanges(Pawn OwnerPawn)
{
	if (KFPawn_Human(OwnerPawn) != None)
			KFPawn_Human(OwnerPawn).bMovesFastInZedTime = False;
}


defaultproperties
{
	Speed=0.3f

	upgradeName="Battering Ram"
	upgradeDescription(0)="During <font color=\"#ffff00\">ZED Time</font>:\n> <font color=\"#66cc00\">Move in real time</font>\n> <font color=\"#66cc00\">Knock down ZEDs</font> on <font color=\"#ffff00\">contact</font>"
	upgradeDescription(1)="During <font color=\"#ffff00\">ZED Time</font>:\n> <font color=\"#66cc00\">Move in real time</font>\n> <font color=\"#66cc00\">Knock down ZEDs</font> on <font color=\"#ffff00\">contact</font>\n> <font color=\"#b346ea\">+30%</font> <font color=\"#ff3399\">movement speed</font>"
	upgradeIcon(0)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_TacticalMovement'
	upgradeIcon(1)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_TacticalMovement_Deluxe'

	Name="Default__WMUpgrade_Skill_AssaultArmor"
}
