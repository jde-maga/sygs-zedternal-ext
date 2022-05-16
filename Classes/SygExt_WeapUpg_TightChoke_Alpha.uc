Class SygExt_WeapUpg_TightChoke_Alpha extends WMUpgrade_Weapon
	abstract;

var float Spread;

// Only Shotgun are compatible
static function bool IsUpgradeCompatible( class<KFWeapon> KFW )
{
	if (class<KFWeap_ShotgunBase>(KFW) != none)
		return true;
	else if (class<KFWeap_HRG_Revolver_Buckshot>(KFW) != none)
		return true;
	else if (class<KFWeap_Pistol_Blunderbuss>(KFW) != none)
		return true;
	else if (class<KFWeap_Shotgun_Medic>(KFW) != none)
		return true;
	else if (class<KFWeap_Rifle_FrostShotgunAxe>(KFW) != none)
		return true;
	else if (class<KFWeap_Shotgun_HRG_Kaboomstick>(KFW) != none)
		return true;

	return false;
}

static simulated function ModifyTightChokePassive( out float tightChokeFactor, int upgLevel)
{
	tightChokeFactor -= default.Spread * upgLevel;
}

defaultproperties
{
	upgradeName="Alpha Tight Choke"
	upgradeDescription(0)="Decrease <font color=\"#ff3399\">shot spread</font> of this weapon by <font color=\"#66cc00\">%x%%</font>."
	WeaponBonus=(baseValue=0, incValue=30, maxValue=-1)
	Spread=0.300000

	Name="Default__SygExt_WeapUpg_TightChoke_Alpha"
}
