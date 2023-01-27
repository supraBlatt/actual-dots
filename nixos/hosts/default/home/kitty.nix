{ pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    extraConfig = builtins.readFile ../../../../config/kitty/kitty.conf;
  };
}
