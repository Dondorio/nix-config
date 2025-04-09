{
  imports = [
    ./plugins.nix
    ./languages.nix
    ./ui.nix
    ./keymap.nix
  ];

  config.vim = {
    theme = {
      enable = true;
      name = "rose-pine";
      style = "moon";
    };

    viAlias = true;
    vimAlias = true;

    binds = {
      whichKey.enable = true;
      cheatsheet.enable = true;
    };

    options = {
      tabstop = 2;
      shiftwidth = 2;
    };

    # vim.diagnostic.config({virtual_lines = true})
    luaConfigPre = ''
      vim.diagnostic.config({ virtual_lines = { current_line = true } })
      vim.lsp.inlay_hint.enable(true)
    '';
  };
}
