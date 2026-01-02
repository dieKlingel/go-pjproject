{
  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-25.11";
    };
    systems = {
      url = "github:nix-systems/default-linux";
    };
  };

  outputs = { 
    self,
    nixpkgs,
    systems,
  }: rec {
    devShells = nixpkgs.lib.genAttrs (import systems) (system: let
      pkgs = import nixpkgs { inherit system; };
    in {
      default = pkgs.mkShell {
        packages = [
          pkgs.go
          pkgs.swig
          pkgs.pkg-config
          pkgs.pjsip
          pkgs.openssl
          pkgs.alsa-lib
        ];
      };
    });
  };
}
