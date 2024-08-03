# homepage: https://github.com/brenoprata10/nvim-highlight-colors
{ pkgs, ... }:

{
  programs.nixvim = {
    extraPlugins = [ pkgs.vimPlugins.nvim-highlight-colors ];

    extraConfigLua = ''
      require("nvim-highlight-colors").setup({
        render = "background",
        enable_hex = true,
      })
    '';
  };
}
