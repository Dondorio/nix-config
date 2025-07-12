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
          ({inputs, ...}: {
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

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    self.submodules = true;

    nixcats = {
      url = "./modules/nixcats";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Extra

    musnix = {
      url = "github:musnix/musnix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-index-database = {
      url = "github:nix-community/nix-index-database";
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

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zjstatus = {
      url = "github:dj95/zjstatus";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
}
