cask "setups" do
  version "0.2.7"

  # Apple Silicon only. The url/sha256 stay at the TOP LEVEL rather than inside
  # an on_arm block: Homebrew validates a cask for every arch, and an on_arm-only
  # url leaves it with "Missing URL" on Intel — an invalid cask. That matters
  # because Homebrew's default branch validates every cask in a tap at
  # `brew tap` time, so one invalid cask here stops NEW users tapping at all,
  # including for ai-proxy, the other cask in this tap.
  #
  # `depends_on arch:` is what actually refuses the install on Intel, and it
  # says so with a real message instead of a validation error.
  depends_on arch: :arm64

  sha256 "6209383e4f5160e45fbff1d99c1d75ec4edb4b3179f76b8fabc69689c9ab1196"
  url "https://github.com/meta-thinking/homebrew-tap/releases/download/setups-v#{version}/Setups_#{version}_aarch64.app.tar.gz"

  name "Setups"
  desc "Your whole setup, saved — backup, timeline, and apply for your machine"
  homepage "https://setups.meta-thinking.net"

  app "Setups.app"

  zap trash: [
    "~/Library/Application Support/net.meta-thinking.setups",
    "~/.setups",
  ]

  caveats <<~EOS
    Setups is ad-hoc signed (Apple notarization is in progress), so the FIRST
    launch needs a one-time approval — run:

      xattr -dr com.apple.quarantine "/Applications/Setups.app"

    or open the app once (it will be blocked), then
    System Settings -> Privacy & Security -> "Open Anyway".

    The powerful optional CLI lives inside the app:
      Settings -> Install CLI  (tab completion included)
  EOS
end
