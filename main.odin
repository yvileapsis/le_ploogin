package le_ploogin

import "core:fmt"
import "core:os"
import runtime "base:runtime"
import log "core:log"

logger : log.Logger

gpkPlayerCharacter : ^PlayerCharacter

main :: proc() {
    fmt.print("This an NVSE plugin! If you see this, you're not loading this into a game.")
}

query :: proc "contextless" () {
    context = runtime.default_context()

    mode: int = 0
    when ODIN_OS == .Linux || ODIN_OS == .Darwin {
        mode = os.S_IRUSR | os.S_IWUSR | os.S_IRGRP | os.S_IROTH
    }

    logh, logh_err := os.open("ploogin.log", (os.O_CREATE | os.O_TRUNC | os.O_RDWR), mode)

    if logh_err == os.ERROR_NONE {
        os.stdout = logh
        os.stderr = logh
    }

    logger = logh_err == os.ERROR_NONE ? log.create_file_logger(logh) : log.create_console_logger()
    context.logger = logger
    log.info("Program started")
}

load :: proc "contextless" () {
    context = runtime.default_context()
    context.logger = logger
}

init :: proc "contextless" () {
    context = runtime.default_context()
    context.logger = logger

    gpkPlayerCharacter = GetPlayerCharacter()
}

gameload :: proc "contextless" () {
    context = runtime.default_context()
    context.logger = logger

    fmt.printf("%#v", gpkPlayerCharacter)
}

mainloop :: proc "contextless" () {
//    context = runtime.default_context()
//    context.logger = logger
}

exit :: proc "contextless" () {
    context = runtime.default_context()
    context.logger = logger

    log.info("Program ended")
    log.destroy_file_logger(logger)
}