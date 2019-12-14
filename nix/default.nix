{ sources ? import ./sources.nix }:

let
  ocamlOverlay = self: super: {
    # ocaml = super.ocaml.override { useX11 = false; };
    opaline = super.opaline.overrideAttrs (o: rec {
      nativeBuildInputs = (with super.ocamlPackages; [
        ocaml findlib ocamlbuild opam-file-format
      ]);
    });
  };
  overlays = [ ocamlOverlay ];
  pkgs = import sources.nixpkgs { inherit overlays; };
in

{
  elsp = {
    native = # NOTE: YOU HAVE TO COMPILE MACOS ON MACOS
      callPackage ./generic.nix {
        inherit ocamlPackages dune reason upx;
      };
    aarch64 =
      with pkgs.pkgsStatic.pkgsCross.aarch64-multiplatform;
      callPackage ./generic.nix {
        inherit (pkgs) dune reason upx;
        inherit ocamlPackages;
      };
    musl64 =
      with pkgs.pkgsStatic.pkgsCross.musl64;
      callPackage ./generic.nix {
        inherit (pkgs) dune reason upx;
        inherit ocamlPackages;
      };
    mingw32 =
      # let
      #   crossPkgs = import sources.nixpkgs {
      #     crossSystem = pkgs.lib.systems.examples.mingw32;
      #     inherit overlays;
      #   };
      # in
      #   with crossPkgs;
      with pkgs.pkgsCross.mingw32;
      callPackage ./generic.nix {
        inherit ocamlPackages dune reason upx;
      };
  };
}
