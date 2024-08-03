{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    #Home manager
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    #More stuff stolen from autumn
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    spicetify-nix.url = "github:the-argus/spicetify-nix";
    stylix.url = "github:danth/stylix";
  };

  outputs = { self, nixpkgs, home-manager, ... } @ inputs: 
  let
    pkgs = nixpkgs.legacyPackages.x86_64-linux;
  in
  {

    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      modules = [
        ./hosts/default/configuration.nix
        inputs.stylix.nixosModules.stylix
        # inputs.home-manager.nixosModules.default

        # inputs.nixvim.homeManagerModules.nixvim

        home-manager.nixosModules.home-manager {
          home-manager.useUserPackages = true;
          home-manager.useGlobalPkgs = true;
          home-manager.extraSpecialArgs = {inherit inputs;};
          home-manager.users.donda = import ./modules/home-manager;
        }

      ];
    };

    # homeConfigurations.donda = home-manager.lib.homeManagerConfiguration {
    #   extraSpecialArgs = { inherit inputs; };
    #   inherit pkgs;
    #   modules = [
    #     ./home.nix
    #     inputs.nixvim.homeManagerModules.nixvim
    #   ];
    # };

  };
}
