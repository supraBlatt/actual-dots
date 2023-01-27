{
  users.users.yu = {
    isNormalUser = true;
    description = "Yu";
    extraGroups = [ "wheel" ];
    initialHashedPassword = "$7$CU..../....gXRz0tUuUZ5JxjdRorIjn.$gooY.tpsYAyilmcVkLNSQSJORJA8qpttviUOdeU9HOC";
  };
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.yu = ./home.nix;
  };
}
