Class SygExt_WeapUpg_StunPower_Alpha extends WMUpgrade_Weapon
	abstract;

var float StunPower;

// weapons with stun effect are compatible
static function bool IsUpgradeCompatible( class<KFWeapon> KFW )
{
	local class<KFDamageType> KFDT;

	KFDT = class<KFDamageType>(KFW.default.InstantHitDamageTypes[0]);
	if (KFDT != none && KFDT.default.StunPower > 0)
		return true;

	return false;
}

static function ModifyStunPower( out float InStunPower, float DefaultStunPower, int upgLevel, optional class<DamageType> DamageType, optional byte HitZoneIdx)
{
	InStunPower += DefaultStunPower * default.StunPower * upgLevel;
}

defaultproperties
{
	upgradeName="Alpha Stun Power"
	upgradeDescription(0)="Increase <font color=\"#ff3399\">stun power</font> of this weapon by <font color=\"#66cc00\">%x%%</font>."
	WeaponBonus=(baseValue=0, incValue=30, maxValue=-1)
	StunPower=0.300000

	Name="Default__SygExt_WeapUpg_StunPower_Alpha"
}
