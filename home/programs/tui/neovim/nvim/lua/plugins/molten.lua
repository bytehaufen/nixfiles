return {
  -- Which key integration
  {
    "folke/which-key.nvim",
    -- optional = true,
    opts = {
      spec = {
        { "<localleader>m", group = "molten" },
        { "<localleader>mo", group = "output" },
      },
    },
  },
  -- Molten configuration - Make neovim a jupyter notebook
  {
    "benlubas/molten-nvim",
    build = ":UpdateRemotePlugins", -- NOTE: Sometimes on first install, this has to be run manually
    ft = { "markdown" },
    dependencies = { "image.nvim" },
    config = function()
      vim.g.molten_auto_image_popup = true
      vim.g.molten_auto_open_html_in_browser = true
      vim.g.molten_auto_open_output = false
      vim.g.molten_copy_output = true
      vim.g.molten_cover_empty_lines = true
      vim.g.molten_image_location = "float"
      vim.g.molten_output_virt_lines = true
      vim.g.molten_output_win_border = { "", "━", "", "" }
      vim.g.molten_output_win_max_height = 12
      vim.g.molten_save_path = (vim.fn.stdpath("data") .. "/molten")
      vim.g.molten_tick_rate = 142
      vim.g.molten_use_border_highlights = true
      vim.g.molten_virt_lines_off_by_1 = true
      vim.g.molten_virt_text_output = true
      vim.g.molten_wrap_output = true
    end,
    keys = {
      { "<localleader>mr", mode = { "v" }, "<cmd>MoltenEvaluateVisual<cr>", desc = "evaluate visual selection" },

      { "<localleader>mi", mode = { "n" }, "<cmd>MoltenInit<cr>", desc = "Initialize the plugin" },
      { "<localleader>me", mode = { "n" }, "<cmd>MoltenEvaluateOperator<cr>", desc = "run operator selection" },

      { "<localleader>ml", mode = { "n" }, "<cmd>MoltenEvaluateLine<cr>", desc = "evaluate line" },
      { "<localleader>mr", mode = { "n" }, "<cmd>MoltenReevaluateCell<cr>", desc = "re-evaluate cell" },
      { "<localleader>md", mode = { "n" }, "<cmd>MoltenDelete<cr>", desc = "molten delete cell" },

      { "<localleader>moh", mode = { "n" }, "<cmd>MoltenHideOutput<cr>", desc = "hide output" },
      { "<localleader>mos", mode = { "n" }, "<cmd>noautocmd MoltenEnterOutput<cr>", desc = "show/enter output" },
      { "<localleader>moi", mode = { "n" }, "<cmd>MoltenImagePopup<cr>", desc = "show image popup" },
      { "<localleader>mob", mode = { "n" }, "<cmd>MoltenOpenInBrowser<cr>", desc = "open in browser" },
      {
        "<localleader>mc",
        mode = { "n" },
        function()
          local function find_line_with_backticks(reverse)
            -- Get the lines of the current buffer
            local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)

            -- Loop through the lines and search for the string
            if reverse then
              for line_num, line in ipairs(lines) do
                if string.find(line, "```") then
                  return line_num
                end
              end
            else
              for line_num = #lines, 1, -1 do
                if string.find(lines[line_num], "```") then
                  return line_num
                end
              end
            end
          end

          -- Save the current cursor position
          local save_cursor = vim.fn.getcurpos()

          -- Search backwards for the line after start of the code block
          vim.cmd("normal! ?```")
          local start_line = find_line_with_backticks(true) + 1

          -- Restore the cursor position and search forwards for the line before end of the code block
          vim.fn.setpos(".", save_cursor)
          vim.cmd("normal! /```")
          local end_line = find_line_with_backticks(false) - 1

          -- Execute the code block
          vim.fn.MoltenEvaluateRange(start_line, end_line)
        end,
        desc = "evaluate code block",
      },
    },
  },
  -- Save images from neovim with `:SaveImage`
  {
    "benlubas/image-save.nvim",
    cmd = "SaveImage",
  },
  -- Render images in neovim
  {
    "3rd/image.nvim",
    dependencies = { "https://github.com/leafo/magick" },
    ft = { "markdown", "norg" },
    config = function()
      local image = require("image")

      ---@diagnostic disable-next-line: missing-fields
      image.setup({
        backend = "kitty",
        integrations = {
          markdown = {
            enabled = true,
            clear_in_insert_mode = false,
            download_remote_images = false,
            only_render_image_at_cursor = false,
            filetypes = { "markdown" }, -- markdown extensions (ie. quarto) can go here
          },
        },
        max_width = 100,
        max_height = 8,
        max_height_window_percentage = math.huge,
        max_width_window_percentage = math.huge,
        window_overlap_clear_enabled = true, -- toggles images when windows are overlapped
        editor_only_render_when_focused = true, -- auto show/hide images when the editor gains/looses focus
        tmux_show_only_in_active_window = true, -- auto show/hide images in the correct Tmux window (needs visual-activity off)
        window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "fidget", "" },
      })
    end,
  },
  -- Render mermaid/plantuml/d2/gnuplot code fields as images into neovim
  { "3rd/diagram.nvim", dependencies = { "image.nvim" }, enabled = false, dev = true, opts = {} },
}
