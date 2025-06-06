return {
  "mini.nvim",
  for_cat = {
    cat = "general",
    default = true,
  },
  in_extra = {
    key = "colorscheme.name",
    value = "mini",
  },
  on_plugin = { "nvim-treesitter" },
  event = { "DeferredUIEnter" },
  after = function(plugin)
    -- Require setup all the modules
    -- Improve behavior of a and i keys
    require("mini.ai").setup()
    -- Align toolkit
    require("mini.align").setup()
    -- Comment lines
    require("mini.comment").setup()
    -- Move selection or line
    require("mini.move").setup()
    -- Evaluate, sort and exchange text regions
    require("mini.operators").setup()
    -- Automatically insert paranthesis pairs
    require("mini.pairs").setup()
    -- Split and join arguments to functions
    require("mini.splitjoin").setup()
    -- Surround actions
    require("mini.surround").setup({
      mappings = {
        add = 'gza', -- Add surrounding in Normal and Visual modes
        delete = 'gzd', -- Delete surrounding
        find = 'gzf', -- Find surrounding (to the right)
        find_left = 'gzF', -- Find surrounding (to the left)
        highlight = 'gzh', -- Highlight surrounding
        replace = 'gzr', -- Replace surrounding
        update_n_lines = 'gzn', -- Update `n_lines`

        suffix_last = 'l', -- Suffix to search with "prev" method
        suffix_next = 'n', -- Suffix to search with "next" method
      },
    })
    -- Basic settings
    require("mini.basics").setup({
      options = {
        basic = true,
        extra_ui = true,
        -- turns syntax on
        win_borders = "bold",
      },
      mappings = {
        basic = true,
        option_toggle_prefix = "\\",
        windows = true,
        move_with_alt = true,
      },
      autocommands = {
        basic = true,
        relnum_in_visual_mode = false,
      },
    })
    -- Move with square brackets
    require("mini.bracketed").setup()
    -- Jump to character
    -- require("mini.jump").setup()
    -- Highlight word under cursor
    require("mini.cursorword").setup()
    -- Highlight certain stuff
    local minihp = require("mini.hipatterns")
    minihp.setup({
      highlighters = {
        -- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
        fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
        hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
        todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
        note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },
        -- Highlight hex color strings (`#rrggbb`) using that color
        hex_color = minihp.gen_highlighter.hex_color(),
      },
    })
    -- Icons for file types
    -- require('mini.icons').setup()
    -- Scrollbar and text overview
    require("mini.map").setup({
      integrations = nil,
    })
  end,
}
