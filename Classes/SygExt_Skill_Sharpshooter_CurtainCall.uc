class SygExt_Skill_Sharpshooter_CurtainCall extends WMUpgrade_Skill;

var array<float> Damage;

static simulated function InitiateWeapon(int upgLevel, KFWeapon KFW, KFPawn OwnerPawn)
{
	local SygExt_Skill_Sharpshooter_CurtainCall_Helper UPG;

	if (KFPawn_Human(OwnerPawn) != None && OwnerPawn.Role == Role_Authority)
	{
		foreach OwnerPawn.ChildActors(class'SygExt_Skill_Sharpshooter_CurtainCall_Helper', UPG)
            return;
		
        UPG = OwnerPawn.Spawn(class'SygExt_Skill_Sharpshooter_CurtainCall_Helper', OwnerPawn);
	}
}

static function SygExt_Skill_Sharpshooter_CurtainCall_Helper GetHelper(Pawn OwnerPawn)
{
	local SygExt_Skill_Sharpshooter_CurtainCall_Helper UPG;

	if (KFPawn_Human(OwnerPawn) != None)
	{
		foreach OwnerPawn.ChildActors(class'SygExt_Skill_Sharpshooter_CurtainCall_Helper', UPG)
			return UPG;

		//Should have one
		UPG = OwnerPawn.Spawn(class'SygExt_Skill_Sharpshooter_CurtainCall_Helper', OwnerPawn);
	}

	return UPG;
}

static simulated function DeleteHelperClass(Pawn OwnerPawn)
{
	local SygExt_Skill_Sharpshooter_CurtainCall_Helper UPG;

	if (OwnerPawn != None)
	{
		foreach OwnerPawn.ChildActors(class'SygExt_Skill_Sharpshooter_CurtainCall_Helper', UPG)
		{
			UPG.Destroy();
		}
	}
}

static function ModifyDamageGiven(out int InDamage, int DefaultDamage, int upgLevel, optional Actor DamageCauser, optional KFPawn_Monster MyKFPM, optional KFPlayerController DamageInstigator, optional class<KFDamageType> DamageType, optional int HitZoneIdx, optional KFWeapon MyKFW)
{
    local SygExt_Skill_Sharpshooter_CurtainCall_Helper UPG;
    UPG = GetHelper(DamageInstigator.Pawn);

	if (UPG != None) {
		if (MyKFPM != None && !MyKFPM.bLargeZed && MyKFPM.IsAliveAndWell() && (MyKFPM.Health - InDamage) <= 0)
			UPG.IncreaseCounter();
		else if (MyKFPM != None && MyKFPM.bLargeZed && MyKFPM.IsAliveAndWell()) {
			InDamage += Round(float(DefaultDamage) * (float(UPG.GetStacks()) * default.Damage[upgLevel - 1]));
			if ((MyKFPM.Health - InDamage) <= 0)
				UPG.ResetCounter();
		}
	}
}

defaultproperties
{
    Damage(0)=0.05f;
    Damage(1)=0.10f;
    upgradeName="Curtain Call"
    upgradeDescription(0)="For every <font color=\"#ffff00\">small ZEDs killed</font>:\n> <font color=\"#66cc00\">+5%</font> <font color=\"#ff3399\">damage</font> against <font color=\"#ffff00\">large ZEDs</font> (reset on large ZED kill)"
    upgradeDescription(1)="For every <font color=\"#ffff00\">small ZEDs killed</font>:\n> <font color=\"#b346ea\">+10%</font> <font color=\"#ff3399\">damage</font> against <font color=\"#ffff00\">large ZEDs</font> (reset on large ZED kill)"
    upgradeIcon(0)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_RankThemUp'
	upgradeIcon(1)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_RankThemUp_Deluxe'
    Name="Default__SygExt_Skill_Sharpshooter_CurtainCall"
}