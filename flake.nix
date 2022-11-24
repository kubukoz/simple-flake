{
  inputs.nixpkgs.url = "github:nixos/nixpkgs/release-21.05";
  outputs = { self, nixpkgs, ... }: {
    packages.aarch64-darwin.default = nixpkgs.legacyPackages.aarch64-darwin.cowsay;
    devShells.aarch64-darwin.default = let pkgs = import nixpkgs { system = "aarch64-darwin"; }; in
      pkgs.mkShell {
        buildInputs = [ pkgs.jdk8 pkgs.coursier ];
      };
  };
}
