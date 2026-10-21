cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.27.0.17"
  sha256 arm:   "9b2b4f8ba308b6e8e81afac1e2feb445f9d0932fc14ebaf9f8621948ba90b592", intel: "55614dc5bc64dc6c11c05a31574c6e3b8e5541d0d8382f5663b6e47e541511b0"

  url "https://github.com/deskflow/deskflow/releases/download/continuous/deskflow-continuous-macos-#{arch}.dmg"
  name "Deskflow"
  desc "Mouse and keyboard sharing utility"
  homepage "https://github.com/deskflow/deskflow"

  conflicts_with cask: "deskflow"

  depends_on macos: :monterey

  app "Deskflow.app"

  zap trash: [
     "~/Library/Saved Application State/Deskflow.savedState",
    "~/Library/Application Support/Deskflow",
  ]
end
