{
  lib,
  fetchFromGitHub,
  rustPlatform,
  ...
}:
rustPlatform.buildRustPackage rec {
  pname = "osintui";
  version = "0.25.7";

  src = fetchFromGitHub {
    owner = "wssheldon";
    repo = pname;
    rev = "1cd4cff7b76e2be9f69fc8392c81875791154806";
    hash = "sha256-qJ+81eFKxX8HUXB+r6wVMB1Le7QS/zwKacX8Eo73jjg=";
  };

  cargoHash = "sha256-qJ+81eFKxX8HUXB+r6wVMB1Le7QS/zwKacX8Eo73jjg=";

  meta = with lib; {
    description = "A fast line-oriented regex search tool, similar to ag and ack";
    homepage = "https://github.com/BurntSushi/ripgrep";
    license = licenses.unlicense;
    maintainers = [];
  };
}
