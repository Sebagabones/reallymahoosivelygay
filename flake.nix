{
  description = "Mahoosively Gay";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    bun2nix.url = "github:baileyluTCD/bun2nix";
    bun2nix.inputs.nixpkgs.follows = "nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, bun2nix, flake-utils }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      nodejs = pkgs.nodejs_24;
      bun = pkgs.bun;
      mkBunDerivation = bun2nix.lib.${system}.mkBunDerivation;
    in {
      devShells.${system}.default = pkgs.mkShell {
        buildInputs = [
          pkgs.nodejs
          pkgs.bun
          pkgs.yarn-berry
          bun2nix.packages.${system}.default
        ];

        shellHook = ''
          export PATH="$PWD/node_modules/.bin:$PATH"
        '';
      };
      packages.${system}.default = mkBunDerivation {
        pname = "MahoosivelyGay";
        packageJson = ./package.json;
        index = "src/pages/index.astro";
        src = ./.;
        bunNix = ./bun.nix;
        buildPhase = ''
          bun run build
        '';
        installPhase = ''
          cp -R dist $out
        '';
      };
      formatter.${system} = pkgs.nixpkgs-fmt;
    };
}
