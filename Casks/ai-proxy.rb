cask "ai-proxy" do
  version "0.2.6"
  sha256 "febf37943b2c00a4fc58084e5df55ea95da157887f4c8bb815488c0c5eeb23dd"

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
