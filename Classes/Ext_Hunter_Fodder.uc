class Ext_Hunter_Fodder extends WMUpgrade_Weapon
    abstract;

var float Damage;

static function bool IsUpgradeCompatible(class<KFWeapon> KFD)
{
    return true;
}

static function ModifyDamageGiven(out int InDamage, int DefaultDamage, int upgLevel, optional Actor DamageCauser, optional KFPawn_Monster MyKFPM, optional KFPlayerController DamageInstigator, optional class<KFDamageType> DamageType, optional int HitZoneIdx, optional KFWeapon MyKFW)
{
    if ((MyKFPM != none) && KFPawn_ZedClot_Alpha(MyKFPM) != none)
        InDamage += Round((float(DefaultDamage) * default.Damage) * float(upgLevel));
    else if ((MyKFPM != none) && KFPawn_ZedClot_AlphaKing(MyKFPM) != none)
        InDamage += Round((float(DefaultDamage) * default.Damage) * float(upgLevel));
    else if ((MyKFPM != none) && KFPawn_ZedCrawler(MyKFPM) != none)
        InDamage += Round((float(DefaultDamage) * default.Damage) * float(upgLevel));
    else if ((MyKFPM != none) && KFPawn_ZedCrawlerKing(MyKFPM) != none)
        InDamage += Round((float(DefaultDamage) * default.Damage) * float(upgLevel));
    else if ((MyKFPM != none) && KFPawn_ZedClot_Cyst(MyKFPM) != none)
        InDamage += Round((float(DefaultDamage) * default.Damage) * float(upgLevel));
    else if ((MyKFPM != none) && KFPawn_ZedGorefast(MyKFPM) != none)
        InDamage += Round((float(DefaultDamage) * default.Damage) * float(upgLevel));
    else if ((MyKFPM != none) && KFPawn_ZedGorefastDualBlade(MyKFPM) != none)
        InDamage += Round((float(DefaultDamage) * default.Damage) * float(upgLevel));
    else if ((MyKFPM != none) && KFPawn_ZedClot_Slasher(MyKFPM) != none)
        InDamage += Round((float(DefaultDamage) * default.Damage) * float(upgLevel));
    else if ((MyKFPM != none) && KFPawn_ZedStalker(MyKFPM) != none)
        InDamage += Round((float(DefaultDamage) * default.Damage) * float(upgLevel));
    else if ((MyKFPM != none) && WMPawn_ZedClot_Alpha_NoRiot(MyKFPM) != none)
        InDamage += Round((float(DefaultDamage) * default.Damage) * float(upgLevel));
    else if ((MyKFPM != none) && WMPawn_ZedClot_Slasher_Omega(MyKFPM) != none)
        InDamage += Round((float(DefaultDamage) * default.Damage) * float(upgLevel));
    else if ((MyKFPM != none) && WMPawn_ZedCrawler_Big(MyKFPM) != none)
        InDamage += Round((float(DefaultDamage) * default.Damage) * float(upgLevel));
    else if ((MyKFPM != none) && WMPawn_ZedCrawler_Huge(MyKFPM) != none)
        InDamage += Round((float(DefaultDamage) * default.Damage) * float(upgLevel));
    else if ((MyKFPM != none) && WMPawn_ZedCrawler_Medium(MyKFPM) != none)
        InDamage += Round((float(DefaultDamage) * default.Damage) * float(upgLevel));
    else if ((MyKFPM != none) && WMPawn_ZedCrawler_Mini(MyKFPM) != none)
        InDamage += Round((float(DefaultDamage) * default.Damage) * float(upgLevel));
    else if ((MyKFPM != none) && WMPawn_ZedCrawler_NoElite(MyKFPM) != none)
        InDamage += Round((float(DefaultDamage) * default.Damage) * float(upgLevel));
    else if ((MyKFPM != none) && WMPawn_ZedCrawler_Ultra(MyKFPM) != none)
        InDamage += Round((float(DefaultDamage) * default.Damage) * float(upgLevel));
    else if ((MyKFPM != none) && WMPawn_ZedGorefast_NoDualBlade(MyKFPM) != none)
        InDamage += Round((float(DefaultDamage) * default.Damage) * float(upgLevel));
     else if ((MyKFPM != none) && WMPawn_ZedGorefast_Omega(MyKFPM) != none)
        InDamage += Round((float(DefaultDamage) * default.Damage) * float(upgLevel));
    else if ((MyKFPM != none) && WMPawn_ZedStalker_NoDAR(MyKFPM) != none)
        InDamage += Round((float(DefaultDamage) * default.Damage) * float(upgLevel));
    else if ((MyKFPM != none) && WMPawn_ZedStalker_Omega(MyKFPM) != none)
        InDamage += Round((float(DefaultDamage) * default.Damage) * float(upgLevel));
}

defaultproperties
{
    Damage=0.20
    WeaponBonus=(incValue=20,MaxValue=-1)
    upgradeName="Hunter: Fodder"
    upgradeDescription(0)="Increase <font color=\"#ff3399\">damage</font> of this weapon by <font color=\"#66cc00\">%x%%</font> against <font color=\"#ffff00\">all types of Clots, Cysts, Slashers, Gorefasts, Stalkers and Crawlers</font>."
}