local enabled = true

-- FIXME: `l` is not working in normal and visual mode when hardtime is enabled
return {
  {
    "m4xshen/hardtime.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    event = "BufEnter",
    opts = function()
      Snacks.toggle({
        name = "Hardtime",
        get = function()
          return enabled
        end,
        set = function(state)
          if state then
            vim.cmd("Hardtime enable")
          else
            vim.cmd("Hardtime disable")
          end
          enabled = state
        end,
      }):map("<leader>uH")

      return {
        enabled = enabled,

        disabled_filetypes = { "copilot-chat" },

        hints = {
          ["[dcyvV][ia][%(%)]"] = {
            message = function(keys)
              return "Use " .. keys:sub(1, 2) .. "b instead of " .. keys
            end,
            length = 3,
          },
          ["[dcyvV][ia][%{%}]"] = {
            message = function(keys)
              return "Use " .. keys:sub(1, 2) .. "B instead of " .. keys
            end,
            length = 3,
          },
          ["k%^"] = {
            message = function()
              return "Use - instead of k^" -- return the hint message you want to display
            end,
            length = 2, -- the length of actual key strokes that matches this pattern
          },
          ["d[tTfFs].i"] = { -- this matches d + {t/T/f/F} + {any character} + i
            message = function(keys) -- keys is a string of key strokes that matches the pattern
              return "Use " .. "c" .. keys:sub(2, 3) .. " instead of " .. keys
              -- example: Use ct( instead of dt(i
            end,
            length = 4,
          },
        },
      }
    end,
  },
}
