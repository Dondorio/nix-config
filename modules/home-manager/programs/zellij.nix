{
  config,
  pkgs,
  lib,
  inputs,
  ...
}: let
  zjstatus = inputs.zjstatus.packages.${pkgs.stdenv.system}.default;
  b16 = config.lib.stylix.colors;
in {
  programs = {
    zellij = {
      enable = true;
      enableZshIntegration = true;

      settings = {
        pane_frames = false;
        show_startup_tips = false;

        ui = {
          pane_frames = {
            rounded_corners = true;
          };
        };
      };
    };
  };

  xdg.configFile."zellij/layouts/default.kdl".text =
    # kdl
    ''
      layout {
        default_tab_template {
          pane size=1 borderless=true {
            plugin location="file:${zjstatus}/bin/zjstatus.wasm" {
              format_left   "{mode}#[bg=$bg] {tabs}"
              format_center "#[bg=$bg,fg=$fg] #[bg=$bg,fg=$fg]{session}"
              format_right  "{command_git_branch} {datetime} {swap_layout}"
              format_space  "#[bg=$bg]"
              format_hide_on_overlength "true"
              format_precedence "crl"

              border_enabled  "false"
              border_char     "─"
              border_format   "#[fg=#6C7086]{char}"
              border_position "top"

              tab_normal "${lib.concatStrings [
        "#[bg=#${b16.base05},fg=#${b16.base00}]"
        "#[bg=#${b16.base05},fg=#${b16.base02}] {index} "
        "#[bg=#${b16.base02},fg=#${b16.base05}] {name}"
        "{floating_indicator}{fullscreen_indicator}{sync_indicator} "
        "#[bg=#${b16.base00},fg=#${b16.base02},bold]"
      ]}"
              tab_active "${lib.concatStrings [
        "#[bg=#${b16.base0B},fg=#${b16.base00}]"
        "#[bg=#${b16.base0B},fg=#${b16.base02},italic] {index} "
        "#[bg=#${b16.base02},fg=#${b16.base05},italic] {name}"
        "{floating_indicator}{fullscreen_indicator}{sync_indicator} "
        "#[bg=#${b16.base00},fg=#${b16.base02}]"
      ]}"

              tab_separator "#[bg=#${b16.base00}] | "

              tab_sync_indicator       "  "
              tab_fullscreen_indicator "  "
              tab_floating_indicator   " 󰹙 "

              command_git_branch_command     "git rev-parse --abbrev-ref HEAD"
              command_git_branch_format      "#[fg=blue] {stdout} "
              command_git_branch_interval    "10"
              command_git_branch_rendermode  "static"

              datetime        "#[fg=#6C7086,bold] {format} "
              datetime_format "%A, %d %b %Y %H:%M"
              datetime_timezone "Europe/Warsaw"

              mode_normal        "#[bg=#${b16.base0B},fg=#${b16.base02},bold] NORMAL #[fg=#${b16.base0B},bg=$bg,bold]"
              mode_locked        "#[bg=#${b16.base04},fg=#${b16.base02},bold]  LOCKED #[fg=#${b16.base04},bg=$bg,bold]"
              mode_resize        "#[bg=#${b16.base08},fg=#${b16.base02},bold] 󰙖 RESIZE #[fg=#${b16.base08},bg=$bg,bold]"
              mode_pane          "#[bg=#${b16.base0D},fg=#${b16.base02},bold] PANE #[fg=#${b16.base0D},bg=$bg,bold]"
              mode_tab           "#[bg=#${b16.base07},fg=#${b16.base02},bold] TAB #[fg=#${b16.base07},bg=$bg,bold]"
              mode_scroll        "#[bg=#${b16.base0A},fg=#${b16.base02},bold]  SCROLL #[fg=#${b16.base0A},bg=$bg,bold]"
              mode_enter_search  "#[bg=#${b16.base0D},fg=#${b16.base02},bold] ENT-SEARCH #[fg=#${b16.base0D},bg=$bg,bold]"
              mode_search        "#[bg=#${b16.base0D},fg=#${b16.base02},bold]  SEARCHARCH #[fg=#${b16.base0D},bg=$bg,bold]"
              mode_rename_tab    "#[bg=#${b16.base07},fg=#${b16.base02},bold] 󰑕 RENAME-TAB #[fg=#${b16.base07},bg=$bg,bold]"
              mode_rename_pane   "#[bg=#${b16.base0D},fg=#${b16.base02},bold] 󰑕 RENAME-PANE #[fg=#${b16.base0D},bg=$bg,bold]"
              mode_session       "#[bg=#${b16.base0E},fg=#${b16.base02},bold] SESSION #[fg=#${b16.base0E},bg=$bg,bold]"
              mode_move          "#[bg=#${b16.base0F},fg=#${b16.base02},bold]  MOVE #[fg=#${b16.base0F},bg=$bg,bold]"
              mode_prompt        "#[bg=#${b16.base0D},fg=#${b16.base02},bold] PROMPT #[fg=#${b16.base0D},bg=$bg,bold]"
              mode_tmux          "#[bg=#${b16.base09},fg=#${b16.base02},bold]  TMUX #[fg=#${b16.base09},bg=$bg,bold]"
            }
          }
          children
        }

        // swap layouts (alt + [ || ] )
        swap_tiled_layout name="vertical" {
          tab max_panes=5 {
            pane split_direction="vertical" {
              pane
              pane { children; }
            }
          }
          tab max_panes=8 {
            pane split_direction="vertical" {
              pane { children; }
              pane { pane; pane; pane; pane; }
            }
          }
          tab max_panes=12 {
            pane split_direction="vertical" {
              pane { children; }
              pane { pane; pane; pane; pane; }
              pane { pane; pane; pane; pane; }
            }
          }
        }

        swap_tiled_layout name="horizontal" {
          tab max_panes=5 {
            pane
            pane
          }
          tab max_panes=8 {
            pane {
              pane split_direction="vertical" { children; }
              pane split_direction="vertical" { pane; pane; pane; pane; }
            }
          }
          tab max_panes=12 {
            pane {
              pane split_direction="vertical" { children; }
              pane split_direction="vertical" { pane; pane; pane; pane; }
              pane split_direction="vertical" { pane; pane; pane; pane; }
            }
          }
        }

        swap_tiled_layout name="stacked" {
          tab min_panes=5 {
            pane split_direction="vertical" {
              pane
              pane stacked=true { children; }
            }
          }
        }

        swap_floating_layout name="enlarged" {
          floating_panes max_panes=10 {
            pane { x "5%"; y 1; width "90%"; height "90%"; }
            pane { x "5%"; y 2; width "90%"; height "90%"; }
            pane { x "5%"; y 3; width "90%"; height "90%"; }
            pane { x "5%"; y 4; width "90%"; height "90%"; }
            pane { x "5%"; y 5; width "90%"; height "90%"; }
            pane { x "5%"; y 6; width "90%"; height "90%"; }
            pane { x "5%"; y 7; width "90%"; height "90%"; }
            pane { x "5%"; y 8; width "90%"; height "90%"; }
            pane { x "5%"; y 9; width "90%"; height "90%"; }
            pane focus=true { x 10; y 10; width "90%"; height "90%"; }
          }
        }

        swap_floating_layout name="staggered" {
          floating_panes
        }


        swap_floating_layout name="spread" {
          floating_panes max_panes=1 {
            pane {y "50%"; x "50%"; }
          }
          floating_panes max_panes=2 {
            pane { x "1%"; y "25%"; width "45%"; }
            pane { x "50%"; y "25%"; width "45%"; }
          }
          floating_panes max_panes=3 {
            pane focus=true { y "55%"; width "45%"; height "45%"; }
            pane { x "1%"; y "1%"; width "45%"; }
            pane { x "50%"; y "1%"; width "45%"; }
          }
          floating_panes max_panes=4 {
            pane { x "1%"; y "55%"; width "45%"; height "45%"; }
            pane focus=true { x "50%"; y "55%"; width "45%"; height "45%"; }
            pane { x "1%"; y "1%"; width "45%"; height "45%"; }
            pane { x "50%"; y "1%"; width "45%"; height "45%"; }
          }
        }
      }'';
}
