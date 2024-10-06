local wk = require('which-key')

wk.add(
    { "<leader>f", group = "Find" },
    { "<leader>v", group = "View" },
    { "<leader>vc", group = "Code" },
    { "<leader>r", group = "run" },
    { "<leader>c", group = "Code" },
    { "<leader>ce", group = "Extract" },
    { "<leader>d", group = "Debug" },
    { "<leader>ds", group = "Step" },
    {"g", group = "Goto"}
)
