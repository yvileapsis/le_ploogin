package le_ploogin

doOnce : bool

MessageHandler :: proc "c" (msg: ^NVSEMessage) {

    #partial switch msg.type {
    case .DeferredInit: init()
    case .MainGameLoop:
        if !doOnce {
            gameload()
            doOnce = true
        }
        mainloop()
    case .ExitGame, .ExitGame_Console:
        exit()
    }
}

@(export, link_name="NVSEPlugin_Query")
NVSEPlugin_Query :: proc "c" (nvse : ^NVSEInterface, info : ^PluginInfo) -> bool {

    info.infoVersion = 1
    info.name = "le_ploogin"
    info.version = 100

    query()

    return true
}

@(export, link_name="NVSEPlugin_Load")
NVSEPlugin_Load :: proc "c" (nvse : ^NVSEInterface) -> bool {

    g_plugin_handle  := nvse.GetPluginHandle();
    g_nvse_interface := nvse;

    g_messaging_interface := (^NVSEMessagingInterface)(nvse.QueryInterface(.Messaging))

    g_messaging_interface.RegisterListener(g_plugin_handle, "NVSE", MessageHandler);

    load()

    return true
}