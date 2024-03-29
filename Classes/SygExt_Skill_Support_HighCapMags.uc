class SygExt_Skill_Support_HighCapMags extends WMUpgrade_Skill;

var array<float> MagCapacity;

static simulated function ModifyMagSizeAndNumber(out int InMagazineCapacity, int DefaultMagazineCapacity, int upgLevel, KFWeapon KFW, optional array< class<KFPerk> > WeaponPerkClass, optional bool bSecondary=False, optional name WeaponClassname)
{
	InMagazineCapacity += Round(float(DefaultMagazineCapacity) * default.MagCapacity[upgLevel - 1]);
}

defaultproperties
{
	MagCapacity(0)=0.35f
	MagCapacity(1)=1.00f

	upgradeName="High Capacity Mags"
    upgradeDescription(0)="> <font color=\"#66cc00\">+35%</font> <font color=\"#ff3399\">magazine size</font>"
    upgradeDescription(1)="> <font color=\"#b346ea\">+100%</font> <font color=\"#ff3399\">magazine size</font>"
	upgradeIcon(0)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_HighCapacityMagsB'
	upgradeIcon(1)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_HighCapacityMagsB_Deluxe'

	Name="Default__SygExt_Skill_Support_HighCapMags"
}
