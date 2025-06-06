{
  description = "A very cool flake";

  outputs = {
    self,
    nixpkgs,
    home-manager,
    ...
  } @ inputs: let
    pkgs = import nixpkgs {
      system = "x86_64-linux";
    };
  in {
    nixosConfigurations = {
      donda = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          ./hosts/default/configuration.nix
          inputs.home-manager.nixosModules.home-manager
          ({
            pkgs,
            inputs,
            ...
          }: {
            imports = [
              inputs.nixcats.nixosModules.default
            ];

            nixCats.enable = true;
            #   environment.systemPackages = [
            #     self.packages.${pkgs.stdenv.system}.nvf
            #   ];
          })
        ];
      };

      customISO = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          ./hosts/customISO/configuration.nix
        ];
      };
    };

    packages.x86_64-linux = {
      nvf =
        (inputs.nvf.lib.neovimConfiguration {
          inherit pkgs;
          modules = [
            ./modules/nvf
          ];
        })
        .neovim;
    };
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    #nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-24.11";
    nixpkgs-cad7255.url = "github:nixos/nixpkgs/cad72553776976da6754e035490f032e6dbf7012";
    # nixpkgs-nvf.url = "github:nixos/nixpkgs/25d1b84f5c90632a623c48d83a2faf156451e6b1";

    #Home manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    musnix = {
      url = "github:musnix/musnix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    aagl = {
      url = "github:ezKEa/aagl-gtk-on-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixcats = {
      url = "path:./modules/nixcats";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
}
