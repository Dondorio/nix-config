{ pkgs, ... }:

{
  stylix.enable = true;
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-frappe.yaml";

  stylix.cursor.package = pkgs.capitaine-cursors;
  stylix.cursor.name = "capitaine-cursors-dark";

  stylix.image = ../home-manager/programs/awesome/wallpapers/wallhaven-blue-anime-girl.png;
  
}
