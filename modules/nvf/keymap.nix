{
  config.vim.keymaps = [
    {
      key = "<C-h>";
      mode = "n";
      silent = true;
      action = ": bp <CR>";
    }
    {
      key = "<C-l>";
      mode = "n";
      silent = true;
      action = ": bn <CR>";
    }

    {
      # Oil
      key = "-";
      mode = "n";
      silent = true;
      action = ": Oil <CR>";
    }

    {
      # Exit terminal mode
      key = "<Esc>";
      mode = "t";
      silent = true;
      action = "<C-\\><C-n>";
    }
    {
      # Exit terminal
      key = "<S-Esc>";
      mode = "t";
      silent = true;
      action = "<C-\\><C-n> :q <CR>";
    }
  ];
}
