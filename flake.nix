{
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }:
    (flake-utils.lib.eachSystem [ "aarch64-linux" "i686-linux" "x86_64-linux" ]
      (system: {
        packages.trash-d = nixpkgs.legacyPackages.${system}.callPackage ./. { };
        defaultPackage = self.packages.${system}.trash-d;
      })) // {
        overlay = final: prev: { trash-d = prev.callPackage ./. { }; };
      };
}
