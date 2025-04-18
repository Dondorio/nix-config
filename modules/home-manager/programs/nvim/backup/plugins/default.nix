{ ... }: {
  imports = [
    ./telescope.nix
    ./toggleterm.nix
    ./ccc.nix
  ];

  programs.nixvim.plugins = {
    bufferline.enable = true;
    comment.enable = true;
    comment-box.enable = true;
    crates.enable = true;
    cursorline.enable = true;
    image.enable = true;
    lualine.enable = true;
    nvim-tree.enable = true;
    nvim-autopairs.enable = true;
    treesitter.enable = true;

    web-devicons.enable = true;
  };
}
