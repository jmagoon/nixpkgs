{ stdenv, lib, pkgs, fetchFromGitHub, pkgconfig }:

stdenv.mkDerivation rec {
  version = "2.10.6";
  name = "cpprestsdk-${version}";
  src = fetchFromGitHub {
    owner = "Microsoft";
    repo = "cpprestsdk";
    rev = "66e50f02dde92f802bbd3a8d79c6352954665b9b";
    sha256 = "1v2vqrs5lcsnjm5f8y6l7khl1gqjgq0p3qys54cybhjcb6l02x8k";
  };

  nativeBuildInputs = with pkgs; [ pkgconfig cmake ];
  buildInputs = with pkgs; [ zlib boost openssl];

  meta = with lib; {
    description = "A modern REST library for C++.";
    homepage = "https://github.com/Microsoft/cpprestsdk";
    maintainers = with maintainers; [ jmagoon ];
    platforms = platforms.linux;
  };
}
