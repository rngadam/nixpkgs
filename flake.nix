{
  description = "rngadam's personal nixpkgs collection";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        packages = {
          ingress2gateway = pkgs.callPackage ./pkgs/ingress2gateway/default.nix { };
          gwctl = pkgs.callPackage ./pkgs/gwctl/default.nix { };
          default = self.packages.${system}.ingress2gateway;
        };
      }
    );
}
