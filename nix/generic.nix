{ ocamlPackages, dune, reason, upx }:

ocamlPackages.buildDunePackage rec {
  pname = "elsp";
  version = "0.0.1";
  src = ./..;
  nativeBuildInputs = [ dune reason upx ];
  postFixup = ''
    upx -qqq --best $out/bin/*.exe
  '';
}
