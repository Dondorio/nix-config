{
  config.vim = {
    ui = {
      borders.enable = true;

      noice = {
        enable = true; # Completely replaces the UI for messages, cmdline and the popupmenu.
        setupOpts.format = {
          cmdline = {
            icon = "";
            lang = "vim";
            pattern = "^:";
          };
        };
      };

      colorizer.enable = true; # Colour highlighter
      modes-nvim.enable = true; # Prismatic line decorations for the adventurous vim user
      illuminate.enable = true; # Highlight the word under the cursor

      breadcrumbs = {
        enable = true;
        navbuddy.enable = true; # Popup that provides a breadcrumbs like navigation feature
      };

      smartcolumn = {
        # Auto hides colorcolumn
        enable = true;
        setupOpts.custom_colorcolumn = {
          # this is a freeform module, it's `buftype = int;` for configuring column position
          nix = "110";
          ruby = "120";
          java = "130";
          go = ["90" "130"];
        };
      };
      fastaction.enable = true; # Plugin designed to optimize code actions
    };

    visuals = {
      nvim-scrollbar.enable = false; # Scrollbar
      nvim-web-devicons.enable = true; # Provides nerdfont icons for use by nvim plugins
      nvim-cursorline.enable = true; # Highlight words and lines on the cursor
      cinnamon-nvim.enable = true; # Smooth scrolling
      fidget-nvim.enable = true; # Extensible UI for Neovim notifications and LSP progress messages

      highlight-undo.enable = true;
      indent-blankline = {
        enable = true; # This plugin adds indentation guides to Neovim
        setupOpts = {
          indent.char = "▏";
        };
      };
    };
  };
}
