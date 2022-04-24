class SygExt_Skill_Sharpshooter_Ambush extends WMUpgrade_Skill;

var array<float> Damage;

static simulated function InitiateWeapon(int upgLevel, KFWeapon KFW, KFPawn OwnerPawn)
{
	local SygExt_Skill_Sharpshooter_Ambush_Helper UPG;

	if (KFPawn_Human(OwnerPawn) != None && OwnerPawn.Role == Role_Authority)
	{
		foreach OwnerPawn.ChildActors(class'SygExt_Skill_Sharpshooter_Ambush_Helper', UPG)
            return;
		
        UPG = OwnerPawn.Spawn(class'SygExt_Skill_Sharpshooter_Ambush_Helper', OwnerPawn);
	}
}

static function SygExt_Skill_Sharpshooter_Ambush_Helper GetHelper(Pawn OwnerPawn)
{
	local SygExt_Skill_Sharpshooter_Ambush_Helper UPG;

	if (KFPawn_Human(OwnerPawn) != None)
	{
		foreach OwnerPawn.ChildActors(class'SygExt_Skill_Sharpshooter_Ambush_Helper', UPG)
			return UPG;

		//Should have one
		UPG = OwnerPawn.Spawn(class'SygExt_Skill_Sharpshooter_Ambush_Helper', OwnerPawn);
	}

	return UPG;
}

static simulated function DeleteHelperClass(Pawn OwnerPawn)
{
	local SygExt_Skill_Sharpshooter_Ambush_Helper UPG;

	if (OwnerPawn != None)
	{
		foreach OwnerPawn.ChildActors(class'SygExt_Skill_Sharpshooter_Ambush_Helper', UPG)
		{
			UPG.Destroy();
		}
	}
}

static function ModifyDamageGiven(out int InDamage, int DefaultDamage, int upgLevel, optional Actor DamageCauser, optional KFPawn_Monster MyKFPM, optional KFPlayerController DamageInstigator, optional class<KFDamageType> DamageType, optional int HitZoneIdx, optional KFWeapon MyKFW)
{
	local SygExt_Skill_Sharpshooter_Ambush_Helper UPG;

    UPG = GetHelper(DamageInstigator.Pawn);

    if (HitZoneIdx == HZI_HEAD) {
        InDamage += Round(float(DefaultDamage) * (float(UPG.GetAmbushStacks()) * default.Damage[upgLevel - 1]));
        UPG.ResetStacks(); 
    }
}

defaultproperties
{
    Damage(0)=0.50f;
    Damage(1)=1.25f;
    upgradeName="Ambush"
    upgradeDescription(0)="For every <font color=\"#ffff00\">second without headshot</font>:\n> <font color=\"#66cc00\">+50%</font> <font color=\"#ff3399\">headshot damage</font>"
    upgradeDescription(1)="For every <font color=\"#ffff00\">second without headshot</font>:\n> <font color=\"#b346ea\">+125%</font> <font color=\"#ff3399\">headshot damage</font>"
	upgradeIcon(0)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_RankThemUp'
	upgradeIcon(1)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_RankThemUp_Deluxe'
    Name="Default__SygExt_Skill_Sharpshooter_Ambush"
}