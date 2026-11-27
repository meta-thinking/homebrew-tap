cask "ai-hub" do
  version "0.5.1"

  on_arm do
    sha256 "9c4f4098b53746799f3867e7abbb6c9ec328540c8650b842a68467abc8127e78"
    url "https://github.com/meta-thinking/homebrew-tap/releases/download/desktop-v#{version}/AI-Hub_#{version}_aarch64.app.tar.gz"
  end
  on_intel do
    sha256 "4c24235940c1b6231552f9876a6409bcc18d6b11f290c0240e83f24887e07e8b"
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
  EOS
end
