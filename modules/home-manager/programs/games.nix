{pkgs, ...}: {
  home.packages = with pkgs; [
    # lutris
    lunar-client
    (prismlauncher.override {
      jdks = [
        zulu
        zulu8
        zulu17
        zulu25
      ];
    })
  ];
}
