{ pkgs, ... }:

{
  fonts.fonts = with pkgs; [
    iosevka
    noto-fonts
    noto-fonts-emoji
    noto-fonts-cjk-sans
  ];
}
