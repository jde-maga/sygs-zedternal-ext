Class SygExt_WeapUpg_HeadshotDamage_Alpha extends WMUpgrade_Weapon
	abstract;

var float Damage;

// Revolvers, Rifles and SMGs are compatible
static function bool IsUpgradeCompatible( class<KFWeapon> KFW )
{
	if (class<KFWeap_Pistol_Blunderbuss>(KFW) != none)
		return false;
	else if (class<KFWeap_Rifle_MosinNagant>(KFW) != none)
		return true;
	else if (class<KFWeap_Bow_CompoundBow>(KFW) != none)
		return true;
	else if (class<KFWeap_HRG_Nailgun>(KFW) != none)
		return true;
	else if (class<KFWeap_Pistol_Bladed>(KFW) != none)
		return true;
	else if (class<KFWeap_Pistol_DualBladed>(KFW) != none)
		return true;
	else if (class<KFWeap_PistolBase>(KFW) != none)
		return true;
	else if (class<KFWeap_RifleBase>(KFW) != none)
		return true;
	else if (class<KFWeap_SMGBase>(KFW) != none)
		return true;
	else if (class<KFWeap_ScopedBase>(KFW) != none)
		return true;

	return false;
}

static function ModifyDamageGiven( out int InDamage, int DefaultDamage, int upgLevel, optional Actor DamageCauser, optional KFPawn_Monster MyKFPM, optional KFPlayerController DamageInstigator, optional class<KFDamageType> DamageType, optional int HitZoneIdx, optional KFWeapon MyKFW)
{
	if (HitZoneIdx == HZI_HEAD)
		InDamage += Round(float(DefaultDamage) * default.Damage * upgLevel);
}

defaultproperties
{
	upgradeName="Alpha Headshot Damage"
	upgradeDescription(0)="Increase <font color=\"#ff3399\">headshot damage</font> with this weapon by <font color=\"#66cc00\">%x%%</font>."
	WeaponBonus=(baseValue=0, incValue=20, maxValue=-1)
	Damage=0.200000

	Name="Default__SygExt_WeapUpg_HeadshotDamage_Alpha"
}
