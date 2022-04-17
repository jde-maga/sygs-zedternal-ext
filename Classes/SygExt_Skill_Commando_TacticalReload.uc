class SygExt_Skill_Commando_TacticalReload extends WMUpgrade_Skill;

var array<float> ReloadRate;

static simulated function GetReloadRateScalePassive(out float reloadRateFactor, int upgLevel)
{
	if (upgLevel > 1)
		reloadRateFactor = 1.0f / (1.0f / reloadRateFactor + default.ReloadRate[upgLevel - 1]);
}

defaultproperties
{
    ReloadRate(0)=0.25f
    ReloadRate(1)=0.50f

	upgradeName="Tactical Reload"

    upgradeDescription(0)="> <font color=\"#66cc00\">+25%</font> <font color=\"#ff3399\">reload speed</font>"
    upgradeDescription(1)="> <font color=\"#b346ea\">+50%</font> <font color=\"#ff3399\">reload speed</font>"
	upgradeIcon(0)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_TacticalReload'
	upgradeIcon(1)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_TacticalReload_Deluxe'

	Name="Default__WMUpgrade_Skill_TacticalReload"
}
