class SygExt_WeapUpg_SWAP_TheDistraction extends WMUpgrade_Weapon
    abstract;

var float StumblePower;
var float StumblePowerStatic;
var float SpareAmmoStatic;

static function bool IsUpgradeCompatible(class<KFWeapon> KFW)
{    
    if(class<KFWeap_AssaultRifle_LazerCutter>(KFW) != none)
        return false;
    else if(class<KFWeap_FlameBase>(KFW) != none)
        return true;

    return false;
}

static function ModifyStumblePower(out float InStumblePower, float DefaultStumblePower, int upgLevel, optional KFPawn KFP, optional class<KFDamageType> DamageType, optional out float CooldownModifier, optional byte BodyPart, optional KFPawn OwnerPawn)
{
    InStumblePower += (DefaultStumblePower * default.StumblePowerStatic);
    InStumblePower += ((DefaultStumblePower * default.StumblePower) * float(upgLevel));
}

static simulated function ModifySpareAmmoAmount(out int InSpareAmmo, int DefaultSpareAmmo, int upgLevel, KFWeapon KFW, const optional out STraderItem TraderItem, optional bool bSecondary=false)
{
    if(!bSecondary)
    {
        InSpareAmmo -= Round(float(DefaultSpareAmmo) * default.SpareAmmoStatic);
    }  
}

defaultproperties
{
    StumblePower=2.0
    StumblePowerStatic=0.250
    SpareAmmoStatic=0.50
    WeaponBonus=(incValue=25,MaxValue=-1)
    upgradeName="SWAP The Distraction"
    upgradeDescription(0)="Increase <font color=\"#ff3399\">stumble power</font> by <font color=\"#ffcc00\">200%</font> (<font color=\"#66cc00\">+%x%%</font>).\nDecrease <font color=\"#ff3399\">spare ammo</font> by <font color=\"#ff0000\">50%</font>."
}