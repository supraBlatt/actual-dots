{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    libsForQt5.dolphin
    wofi
  ];
}
