Class SygExt_WeapUpg_KnockdownPower_Alpha extends WMUpgrade_Weapon
	abstract;

var float KnockdownPower;

// weapons with stun effect are compatible
static function bool IsUpgradeCompatible( class<KFWeapon> KFW )
{
	local class<KFDamageType> KFDT;

	KFDT = class<KFDamageType>(KFW.default.InstantHitDamageTypes[0]);
	if (KFDT != none && KFDT.default.KnockdownPower > 0)
		return true;

	return false;
}

static function ModifyKnockdownPower( out float InKnockdownPower, float DefaultKnockdownPower, int upgLevel, KFPawn OwnerPawn, optional class<DamageType> DamageType, optional byte BodyPart, optional bool bIsSprinting=false)
{
	InKnockdownPower += DefaultKnockdownPower * default.KnockdownPower * upgLevel;
}

defaultproperties
{
	upgradeName="Alpha Knockdown Effect"
	upgradeDescription(0)="Increase <font color=\"#ff3399\">knockdown power</font> of this weapon by <font color=\"#66cc00\">%x%%</font>."
	WeaponBonus=(baseValue=0, incValue=30, maxValue=-1)
	KnockdownPower=0.300000

	Name="Default__SygExt_WeapUpg_KnockdownPower_Alpha"
}
