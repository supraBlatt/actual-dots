{ osConfig, pkgs, ... }:

let
  wallpaper = pkgs.callPackage ./wallpapers/city.nix { };

  autostart = pkgs.writeShellScript "hyprland-session-autostart" ''
    hyprctl setcursor Bibata-Modern-Ice 24
  '';
in

{
  home.stateVersion = "23.05";

  home.packages = with pkgs; [
    bibata-cursors
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    inherit (osConfig.programs.hyprland) package;
    extraConfig = ''
      exec-once = ${autostart}
    '' + builtins.readFile ../../../config/hypr/hyprland.conf;
  };

  services.dunst = {
    enable = true;
    configFile = ../../../config/dunst/dunstrc;
  };

  programs.waybar = {
    enable = true;
    systemd.enable = true;
  };

  systemd.user.services.swaybg = {
    Unit = {
      Description = "swaybg wallpaper daemon";
      After = [ "graphical-session-pre.target" ];
      PartOf = [ "graphical-session.target" ];
    };

    Service = {
      ExecStart = "${pkgs.swaybg}/bin/swaybg -i ${wallpaper} -m fill";
    };

    Install.WantedBy = [ "graphical-session.target" ];
  };
}
