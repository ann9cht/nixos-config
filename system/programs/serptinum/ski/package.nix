{
  lib,
  stdenv,
  fetchurl,
  autoPatchelfHook,
  makeWrapper,
  libGL,
  wayland,
  libxkbcommon,
  libx11,
  libxcursor,
  libxi,
  libxrandr,
  vulkan-loader,
  xdg-utils,
  fontconfig,
  gnutar,
  p7zip,
  ffmpeg-headless,
  shared-mime-info,
}:

let
  runtimeLibs = [
    libGL
    wayland
    libxkbcommon
    libx11
    libxcursor
    libxi
    libxrandr
    vulkan-loader
  ];
  runtimeTools = [
    xdg-utils
    fontconfig
    gnutar
    p7zip
    ffmpeg-headless
  ];
in
stdenv.mkDerivation {
  pname = "ski-bin";
  version = "0.4.2";

  src = fetchurl {
    url = "https://github.com/ilyamiro/Ski/releases/download/v0.4.2/ski-0.4.2-x86_64-linux.tar.gz";
    sha256 = "8f387beef096f1f0d5f9a3f85d777977618b6fd41a7b5dc36b3ad7f547eb81a2";
  };
  sourceRoot = ".";

  nativeBuildInputs = [
    autoPatchelfHook
    makeWrapper
  ];
  buildInputs = [
    stdenv.cc.cc.lib
    fontconfig
  ];

  installPhase = ''
    runHook preInstall
    mkdir -p $out
    cp -r usr/* $out/
    substituteInPlace $out/share/dbus-1/services/*.service \
      --replace-fail /usr/bin $out/bin
    wrapProgram $out/bin/ski \
      --prefix LD_LIBRARY_PATH : ${lib.makeLibraryPath runtimeLibs} \
      --prefix PATH : ${lib.makeBinPath runtimeTools} \
      --suffix XDG_DATA_DIRS : ${shared-mime-info}/share
    runHook postInstall
  '';

  meta.mainProgram = "ski";
}
