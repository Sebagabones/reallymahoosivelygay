{
  description = "Nix by Example";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    bun2nix.url = "github:baileyluTCD/bun2nix";
    bun2nix.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, bun2nix }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      nodejs = pkgs.nodejs_24;
      bun = pkgs.bun;
      mkBunDerivation = bun2nix.lib.${system}.mkBunDerivation;
      # bun2nix = bun2nix.packages.${system}.default;
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
      # mahoosivelyGay = pkgs.callPackage ./build.nix {
      #   inherit (bun2nix.lib.${system}) mkBunDerivation;
      # };
      packages.${system}.default = mkBunDerivation {
        pname = "MahoosivelyGay";
        packageJson = ./package.json;
        index = "src/pages/index.astro";
        src = ./.;
        bunNix = ./bun.nix;
        # pname = "Mahoosively Gay";
        # version = "1.0.0";
        #
        # src = ./.;
        #
        # bunNix = ./bun.nix;
        #
        # index = "client/index.html";
      };
      # packages.${system}.default = pkgs.stdenv.mkDerivation (finalAttrs: {
      #   pname = "astro-site";
      #   version = "0.0.1";
      #   src = ./.;
      #
      #   nativeBuildInputs = [ nodejs bun ];
      #
      #   buildPhase = ''
      #     bun run build
      #   '';
      #
      #   installPhase = ''
      #     cp -r dist $out
      #   '';
      # });

      formatter = pkgs.nixpkgs-fmt;
    };
}
