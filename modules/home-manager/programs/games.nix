{pkgs, ...}: {
  home.packages = with pkgs; [
    lunar-client
    lutris
    (prismlauncher.override {
      jdks = [
        zulu8
        zulu17
        zulu
      ];
    })
  ];
}
