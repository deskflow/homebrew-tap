cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.89"
  sha256 arm:   "9b915842f04dc72f6ba9f17a245de365db5561d7b5bde4feb676d8c41fb4c67c", intel: "2e5b8cf69336a9e1a8fba4c0215581201696b2a0be22858f31b62e76f420a823"

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
