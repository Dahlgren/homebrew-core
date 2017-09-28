class Armake < Formula
  desc "Arma modding tools (PAA conversion, binarization/rapification, PBO packing)"
  homepage "https://github.com/KoffeinFlummi/armake"
  url "https://github.com/KoffeinFlummi/armake/archive/v0.5.1.tar.gz"
  sha256 "9a1303bc748e564d29cb7fcafa76c680db715412b31a31b5401aa8b1f92894bf"
  head "https://github.com/KoffeinFlummi/armake.git"

  depends_on "bison" => :build
  depends_on "openssl" => :build

  def install
    inreplace "Makefile", "  ", "\t"
    system "make"
    bin.install Dir["bin/*"]
    bash_completion.install "completions/armake" => "armake"
  end

  test do
    system "#{bin}/armake"
  end
end
