class Db48x < Formula
  desc "RPL calculator and desktop simulator in the spirit of the HP48"
  homepage "https://github.com/c3d/db48x"
  url "https://github.com/c3d/db48x/archive/refs/tags/v0.10.0.tar.gz"
  sha256 "199569681ae85862f04baca976f53b1c989151376aa0e09ee079a1be848039ed"
  license "LGPL-3.0-only"

  depends_on "coreutils" => :build
  depends_on "freetype" => :build
  depends_on "make" => :build
  depends_on "pkgconf" => :build
  depends_on "python@3.14" => :build
  depends_on "qtbase"
  depends_on "qtmultimedia"

  # Submodules pinned by v0.10.0, including recorder's build system.
  resource "recorder" do
    url "https://github.com/c3d/recorder/archive/929fb20fc2741dcb9b427a95d266b74f375b4c58.tar.gz"
    sha256 "d6a14ed447bd2a21c794445f3191a9c1b3fe00b1d19de583a40174f02d224c59"
  end

  resource "make-it-quick" do
    url "https://github.com/c3d/make-it-quick/archive/1dd12444607212a20c755299b003e46e1b357d92.tar.gz"
    sha256 "ff43df6a02eceb401f30f6562fa79987240970bf89af1dfe26d73815b0b446a2"
  end

  def install
    resource("recorder").stage buildpath/"recorder"
    resource("make-it-quick").stage buildpath/"recorder/make-it-quick"
    ENV.prepend_path "PATH", formula_opt_libexec("coreutils")/"gnubin"

    system "gmake", "sim", "VERSION=#{version}", "QMAKE=#{formula_opt_bin("qtbase")}/qmake"
    if OS.mac?
      prefix.install "db48x.app"
      bin.install_symlink prefix/"db48x.app/Contents/MacOS/db48x"
    else
      bin.install "db48x"
    end
  end

  def caveats
    on_macos do
      <<~EOS
        Launch the simulator with db48x, or open the app with:
          open #{opt_prefix}/db48x.app
        To add it to Applications:
          ln -s #{opt_prefix}/db48x.app /Applications/db48x.app
      EOS
    end
  end

  test do
    assert_equal "5", shell_output("#{bin}/db48x -H -Z -E '2 3 +'").strip
    assert_equal "144", shell_output("#{bin}/db48x -H -Z -E '12 SQ'").strip
  end
end
