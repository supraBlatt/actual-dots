{
  imports = [
    ./browser.nix
    ./gui.nix
    ./packages.nix
    ./security.nix
    ./user.nix
  ];

  system.stateVersion = "23.05";  
}
