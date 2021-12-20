Class SygExt_WeapUpg_MagSizeSmall_Alpha extends WMUpgrade_Weapon
	abstract;

var int MagSize;

// small cliped weapons are compatible
static function bool IsUpgradeCompatible( class<KFWeapon> KFW )
{
	if (KFW.default.MagazineCapacity[0] >= 5 && KFW.default.MagazineCapacity[0] < 10)
		return true;

	return false;
}

static simulated function ModifyMagSizeAndNumber( out int InMagazineCapacity, int DefaultMagazineCapacity, int upgLevel, KFWeapon KFW, optional array< Class<KFPerk> > WeaponPerkClass, optional bool bSecondary=false, optional name WeaponClassname )
{
	InMagazineCapacity += default.MagSize * upgLevel;
}

defaultproperties
{
	upgradeName="Alpha Magazine Size"
	upgradeDescription(0)="Increase <font color=\"#ff3399\">magazine capacity</font> of this weapon by <font color=\"#66cc00\">%x%</font> round(s)."
	WeaponBonus=(baseValue=0, incValue=2, maxValue=-1)
	MagSize=2
}
