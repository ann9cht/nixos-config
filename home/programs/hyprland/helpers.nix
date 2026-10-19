{ lib }:

let
  vars = import ./variables.nix;
  lua = lib.generators.mkLuaInline;
in
{
  inherit lua;

  exec = cmd: lua "hl.dsp.exec_cmd(${builtins.toJSON cmd})";
  m = key: "${vars.mainMod} + ${key}";

  bind = key: dispatcher: {
    _args = [
      key
      dispatcher
    ];
  };
  bindWith = key: dispatcher: opts: {
    _args = [
      key
      dispatcher
      opts
    ];
  };

  locked = {
    locked = true;
  };
  repeating = {
    repeating = true;
  };
  lockedRepeating = {
    locked = true;
    repeating = true;
  };

  floatRule =
    class: extra:
    {
      match = { inherit class; };
      float = true;
    }
    // extra;
  anim =
    leaf: extra:
    {
      inherit leaf;
      enabled = true;
      speed = 5;
      bezier = "myBezier";
    }
    // extra;
}
