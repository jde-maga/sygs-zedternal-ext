class SygExt_Skill_Sharpshooter_RackEmUp_Helper extends Info
	transient;

var const float DecreaseDelayTimer, ResetDelayTimer;
var const name RhytmMethodRTPCName;
var const AkEvent RhythmMethodSoundReset, RhythmMethodSoundHit, RhythmMethodSoundTop;
var int Headshot;
var bool bDeluxe;

function PostBeginPlay()
{
	super.PostBeginPlay();

	if (Owner == None)
		Destroy();
}

function Timer()
{
	if (Owner == None)
	{
		Destroy();
		return;
	}

	if (HeadShot > 0)
	{
		DecreaseCounter();
		SetTimer(DecreaseDelayTimer, False);
	}
}

function Int GetMaxHeadshots()
{
    if (bDeluxe == True) {
        return 15;
    }
    return 5;
}

function IncreaseCounter()
{
	ClearTimer();
    if (HeadShot < GetMaxHeadshots()) {
	    ++HeadShot;
    }
	HeadShotMessage(byte(HeadShot), byte(Headshot), False, HeadShot >= GetMaxHeadshots());
	SetTimer(ResetDelayTimer, False);
}

function DecreaseCounter()
{
	--HeadShot;
	HeadShotMessage(byte(HeadShot), byte(HeadShot), True, False);
}

reliable client function HeadShotMessage(byte HeadShotNum, byte DisplayValue, optional bool bMissed = False, optional bool bFinalHit = False)
{
	local byte b;
	local AkEvent TempAkEvent;
	local KFPlayerController KFPC;
    local byte MaxHeadshot;
    MaxHeadshot = byte(bDeluxe ? 15 : 5);

	KFPC = KFPlayerController(GetALocalPlayerController());

	if (KFPC == None || KFPC.MyGFxHUD == None)
		return;

	b = HeadShotNum;
	KFPC.UpdateRhythmCounterWidget(DisplayValue, MaxHeadShot);

	if (bFinalHit)
		TempAkEvent = RhythmMethodSoundTop;
	else if (!bMissed)
		TempAkEvent = RhythmMethodSoundHit;
	else if (b == 0)
		TempAkEvent = RhythmMethodSoundReset;

	if (TempAkEvent != None)
		KFPC.PlayRMEffect(TempAkEvent, RhytmMethodRTPCName, b);
}

defaultproperties
{
	HeadShot=0
	DecreaseDelayTimer=1.5f
	ResetDelayTimer=7.0f
    bDeluxe=True

	RhytmMethodRTPCName="R_Method"
	RhythmMethodSoundReset=AkEvent'WW_UI_PlayerCharacter.Play_R_Method_Reset'
	RhythmMethodSoundHit=AkEvent'WW_UI_PlayerCharacter.Play_R_Method_Hit'
	RhythmMethodSoundTop=AkEvent'WW_UI_PlayerCharacter.Play_R_Method_Top'

	Name="Default__SygExt_Skill_Sharpshooter_RackEmUp_Helper"
}
