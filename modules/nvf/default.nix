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
  };
}
