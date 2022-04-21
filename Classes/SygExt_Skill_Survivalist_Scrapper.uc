class SygExt_Skill_Survivalist_Scrapper extends WMUpgrade_Skill;

static simulated function InitiateWeapon(int upgLevel, KFWeapon KFW, KFPawn OwnerPawn)
{
	local SygExt_Skill_Survivalist_Scrapper_Helper UPG;
	local bool bFound;

	if (KFPawn_Human(OwnerPawn) != None && OwnerPawn.Role == Role_Authority)
	{
		bFound = False;
		foreach OwnerPawn.ChildActors(class'SygExt_Skill_Survivalist_Scrapper_Helper', UPG)
		{
            UPG.upgLevel = upgLevel;
			bFound = True;
			break;
		}

		if (!bFound)
		{
			UPG = OwnerPawn.Spawn(class'SygExt_Skill_Survivalist_Scrapper_Helper', OwnerPawn);
            UPG.upgLevel = upgLevel;
		}
	}
}

static function WaveEnd(int upgLevel, KFPlayerController KFPC)
{
    local SygExt_Skill_Survivalist_Scrapper_Helper UPG;

    if (KFPC != None && KFPC.Pawn != None) {
        UPG = GetHelper(KFPC.Pawn);
        if (UPG != None) {
            UPG.ResetZedCounter();
        }
    }
}

static function SygExt_Skill_Survivalist_Scrapper_Helper GetHelper(Pawn OwnerPawn)
{
	local SygExt_Skill_Survivalist_Scrapper_Helper UPG;

	if (KFPawn_Human(OwnerPawn) != None)
	{
		foreach OwnerPawn.ChildActors(class'SygExt_Skill_Survivalist_Scrapper_Helper', UPG)
			return UPG;
	}
    //Should have one
	UPG = OwnerPawn.Spawn(class'SygExt_Skill_Survivalist_Scrapper_Helper', OwnerPawn);

	return UPG;
}

static function AddVampireHealth(out int InHealth, int DefaultHealth, int upgLevel, KFPlayerController KFPC, class<DamageType> DT)
{
    local SygExt_Skill_Survivalist_Scrapper_Helper UPG;

    if (KFPC != None && KFPC.Pawn != None) {
        UPG = GetHelper(KFPC.Pawn);
        if (UPG != None) {
            UPG.IncreaseCounter();
        }
    }
}

defaultproperties
{
	upgradeName="Scrapper"
    upgradeDescription(0)="Every <font color=\"#ffff00\">6 ZEDs killed</font>:\n> <font color=\"#66cc00\">+2.5%</font> <font color=\"#ff3399\">ammo regeneration</font> for <font color=\"#ffff00\">unequipped weapons</font>"
    upgradeDescription(1)="Every <font color=\"#b346ea\">2</font> <font color=\"#ffff00\">ZEDs killed</font>:\n> <font color=\"#66cc00\">+2.5%</font> <font color=\"#ff3399\">ammo regeneration</font> for <font color=\"#ffff00\">unequipped weapons</font>"
	upgradeIcon(0)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_Scrapper'
	upgradeIcon(1)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_Scrapper_Deluxe'

	Name="Default__WMUpgrade_Skill_Scrapper"
}
