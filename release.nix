{ nixpkgs ? <nixpkgs> }:

let
  pkgs = import nixpkgs {};
in {
  helloJob = pkgs.callPackage ./hello.nix {};
}
