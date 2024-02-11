local wk = require('which-key')

wk.register({
    f = {
        name = "Find",
    },
    v = {
        name = "View",
        c = {
            name = "Code",
        }
    },
    r = {
        name = "Run"
    },
}, { prefix = "<leader>" })

wk.register({
    g = {
        name = "Goto",
    },
})

wk.register({
    c = {
        name = "Code",
        e = {
            name = "Extract"
        }
    },
}, { prefix = "<leader>" })

wk.register({
    d = {
        name = "Debug",
        s = {
            name = "Step"
        }
    },
}, { prefix = "<leader>" })
