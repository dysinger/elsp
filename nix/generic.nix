{ ocamlPackages, dune, reason }:

ocamlPackages.buildDunePackage rec {
  pname = "elsp";
  version = "0.0.1";
  src = ./..;
  nativeBuildInputs = [ dune reason ];
}
