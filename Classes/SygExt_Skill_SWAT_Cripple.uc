class SygExt_Skill_SWAT_Cripple extends WMUpgrade_Skill;

var array<float> Snare;

static function ModifySnarePowerPassive(out float snarePowerFactor, int upgLevel)
{
	snarePowerFactor += default.Snare[upgLevel - 1];
}

defaultproperties
{
	Snare(0)=10.0f
    Snare(1)=999.0f

	upgradeName="Cripple"
	upgradeDescription(0)="On <font color=\"#ffff00\">multiple hit</font> with any weapon:\n> <font color=\"#66cc00\">Apply Snare (30% slow on ZED)</green>"
	upgradeDescription(1)="On <font color=\"#b346ea\">any hit</font> with any weapon:\n> <font color=\"#66cc00\">Apply Snare (30% slow on ZED)</green>"
	upgradeIcon(0)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_Destruction'
	upgradeIcon(1)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_Destruction_Deluxe'

	Name="Default__SygExt_Skill_SWAT_Cripple"
}
