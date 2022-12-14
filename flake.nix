{
  description = "My NixOS Configuration";

  inputs = {
    nixpkgs = { url = "github:nixos/nixpkgs/nixos-22.05"; };
    jetbrains-toolbox.url = "./jetbrains-toolbox";
    lapce.url = "./lapce";
    ultorg.url = "./ultorg";
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    nixosConfigurations.nixos-framework = inputs.nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [ ./configuration.nix ];
      specialArgs = { inherit inputs; };
    };
  };
}
