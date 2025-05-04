{
  description = "Your flake description";

  # Optional but standard
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable"; # Example input
    # other inputs...
  };

  # The 'outputs' attribute's value IS a function
  outputs = { self, nixpkgs, ... }@inputs:
    # The value RETURNED by the outputs function MUST be an attribute set
    let
      system = "x86_64-linux"; # Or derive from inputs
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      # Your actual outputs go here (packages, apps, checks, hydraJobs, etc.)
      packages.${system}.default = pkgs.hello;

      # If defining Hydra jobs within the flake:
      hydraJobs.${system} = {
         hello = pkgs.hello;
         # other jobs...
      };
    }; # End of the outputs attrset
}
