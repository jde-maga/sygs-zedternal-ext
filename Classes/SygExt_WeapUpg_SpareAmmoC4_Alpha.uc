Class SygExt_WeapUpg_SpareAmmoC4_Alpha extends WMUpgrade_Weapon
	abstract;

var int SpareAmmo;

// Only C4 are compatible
static function bool IsUpgradeCompatible( class<KFWeapon> KFW )
{
	if (class<KFWeap_Thrown_C4>(KFW) != none)
		return true;

	return false;
}

static simulated function ModifySpareAmmoAmount( out int InSpareAmmo, int DefaultSpareAmmo, int upgLevel, KFWeapon KFW, optional const out STraderItem TraderItem, optional bool bSecondary=false )
{
	InSpareAmmo += default.SpareAmmo * upgLevel;
}

defaultproperties
{
	upgradeName="Alpha C4 Spare Ammo"
	upgradeDescription(0)="Increase <font color=\"#ff3399\">max ammo</font> of this weapon by %x% rounds."
	WeaponBonus=(baseValue=0, incValue=5, maxValue=-1)
	SpareAmmo=5

	Name="Default__SygExt_WeapUpg_SpareAmmoC4_Alpha"
}
