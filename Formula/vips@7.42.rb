class VipsAT742 < Formula
  desc "Image processing library"
  homepage "https://github.com/thehecht/libvips"
  url "https://github.com/thehecht/libvips/archive/7.42.zip"
  sha256 "d48a6fe54dcc81f834afed3a7783e236df88776edff1278b2341e50ecf3b7d69"

  fails_with :clang

  depends_on "gobject-introspection" => :build
  depends_on "pkg-config" => :build
  depends_on "automake" => :build
  depends_on "gtk-doc" => :build
  depends_on "swig" => :build
  depends_on "autoconf" => :build
  depends_on "gcc" => :build
  depends_on "fftw"
  depends_on "fontconfig"
  depends_on "gettext"
  depends_on "giflib"
  depends_on "glib"
  depends_on "graphicsmagick"
  depends_on "jpeg"
  depends_on "libexif"
  depends_on "libgsf"
  depends_on "libpng"
  depends_on "librsvg"
  depends_on "libtiff"
  depends_on "little-cms2"
  depends_on "openexr"
  depends_on "openslide"
  depends_on "orc"
  depends_on "pango"
  depends_on "poppler"
  depends_on "webp"

  def install
    args = %W[
      --prefix=#{prefix}
      --without-python
    ]

    system "./bootstrap.sh"
    system "./configure", *args
    system "make", "install"
  end

  test do
    system "#{bin}/vips", "-l"
    cmd = "#{bin}/vipsheader -f width #{test_fixtures("test.png")}"
    assert_equal "8", shell_output(cmd).chomp
  end
end
