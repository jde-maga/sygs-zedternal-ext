class SygExt_Skill_Survivalist_ColdRiposte_ProjectileDeluxe extends KFProj_FreezeGrenade
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
		DamageRadius=2500.0f
		MyDamageType=Class'SygExt_Skill_Survivalist_ColdRiposte_FreezeExplosion'
		ActorClassToIgnoreForDamage=class'KFGame.KFPawn_Human'
	End Object

	Name="Default__WMProj_FreezeExplosion"
}
