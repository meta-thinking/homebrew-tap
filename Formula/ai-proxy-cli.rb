class AiProxyCli < Formula
  desc "Headless AI-Proxy: your AI subscriptions as one OpenAI-compatible endpoint"
  homepage "https://aiproxy.meta-thinking.net"
  version "0.2.9"

  depends_on arch: :arm64

  url "https://github.com/meta-thinking/homebrew-tap/releases/download/desktop-v#{version}/ai-proxy-cli-darwin-arm64.tar.gz"
  sha256 "49715e1ed957c03953e543c9b94be7fa01e7c65a89b2362b7900eb95524639e3"

  def install
    libexec.install "ai-proxy-server", "aiproxy-adapter", "ai-proxy"
    bin.install_symlink libexec/"ai-proxy"
  end

  def caveats
    <<~EOS
      Quick start:
        ai-proxy login gemini     # free Gemini via OAuth
        ai-proxy start            # gateway on :8317
      Pro unlock (image/video/voice; the gateway itself is free forever):
        export AIPROXY_LICENSE_KEY=ap_sk_...   # aiproxy.meta-thinking.net/dashboard
      Docs: https://aiproxy.meta-thinking.net/docs
    EOS
  end

  test do
    assert_match "stopped", shell_output("#{bin}/ai-proxy status")
  end
end
