return {
    "rmagatti/auto-session",
    config = function()
        local auto_session = require("auto-session")

    auto_session.setup(
        { auto_restore_enabled = false }
    )
    end,
}
