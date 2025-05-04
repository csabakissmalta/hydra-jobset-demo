# default.nix
# A minimal Hydra jobset definition.

# Import nixpkgs. Hydra needs to know which version of nixpkgs to use.
# This is configured in the Hydra jobset settings itself.
let
  pkgs = import <nixpkgs> {
    # No specific system or overlays needed for this simple example
  };
in

# The result must be an attribute set.
# Each key in the set becomes a job name in Hydra.
# Each value must be a Nix derivation that Hydra can build.
{
  # Job name: "hello"
  # Derivation: The standard GNU Hello package from nixpkgs.
  hello = pkgs.hello;
}
