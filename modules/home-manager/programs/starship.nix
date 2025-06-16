{
  lib,
  config,
  ...
}: let
  cfg = config.programs.starship;
in {
  options.programs.starship = {
    separators = {
      enable_l = lib.mkOption {
        type = lib.types.bool;
        default = true;
      };
      enable_r = lib.mkOption {
        type = lib.types.bool;
        default = true;
      };

      slope_l = lib.mkOption {
        default = "";
      };
      slope_r = lib.mkOption {
        default = "";
      };

      round_l = lib.mkOption {
        default = "";
      };
      round_r = lib.mkOption {
        default = "";
      };
    };

    fill_symbol = lib.mkOption {
      default = " ";
    };

    lang = {
      style = lib.mkOption {
        default = "bg:green";
      };
      format = lib.mkOption {
        default = "[ [$lang_name $symbol( $version) ](fg:white bg:green)]($style)";
        description = "The format of the languages with set symbols. You can also use $lang_name";
      };
      symbols = lib.mkOption {
        default = {
          lua = "";
          nodejs = "";
          c = " ";
          cpp = " ";
          rust = "";
          golang = "";
          php = "";
          java = "";
          kotlin = "";
          haskell = "";
          python = "";
        };
      };
    };
  };

  config.programs.starship = {
    enable = true;
    settings =
      {
        format = lib.replaceStrings ["\n"] [""] (
          lib.concatStrings [
            # General
            # toml
            ''
              $username
              $directory
            ''

            # Git
            # toml
            ''
              $git_branch
              $git_status
            ''

            # Extra
            # toml
            ''
              $nix_shell
            ''

            # Right side
            # toml
            ''
              $fill
              ${
                if cfg.separators.enable_r
                then "[${cfg.separators.slope_l}](fg:cyan)"
                else ""
              }
              $cmd_duration
            ''

            # Languages
            # toml
            ''
              ${
                if cfg.separators.enable_r
                then "[${cfg.separators.slope_l}](bg:cyan fg:green)"
                else ""
              }
              $c
              $cpp
              $golang
              $haskell
              $java
              $kotlin
              $lua
              $nix
              $nodejs
              $php
              $python
              $rust
            ''

            # Input area
            # toml
            ''
              $line_break
              $character
            ''
          ]
        );

        directory = {
          truncation_length = 3;
          truncation_symbol = "…/";
          substitutions = {
            "Documents" = "󰈙 ";
            "Downloads" = " ";
            "Music" = "󰝚 ";
            "Pictures" = " ";
            "Documents/programming" = "󰲋 ";
          };
        };

        # Git
        git_branch = {
          symbol = "";
          format = "[$symbol $branch ]($style)";
        };

        # Extra
        nix_shell = {
          style = "bold italic dimmed blue";
          symbol = "󱄅";
          format = ''[$symbol shell \[$state\]]($style) [$name](italic dimmed blue)'';
          impure_msg = "[impure](bold red)";
          pure_msg = "[pure](bold orange)";
          unknown_msg = "[?](bold white)";
        };

        # Right side
        fill = {
          symbol = cfg.fill_symbol;
        };

        cmd_duration = {
          disabled = false;
          style =
            if cfg.separators.enable_l
            then "bg:cyan fg:black"
            else "cyan";
          format = ''[ [ $duration]($style) ]${
              if cfg.separators.enable_l
              then "(bg:cyan)"
              else "()"
            }'';
        };
      }
      # the // here is for merging sets
      // lib.mapAttrs (langName: symbol: let
        inherit (cfg.lang) style format;
      in {
        inherit symbol;
        inherit style;
        format = lib.replaceStrings ["$lang_name"] [langName] format;
      })
      cfg.lang.symbols;
  };
}
