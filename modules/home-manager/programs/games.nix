{pkgs, ...}: {
  home.packages = with pkgs; [
    lunar-client
    lutris
    (prismlauncher.override {
      jdks = [
        zulu
        zulu17
        zulu8
      ];
    })
  ];
}
