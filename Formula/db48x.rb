class Db48x < Formula
  desc "RPL calculator simulators in the spirit of the HP48"
  homepage "https://github.com/c3d/db48x"
  url "https://github.com/c3d/db48x/archive/refs/tags/v0.10.0.tar.gz"
  sha256 "199569681ae85862f04baca976f53b1c989151376aa0e09ee079a1be848039ed"
  license "LGPL-3.0-only"

  option "without-db48x", "Build without the DM42-style db48x simulator"
  option "without-db50x", "Build without the color DM32-style db50x simulator"

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
    odie "At least one simulator must be enabled" if build.without?("db48x") && build.without?("db50x")

    resource("recorder").stage buildpath/"recorder"
    resource("make-it-quick").stage buildpath/"recorder/make-it-quick"
    ENV.prepend_path "PATH", formula_opt_libexec("coreutils")/"gnubin"

    %w[db48x db50x].each do |simulator|
      next if build.without?(simulator)

      target = (simulator == "db48x") ? "sim" : "color-dm32-sim"
      system "gmake", target, "VERSION=#{version}", "QMAKE=#{formula_opt_bin("qtbase")}/qmake"
      if OS.mac?
        prefix.install "#{simulator}.app"
        bin.install_symlink prefix/"#{simulator}.app/Contents/MacOS/#{simulator}"
      else
        bin.install simulator
      end
    end
  end

  def caveats
    on_macos do
      example = build.without?("db50x") ? "db48x" : "db50x"
      <<~EOS
        Launch installed simulators with db48x or db50x.
        Their app bundles are under #{opt_prefix}:
          db48x.app (unless built --without-db48x)
          db50x.app (unless built --without-db50x)
        Open an installed app with open, or link it into /Applications, e.g.:
          open #{opt_prefix}/#{example}.app
          ln -s #{opt_prefix}/#{example}.app /Applications/#{example}.app
      EOS
    end
  end

  test do
    %w[db48x db50x].each do |simulator|
      next if build.without?(simulator)

      assert_equal "5", shell_output("#{bin}/#{simulator} -H -Z -E '2 3 +'").strip
      assert_equal "144", shell_output("#{bin}/#{simulator} -H -Z -E '12 SQ'").strip
    end
  end
end
