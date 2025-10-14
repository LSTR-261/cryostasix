{
  lib,
  stdenv,
  fetchFromGitHub,
}:

stdenv.mkDerivation rec {
  pname = "arttime";
  version = "2.4.0";

  src = fetchFromGitHub {
    owner = "poetaman";
    repo = "arttime";
    rev = "v${version}";
    hash = "sha256-luz2tz8ammN4Xiw5q4vUVAAwIpbDNU/vO/ewTlvjRHA=";
  };

  meta = {
    description = "Arttime is a CLI application that blends beauty of ASCII / text art with functionality of clock / timer / pattern-based time manager in terminal";
    homepage = "https://github.com/poetaman/arttime";
    license = lib.licenses.gpl3Only;
    maintainers = with lib.maintainers; [ ];
    mainProgram = "arttime";
    platforms = lib.platforms.all;
  };
}
