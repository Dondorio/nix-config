{ ... }:
{
  programs.nixvim.plugins.ccc = {
    enable = true;

    settings = {
      highlighter.auto_enable = true;
      highlight_mode = "bg";
      default_color = "#FFFFFF";
      inputs = [
        "ccc.input.hsv"
        "ccc.input.rgb"
        "ccc.input.hsl"
      ];

    };

  };
}
