package le_ploogin

BaseExtraListVtbl :: struct {
    Destructor       : proc "fast" (this : rawptr),
}

BaseExtraListData :: struct {
    pkHead              : ^BSExtraList,
    ucPresenceBitfield  : [0x15]u8,
}

BaseExtraList :: struct {
    using vtbl_baseextralist : ^BaseExtraListVtbl,
    using data_baseextralist : BaseExtraListData,
}
#assert(size_of(BaseExtraList) == 0x20);

ExtraDataListVtbl :: struct {
    using baseExtraList : BaseExtraListVtbl,

}

ExtraDataListData :: struct {
}

ExtraDataList :: struct {
    using vtbl_baseextralist : ^ExtraDataListVtbl,
    using data_baseextralist : BaseExtraListData,
    using data_extradatalist : ExtraDataListData,
}
#assert(size_of(ExtraDataList) == 0x20);