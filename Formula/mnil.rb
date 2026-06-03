class Mnil < Formula
    desc "TUI log viewer that follows piped stdin"
    homepage "https://github.com/garrettcannon/mnil"
    url "https://github.com/garrettcannon/mnil/archive/refs/tags/v0.1.0.tar.gz"
    sha256 "c378ee9403cf9cc78380330a35ffcda0b1718ef513af4c4e71324c8d1dce2d29"
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
