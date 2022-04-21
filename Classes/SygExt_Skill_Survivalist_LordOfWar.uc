class SygExt_Skill_Survivalist_LordOfWar extends WMUpgrade_Skill;

var array<float> Damage;

static function ModifyDamageGiven(out int InDamage, int DefaultDamage, int upgLevel, optional Actor DamageCauser, optional KFPawn_Monster MyKFPM, optional KFPlayerController DamageInstigator, optional class<KFDamageType> DamageType, optional int HitZoneIdx, optional KFWeapon MyKFW)
{
    local KFPawn Player;
    local KFWeapon KFW;
    local int WeaponsCount;
    Player = KFPawn(DamageInstigator.Pawn);
    WeaponsCount = 0;

    if (Player != None && Player.InvManager != None)
    {
        foreach Player.InvManager.InventoryActors(class'KFWeapon', KFW)
        {
            if (KFWeap_Healer_Syringe(KFW) == None && KFWeap_Welder(KFW) == None)
                Weaponscount++;
        }
        InDamage += Round(float(DefaultDamage) * (float(Weaponscount) * default.Damage[upgLevel - 1]));
    }
}

defaultproperties
{
    Damage(0)=0.07f;
    Damage(1)=0.15f;
	upgradeName="Lord of War"
    upgradeDescription(0)="For every <font color=\"#ffff00\">gun owned</font>:\n> <font color=\"#66cc00\">+7%</font> <font color=\"#ff3399\">damage</font>\n\n<i><font color=\"#919191\">Dual variants count as only one</font></i>"
    upgradeDescription(1)="For every <font color=\"#ffff00\">gun owned</font>:\n> <font color=\"#ff3399\">+15%</font> <font color=\"#ff3399\">damage</font>\n\n<i><font color=\"#919191\">Dual variants count as only one</font></i>"
	upgradeIcon(0)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_Fallback'
	upgradeIcon(1)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_Fallback_Deluxe'

	Name="Default__SygExt_Skill_Survivalist_LordOfWar"
}
