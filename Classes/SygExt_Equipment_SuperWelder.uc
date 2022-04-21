class SygExt_Equipment_SuperWelder extends WMUpgrade_Equipment;

static simulated function ModifyWeldingRate(out float InFastenRate, float DefaultFastenRate, out float InUnfastenRate, float DefaultUnfastenRate, int upgLevel)
{
    InFastenRate = InFastenRate * 10000.0f;
    InUnfastenRate = InUnfastenRate * 100000.0f;
}


defaultproperties
{
	upgradeName="Super Welder"
	upgradeDescription(0)="Instantly weld and unweld doors !"
	upgradeIcon(0)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_DoorTraps'

	Name="Default__SygExt_Equipment_SuperWelder"
}
