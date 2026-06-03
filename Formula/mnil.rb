class Mnil < Formula
    desc "TUI log viewer that follows piped stdin"
    homepage "https://github.com/garrettcannon/mnil"
    url "https://github.com/garrettcannon/mnil/archive/refs/tags/v0.2.0.tar.gz"
    sha256 "1543c6d8ff2b6f91e92b7816e6f90a5b137e44a4d5f05887639cf1434b8a45a4"
    license "MIT"
    head "https://github.com/garrettcannon/mnil.git", branch: "main"

    depends_on "go" => :build

    def install
      system "go", "build",
        "-trimpath",
        "-ldflags", "-s -w -X main.version=#{version}",
        "-o", bin/"mnil",
        "."
    end

    test do
      assert_match(/mnil/, shell_output("#{bin}/mnil -version"))
    end
  end
