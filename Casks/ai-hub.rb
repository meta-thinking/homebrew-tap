cask "ai-hub" do
  version "0.5.0"

  on_arm do
    sha256 "24654b5e7ba2dee56cc2966d0f07624754797423c66fedf3b74b8a497f550d84"
    url "https://github.com/meta-thinking/homebrew-tap/releases/download/desktop-v#{version}/AI-Hub_#{version}_aarch64.app.tar.gz"
  end
  on_intel do
    sha256 "7048cece11fca966eec27de1db6ca44dc4c273d2ecdc8cc7a5093d767850d3f8"
    url "https://github.com/meta-thinking/homebrew-tap/releases/download/desktop-v#{version}/AI-Hub_#{version}_x64.app.tar.gz"
  end

  name "AI Hub"
  desc "Your AI subscriptions as one OpenAI-compatible endpoint"
  homepage "https://aihub.meta-thinking.net"

  app "AI Hub.app"

  zap trash: [
    "~/.ai-hub",
    "~/Library/Application Support/AI-Hub",
    "~/Library/Application Support/net.meta-thinking.ai-hub",
  ]

  caveats <<~EOS
    AI Hub is signed with a Developer ID and notarized by Apple, so it opens
    normally — no Gatekeeper prompt, nothing to disable.

    The `ai-hub` command line tool installs from the app itself:
    open AI Hub -> Server -> Install CLI.

    Generated images and clips are kept in ~/.ai-hub/generated-content, and
    can be emptied from the Server tab.

    Everything is free — sign in once to unlock one-click client configs.
    Plans: https://aihub.meta-thinking.net/pricing
    Docs: https://aihub.meta-thinking.net/docs
  EOS
end
