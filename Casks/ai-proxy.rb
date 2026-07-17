cask "ai-proxy" do
  version "0.3.1"

  on_arm do
    sha256 "fda94f0f4394b620c43adefb6c49188d26dc965b289380563ad25389c388eedc"
    url "https://github.com/meta-thinking/homebrew-tap/releases/download/desktop-v#{version}/AI-Proxy_#{version}_aarch64.app.tar.gz"
  end
  on_intel do
    sha256 "aa61e11f8c2618d9bb9cea1688c232fd433147eb860e63392bf29d6eb5ae53d2"
    url "https://github.com/meta-thinking/homebrew-tap/releases/download/desktop-v#{version}/AI-Proxy_#{version}_x64.app.tar.gz"
  end

  name "AI-Proxy"
  desc "The automations gateway — your AI subscriptions as one OpenAI-compatible endpoint"
  homepage "https://aiproxy.meta-thinking.net"

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

    Free forever: text models, your subscriptions, Ollama, one API key.
    Pro (image/video/voice + quick configs): https://aiproxy.meta-thinking.net/pricing
    Docs: https://aiproxy.meta-thinking.net/docs
  EOS
end
