# Nixvim package configuration
{ inputs, ... }:
{
  perSystem =
    { pkgs, system, ... }:
    let
      nixvim' = inputs.nixvim.legacyPackages.${system};
      nvim = nixvim'.makeNixvimWithModule {
        inherit pkgs;
        module = ../config;
      };
    in
    {
      packages = {
        default = nvim;
        nixvim = nvim;
      };
    };
}
