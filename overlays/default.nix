{ inputs }:
final: _prev: {
  serpantinum =
    inputs.serpantinum.packages.${final.stdenv.hostPlatform.system}.default.overrideAttrs
      (old: {
        patches = (old.patches or [ ]) ++ [
          ./patches/serpantinum/lunar.patch
        ];
      });
}
