{ stdenv, lib, pkgs, fetchFromGitHub, pkgconfig }:

stdenv.mkDerivation rec {
  version = "1.1.2";
  name = "nativefiledialog-${version}";
  src = fetchFromGitHub {
    owner = "mlabbe";
    repo = "nativefiledialog";
    rev = "5cfe5002eb0fac1e49777a17dec70134147931e2";
    sha256 = "02baxnp1vp3058rljvrmrya4laf1qp8a7ph7fg2njy809d9468mc";
  };

  buildInputs = with pkgs; [ pkgconfig gnome3.gtk ];

  preBuild = "cd ./build/gmake_linux";

  installPhase = ''
    cd ../..
    cp -r src/include $out/
    cp -a build/obj/x64/Release/nfd/. $out/include/
    mkdir -p $out/lib
    cp -a build/lib/Release/x64/. $out/lib/
  '';

  meta = with lib; {
    description = "File dialogs for C/C++ programs";
    homepage = "https://github.com/mlabbe/nativefiledialog";
    maintainers = with maintainers; [ "jmagoon" ];
    platforms = platforms.linux;
  };
}
