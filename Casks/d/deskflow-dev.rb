cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.27.0.25"
  sha256 arm:   "c88c116cbfe0c2a7d62409a2bd9eaa36a892d3101c56a787692c973b538db1ba", intel: "98c164de8ed4bb3bf329a7486c331a66965f2432a1044b283656f12973c7d164"

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
