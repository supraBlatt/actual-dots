{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    kitty
    libsForQt5.dolphin
    wofi
  ];
}
