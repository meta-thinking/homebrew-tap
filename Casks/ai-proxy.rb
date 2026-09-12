cask "ai-proxy" do
  version "0.4.1"

  on_arm do
    sha256 "a86286dde400f089bae1234bca78e3baeaa769899862ae553b174b14e1ed0a43"
    url "https://github.com/meta-thinking/homebrew-tap/releases/download/desktop-v#{version}/AI-Proxy_#{version}_aarch64.app.tar.gz"
  end
  on_intel do
    sha256 "19508aa7356bb2d40b2284e64b4c673dc7a271e1e430b722753fb92919255015"
    url "https://github.com/meta-thinking/homebrew-tap/releases/download/desktop-v#{version}/AI-Proxy_#{version}_x64.app.tar.gz"
  end

  name "AI-Proxy"
  desc "The automations gateway — your AI subscriptions as one OpenAI-compatible endpoint"
  homepage "https://aiproxy.meta-thinking.net"

  app "AI-Proxy.app"

  zap trash: [
    "~/Library/Application Support/AI-Proxy",
    "~/Library/Application Support/com.metathinking.ai-proxy.desktop",
  ]

  caveats <<~EOS
    AI-Proxy is signed with a Developer ID and notarized by Apple, so it opens
    normally — no Gatekeeper prompt, nothing to disable.

    The `ai-proxy` command line tool installs from the app itself:
    open AI-Proxy -> Server -> Install CLI. (The old ai-proxy-cli formula is
    retired: on Apple Silicon /opt/homebrew/bin precedes /usr/local/bin, so a
    brewed copy shadowed the app's own and rewrote its engine config.)

    Generated images and clips are kept in ~/.ai-proxy/generated-content, and
    can be emptied from the Server tab.

    Everything is free — sign in once to unlock one-click client configs.
    Plans: https://aiproxy.meta-thinking.net/pricing
    Docs: https://aiproxy.meta-thinking.net/docs
  EOS
end
