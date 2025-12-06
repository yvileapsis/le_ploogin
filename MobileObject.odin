package le_ploogin

BaseProcess :: struct {}

MobileObjectVtbl :: struct {
    using _refr : TESObjectREFRVtbl,
}
//#assert(size_of(MobileObjectVtbl) == 0x300)

MobileObjectData :: struct {
    pkCurrentProcess        : ^BaseProcess,
    pkTalkingActivator      : ^TESObjectREFR,
    pkDialogueItemTarget    : ^MobileObject,
    fUpdateTargetTimer      : f32,
    fSayToFailVoiceTimer    : f32,
    bSpeakingDone           : bool,
    bTalkingToPlayer        : bool,
    bIgnoreChangeAnimationCall : bool,
    bSoundFileDone          : bool,
    bVoiceFileDone          : bool,
    bTalkingActivator       : bool,
    bInTempChangeList       : bool,
    bDoNotRunSayToCallBack  : bool,
    cSoundCallBackSet       : u8,
    bSoundCallBackSuccess   : bool,
    bUseEmotion             : bool,
    bRunsInLow              : bool,
}
#assert(size_of(MobileObjectData) == 0x20)

MobileObject :: struct {
    using _vtbl_mobj         : ^MobileObjectVtbl,
    using _data_form         : TESFormData,
    using _vtbl_childcell    : ^TESChildCELLVtbl,
    using _data_childcell    : TESChildCELLData,
    using _data_refr         : TESObjectREFRData,
    using _data_mobj         : MobileObjectData,
}
#assert(size_of(MobileObject) == 0x88)