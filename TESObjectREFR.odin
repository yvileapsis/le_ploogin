package le_ploogin

TESObjectREFRVtbl :: struct {
    using _form : TESFormVtbl,
}
//#assert(size_of(TESObjectREFRData) == 0x23C);

TESObjectREFRData :: struct {
    pkLoopSound             : ^TESSound, // 0
    pkObjectReference       : ^TESBoundObject, // 4
    kRotation               : [3]f32, // 8
    kPosition               : [3]f32, // 20
    fRefScale               : f32, // 32
    pkParentCell            : ^TESObjectCELL, // 36
    kExtraDataList          : ExtraDataList, // 40
    pkLoadedData            : ^LoadedRefData, // 60
}
#assert(size_of(TESObjectREFRData) == 0x4C);

TESObjectREFR :: struct {
    using _vtbl_refr         : ^TESObjectREFRVtbl,
    using _data_form         : TESFormData,
    using _vtbl_childcell    : ^TESChildCELLVtbl,
    using _data_childcell    : TESChildCELLData,
    using _data_refr         : TESObjectREFRData,
}
#assert(size_of(TESObjectREFR) == 0x68);