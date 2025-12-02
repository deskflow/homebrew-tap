cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.25.0.47"
  sha256 arm:   "a4ea8a9eb20658a5b79fa793dc263a06eb31af631f1dcf4be6595898a28cae5f", intel: "8bb0c01fd34f952772180d9dcf97a7abe3352a820b820c141a95977a0a8a3c2f"

  url "https://github.com/deskflow/deskflow/releases/download/continuous/deskflow-continuous-macos-#{arch}.dmg",
      verified: "github.com/deskflow/deskflow/"
  name "Deskflow"
  desc "Mouse and keyboard sharing utility"
  homepage "https://github.com/deskflow/deskflow"

  conflicts_with cask: "deskflow"

  depends_on macos: ">= :monterey"

  app "Deskflow.app"

  postflight do
    system_command "xattr",
                   args: [
                     "-c", "#{appdir}/Deskflow.app"
                   ]
  end

  zap trash: [
     "~/Library/Saved Application State/Deskflow.savedState",
    "~/Library/Application Support/Deskflow",
  ]
end
