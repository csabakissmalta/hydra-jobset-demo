{ pkgs ? import <nixpkgs> {} }:

pkgs.stdenv.mkDerivation {
  name = "hello";
  src = ./.;
  buildPhase = ''
    echo "echo Hello, Hydra!" > hello.sh
    chmod +x hello.sh
  '';
  installPhase = ''
    mkdir -p $out/bin
    cp hello.sh $out/bin/hello
  '';
}
