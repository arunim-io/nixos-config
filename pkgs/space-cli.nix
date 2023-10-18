{ lib, fetchFromGitHub, buildGoModule }: buildGoModule rec {
  pname = "space-cli";
  version = "0.4.2";

  src = fetchFromGitHub {
    owner = "deta";
    repo = "space-cli";
    rev = "v${version}";
    hash = "sha256-oQFU9xbySl62sE+0gfS/pYNg5M7UA0EIS8mIXQGPoMk=";
  };

  vendorHash = "sha256-UL0igvXYAR33x9VpqcAhKgDLK3Ay0ZUFAK2lVEDFtTc=";


  # installPhase = ''
  #   runHook preInstall
  #   install -Dm755 bin/space -t $out/bin
  # '';

  meta = with lib; {
    description = " Deta Space CLI";
    homepage = "https://deta.space/docs/en/build/fundamentals/space-cli";
    changelog = "https://github.com/deta/space-cli/releases/tag/v${version}";
    license = licenses.mit;
  };
}
