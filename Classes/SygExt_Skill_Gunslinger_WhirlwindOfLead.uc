class SygExt_Skill_Gunslinger_WhirlwindOfLead extends WMUpgrade_Skill;

var float FireRateDeluxe;

static simulated function bool GetIsUberAmmoActive(int upgLevel, KFWeapon KFW, KFPawn OwnerPawn)
{
	return OwnerPawn.Controller.WorldInfo.TimeDilation < 1.0f;
}

static simulated function ModifyRateOfFirePassive(out float rateOfFireFactor, int upgLevel)
{
    if (upgLevel > 1) {
        rateOfFireFactor = 1.0f / (1.0f / rateOfFireFactor + default.FireRateDeluxe);
    }
}

defaultproperties
{
	FireRateDeluxe=0.50f

	upgradeName="Whirlwind Of Lead"
    upgradeDescription(0)="During <font color=\"#ffff00\">ZED time</font>:\n> <font color=\"#66cc00\">Weapons have unlimited ammo</font>"
    upgradeDescription(1)="During <font color=\"#ffff00\">ZED time</font>:\n> <font color=\"#66cc00\">Weapons have unlimited ammo</font>\n> <font color=\"#b346ea\">+50%</font> <font color=\"#ff3399\">fire rate</font>"

	upgradeIcon(0)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_WhirlwindOfLead'
	upgradeIcon(1)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_WhirlwindOfLead_Deluxe'

	Name="Default__SygExt_Skill_Gunslinger_WhirlwindOfLead"
}
