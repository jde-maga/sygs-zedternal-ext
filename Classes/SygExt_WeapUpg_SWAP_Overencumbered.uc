
class SygExt_WeapUpg_SWAP_Overencumbered extends WMUpgrade_Weapon
    abstract;

var float SpareAmmo;
var float SpareAmmoStatic;
var float ReloadRateStatic;

static function bool IsUpgradeCompatible(class<KFWeapon> KFW)
{
	if (class<KFWeap_Pistol_Bladed>(KFW) != none)
		return false;
	else if (class<KFWeap_Pistol_DualBladed>(KFW) != none)
		return false;
	else if (class<KFWeap_Rifle_MosinNagant>(KFW) != none)
		return false;
	else if (class<KFWeap_Rifle_FrostShotgunAxe>(KFW) != none)
		return false;
    else if(class<KFWeap_MeleeBase>(KFW) != none)
        return false;
    else if(class<KFWeap_Thrown_C4>(KFW) != none)
        return false;

    return true; 
}

static simulated function ModifySpareAmmoAmount(out int InSpareAmmo, int DefaultSpareAmmo, int upgLevel, KFWeapon KFW, optional const out STraderItem TraderItem, optional bool bSecondary=false)
{
    if(!bSecondary)
    {
        InSpareAmmo += Round(float(DefaultSpareAmmo) * default.SpareAmmo);
        InSpareAmmo += Round((float(DefaultSpareAmmo) * default.SpareAmmo) * upgLevel);
    }
}

static simulated function GetReloadRateScale(out float InReloadRateScale, int upgLevel, KFWeapon KFW, KFPawn OwnerPawn)
{
    InReloadRateScale = 1.f * ((1.f * InReloadRateScale) + default.ReloadRateStatic);
}

defaultproperties
{
    SpareAmmo=0.20
    SpareAmmoStatic=2.0
    ReloadRateStatic=0.250
    WeaponBonus=(incValue=20,MaxValue=-1)
    upgradeName="SWAP Over Encumbered"
    upgradeDescription(0)="Increase <font color=\"#ff3399\">spare ammo</font> by <font color=\"#ffcc00\">200%</font> (<font color=\"#66cc00\">+%x%%</font>).\nDecrease <font color=\"#ff3399\">reload speed</font> by <font color=\"#ff0000\">25%</font>."

    Name="Default__SygExt_WeapUpg_SWAP_Overencumbered"
}