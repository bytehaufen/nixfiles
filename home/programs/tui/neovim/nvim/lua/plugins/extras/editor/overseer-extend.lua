return {
  {
    "stevearc/overseer.nvim",
    -- stylua: ignore
    keys = {
      { "<leader>ow", "<cmd>OverseerToggle<cr>",        desc = "Task list" },
      { "<leader>oo", "<cmd>OverseerRun<cr>",           desc = "Run task" },
      { "<leader>oq", "<cmd>OverseerQuickAction<cr>",   desc = "Action recent task" },
      { "<leader>oi", "<cmd>OverseerInfo<cr>",          desc = "Overseer Info" },
      { "<leader>ob", "<cmd>OverseerBuild<cr>",         desc = "Task builder" },
      { "<leader>oa", "<cmd>OverseerTaskAction<cr>",    desc = "Task action" },
      { "<leader>oc", "<cmd>OverseerClearCache<cr>",    desc = "Clear cache" },

      { "<leader>os", "<cmd>OverseerSaveBundle<cr>",    desc = "Save Task Bundle" },
      { "<leader>ol", "<cmd>OverseerLoadBundle<cr>",    desc = "Load Task Bundle" },
      { "<leader>od", "<cmd>OverseerDeleteBundle<cr>",  desc = "Delete Task Bundle" },
    },
  },
}
