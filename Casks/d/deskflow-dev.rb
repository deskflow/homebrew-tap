cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.22.0.35"
  sha256 arm:   "52ebd1248f3ef0effaa0870c089d53704466425b614aa7dde7b9a8bf11bb4631", intel: "17f85f190d6e497d4b4800ba31fd9fd96720dc99050db6c2070ebfb94aa46630"

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
