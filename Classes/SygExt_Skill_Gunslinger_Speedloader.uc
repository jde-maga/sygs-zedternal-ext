class SygExt_Skill_Gunslinger_Speedloader extends WMUpgrade_Skill;

var array<float> ReloadSpeed;

static simulated function GetReloadRateScale(out float InReloadRateScale, int upgLevel, KFWeapon KFW, KFPawn OwnerPawn)
{
	local float Load;

	if (KFW != None)
	{
        Load = (float(KFW.AmmoCount[0]) / float(KFW.MagazineCapacity[0])) * 100.00f;
		InReloadRateScale = 1.0f / (1.0f / InReloadRateScale + (Load * default.ReloadSpeed[upgLevel - 1]));
	}
}

defaultproperties
{
    ReloadSpeed(0)=0.01f
    ReloadSpeed(1)=0.05f
	upgradeName="Speedloader"
    upgradeDescription(0)="> <font color=\"#66cc00\">+1%</font> <font color=\"#ff3399\">reload speed</font> per <font color=\"#ffff00\">percent of bullets left in magazine</font>"
    upgradeDescription(1)="> <font color=\"#b346ea\">+5%</font> <font color=\"#ff3399\">reload speed</font> per <font color=\"#ffff00\">percent of bullets left in magazine</font>"
	upgradeIcon(0)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_Speedloader'
	upgradeIcon(1)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_Speedloader_Deluxe'
	Name="Default__SygExt_Skill_Gunslinger_Speedloader"
}
