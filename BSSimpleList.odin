package le_ploogin

BSSimpleList :: struct($T: typeid) {
    m_item      : T,
    m_pkNext    : ^BSSimpleList(T)
}
#assert(size_of(BSSimpleList(rawptr)) == 0x8);


Modifier :: struct {
    cKey    : u8,
    fValue  : f32,
}

ModifierList :: struct {
    using list          : BSSimpleList(^Modifier),
    bZeroValuesAllowed  : bool,
    pkFastModModifiers  : rawptr,
}
#assert(size_of(ModifierList) == 0x10);


TESRegionList :: struct {
    using list          : BSSimpleList(^TESRegion),
    vtbl                : rawptr,
    bOwnsRegionMemory   : bool,
}
#assert(size_of(TESRegionList) == 0x10);