Class SygExt_Perk_Sharpshooter extends WMUpgrade_Perk;

var float SharpshooterWeaponsDamage, HeadshotDamage, Recoil, BossDamage;

static function ModifyDamageGiven(out int InDamage, int DefaultDamage, int upgLevel, optional Actor DamageCauser, optional KFPawn_Monster MyKFPM, optional KFPlayerController DamageInstigator, optional class<KFDamageType> DamageType, optional int HitZoneIdx, optional KFWeapon MyKFW)
{
	if (IsWeaponOnSpecificPerk(MyKFW, class'KFGame.KFPerk_Sharpshooter') || IsDamageTypeOnSpecificPerk(DamageType, class'KFGame.KFPerk_Sharpshooter'))
		InDamage += Round(float(DefaultDamage) * default.SharpshooterWeaponsDamage * upgLevel);

	if (HitZoneIdx == HZI_HEAD)
		InDamage += Round(float(DefaultDamage) * default.HeadshotDamage * upgLevel);

    if ((MyKFPM != none) && WMPawn_ZedPatriarch(MyKFPM) != none)
        InDamage += Round((float(DefaultDamage) * default.BossDamage) * float(upgLevel));
    else if ((MyKFPM != none) && WMPawn_ZedFleshpoundKing(MyKFPM) != none)
        InDamage += Round((float(DefaultDamage) * default.BossDamage) * float(upgLevel));
    else if ((MyKFPM != none) && WMPawn_ZedBloatKing(MyKFPM) != none)
        InDamage += Round((float(DefaultDamage) * default.BossDamage) * float(upgLevel));
    else if ((MyKFPM != none) && WMPawn_ZedHans(MyKFPM) != none)
        InDamage += Round((float(DefaultDamage) * default.BossDamage) * float(upgLevel));
    else if ((MyKFPM != none) && WMPawn_ZedMatriarch(MyKFPM) != none)
        InDamage += Round((float(DefaultDamage) * default.BossDamage) * float(upgLevel));
}

static simulated function ModifyRecoilPassive(out float recoilFactor, int upgLevel)
{
	recoilFactor -= recoilFactor * default.Recoil * upgLevel;
}

defaultproperties
{
	SharpshooterWeaponsDamage=0.10f
	HeadshotDamage=0.10f
    BossDamage=0.10f
	Recoil=0.10f

	upgradeName="Sharpshooter"
    upgradeDescription(0)="> <font color=\"#66cc00\">-%x%%</font> <font color=\"#ff3399\">recoil</font>"
	upgradeDescription(1)="> <font color=\"#66cc00\">+%x%%</font> <font color=\"#ff3399\">headshot damage</font>"
	upgradeDescription(2)="> <font color=\"#66cc00\">+%x%%</font> <font color=\"#ff3399\">boss damage</font>"
	upgradeDescription(3)="> <font color=\"#66cc00\">+%x%%</font> <font color=\"#ff3399\">Sharpshooter weapons damage</font>"
	PerkBonus(0)=(baseValue=0, incValue=8, maxValue=-1)
	PerkBonus(1)=(baseValue=0, incValue=10, maxValue=-1)
	PerkBonus(2)=(baseValue=0, incValue=10, maxValue=-1)
	PerkBonus(3)=(baseValue=0, incValue=10, maxValue=-1)
	upgradeIcon(0)=Texture2D'ZedternalReborn_Resource.Perks.UI_Perk_Sharpshooter_Rank_0'
	upgradeIcon(1)=Texture2D'ZedternalReborn_Resource.Perks.UI_Perk_Sharpshooter_Rank_1'
	upgradeIcon(2)=Texture2D'ZedternalReborn_Resource.Perks.UI_Perk_Sharpshooter_Rank_2'
	upgradeIcon(3)=Texture2D'ZedternalReborn_Resource.Perks.UI_Perk_Sharpshooter_Rank_3'
	upgradeIcon(4)=Texture2D'ZedternalReborn_Resource.Perks.UI_Perk_Sharpshooter_Rank_4'
	upgradeIcon(5)=Texture2D'ZedternalReborn_Resource.Perks.UI_Perk_Sharpshooter_Rank_5'

	Name="Default__SygExt_Perk_Sharpshooter"
}
