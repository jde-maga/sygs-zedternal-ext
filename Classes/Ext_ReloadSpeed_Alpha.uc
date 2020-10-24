Class Ext_ReloadSpeed_Alpha extends WMUpgrade_Weapon
	abstract;

var float ReloadRate;

// melee and thrown weapons are not compatible
static function bool IsUpgradeCompatible( class<KFWeapon> KFW )
{
	if (class<KFWeap_Rifle_MosinNagant>(KFW) != none)
		return true;
	else if (class<KFWeap_MeleeBase>(KFW) != none)
		return false;
	else if (class<KFWeap_ThrownBase>(KFW) != none)
		return false;

	return true;
}

static simulated function GetReloadRateScale( out float InReloadRateScale, int upgLevel, KFWeapon KFW, KFPawn OwnerPawn)
{
	InReloadRateScale = 1.f / (1.f/InReloadRateScale + default.ReloadRate * upgLevel);
}

defaultproperties
{
	upgradeName="Alpha Reload Speed"
	upgradeDescription(0)="Increase <font color=\"#ff3399\">reload speed</font> of this weapon by <font color=\"#66cc00\">%x%%</font>."
	WeaponBonus=(baseValue=0, incValue=20, maxValue=-1)
	ReloadRate=0.200000
}
