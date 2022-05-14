class SygExt_Skill_Gunslinger_MagicBullet extends WMUpgrade_Skill;

static simulated function InitiateWeapon(int upgLevel, KFWeapon KFW, KFPawn OwnerPawn)
{
	local SygExt_Skill_Gunslinger_MagicBullet_Helper UPG;

	if (KFPawn_Human(OwnerPawn) != None && OwnerPawn.Role == Role_Authority)
	{
		foreach OwnerPawn.ChildActors(class'SygExt_Skill_Gunslinger_MagicBullet_Helper', UPG)
            return;

		UPG = OwnerPawn.Spawn(class'SygExt_Skill_Gunslinger_MagicBullet_Helper', OwnerPawn);
        UPG.bDeluxe = (upgLevel > 1);
	}
}

static function SygExt_Skill_Gunslinger_MagicBullet_Helper GetHelper(Pawn OwnerPawn, int upgLevel)
{
	local SygExt_Skill_Gunslinger_MagicBullet_Helper UPG;

	if (KFPawn_Human(OwnerPawn) != None)
	{
		foreach OwnerPawn.ChildActors(class'SygExt_Skill_Gunslinger_MagicBullet_Helper', UPG)
		    return UPG;

		//Should have one
		UPG = OwnerPawn.Spawn(class'SygExt_Skill_Gunslinger_MagicBullet_Helper', OwnerPawn);
        UPG.bDeluxe = (upgLevel > 1);
	}

	return UPG;
}

static simulated function DeleteHelperClass(Pawn OwnerPawn)
{
	local SygExt_Skill_Gunslinger_MagicBullet_Helper UPG;

	if (OwnerPawn != None)
		foreach OwnerPawn.ChildActors(class'SygExt_Skill_Gunslinger_MagicBullet_Helper', UPG)
			UPG.Destroy();
}

static function AddVampireHealth(out int InHealth, int DefaultHealth, int upgLevel, KFPlayerController KFPC, class<DamageType> DT)
{
	local SygExt_Skill_Gunslinger_MagicBullet_Helper UPG;

	UPG = GetHelper(KFPC.Pawn, upgLevel);
	if (UPG != None)
	{
		if (UPG.Player.WorldInfo.NetMode == NM_Standalone) // For single player
			UPG.StandaloneUpdateAmmo(1);
		else // For servers
			UPG.ServerUpdateAmmo(1);
	}
}

static function WaveEnd(int upgLevel, KFPlayerController KFPC)
{
    local SygExt_Skill_Gunslinger_MagicBullet_Helper UPG;

	UPG = GetHelper(KFPC.Pawn, upgLevel);
	if (UPG != None)
        UPG.ResetCounter();
}

static simulated function ModifyWeaponSwitchTime(out float InSwitchTime, float DefaultSwitchTime, int upgLevel, KFWeapon KFW)
{
    local SygExt_Skill_Gunslinger_MagicBullet_Helper UPG;

	UPG = GetHelper(KFPawn(KFW.Owner), upgLevel);
	if (UPG != None)
        UPG.ResetCounter(); 
}

static simulated function GetReloadRateScale(out float InReloadRateScale, int upgLevel, KFWeapon KFW, KFPawn OwnerPawn)
{
    local SygExt_Skill_Gunslinger_MagicBullet_Helper UPG;

	UPG = GetHelper(OwnerPawn, upgLevel);
	if (UPG != None)
        UPG.ResetCounter();
}

defaultproperties
{
    upgradeName="Magic Bullet"
    upgradeDescription(0)="When <font color=\"#ffff00\">killing a ZED</font>:\n> <font color=\"#66cc00\">+1</font> <font color=\"#ff3399\">ammo regen</font>\n\n<i>Regen cannot exceed magazine size, reset on reload</i>"
    upgradeDescription(1)="When <font color=\"#ffff00\">killing a ZED</font>:\n> <font color=\"#66cc00\">+1</font> <font color=\"#ff3399\">ammo regen</font>"
    upgradeIcon(0)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_MagicBullet'
	upgradeIcon(1)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_MagicBullet_Deluxe'

	Name="Default__SygExt_Skill_Gunslinger_MagicBullet"

}