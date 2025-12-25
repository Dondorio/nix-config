{pkgs, ...}: let
  c = with pkgs; [
    clang
    cmake
  ];

  rust = with pkgs; [
    cargo
    cargo-cross
    cargo-generate
    cargo-info
    cargo-modules
    clippy
    rustc
    rustfmt
  ];

  lua = with pkgs; [
    pkgs.lua
    luarocks
  ];

  ocaml = with pkgs; [
    dune_3
    opam
    pkgs.ocaml
  ];

  gleam = [pkgs.gleam];

  go = [pkgs.go];

  zig = [pkgs.zig];

  elixir = [pkgs.elixir];

  js = with pkgs; [
    nodejs
    yarn
  ];

  python = [pkgs.python3];
in {
  home.packages = with pkgs;
    [
      gnumake
      libtree
      meson
      ninja
    ]
    ++ c
    ++ rust
    ++ lua
    ++ ocaml
    ++ gleam
    ++ go
    ++ elixir
    ++ js
    ++ python
    ++ zig;
}
