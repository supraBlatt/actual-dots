{ osConfig, ... }:

{
  home.stateVersion = "23.05";
  wayland.windowManager.hyprland = {
    enable = true;
    inherit (osConfig.programs.hyprland) package;
    extraConfig = builtins.readFile ../../../config/hypr/hyprland.conf;
  };
}
