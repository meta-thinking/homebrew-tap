cask "ai-proxy" do
  version "0.3.0"
  sha256 "37db8640997065cbad9e2ea6c97caeeceaddd2fcac93fc63deb62c48c94ef797"

  url "https://github.com/meta-thinking/homebrew-tap/releases/download/desktop-v#{version}/AI-Proxy_#{version}_aarch64.app.tar.gz"
  name "AI-Proxy"
  desc "The automations gateway — your AI subscriptions as one OpenAI-compatible endpoint"
  homepage "https://aiproxy.meta-thinking.net"

  depends_on arch: :arm64

  app "AI-Proxy.app"

  caveats <<~EOS
    AI-Proxy is ad-hoc signed (not yet notarized by Apple), so the FIRST launch
    needs a one-time approval:

      EASIEST — skip the quarantine flag at install time:
        brew reinstall --cask --no-quarantine ai-proxy

      OR after a normal install:
        macOS 15 (Sequoia)+: open the app once (it will be blocked), then
          System Settings -> Privacy & Security -> "Open Anyway", or run:
        xattr -dr com.apple.quarantine "/Applications/AI-Proxy.app"

    Apple Silicon only (M1-M4). Intel/Windows/Linux builds ship via CI.

    Free forever: text models, your subscriptions, Ollama, one API key.
    Pro (image/video/voice + quick configs): https://aiproxy.meta-thinking.net/pricing
    Docs: https://aiproxy.meta-thinking.net/docs
  EOS
    AI-Proxy is ad-hoc signed (no Apple notarization yet). If macOS blocks the
    first launch:  xattr -dr com.apple.quarantine "/Applications/AI-Proxy.app"

    Free forever: text models, your subscriptions, Ollama, one API key.
    Pro (image/video/voice + quick configs): https://aiproxy.meta-thinking.net/pricing
    Docs: https://aiproxy.meta-thinking.net/docs
    (Apple Silicon only for now — Intel/Windows/Linux ship via CI.)
  EOS
end
