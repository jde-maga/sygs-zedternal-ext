Class SygExt_WeapUpg_MagSize extends WMUpgrade_Weapon
	abstract;

var float MagSize;

// large cliped weapons and revolver are compatible
static function bool IsUpgradeCompatible( class<KFWeapon> KFW )
{
	if (KFW.default.MagazineCapacity[0] >= 10)
		return true;

	return false;
}

static simulated function ModifyMagSizeAndNumber( out int InMagazineCapacity, int DefaultMagazineCapacity, int upgLevel, KFWeapon KFW, optional array< Class<KFPerk> > WeaponPerkClass, optional bool bSecondary=false, optional name WeaponClassname )
{
	InMagazineCapacity += Round(float(DefaultMagazineCapacity) * default.MagSize * upgLevel);
}

defaultproperties
{
	upgradeName="Magazine Size"
	upgradeDescription(0)="Increase <font color=\"#ff3399\">magazine capacity</font> of this weapon by <font color=\"#66cc00\">%x%%</font>."
	WeaponBonus=(baseValue=0, incValue=10, maxValue=-1)
	MagSize=0.100000

	Name="Default__SygExt_WeapUpg_MagSize"
}
