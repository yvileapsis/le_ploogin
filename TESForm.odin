package le_ploogin

TESFormVtbl :: struct {
    using _baseFormComponent : BaseFormComponentVtbl,
    Destructor              : proc "fast" (this : rawptr),

    InitializeData          : proc "fast" (this : rawptr),
    ClearData               : proc "fast" (this : rawptr),

    ProcessBeforeSave       : proc "fast" (this : rawptr) -> bool,
    LoadForm                : proc "fast" (this : rawptr, edx : u32, apFile : ^TESFile) -> bool,
    LoadPartial             : proc "fast" (this : rawptr, edx : u32, apFile : ^TESFile) -> bool,
    SaveFormToFile          : proc "fast" (this : rawptr, edx : u32, apFile : ^TESFile) -> bool,
    SaveForm                : proc "fast" (this : rawptr),
    LoadEdit                : proc "fast" (this : rawptr, edx : u32, apFile : ^TESFile) -> bool,
    SaveEdit                : proc "fast" (this : rawptr, edx : u32, apFile : ^TESFile) -> bool,

    SortIsBeforeGroup       : proc "fast" (this : rawptr, edx : u32, arg : u32) -> bool,
    SortIsBeforeTESForm     : proc "fast" (this : rawptr, edx : u32, apForm : ^TESForm) -> bool,
    DuplicateFormTo         : proc "fast" (this : rawptr, edx : u32, abool : bool, amap : rawptr) -> ^TESForm,
    DuplicateFormCleanUp    : proc "fast" (this : rawptr, edx : u32, amap : rawptr) -> ^TESForm,

    MarkAsModified          : proc "fast" (this : rawptr, edx : u32, auChangedFlags : u32),
    MarkAsUnmodified        : proc "fast" (this : rawptr, edx : u32, auChangedFlags : u32),

    GetSaveSize             : proc "fast" (this : rawptr, edx : u32, auFlags : u32) -> u32,

    SaveGameWithBuffer      : proc "fast" (this : rawptr, edx : u32, apBuffer : u32),
    SaveGame                : proc "fast" (this : rawptr, edx : u32, arg : u32),
    LoadGameWithBuffer      : proc "fast" (this : rawptr, edx : u32, apBuffer : u32),
    LoadGame                : proc "fast" (this : rawptr, edx : u32, arg1 : u32, arg2 : u32),
    InitLoadGameWithBuffer  : proc "fast" (this : rawptr, edx : u32, apBuffer : u32),
    InitLoadGame            : proc "fast" (this : rawptr, edx : u32, arg1 : u32, arg2 : u32),
    FinishInitLoadGame      : proc "fast" (this : rawptr, edx : u32, arg1 : u32, arg2 : u32),
    RevertWithBuffer        : proc "fast" (this : rawptr, edx : u32, apBuffer : u32),
    Revert                  : proc "fast" (this : rawptr, edx : u32, arg : u32),
    LoadQueuedFormData      : proc "fast" (this : rawptr, edx : u32, arg : u32),
    FindInFile              : proc "fast" (this : rawptr, edx : u32, apFile : ^TESFile) -> bool,
    CheckSaveGame           : proc "fast" (this : rawptr, edx : u32, apBuffer : u32),
    FinishLoadGame          : proc "fast" (this : rawptr, edx : u32, apBuffer : u32),

    InitItem                : proc "fast" (this : rawptr),
    GetSavedFormType        : proc "fast" (this : rawptr) -> u32,
    GetFormDetailedString   : proc "fast" (this : rawptr, edx : u32, apString : ^BSString) -> u32,

    IsQuestItem             : proc "fast" (this : rawptr) -> bool,

    GetHasTalkedToPC        : proc "fast" (this : rawptr) -> bool,
    GetHavokDeath           : proc "fast" (this : rawptr) -> bool,
    GetRandomAnim           : proc "fast" (this : rawptr) -> bool,
    GetNeedToChangeProcess  : proc "fast" (this : rawptr) -> bool,

    IsDangerous             : proc "fast" (this : rawptr) -> bool,
    IsHasPLSpecTex          : proc "fast" (this : rawptr) -> bool,
    IsObstacle              : proc "fast" (this : rawptr) -> bool,
    IsContinuousBroadcost   : proc "fast" (this : rawptr) -> bool,

    GetOnLocalMap           : proc "fast" (this : rawptr) -> bool,
    SetOnLocalMap           : proc "fast" (this : rawptr, edx : u32, apFlag : bool),
    GetEmittanceColor       : proc "fast" (this : rawptr) -> ^NiColor,

    SetDelete               : proc "fast" (this : rawptr, edx : u32, apFlag : bool),
    SetAltered              : proc "fast" (this : rawptr, edx : u32, apFlag : bool),

    SetQuestItem            : proc "fast" (this : rawptr, edx : u32, apFlag : bool),
    SetHasTalkedToPC        : proc "fast" (this : rawptr, edx : u32, apFlag : bool),
    SetHavokDeath           : proc "fast" (this : rawptr, edx : u32, apFlag : bool),
    SetNeedToChangeProcess  : proc "fast" (this : rawptr, edx : u32, apFlag : bool),

    SaveObjectBound         : proc "fast" (this : rawptr),
    LoadObjectBound         : proc "fast" (this : rawptr, edx : u32, apFile : ^TESFile),

    IsBoundObject           : proc "fast" (this : rawptr) -> bool,
    IsObject                : proc "fast" (this : rawptr) -> bool,
    IsMagicItem             : proc "fast" (this : rawptr) -> bool,
    IsReference             : proc "fast" (this : rawptr) -> bool,
    IsArmorAddon            : proc "fast" (this : rawptr) -> bool,
    IsActorBase             : proc "fast" (this : rawptr) -> bool,
    IsMobileObject          : proc "fast" (this : rawptr) -> bool,
    IsActor                 : proc "fast" (this : rawptr) -> bool,

    GetRefCount             : proc "fast" (this : rawptr) -> u32,

    Copy                    : proc "fast" (this : rawptr, edx : u32, apForm : ^TESForm),
    Compare                 : proc "fast" (this : rawptr, edx : u32, apForm : ^TESForm) -> bool,

    BelongsInGroup          : proc "fast" (this : rawptr, edx : u32, apGroup : rawptr, abFlag1 : bool, abFlag2 : bool),
    CreateGroupData         : proc "fast" (this : rawptr, edx : u32, apGroup : rawptr, apParentGroup : rawptr),

//    GetFormEditorID         : proc "fast" (this : rawptr) -> cstring,

    IsParentForm            : proc "fast" (this : rawptr) -> bool,
    IsParentFormTree        : proc "fast" (this : rawptr) -> bool,
    IsFormTypeChild         : proc "fast" (this : rawptr, edx : u32, abFlag : bool) -> bool,

    Activate                : proc "fast" (
        this : rawptr,
        edx : u32,
        apItemActivate : ^TESObjectREFR,
        apActionRef : ^TESObjectREFR,
        abIdFlag : bool,
        apObjectToGet : ^TESBoundObject,
        aiCount : u32
    ) -> bool,

    SetFormID               : proc "fast" (this : rawptr, aiID : u32, abUpdateFile : bool),
    GetObjectTypeName       : proc "fast" (this : rawptr) -> cstring,

    GetEditorID             : proc "fast" (this : rawptr) -> cstring,
    SetEditorID             : proc "fast" (this : rawptr, edx : u32, asEditorID : cstring),

}
#assert(size_of(TESFormVtbl) == 0x138);

TESFormData :: struct #packed {
    eFormType           : u8,
    eJIPFormFlags1      : u8,
    eJIPFormFlags2      : u8,
    eJIPFormFlags3      : u8,
    eFlags              : u32,
    uiFormID            : u32,
    /*
    union
    {
        UInt32	uiFormID;					// 00C
        struct
        {
            UInt8 ucID[3];
            UInt8 ucModIndex;
        };
    };
     */
    pSourceFiles        : BSSimpleList(^TESFile),
}

TESForm :: struct {
    using _vtbl_form : ^TESFormVtbl,
    using _data_form : TESFormData
}
#assert(size_of(TESForm) == 0x18);