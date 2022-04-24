class SygExt_Skill_Sharpshooter_FrozenHeadPopper_IceNovaDeluxe extends KFProj_FreezeGrenade
	hidedropdown;

simulated function PostBeginPlay()
{
	super.PostBeginPlay();

	ExplodeTimer();
}

defaultproperties
{
	AssociatedPerkClass=Class'ZedternalReborn.WMPerk'
	FuseTime=0.05f

	Begin Object Name=ExploTemplate0
		Damage=10.0f
		DamageRadius=1000.0f
		MyDamageType=Class'SygExt_Skill_Sharpshooter_FrozenHeadPopper_IceNova_DamageType'
		ActorClassToIgnoreForDamage=class'KFGame.KFPawn_Human'
	End Object

	Name="Default__SygExt_Skill_Sharpshooter_FrozenHeadPopper_IceNovaDeluxe"
}
