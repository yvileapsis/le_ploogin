package le_ploogin

BaseFormComponentVtbl :: struct {
    InitializeDataComponent     : proc "fast" (this : rawptr),
    ClearDataComponent          : proc "fast" (this : rawptr),
    CopyComponent               : proc "fast" (this : rawptr, apSource: ^BaseFormComponent),
    CompareComponent            : proc "fast" (this : rawptr, apOther: ^BaseFormComponent),
}
#assert(size_of(BaseFormComponentVtbl) == 0x10);

BaseFormComponent :: struct {
    using vtbl : ^BaseFormComponentVtbl,
}
#assert(size_of(BaseFormComponent) == 0x4);