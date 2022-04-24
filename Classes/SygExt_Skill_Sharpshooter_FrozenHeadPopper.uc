class SygExt_Skill_Sharpshooter_FrozenHeadPopper extends WMUpgrade_Skill;


static function ModifyDamageGiven(out int InDamage, int DefaultDamage, int upgLevel, optional Actor DamageCauser, optional KFPawn_Monster MyKFPM, optional KFPlayerController DamageInstigator, optional class<KFDamageType> DamageType, optional int HitZoneIdx, optional KFWeapon MyKFW)
{
	local rotator Rot;
	local vector Loc;

	if (MyKFPM != None && DamageInstigator != None && HitZoneIdx == HZI_HEAD && (FRand() < (float(DefaultDamage) / 1000.0f)))
	{
		Rot = rotator(MyKFPM.Velocity);
		Loc = MyKFPM.Location;
		Loc.Z -= MyKFPM.GetCollisionHeight();
		Rot.Pitch = 0;
		if (upgLevel == 1)
			DamageInstigator.Spawn(class'SygZedternalExtended.SygExt_Skill_Sharpshooter_FrozenHeadPopper_IceNova', DamageInstigator, , Loc, Rot, , True);
		else
			DamageInstigator.Spawn(class'SygZedternalExtended.SygExt_Skill_Sharpshooter_FrozenHeadPopper_IceNovaDeluxe', DamageInstigator, , Loc, Rot, , True);
	}
}

defaultproperties
{
	upgradeName="Frozen Head Popper"
    upgradeDescription(0)="On dealing an <font color=\"#ffff00\">headshot</font>, with <font color=\"#ffff00\">1% chance per 10 damage</font>:\n> <font color=\"#66cc00\">Trigger a 5 meters ice nova</font>"
    upgradeDescription(1)="On dealing an <font color=\"#ffff00\">headshot</font>, with <font color=\"#ffff00\">1% chance per 10 damage</font>:\n> <font color=\"#66cc00\">Trigger a <font color=\"#b346ea\">10</font> meters ice nova</font>"
	upgradeIcon(0)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_FrozenHeadPopper'
	upgradeIcon(1)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_FrozenHeadPopper_Deluxe'

	Name="Default__SygExt_Skill_Sharpshooter_FrozenHeadPopper"
}
