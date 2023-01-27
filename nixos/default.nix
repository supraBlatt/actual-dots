{ inputs, lib, ... }:

let
  inherit (lib) const mapAttrs nixosSystem;
in

{
  flake.nixosConfigurations = mapAttrs (const nixosSystem) {
    default = {
      system = "x86_64-linux";
      modules = [
        inputs.home-manager.nixosModules.default
        inputs.hyprland.nixosModules.default
        ./hosts/default
        {
          home-manager.users.yu.imports = [
            inputs.hyprland.homeManagerModules.default
          ];
        }
        {
          nix.registry = {
            nixpkgs.flake = inputs.nixpkgs;
          };
        }
      ];
    };
  };
}
