#{pkgs, ...}:
{
  config.vim = {
    statusline.lualine.enable = true; # Fancy bottom bar
    telescope.enable = true; # Fuzzy finder
    autocomplete.nvim-cmp.enable = true; # Fancy autocomplete

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
            seperator_style = "padded_slope";
            # Null or one of “slant”, “padded_slant”, “slope”, “padded_slope”,
            # “thick”, “thin” or list of string
          };
        };
      };
    }; # Open buffers as tabs on the top of the screen

    autopairs.nvim-autopairs.enable = true; # Automatically pairs stuffs
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

    utility = {
      ccc.enable = true; # Colour picker/ highlighter
      # vim-wakatime.enable = false; # Smth smth productivity metrics
      diffview-nvim.enable = true; # View git diffs
      yanky-nvim.enable = false; # Improve nvim's yank and put functionalities
      icon-picker.enable = true; # Helps you input special characters such as emojis or nerfont icons
      surround.enable = true; # Easily surround words and such in anything you want
      leetcode-nvim.enable = true; # Leetcode in nvim
      # multicursors.enable = true; # Multiple cursors

      oil-nvim.enable = true; # Cool file browser

      motion = {
        hop.enable = true;
        leap.enable = true;
      };

      images = {
        image-nvim.enable = false; # Render images using kitty's img protocol
      };
    };

    notes = {
      todo-comments.enable = true;
    };

    terminal = {
      toggleterm = {
        enable = true;
        lazygit.enable = true; # Git helper
      };
    };

    comments = {
      comment-nvim.enable = true;
    };

    assistant = {
      copilot = {
        enable = true;
        cmp.enable = true;
      };
    };
  };
}
