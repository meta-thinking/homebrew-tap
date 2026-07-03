cask "ai-proxy" do
  version "1.9.1"
  sha256 "9acbd105f677c71b99ffdd0fb1d7fc159a67c1fc61ba4e643585d414c9f9d31c"

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
