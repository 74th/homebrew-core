class Nuget < Formula
  desc "the package manager for the Microsoft development platform including .NET"
  homepage "https://www.nuget.org/"
  url "https://dist.nuget.org/win-x86-commandline/v3.4.3/nuget.exe"
  version "3.4.3"
  sha256 "3b1ea72943968d7af6bacdb4f2f3a048a25afd14564ef1d8b1c041fdb09ebb0a"

  bottle :unneeded

  depends_on "mono" => :recommended

  def install
    libexec.install "nuget.exe"
    bin.mkpath
    (bin/"nuget").write <<-EOS.undent
        #!/bin/bash
        mono #{libexec}/nuget.exe "$@"
    EOS
  end

  test do
    test_str = "NuGet"
    assert_match test_str, shell_output("#{bin}/nuget help").strip
  end
end
