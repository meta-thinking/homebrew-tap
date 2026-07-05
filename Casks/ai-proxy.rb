cask "ai-proxy" do
  version "0.2.7"
  sha256 "1eae5c4cbed58cdb881f9b105f828d629a8908c158ac8efa8d7fc44b0bdff3a2"

  url "https://github.com/meta-thinking/homebrew-tap/releases/download/desktop-v#{version}/AI-Proxy_#{version}_aarch64.app.tar.gz"
  name "AI-Proxy"
  desc "The automations gateway — your AI subscriptions as one OpenAI-compatible endpoint"
  homepage "https://aiproxy.meta-thinking.net"

  depends_on arch: :arm64

  app "AI-Proxy.app"

  caveats <<~EOS
    AI-Proxy is ad-hoc signed (no Apple notarization yet). If macOS blocks the
    first launch:  xattr -dr com.apple.quarantine "/Applications/AI-Proxy.app"

    Free forever: text models, your subscriptions, Ollama, one API key.
    Pro (image/video/voice + quick configs): https://aiproxy.meta-thinking.net/pricing
    Docs: https://aiproxy.meta-thinking.net/docs
    (Apple Silicon only for now — Intel/Windows/Linux ship via CI.)
  EOS
end
