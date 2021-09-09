{ stdenv, fetchFromGitHub, dmd, dub }:
let version = "12";
in stdenv.mkDerivation {
  inherit version;
  pname = "trash-d";
  src = ./.;

  buildInputs = [ dmd ];
  buildPhase = ''
    ${dub}/bin/dub build
  '';

  checkPhase = ''
    ${dub}/bin/dub test
  '';

  installPhase = ''
    mkdir -p "$out/bin"
    cp trash "$out/bin/"
  '';
}
