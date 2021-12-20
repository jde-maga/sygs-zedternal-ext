class SygExt_WeapUpg_SWAP_HighCaliber extends WMUpgrade_Weapon
    abstract;

var float Damage;
var float DamageStatic;
var float RecoilStatic;

static function bool IsUpgradeCompatible(class<KFWeapon> KFW)
{
	if (class<KFWeap_Pistol_Bladed>(KFW) != none)
		return true;
	else if (class<KFWeap_Pistol_DualBladed>(KFW) != none)
		return true;
	else if (class<KFWeap_Rifle_MosinNagant>(KFW) != none)
		return true;
	else if (class<KFWeap_Rifle_FrostShotgunAxe>(KFW) != none)
		return true;

    if(class<KFWeap_MeleeBase>(KFW) != none)                        
        return false;
    else if (class<KFWeap_GrenadeLauncher_Base>(KFW) != none)
        return false;
    else if (class<KFWeap_Thrown_C4>(KFW) != none)
        return false;

    return true;    
}

static function ModifyDamageGiven(out int InDamage, int DefaultDamage, int upgLevel, optional Actor DamageCauser, optional KFPawn_Monster MyKFPM, optional KFPlayerController DamageInstigator, optional class<KFDamageType> DamageType, optional int HitZoneIdx, optional KFWeapon MyKFW)
{
    InDamage += Round(float(DefaultDamage) + default.DamageStatic);
    InDamage += Round((float(DefaultDamage) * default.Damage) * float(upgLevel));  
}

static simulated function ModifyRecoil(out float InRecoilModifier, float DefaultRecoilModifier, int upgLevel, KFWeapon KFW)
{
    InRecoilModifier += (DefaultRecoilModifier * default.RecoilStatic);
}

defaultproperties
{
    Damage=0.10
    DamageStatic=1.0
    RecoilStatic=0.750
    WeaponBonus=(incValue=10,MaxValue=-1)
    upgradeName="SWAP High Caliber"
    upgradeDescription(0)="Increase <font color=\"#ff3399\">damage dealt</font> by <font color=\"#ffcc00\">100%</font> (<font color=\"#66cc00\">+%x%%</font>).\nIncrease <font color=\"#ff3399\">recoil</font> by <font color=\"#ff0000\">75%</font>"
}