{
  description = "A very basic flake";

  inputs = {

    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:nixos/nixpkgs/release-22.05";

  };

  outputs = { self, flake-utils, nixpkgs }:
    flake-utils.lib.eachDefaultSystem
      (system:
        let

          pkgs = nixpkgs.legacyPackages.${system};

        in {

          dockerImage = (import ./default.nix { inherit pkgs; });

        }
      );
}
