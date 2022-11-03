{
  outputs = { self, nixpkgs, ... }: {
    packages.aarch64-darwin.default = nixpkgs.legacyPackages.aarch64-darwin.cowsay;
    devShells.aarch64-darwin.default = let pkgs = import nixpkgs { system = "aarch64-darwin"; }; in
      pkgs.mkShell {
        packages = [ pkgs.hello ];
        shellHook = ''
          FOO=world ${./shell-hook.sh}
        '';
      };
  };
}
