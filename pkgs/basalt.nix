{
  lib,
  fetchFromGitHub,
  rustPlatform,
  ...
}:
rustPlatform.buildRustPackage rec {
  pname = "basalt";
  version = "0.9.0";

  src = fetchFromGitHub {
    owner = "erikjuhani";
    repo = pname;
    rev = "09bbaf077647ae131722d4c9ae23ea2637d643b8";
    hash = "sha256-r34MlNSLZAHqNWlFMGNxT6zTSX+IKKQmJ4klEB4kjek=";
  };

  cargoHash = "sha256-TpbJ1HCBocgLAXGb5dBbZNMlOYXR9IGBRtfShgwlMIo=";

  meta = with lib; {
    description = "A fast line-oriented regex search tool, similar to ag and ack";
    homepage = "https://github.com/BurntSushi/ripgrep";
    license = licenses.unlicense;
    maintainers = [];
  };
}
