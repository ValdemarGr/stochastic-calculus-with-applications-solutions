{
  description = "Work";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }: 
    let
      pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
      };
      system = flake-utils.lib.system.x86_64-linux;
    in
      {
        devShells.${system} = {
          default = pkgs.mkShell {
            name = "import-env";
            packages = [
                pkgs.texliveFull
            ];
          };
        };
      };
}
