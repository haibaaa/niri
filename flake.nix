{
  description = ''
    niri
  '';

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    # Home Manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Neovim Flake
    nvf.url = "github:notashelf/nvf";

    # Other Programs
    stylix.url = "github:danth/stylix";
    apple-fonts.url = "github:Lyndeno/apple-fonts.nix";
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    nixcord.url = "github:kaylorben/nixcord";
    sops-nix.url = "github:Mic92/sops-nix";
    nixarr.url = "github:rasmus-kirk/nixarr";
    noctalia.url = "github:noctalia-dev/noctalia-shell";
    search-nixos-api.url = "github:anotherhadi/search-nixos-api";
  };

  outputs = inputs @ {
    nixpkgs,
    home-manager,
    nvf,
    ...
  }: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config = {
        permittedInsecurePackages = ["openssl-1.1.1w"];
        allowUnfree = true;
        allowBroken = true;
      };
    };
  in {
    # 1. NixOS Configurations (Your main rig)
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          {
            nixpkgs.config = {
              permittedInsecurePackages = ["openssl-1.1.1w"];
              allowBroken = true;
              allowUnfree = true;
            };
            _module.args = {inherit inputs;};
          }
          inputs.home-manager.nixosModules.home-manager
          inputs.stylix.nixosModules.stylix
          ./hosts/nixos/configuration.nix
        ];
      };
    };

    # 2. Home Manager Configurations (For Arch Linux)
    # Replace 'yourusername' with your actual Arch Linux username
    homeConfigurations."viz" = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      extraSpecialArgs = {inherit inputs;};
      modules = [
        ./hosts/nixos/home.nix # Reuses your existing home-manager logic
        {
          home = {
            username = "viz";
            homeDirectory = "/home/viz";
            stateVersion = "24.11";
          };
        }
      ];
    };

    # 3. Standalone Packages (Handy for 'nix run .#nvim' on any machine)
    packages.${system} = {
      nvim =
        (nvf.lib.neovimConfiguration {
          inherit pkgs;
          modules = [./home/programs/nvf/default.nix];
        }).neovim;
    };
  };
}
