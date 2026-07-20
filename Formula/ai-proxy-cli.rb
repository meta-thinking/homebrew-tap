class AiProxyCli < Formula
  desc "Headless AI-Proxy: your AI subscriptions as one OpenAI-compatible endpoint"
  homepage "https://aiproxy.meta-thinking.net"
  version "0.3.2"

  on_macos do
    on_arm do
      url "https://github.com/meta-thinking/homebrew-tap/releases/download/desktop-v#{version}/ai-proxy-cli-darwin-arm64.tar.gz"
      sha256 "91b685e2dbe1eaccefa5d743152c4bb190065fb8c457efd748c4651ce4e2d8c8"
    end
    on_intel do
      url "https://github.com/meta-thinking/homebrew-tap/releases/download/desktop-v#{version}/ai-proxy-cli-darwin-amd64.tar.gz"
      sha256 "d73dfc789d300f8d1d5ff9b8ea7272ac8ca1790aacc59dd265fad667af751f6d"
    end
  end
  on_linux do
    url "https://github.com/meta-thinking/homebrew-tap/releases/download/desktop-v#{version}/ai-proxy-cli-linux-amd64.tar.gz"
    sha256 "1162f012e36061fdda9c473700a830ba260dd010190858a5e9e13312d8945dc9"
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
