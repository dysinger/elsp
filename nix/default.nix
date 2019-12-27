{ sources ? import ./sources.nix }:

let
  ocamlOverlay = self: super: {
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
    native =
      pkgs.callPackage ./generic.nix {
        inherit (pkgs) ocamlPackages dune reason upx;
      };
    musl64 =
      pkgs.callPackage ./generic.nix {
        inherit (pkgs.pkgsCross.musl64.pkgsStatic) ocamlPackages;
        inherit (pkgs) dune reason upx;
      };
  };
}
