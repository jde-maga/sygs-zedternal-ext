class SygExt_Skill_FieldMedic_AirborneAgent_Helper extends Info
	transient;

var KFPawn_Human Player;
var bool bDeluxe;
var const int RadiusSQ;
var const float Recharge, Update;

function PostBeginPlay()
{
	super.PostBeginPlay();

	Player = KFPawn_Human(Owner);
	if (Player == None || Player.Health <= 0)
		Destroy();
	else
		SetTimer(Update, False);
}

function Timer()
{
	local KFPawn_Human KFPH;
	local bool bActivate;

	if (Player == None || Player.Health <= 0)
	{
		Destroy();
		return;
	}

	bActivate = False;
	if (Player.Health <= Round(float(Player.HealthMax) * 0.35f))
		bActivate = True;
	else
	{
		foreach DynamicActors(class'KFPawn_Human', KFPH)
		{
			if (KFPH.Health <= Round(float(Player.HealthMax) * 0.35f) && KFPH.Health > 0 && VSizeSQ(Player.Location - KFPH.Location) <= RadiusSQ)
			{
				bActivate = True;
				break;
			}
		}
	}

	if (!bActivate)
		SetTimer(Update, False);
	else
	{
		Player.StartAirBorneAgentEvent();
		Spawn(class'ZedternalReborn.WMFX_AirborneAgent', , , Player.Location, Player.Rotation, , True);

		if (bDeluxe)
		{
			Player.HealDamage(Player.HealthMax, Player.Controller, class'KFGameContent.KFDT_Healing_MedicGrenade');
			foreach DynamicActors(class'KFPawn_Human', KFPH)
			{
				if (KFPH != Player && VSizeSQ(Player.Location - KFPH.Location) <= RadiusSQ)
					KFPH.HealDamage(20, Player.Controller, class'KFGameContent.KFDT_Healing_MedicGrenade');
			}
		}
		else
			Player.HealDamage(Round(float(Player.HealthMax) * 0.50f), Player.Controller, class'KFGameContent.KFDT_Healing_MedicGrenade');

		SetTimer(Recharge, False);
	}
}

defaultproperties
{
	bDeluxe=False
	RadiusSQ=160000
	Recharge=40.0f
	Update=0.5f

	Name="Default__SygExt_Skill_FieldMedic_AirborneAgent_Helper"
}
