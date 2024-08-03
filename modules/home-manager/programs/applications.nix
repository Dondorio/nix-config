{ pkgs, ... }:

{
  home.packages = with pkgs; [
    nautilus
    floorp
    kitty
    base16-schemes
    oranchelo-icon-theme
    flameshot 
  ];
}
