class gpredict < Formula
  desc "Gpredict satellite trackling application"
  homepage "http://gpredict.oz9aec.net/"
  url "https://github.com/csete/gpredict/archive/1.3.x.zip"
  sha256 "6783c77c030bd41a618c811d3312d4fc9cca8b45ce646b9452c48502636bdbb6"

  depends_on :x11
  depends_on 'pkg-config' => :build
  depends_on 'intltool' => :build
  depends_on 'curl'
  depends_on 'gettext'
  depends_on 'glib'
  depends_on 'goocanvas'
  depends_on 'gtk+'
  depends_on 'hamlib'

  def install
    ettext = Formula['gettext']
    ENV.append "CFLAGS", "-I#{gettext.include}"
    ENV.append "LDFLAGS", "-L#{gettext.lib}"
        
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make", "install" 
  end

  test do
    system "false"
  end
end