{
  config.vim = {
    telescope.enable = true; # Fuzzy finder

    autocomplete.nvim-cmp = {
      enable = true; # Fancy autocomplete
      setupOpts = {
        window = {
          completion = {
            winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None";
            col_offset = -3;
            side_padding = 0;
          };
        };
      };
    };

    spellcheck = {
      enable = true;
      programmingWordlist.enable = true;
    };

    tabline = {
      nvimBufferline = {
        enable = true;
        setupOpts = {
          options = {
            numbers = "none";
            separator_style = "slant";
            sort_by = "id";

            # Null or one of “slant”, “padded_slant”, “slope”, “padded_slope”,
            # “thick”, “thin” or list of string
          };
        };
      };
    }; # Open buffers as tabs on the top of the screen
    statusline.lualine.enable = true; # Fancy bottom bar

    snippets.luasnip.enable = true; # Code snippets

    treesitter = {
      context.enable = true; # Show the cut off context on the top of the buffer
      indent.enable = true;
    };

    git = {
      enable = true;
      gitsigns.enable = true;
      gitsigns.codeActions.enable = false; # throws an annoying debug message
    }; # Idk what this does

    notify = {
      nvim-notify.enable = true;
    };

    mini = {
      # Text editing
      ai.enable = true;
      # align.enable = true;
      comment.enable = true;
      # completion = {
      #   enable = true;
      #   setupOpts = {
      #     mappings = {
      #
      #     };
      #   };
      # };
      # keymap.enable = true;
      move.enable = true;
      operators.enable = true;
      pairs.enable = true;
      # snippets.enable = true;
      splitjoin.enable = true;
      surround.enable = true;

      # General workflow
      # Can't be bothered writing out all the possible mini modules

      # Appearance
      animate = {
        enable = true;
        setupOpts = {
          cursor.enable = false;
        };
      };
      icons.enable = true;
      starter.enable = true;
      trailspace.enable = true;

      # Other
    };

    utility = {
      oil-nvim.enable = true; # Cool file browser

      # ccc = {
      #   enable = true; # Colour picker/ highlighter
      # };

      # vim-wakatime.enable = true; # Smth smth productivity metrics
      diffview-nvim.enable = true; # View git diffs
      # yanky-nvim.enable = true; # Improve nvim's yank and put functionalities
      icon-picker.enable = true; # Helps you input special characters such as emojis or nerfont icons
      # surround.enable = true; # Easily surround words and such in anything you want
      leetcode-nvim.enable = true; # Leetcode in nvim
      # multicursors.enable = true; # Multiple cursors

      motion = {
        hop.enable = true;
        leap.enable = true;
      };
    };

    notes = {
      todo-comments.enable = true;
    };

    comments = {
      comment-nvim.enable = true;
    };

    terminal = {
      toggleterm = {
        enable = true;
        lazygit.enable = true; # Git helper
        setupOpts = {
          direction = "vertical";
        };
      };
    };
  };
}
