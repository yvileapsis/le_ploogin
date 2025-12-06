package le_ploogin

CommandInfo         :: struct {}        // define properly elsewhere
CommandReturnType   :: enum u32 {}      // from CommandTable.h
PluginHandle        :: distinct u32
_SCRIPT             :: struct {}    // if needed later

PluginInfo :: struct {
    infoVersion : u32,
    name : cstring,
    version : u32,
};

SEInterface :: struct {
    version           : u32,
    game_version      : u32,
    editor_version    : u32,
    is_editor         : u32, // C++ bool is typically 4 bytes in these APIs

    RegisterCommand        : proc "c" (info: ^CommandInfo) -> bool,
    SetOpcodeBase          : proc "c" (opcode: u32),
    QueryInterface         : proc "c" (id: NVSEInterfaceId) -> rawptr,

    GetPluginHandle        : proc "c" () -> PluginHandle,

    RegisterTypedCommand   : proc "c" (info: ^CommandInfo, retn_type: CommandReturnType) -> bool,

    GetRuntimeDirectory    : proc "c" () -> cstring,
}

OBSEInterface :: struct {
    using se : SEInterface,

    GetPluginLoaded   : proc(plugin_name: cstring) -> bool,
    GetPluginVersion  : proc(plugin_name: cstring) -> u32,
}

FOSEInterface :: struct {
    using se     : SEInterface,
    is_nogore: u32,
}

NVSEInterface :: struct {
    using se     : SEInterface,
    is_nogore: u32,
}

NVSEConsoleInterface :: struct {
    version : u32,   // kVersion = 3

    RunScriptLine  : proc(
        buf: cstring,
        object: ^TESObjectREFR
    ) -> bool,

    RunScriptLine2 : proc(
        buf                  : cstring,
        calling_refr         : ^TESObjectREFR,
        suppress_console_out : bool,
    ) -> bool,
}

NVSEInterfaceId :: enum u32 {
    Serialization        = 0,
    Console              = 1,
    // v0002
    Messaging,
    CommandTable,
    // v0004
    StringVar,
    ArrayVar,
    Script,
    // v0005 (version bumped to 3)
    Data,
    // v0006
    EventManager,
    LoggingInterface,

    Max,
}


NVSEMessage :: struct {
    sender  : cstring,
    type    : NVSEMessageType,
    data_len: u32,
    data    : rawptr,
}


NVSEEventCallback :: proc "c" (msg: ^NVSEMessage)


NVSEMessagingVersion :: enum u32 {
    Version = 4,
}

NVSEMessageType :: enum u32 {
    PostLoad,                // 0

    ExitGame,
    ExitToMainMenu,

    LoadGame,                // 3
    SaveGame,

    Precompile,
    PreLoadGame,

    ExitGame_Console,

    PostLoadGame,

    PostPostLoad,
    RuntimeScriptError,

    // kVersion = 2
    DeleteGame,
    RenameGame,
    RenameNewGame,
    NewGame,

    // kVersion = 3
    DeleteGameName,
    RenameGameName,
    RenameNewGameName,

    // kVersion = 4 (xNVSE)
    DeferredInit,
    ClearScriptDataCache,
    MainGameLoop,
    ScriptCompile,
    EventListDestroyed,
    PostQueryPlugins,
}

NVSEMessagingInterface :: struct {
    version : u32,

    RegisterListener : proc "c" (
        listener : PluginHandle,
        sender   : cstring,
        handler  : NVSEEventCallback
    ) -> bool,

    Dispatch : proc "c" (
        sender      : PluginHandle,
        messageType : u32,
        data        : rawptr,
        dataLen     : u32,
        receiver    : cstring
    ) -> bool,
}