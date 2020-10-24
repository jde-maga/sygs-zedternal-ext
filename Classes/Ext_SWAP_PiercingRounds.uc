class Ext_SWAP_PiercingRounds extends WMUpgrade_Weapon
    abstract;

var float Penetration;
var float PenetrationStatic;
var float RateOfFireStatic;

static function bool IsUpgradeCompatible(class<KFWeapon> KFW)
{
    if(KFW.default.PenetrationPower[0] > float(0))
    {
        return true;
    }
    return false;
}

static simulated function ModifyPenetration(out float InPenetration, float DefaultPenetration, int upgLevel, class<KFDamageType> DamageType, KFPawn OwnerPawn, optional bool bForce)
{
    InPenetration += (DefaultPenetration * default.PenetrationStatic);
    InPenetration += ((DefaultPenetration * default.Penetration) * float(upgLevel));
}

static simulated function ModifyRateOfFire(out float InRate, float DefaultRate, int upgLevel, KFWeapon KFW)
{
    InRate = DefaultRate / ((DefaultRate / InRate) - default.RateOfFireStatic);
}

defaultproperties
{
    Penetration=0.50
    PenetrationStatic=4.0
    RateOfFireStatic=0.250
    WeaponBonus=(incValue=50,MaxValue=-1)
    upgradeName="SWAP Piercing Rounds"
    upgradeDescription(0)="Increase <font color=\"#ff3399\">penetration</font> by <font color=\"#ffcc00\">400%</font> (<font color=\"#66cc00\">+%x%%</font>).\nDecrease <font color=\"#ff3399\">rate of fire</font> by <font color=\"#ff0000\">25%</font>."
}