class SygExt_Skill_Survivalist_UnfairAdvantage extends WMUpgrade_Skill;

var array<float> Damage;

static function ModifyDamageGiven(out int InDamage, int DefaultDamage, int upgLevel, optional Actor DamageCauser, optional KFPawn_Monster MyKFPM, optional KFPlayerController DamageInstigator, optional class<KFDamageType> DamageType, optional int HitZoneIdx, optional KFWeapon MyKFW)
{
	if (MyKFPM != None && MyKFPM.AfflictionHandler != None)
	{
		if (MyKFPM.IsDoingSpecialMove(SM_Frozen)) 
			Indamage += Round(float(DefaultDamage) * default.Damage[upgLevel - 1]);
		if (MyKFPM.bEmpDisrupted || MyKFPM.bEmpPanicked) 
			Indamage += Round(float(DefaultDamage) * default.Damage[upgLevel - 1]);
	}
}

defaultproperties
{
	Damage(0)=0.75f
	Damage(1)=2.00f
	upgradeName="Unfair Advantage"
	upgradeDescription(0)="Against <font color=\"#ffff00\">frozen ZEDs</font>:\n> <font color=\"#66cc00\">+75%</font> <font color=\"#ff3399\">damage</font>\n\nAgainst <font color=\"#ffff00\">EMP'd ZEDs</font>:\n> <font color=\"#66cc00\">+75%</font> <font color=\"#ff3399\">damage</font>"
	upgradeDescription(1)="Against <font color=\"#ffff00\">frozen ZEDs</font>:\n> <font color=\"#b346ea\">+200%</font> <font color=\"#ff3399\">damage</font>\n\nAgainst <font color=\"#ffff00\">EMP'd ZEDs</font>:\n> <font color=\"#b346ea\">+200%</font> <font color=\"#ff3399\">damage</font>"
	upgradeIcon(0)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_Fallback'
	upgradeIcon(1)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_Fallback_Deluxe'

	Name="Default__WMUpgrade_Skill_UnfairAdvantage"
}
