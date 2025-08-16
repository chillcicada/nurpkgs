{
  lib,
  fetchFromGitHub,
  rustPlatform,
}:

rustPlatform.buildRustPackage (finalAttrs: {
  pname = "projclean";
  version = "0.8.0";

  src = fetchFromGitHub {
    owner = "sigoden";
    repo = "projclean";
    tag = "v${finalAttrs.version}";
    hash = "sha256-EScezOsfiirg8YbhteFxuVTodeup8tUzZdcrWveJxWE=";
  };

  cargoHash = "sha256-9atTgWg1iYCeXsRLLMOR87CbpIezD3ozMMOgumRNKAg=";

  meta = {
    description = "Project dependencies & build artifacts cleanup tool.";
    homepage = "https://github.com/sigoden/projclean";
    license = lib.licenses.mit;
    platforms = lib.platforms.linux;
    maintainers = with lib.maintainers; [ chillcicada ];
  };
})
