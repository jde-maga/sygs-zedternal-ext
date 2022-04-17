class SygExt_Skill_Commando_Tactician extends WMUpgrade_Skill;

var array<float> Mod;

static simulated function GetZedTimeModifier(out float InModifier, int upgLevel, KFWeapon KFW)
{
	local name StateName;
	StateName = KFW.GetStateName();

	if (class'ZedternalReborn.WMWeaponStates'.static.IsWeaponReloadState(StateName) || class'ZedternalReborn.WMWeaponStates'.static.IsWeaponSwitchState(StateName))
		InModifier += default.Mod[upgLevel - 1];
}

defaultproperties
{
	Mod(0)=1.00f
	Mod(1)=2.00f

	upgradeName="Tactician"
    upgradeDescription(0)="During <font color=\"#ffff00\">ZED time</font>:\n> <font color=\"#66cc00\">Reload in real time</font>\n> <font color=\"#66cc00\">Switch weapons in real time</font>"
    upgradeDescription(1)="During <font color=\"#ffff00\">ZED time</font>:\n> <font color=\"#66cc00\">Reload in reload time</font>\n> <font color=\"#66cc00\">Switch weapons in real time</font>\n> <font color=\"#b346ea\">+100%</font> <font color=\"#ff3399\">reload speed</font>\n> <font color=\"#b346ea\">+100%</font> <font color=\"#ff3399\">switch speed</font>"
	upgradeIcon(0)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_Tactician'
	upgradeIcon(1)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_Tactician_Deluxe'

	Name="Default__WMUpgrade_Skill_Tactician"
}
