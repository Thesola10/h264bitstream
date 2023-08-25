{
  inputs."nixpkgs".url = github:nixos/nixpkgs;

  outputs = { self, nixpkgs, ... }:
  { packages.x86_64-linux.default =
      (import nixpkgs { system = "x86_64-linux"; }).stdenv.mkDerivation {
        name = "h264bitstream";
        src = ./.;
        buildPhase = "make -f Makefile.unix";
        installPhase = "mkdir -p $out/lib && install -Dm755 libh264bitstream.a $out/lib";
      };
    packages.aarch64-linux.default =
      (import nixpkgs { system = "aarch64-linux"; }).stdenv.mkDerivation {
        name = "h264bitstream";
        src = ./.;
        buildPhase = "make -f Makefile.unix";
        installPhase = "mkdir -p $out/lib && install -Dm755 libh264bitstream.a $out/lib";
      };
  };
}
