class SygExt_Skill_Support_ConcussionRounds extends WMUpgrade_Skill;

var array<float> Effect;

static function ModifyStumblePowerPassive(out float stumblePowerFactor, int upgLevel)
{
	stumblePowerFactor += default.Effect[upgLevel - 1];
}

static function ModifyStunPowerPassive(out float stunPowerFactor, int upgLevel)
{
	stunPowerFactor += default.Effect[upgLevel - 1];
}

static function ModifyKnockdownPowerPassive(out float knockdownPowerFactor, int upgLevel)
{
	knockdownPowerFactor += default.Effect[upgLevel - 1];
}

defaultproperties
{
	Effect(0)=0.25f
	Effect(1)=0.60f

	upgradeName="Concussion Rounds"

    upgradeDescription(0)="> <font color=\"#66cc00\">+35%</font> <font color=\"#ff3399\">stumble power</font>\n> <font color=\"#66cc00\">+35%</font> <font color=\"#ff3399\">stun power</font>\n> <font color=\"#66cc00\">+35%</font> <font color=\"#ff3399\">knockdown power</font>"   
    upgradeDescription(1)="> <font color=\"#b346ea\">+80%</font> <font color=\"#ff3399\">stumble power</font>\n> <font color=\"#b346ea\">+80%</font> <font color=\"#ff3399\">stun power</font>\n> <font color=\"#b346ea\">+80%</font> <font color=\"#ff3399\">knockdown power</font>"
	upgradeIcon(0)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_ConcussionRounds'
	upgradeIcon(1)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_ConcussionRounds_Deluxe'

	Name="Default__WMUpgrade_Skill_ConcussionRounds"
}
