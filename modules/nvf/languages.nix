{
  config.vim = {
    languages = {
      enableLSP = true;
      enableTreesitter = true;
      enableExtraDiagnostics = true;
      enableFormat = true;

      nix = {
        enable = true;
        format.type = "alejandra";
      };

      rust = {
        enable = true;
        crates.enable = true;
      };

      clang = {
        enable = true;
        cHeader = true;
        lsp.enable = true;
        treesitter.enable = true;
      };

      python.enable = true;
      lua.enable = true;
      bash.enable = true;

      # Webdev languages
      html.enable = true;
      css.enable = true;
      tailwind.enable = true;
      ts.enable = true;
      svelte.enable = true;
    };

    diagnostics.nvim-lint = {
      enable = true;
      # linters_by_ft = {
      #   rust = ["cargo clippy"];
      # };
    };

    debugger = {
      nvim-dap = {
        enable = true;
        ui.enable = true;
      };
    };

    lsp = {
      formatOnSave = true;
      lightbulb.enable = true; # Shows a lightbulb signifying a code action being available
      # lsplines.enable = true; # Render diagnostics using virtual lines
      lspSignature.enable = true; # Show function signature as you type
      nvim-docs-view.enable = true;
    };
  };
}
