class SygExt_Skill_Gunslinger_Steady extends WMUpgrade_Skill;

var array<float> Recoil;
var float Bob;

static simulated function ModifyRecoil(out float InRecoilModifier, float DefaultRecoilModifier, int upgLevel, KFWeapon KFW)
{
	if (KFW != None && !KFW.bUsingSights)
		InRecoilModifier -= DefaultRecoilModifier * default.Recoil[upgLevel - 1];
}

static simulated function ModifyWeaponBopDampingPassive(out float bobDampFactor, int upgLevel)
{
	bobDampFactor += default.Bob;
}

defaultproperties
{
	Recoil(0)=0.3f
	Recoil(1)=0.75f
	Bob=0.11f

	upgradeName="Steady"
    upgradeDescription(0)="> <font color=\"#66cc00\">-30%</font> <font color=\"#ff3399\">recoil</font> when <font color=\"#ffff00\">hip firing</font>\n> <font color=\"#66cc00\">reduced</font> <font color=\"#ff3399\">weapon bobbing</font>"
    upgradeDescription(1)="> <font color=\"#b346ea\">-75%</font> <font color=\"#ff3399\">recoil</font> when <font color=\"#ffff00\">hip firing</font>\n> <font color=\"#b346ea\">reduced</font> <font color=\"#ff3399\">weapon bobbing</font>"
	upgradeIcon(0)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_Steady'
	upgradeIcon(1)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_Steady_Deluxe'

	Name="Default__SygExt_Skill_Gunslinger_Steady"
}
