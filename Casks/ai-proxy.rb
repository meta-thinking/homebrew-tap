cask "ai-proxy" do
  version "1.10.1"
  sha256 "06a29d2c5b55fa69473a1880bbb1d8479a8e87dc816628f36b4a43816913f091"

  url "https://github.com/heshamh96/homebrew-tap/releases/download/v#{version}/AI-Proxy.zip"
  name "AI-Proxy"
  desc "Menu-bar gateway exposing your AI subscriptions as an OpenAI-compatible API"
  homepage "https://github.com/heshamh96/AI-Proxy"

  app "AI-Proxy.app"

  caveats <<~EOS
    AI-Proxy is ad-hoc signed (no Apple notarization yet). If macOS blocks the
    first launch, either right-click the app in /Applications and choose Open,
    or run:  xattr -dr com.apple.quarantine "/Applications/AI-Proxy.app"

    Look for the AI-Proxy window and the menu-bar icon. Not affiliated with
    Anthropic, Google, or OpenAI — it routes requests through YOUR OWN
    subscriptions (see the disclaimer in the app's License tab).
  EOS
end
