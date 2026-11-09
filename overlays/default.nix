{ inputs }:
final: prev: {
  serpantinum =
    inputs.serpantinum.packages.${final.stdenv.hostPlatform.system}.default.overrideAttrs
      (old: {
        patches = (old.patches or [ ]) ++ [
          ./patches/serpantinum/lunar.patch
        ];
      });

  ski = (final.callPackage inputs.ski { }).overrideAttrs (old: {
    postInstall = (old.postInstall or "") + ''
      install -Dm644 ${./assets/ski/ski.svg} $out/share/icons/hicolor/scalable/apps/ski.svg
    '';
  });

  mpv = prev.mpv.override { youtubeSupport = false; };
}
