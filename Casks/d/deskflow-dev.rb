cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.21.2.293"
  sha256 arm:   "61d73ce6f2c55c5ba115d2bd7d690b2a657bf0f3b75a6fc057ad135369d73cc4", intel: "a8a0c1b2da784bb696b1dd0809f59df3a7ce44e06765739ae1828911ab9b0e7c"

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
