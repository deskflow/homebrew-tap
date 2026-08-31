cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.425"
  sha256 arm:   "5e5e45c6a443d252c9a1baccd4015d6673bd374320a3950945e16572888f6f2b", intel: "b3f4128463a8cde4a59572ef71f9d80c0c9bf20a9e2f7038e0230f4f5dc98eca"

  url "https://github.com/deskflow/deskflow/releases/download/continuous/deskflow-continuous-macos-#{arch}.dmg",
      verified: "github.com/deskflow/deskflow/"
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
