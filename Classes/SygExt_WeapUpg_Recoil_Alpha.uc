Class SygExt_WeapUpg_Recoil_Alpha extends WMUpgrade_Weapon
	abstract;

var float Recoil;

// Revolvers, Rifles, SMGs and Medic weapons are compatible
static function bool IsUpgradeCompatible( class<KFWeapon> KFW )
{
	if (KFW.default.MagazineCapacity[0] <= 1)
		return false;
	else if (class<KFWeap_Pistol_Blunderbuss>(KFW) != none)
		return false;
	else if (class<KFWeap_PistolBase>(KFW) != none)
		return true;
	else if (class<KFWeap_RifleBase>(KFW) != none)
		return true;
	else if (class<KFWeap_SMGBase>(KFW) != none)
		return true;
	else if (class<KFWeap_ScopedBase>(KFW) != none)
		return true;
	else if (class<KFWeap_MedicBase>(KFW) != none)
		return true;
	else if (class<KFWeap_Rifle_MosinNagant>(KFW) != none)
		return true;
	else if (class<KFWeap_HRG_Nailgun>(KFW) != none)
		return true;
	else if (class<KFWeap_Pistol_Bladed>(KFW) != none)
		return true;
	else if (class<KFWeap_Pistol_DualBladed>(KFW) != none)
		return true;
	else if (class<KFWeap_Rifle_FrostShotgunAxe>(KFW) != none)
		return true;

	return false;
}

static simulated function ModifyRecoil( out float InRecoilModifier, float DefaultRecoilModifier, int upgLevel, KFWeapon KFW)
{
	InRecoilModifier -= DefaultRecoilModifier * default.Recoil * upgLevel;
}

defaultproperties
{
	upgradeName="Alpha Recoil"
	upgradeDescription(0)="Decrease <font color=\"#ff3399\">recoil</font> of this weapon by <font color=\"#66cc00\">%x%%</font>."
	WeaponBonus=(baseValue=0, incValue=30, maxValue=95)
	Recoil=0.300000
}
