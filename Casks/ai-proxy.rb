cask "ai-proxy" do
  version "0.3.0"
  sha256 "586c7575f4a3774e7d6ef52ea8b0045d7669059f59b71edb53f8fed4a8939e54"

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
