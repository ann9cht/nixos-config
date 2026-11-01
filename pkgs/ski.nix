{
  lib,
  stdenv,
  callPackage,
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
  sources = callPackage ../_sources/generated.nix { };

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
  inherit (sources.ski) version src;
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
