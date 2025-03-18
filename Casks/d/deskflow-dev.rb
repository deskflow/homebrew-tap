cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.20.1.109"
  sha256 arm:   "fc0092ad6775c61f47db482f7444425f719f2670752224111796058d215b9cb5", intel: "62b9c155e6a1181e08d6a5358eb14a2575228871132f7410cdc034c492c2c198"

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
