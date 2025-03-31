cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.21.1.0"
  sha256 arm:   "b6e7b36707e2d5d5202e0f1e7145ed38f80ebd6cc3b2be9f6a5cb65f9739e7ef", intel: "29d05e949dbdf812ecdbecaa3186255e4cf32ec8e283d87e4d327bd58baf8700"

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
