  {
  description = "meltalizard's NixOS configuration";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    # ↑ removed the pkgs = import nixpkgs { ... } block that was here
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }: {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./configuration.nix
          home-manager.nixosModules.home-manager
          {
          nixpkgs.config.allowUnfree = true;              # add this
          nixpkgs.config.android_sdk.accept_license = true;
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "backup";
            home-manager.users.meltalizard = {
              imports = [
                ./home.nix
                ./packages.nix
                ./android.nix
                ./shell.nix
              ];
            };
          }
        ];
      };
    };

    devShells.x86_64-linux.default = let
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
    in pkgs.mkShell {
      packages = [
        (pkgs.python3.withPackages (ps: with ps; [
          tensorflow
          numpy
          pillow
        ]))
      ];
    };
  };
}
