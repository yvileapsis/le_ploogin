package le_ploogin

TESFile :: struct {}
TESBoundObject :: struct {}
BSString :: struct {}
NiColor :: struct {}
TESObjectCELL :: struct {}
TESSound :: struct {}
BSExtraList :: struct {}
LoadedRefData :: struct {}
MagicLight :: struct {}
SpellDispelData :: struct {}
bhkRagdollController :: struct {}
bhkRagdollPenetrationUtil :: struct {}
TESActorBase :: struct {}
ActorMover :: struct {}
TESPackage :: struct {}
ContinuousBeamProjectile :: struct {}
CastPowerItem :: struct {}
DispositionModifier :: struct {}
HitData :: struct {}
BipedAnim :: struct {}
PlayerTargetLoc :: struct {}
TESObjectWEAP :: struct {}
DialoguePackage :: struct {}
ActiveEffect :: struct {}
HitCaster :: struct {}
BGSNote :: struct {}
ImageSpaceModifierInstanceDOF :: struct {}
ImageSpaceModifierInstanceDRB :: struct {}
PlayerActionObject :: struct {}
CasinoData :: struct {}
TESCaravanCard :: struct {}
bhkMouseSpringAction :: struct {}
Animation :: struct {}
NiAVObject :: struct {}
NiNode :: struct {}
TESTopic :: struct {}
TESQuestStageItem :: struct {}
BGSQuestObjective :: struct {}
TESQuestTarget :: struct {}
TESObjectBOOK :: struct {}
AlchemyItem :: struct {}
TESClass :: struct {}
ParentSpaceNode :: struct {}
TeleportLink :: struct {}
TESRegion :: struct {}
TESRegionSound :: struct {}
TESReputation :: struct {}
MagicItem :: struct {}
CameraCaster :: struct {}
MagicShaderHitEffect :: struct {}
TESQuest :: struct {}
BGSMusicType :: struct {}
TESWorldSpace :: struct {}
AudioMarkerInfo :: struct {}
NiLight :: struct {}
PerkRankData :: struct {}
BGSPerkEntry :: struct {}
ActorsNearPlayerData :: struct {}
CombatGroup :: struct {}
bhkRigidBody :: struct {}
ItemChange :: struct {}
TESAmmo :: struct {}


TESChildCELLVtbl :: struct {
    GetSaveParentCell       : proc "fast" (this : rawptr) -> ^TESObjectCELL,
}
#assert(size_of(TESChildCELLVtbl) == 0x4);

TESChildCELLData :: struct {}
#assert(size_of(TESChildCELLData) == 0x0);

TESChildCell :: struct {
    using vtbl_childcell : ^TESChildCELLVtbl,
    using data_childcell : TESChildCELLData,
}
#assert(size_of(TESChildCell) == 0x4);


MagicCasterVtbl :: struct {

}
//#assert(size_of(MobileObjectVtbl) == 0x300)

MagicCasterData :: struct {
    pkLight     : ^MagicLight,
    eState      : u32,
}
#assert(size_of(MagicCasterData) == 0x8)

MagicCaster :: struct {
    using vtbl_mgcs         : ^MagicCasterVtbl,
    using data_mgcs         : MagicCasterData,
}
#assert(size_of(MagicCaster) == 0xC)



MagicTargetVtbl :: struct {

}
//#assert(size_of(MagicTargetVtbl) == 0x300)

MagicTargetData :: struct {
    bShowTargetStats        : bool,
    bUpdating               : bool,
    kPostUpdateDispelList   : BSSimpleList(^SpellDispelData),
}
#assert(size_of(MagicTargetData) == 0xC)

MagicTarget :: struct {
    using vtbl_mgtg         : ^MagicTargetVtbl,
    using data_mgtg         : MagicTargetData,
}
#assert(size_of(MagicTarget) == 0x10)



ActorValueOwnerVtbl :: struct {

}
//#assert(size_of(ActorValueOwnerVtbl) == 0x300)

ActorValueOwnerData :: struct {}
#assert(size_of(ActorValueOwnerData) == 0x0)

ActorValueOwner :: struct {
    using vtbl_avow         : ^ActorValueOwnerVtbl,
    using data_avow         : ActorValueOwnerData,
}
#assert(size_of(ActorValueOwner) == 0x4)



CachedValuesOwnerVtbl :: struct {

}
//#assert(size_of(CachedValuesOwnerVtbl) == 0x300)

CachedValuesOwnerData :: struct {}
#assert(size_of(CachedValuesOwnerData) == 0x0)

CachedValuesOwner :: struct {
    using vtbl_cvow         : ^CachedValuesOwnerVtbl,
    using data_cvow         : CachedValuesOwnerData,
}
#assert(size_of(CachedValuesOwner) == 0x4)

AchievementInstance :: struct {
    bUnlocked       : bool,
    iCurrentValue   : u32,
    bTracking       : bool,
}

BSSimpleArray :: struct($T: typeid, $size : u32) {
    vtbl        : rawptr,
    pBuffer     : ^T,
    iSize       : u32,
    iAllocSize  : u32,
}
#assert(size_of(BSSimpleArray(u32, 1024)) == 0x10);

TeleportPath :: struct {
    kSpaces     : BSSimpleArray(ParentSpaceNode, 1024),
    kDoors      : BSSimpleArray(TeleportLink, 1024),
    fStart      : [3]f32,
    fEnd        : [3]f32,
}

BSSoundHandle :: struct {
    iSoundID        : u32,
    bAssumeSuccess  : bool,
    eState          : u32,
}

NiTPrimitiveArray :: struct ($T: typeid) {

}

MapMarkerData :: struct {}

MapMarker :: struct {
    pkData  : ^MapMarkerData,
    pkRef   : ^TESObjectREFR,
}

NiTMapBase :: struct {
    vtbl : u32,
    m_uiHashSize : u32,
    m_ppkHashTable : ^^u32,
    m_uiCount : u32,
}

NiTMap :: struct ($key: typeid, $value : typeid) {
    using mapBase : NiTMapBase,
}
#assert(size_of(NiTMap(u32, u32)) == 0x10)

CharacterProgressionData :: struct {
    bReadyToLevelUp : bool,
    iNextTreshold   : u32,
    iIgnoreCallBack : bool,
}