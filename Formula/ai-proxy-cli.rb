class AiProxyCli < Formula
  desc "Headless AI-Proxy: your AI subscriptions as one OpenAI-compatible endpoint"
  homepage "https://aiproxy.meta-thinking.net"
  version "0.2.6"

  depends_on arch: :arm64

  url "https://github.com/meta-thinking/homebrew-tap/releases/download/desktop-v#{version}/ai-proxy-cli-darwin-arm64.tar.gz"
  sha256 "2eaa6970f0cdb6d8be017bae1edece13e0985fbf34e006f420adae9a10dfe2a3"

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
