# heshamh96/homebrew-tap

```bash
brew tap heshamh96/tap
brew trust heshamh96/tap        # newer Homebrew asks you to trust third-party taps
brew install --cask ai-proxy
brew upgrade --cask ai-proxy    # updates

# If Gatekeeper blocks the first launch (app is ad-hoc signed):
xattr -dr com.apple.quarantine "/Applications/AI-Proxy.app"
```

**ai-proxy** — Mac app that exposes your AI subscriptions (Gemini, Claude, …) as one
local OpenAI-compatible API for tools like n8n, opencode, Cursor, and anything else that
accepts a custom base URL. The app bundle contains no secrets.
