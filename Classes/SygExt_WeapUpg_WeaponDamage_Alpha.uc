Class SygExt_WeapUpg_WeaponDamage_Alpha extends WMUpgrade_Weapon
	abstract;

var float Damage;

// all weapons are compatible
static function bool IsUpgradeCompatible( class<KFWeapon> KFW )
{
	return true;
}

static function ModifyDamageGiven( out int InDamage, int DefaultDamage, int upgLevel, optional Actor DamageCauser, optional KFPawn_Monster MyKFPM, optional KFPlayerController DamageInstigator, optional class<KFDamageType> DamageType, optional int HitZoneIdx, optional KFWeapon MyKFW)
{
	InDamage += Round(float(DefaultDamage) * default.Damage * upgLevel);
}

defaultproperties
{
	upgradeName="Alpha Damage"
	upgradeDescription(0)="Increase <font color=\"#ff3399\">damage dealt</font> with this weapon by <font color=\"#66cc00\">%x%%</font>."
	WeaponBonus=(baseValue=0, incValue=20, maxValue=-1)
	Damage=0.200000
}
