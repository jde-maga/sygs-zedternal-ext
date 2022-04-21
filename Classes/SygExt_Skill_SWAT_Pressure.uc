class SygExt_Skill_SWAT_Pressure extends WMUpgrade_Skill;

var array<float> maxReloadSpeed;

static simulated function GetReloadRateScale(out float InReloadRateScale, int upgLevel, KFWeapon KFW, KFPawn OwnerPawn)
{
	InReloadRateScale = 1.0f / (1.0f / InReloadRateScale + default.maxReloadSpeed[upgLevel - 1] * (1.0f - OwnerPawn.Health / OwnerPawn.HealthMax));
}

defaultproperties
{
	maxReloadSpeed(0)=1.0f
	maxReloadSpeed(1)=10.0f

	upgradeName="Pressure"
	upgradeDescription(0)="For each <font color=\"#ffff00\">percent of HP lost</font>:\n> <font color=\"#66cc00\">+1%</font> <font color=\"#ff3399\">reload speed</font>"
	upgradeDescription(1)="For each <font color=\"#ffff00\">percent of HP lost</font>:\n> <font color=\"#b346ea\">+10%</font> <font color=\"#ff3399\">reload speed</font>"
	upgradeIcon(0)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_Pressure'
	upgradeIcon(1)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_Pressure_Deluxe'

	Name="Default__SygExt_Skill_SWAT_Pressure"
}