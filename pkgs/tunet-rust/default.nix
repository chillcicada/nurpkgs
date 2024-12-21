{ lib
, fetchFromGitHub
, rustPlatform
, pkg-config
, openssl
, freetype
}:

rustPlatform.buildRustPackage rec {
  pname = "tunet-rust";
  version = "0.9.4";

  src = fetchFromGitHub {
    owner = "Berrysoft";
    repo = pname;
    rev = "v${version}";
    hash = "sha256-evrchI+r7NcpZPUUMgpCxaB4to1SBBpPwOxFM1V7SP8=";
  };

  cargoHash = "sha256-qZUcOo05YF/+G+S2xUlV3FRAf8tTJCunhSwOZXphIG8=";

  cargoBuildFlags = [ "--workspace" "--exclude" "native" ];

  doCheck = false;

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ openssl freetype ];

  meta = with lib; {
    description = "清华大学校园网 Rust 库与客户端";
    homepage = "https://github.com/Berrysoft/tunet-rust";
    license = licenses.mit;
    mainProgram = "degit-rs";
  };
}
