class SygExt_Skill_Sharpshooter_RackEmUp extends WMUpgrade_Skill;

var float Damage;
var array<int> MaxStacks;

static simulated function InitiateWeapon(int upgLevel, KFWeapon KFW, KFPawn OwnerPawn)
{
	local SygExt_Skill_Sharpshooter_RackEmUp_Helper UPG;
	local bool bFound;

	if (KFPawn_Human(OwnerPawn) != None && OwnerPawn.Role == Role_Authority)
	{
		bFound = False;
		foreach OwnerPawn.ChildActors(class'SygExt_Skill_Sharpshooter_RackEmUp_Helper', UPG)
		{
			bFound = True;
			break;
		}

		if (!bFound)
        {
			UPG = OwnerPawn.Spawn(class'SygExt_Skill_Sharpshooter_RackEmUp_Helper', OwnerPawn);
            UPG.bDeluxe = (upgLevel > 1);
        }
	}
}

static function SygExt_Skill_Sharpshooter_RackEmUp_Helper GetHelper(Pawn OwnerPawn, int upgLevel)
{
	local SygExt_Skill_Sharpshooter_RackEmUp_Helper UPG;

	if (KFPawn_Human(OwnerPawn) != None)
	{
		foreach OwnerPawn.ChildActors(class'SygExt_Skill_Sharpshooter_RackEmUp_Helper', UPG)
		{
			return UPG;
		}

		//Should have one
		UPG = OwnerPawn.Spawn(class'SygExt_Skill_Sharpshooter_RackEmUp_Helper', OwnerPawn);
        UPG.bDeluxe = (upgLevel > 1);
	}

	return UPG;
}

static simulated function DeleteHelperClass(Pawn OwnerPawn)
{
	local SygExt_Skill_Sharpshooter_RackEmUp_Helper UPG;

	if (OwnerPawn != None)
	{
		foreach OwnerPawn.ChildActors(class'SygExt_Skill_Sharpshooter_RackEmUp_Helper', UPG)
		{
			UPG.Destroy();
		}
	}
}

static function ModifyDamageGiven(out int InDamage, int DefaultDamage, int upgLevel, optional Actor DamageCauser, optional KFPawn_Monster MyKFPM, optional KFPlayerController DamageInstigator, optional class<KFDamageType> DamageType, optional int HitZoneIdx, optional KFWeapon MyKFW)
{
	local SygExt_Skill_Sharpshooter_RackEmUp_Helper UPG;

	if (DamageType != None && MyKFPM != None && DamageInstigator != None && DamageInstigator.Pawn != None && MyKFPM.IsAliveAndWell() && !MyKFPM.bCheckingExtraHeadDamage)
	{
        UPG = GetHelper(DamageInstigator.Pawn, upgLevel);
        if (UPG != None) {
            InDamage += Round(float(DefaultDamage) * (default.Damage * float(UPG.Headshot)));
            if (HitZoneIdx == HZI_HEAD) {
                UPG.IncreaseCounter();
            }
        }
	}

}

defaultproperties
{
    Damage=0.10f
	upgradeName="Rack 'em up"
    upgradeDescription(0)="On dealing an <font color=\"#ffff00\">headshot</font>:\n> <font color=\"#66cc00\">+10%</font> <font color=\"#ff3399\">damage</font> for <font color=\"#ffff00\">7 seconds</font>, stacking up to <font color=\"#ffff00\">5 times</font>"
    upgradeDescription(1)="On dealing an <font color=\"#ffff00\">headshot</font>:\n> <font color=\"#66cc00\">+10%</font> <font color=\"#ff3399\">damage</font> for <font color=\"#ffff00\">7 seconds</font>, stacking up to <font color=\"#b346ea\">15 times</font>"
	upgradeIcon(0)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_RankThemUp'
	upgradeIcon(1)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_RankThemUp_Deluxe'
	Name="Default__SygExt_Skill_Sharpshooter_RackEmUp"
}
