let
  aagl-gtk-on-nix = import (builtins.fetchTarball {
    url = "https://github.com/ezKEa/aagl-gtk-on-nix/archive/main.tar.gz";
    sha256 = "1mnsks7kibjr8kb1cjy2052kjaxrvfp5adg2ibfal7j9862042af";
  });
in {
  home.packages = [aagl-gtk-on-nix.an-anime-game-launcher];
}
