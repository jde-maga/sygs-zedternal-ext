class Ext_SWAP_WarVet extends WMUpgrade_Weapon
    abstract;

var float Recoil;
var float RecoilStatic;
var float ReloadRateStatic;

static function bool IsUpgradeCompatible(class<KFWeapon> KFW)
{
    if(class<KFWeap_MeleeBase>(KFW) != none)
    {
        return false;
    }
    else
    {
        if(class<KFWeap_Thrown_C4>(KFW) != none)
        {
            return false;
        }
    }
    return true;
}

static simulated function ModifyRecoil(out float InRecoilModifier, float DefaultRecoilModifier, int upgLevel, KFWeapon KFW)
{
    InRecoilModifier -= (DefaultRecoilModifier * default.RecoilStatic);
    InRecoilModifier -= ((DefaultRecoilModifier * default.Recoil) * float(upgLevel));
}

static simulated function GetReloadRateScale(out float InReloadRateScale, int upgLevel, KFWeapon KFW, KFPawn OwnerPawn)
{
    InReloadRateScale = 1.f * ((1.f * InReloadRateScale) + default.ReloadRateStatic);  
}

defaultproperties
{
    Recoil=0.10
    RecoilStatic=0.50
    ReloadRateStatic=0.250
    WeaponBonus=(incValue=10,MaxValue=-1)
    upgradeName="SWAP War Vet"
    upgradeDescription(0)="Decrease <font color=\"#ff3399\">recoil</font> by <font color=\"#ffcc00\">50%</font> (<font color=\"#66cc00\">+%x%%</font>).\nIncrease <font color=\"#ff3399\">reload speed</font> by <font color=\"#ff0000\">25%</font>."
}