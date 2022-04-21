class SygExt_Skill_Support_TightChoke extends WMUpgrade_Skill;

var array<float> Spread;

static simulated function ModifyTightChokePassive(out float tightChokeFactor, int upgLevel)
{
	tightChokeFactor -= default.Spread[upgLevel - 1];
}

defaultproperties
{
	Spread(0)=0.5f
	Spread(1)=1.0f

	upgradeName="Tight Choke"
    upgradeDescription(0)="> <font color=\"#66cc00\">-50%</font> <font color=\"#ff3399\">spread</font>"
    upgradeDescription(1)="> <font color=\"#b346ea\">-100%</font> <font color=\"#ff3399\">spread</font>"
	upgradeIcon(0)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_TightChoke'
	upgradeIcon(1)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_TightChoke_Deluxe'

	Name="Default__SygExt_Skill_Support_TightChoke"
}
