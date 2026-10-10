cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.27.0.4"
  sha256 arm:   "757bf1cf05496c1830413b4abf96f61cfbc9a187aead84103db46eb5d586f2de", intel: "7ebe82f456cbe5db700c50e70663ad7cf6a400632e9eb60ca08f7425a6db0278"

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
