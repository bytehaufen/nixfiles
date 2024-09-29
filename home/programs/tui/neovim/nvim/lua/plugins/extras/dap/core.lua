return {
  {
    "mfussenegger/nvim-dap",
    desc = "Debugging support. Requires language specific adapters to be configured. (see lang extras)",

    dependencies = {
      "rcarriga/nvim-dap-ui",
      -- virtual text for the debugger
      {
        "theHamsta/nvim-dap-virtual-text",
        opts = {},
      },
    },
    keys = {
      { "<F9>", "<leader>db", desc = "Toggle Breakpoint", remap = true },
      { "<F8>", "<leader>dc", desc = "Continue", remap = true },
      { "<F11>", "<leader>dc", desc = "Continue", remap = true },
      { "<F5>", "<leader>di", desc = "Step Into", remap = true },
      { "<F7>", "<leader>do", desc = "Step Out", remap = true },
      { "<F6>", "<leader>dO", desc = "Step Over", remap = true },
    },
  },
}
