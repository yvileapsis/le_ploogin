package le_ploogin

CharacterVtbl :: struct {
    using _actr : ActorVtbl,
}
//#assert(size_of(CharacterVtbl) == 0x300)

CharacterData :: struct {
    pkBiped                 : ^BipedAnim,
    fArmorRating            : f32,
    fArmorThreshold         : f32,
    bTrespassing            : bool,
    bGuard                  : bool,
    fEquippedWeight         : f32,
}
#assert(size_of(CharacterData) == 0x14)

Character :: struct {
    using _vtbl_actr         : ^CharacterVtbl,
    using _data_form         : TESFormData,

    using _vtbl_childcell    : ^TESChildCELLVtbl,
    using _data_childcell    : TESChildCELLData,

    using _data_refr         : TESObjectREFRData,
    using _data_mobj         : MobileObjectData,

    using _vtbl_mgcs         : ^MagicCasterVtbl,
    using _data_mgcs         : MagicCasterData,
    using _vtbl_mgtg         : ^MagicTargetVtbl,
    using _data_mgtg         : MagicTargetData,
    using _vtbl_avow         : ^ActorValueOwnerVtbl,
    using _data_avow         : ActorValueOwnerData,
    using _vtbl_cvow         : ^CachedValuesOwnerVtbl,
    using _data_cvow         : CachedValuesOwnerData,

    using _data_actr         : ActorData,
    using _data_char         : CharacterData,
}
#assert(size_of(Character) == 0x1C8)