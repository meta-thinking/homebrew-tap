class AiProxyCli < Formula
  desc "Headless AI-Proxy: your AI subscriptions as one OpenAI-compatible endpoint"
  homepage "https://aiproxy.meta-thinking.net"
  version "0.3.1"

  on_macos do
    on_arm do
      url "https://github.com/meta-thinking/homebrew-tap/releases/download/desktop-v#{version}/ai-proxy-cli-darwin-arm64.tar.gz"
      sha256 "29728b59762e3f80d55e2678ca5075f86b809d8567cae048944c2e0391427157"
    end
    on_intel do
      url "https://github.com/meta-thinking/homebrew-tap/releases/download/desktop-v#{version}/ai-proxy-cli-darwin-amd64.tar.gz"
      sha256 "7b980144ad5a3fcc48daf477247a53d4b7cd83ebb4394938fd1c7cb486d68879"
    end
  end
  on_linux do
    url "https://github.com/meta-thinking/homebrew-tap/releases/download/desktop-v#{version}/ai-proxy-cli-linux-amd64.tar.gz"
    sha256 "6af981f04e60b07940de7df775d2882587ced61d911e288c66b76ad52f190d01"
  end

  def install
    libexec.install "ai-proxy-server", "aiproxy-adapter", "ai-proxy"
    bin.install_symlink libexec/"ai-proxy"
  end

  def caveats
    <<~EOS
      Quick start:
        ai-proxy login gemini     # free Gemini via OAuth
        ai-proxy start            # gateway on :8317
        ai-proxy service-install  # macOS: auto-start + auto-restart (launchd)
      Health probe (no key, no tokens): curl -s http://localhost:8317/health
      Pro unlock (image/video/voice; the gateway itself is free forever):
        export AIPROXY_LICENSE_KEY=ap_sk_...   # aiproxy.meta-thinking.net/dashboard
      Docs: https://aiproxy.meta-thinking.net/docs
    EOS
  end

  test do
    assert_match "stopped", shell_output("#{bin}/ai-proxy status")
  end
end
