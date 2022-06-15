{
  description = "A very basic flake";

  outputs = { self, nixpkgs }: {

    packages.x86_64-linux.hello = nixpkgs.legacyPackages.x86_64-linux.hello;

    defaultPackage.x86_64-linux = self.packages.x86_64-linux.hello;

  };
}
{
  inputs = {
    nixgl.url = "github:guibou/nixGL";
  };
  outputs = { nixgl, ... }: { };
}
{
  outputs = { nixgl, nixpkgs, ... }:
  let
    pkgs = import nixpkgs {
      system = "x86_64-linux";
      overlays = [ nixgl.overlay ];
    };
  in
  # You can now reference pkgs.nixgl.nixGLIntel, etc.
  { }
}

