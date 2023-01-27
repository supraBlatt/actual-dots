{ inputs, lib, ... }:

let
  inherit (lib) const mapAttrs nixosSystem;
in

{
  flake.nixosConfigurations = mapAttrs (const nixosSystem) {
    default = {
      system = "x86_64-linux";
      modules = [
        ./hosts/default
      ];
    };
  };
}
