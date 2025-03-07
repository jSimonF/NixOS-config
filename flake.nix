{

    description = "Simon's flake";

    inputs = {
      nixpkgs.url = "nixpkgs/nixos-24.11";
      nixos-hardware.url = "github:NixOS/nixos-hardware/master";
      home-manager.url = "github:nix-community/home-manager/release-24.11";
      home-manager.inputs.nixpkgs.follows = "nixpkgs";
      stylix.url = "github:danth/stylix/release-24.11";
    };

    outputs = { self, nixpkgs, nixos-hardware, home-manager, stylix, ... }@inputs:
      let
        lib = nixpkgs.lib;
	system = "x86_64-linux";
	pkgs = nixpkgs.legacyPackages.${system};
      in {
      nixosConfigurations = {
        franklin = lib.nixosSystem {
	  inherit system;
	  modules = [ 
	    ./configuration.nix 
	    nixos-hardware.nixosModules.lenovo-thinkpad-t480
	    inputs.stylix.nixosModules.stylix
	  ];
	};
      };
      homeConfigurations = {
        simon = home-manager.lib.homeManagerConfiguration {
	  inherit pkgs;
	  modules = [ 
	    ./home.nix
	    stylix.homeManagerModules.stylix
	  ];
	};
      };
    };

}
