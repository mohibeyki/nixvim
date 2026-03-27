{
  description = "Mohi's NeoVim configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    systems.url = "github:nix-systems/default";

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    neovim-nightly-overlay = {
      url = "github:nix-community/neovim-nightly-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      flake-parts,
      systems,
      neovim-nightly-overlay,
      ...
    }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = import systems;

      perSystem =
        { pkgs, system, ... }:
        let
          pkgs' = pkgs.extend neovim-nightly-overlay.overlays.default;
          nixvim' = inputs.nixvim.legacyPackages.${system};
          nvim = nixvim'.makeNixvimWithModule {
            pkgs = pkgs';
            module = ./modules;
            extraSpecialArgs = {
              neovim = pkgs'.neovim;
            };
          };
        in
        {
          packages = {
            default = nvim;
            nixvim = nvim;
          };
          formatter = pkgs.nixfmt-rfc-style;
        };
    };
}
