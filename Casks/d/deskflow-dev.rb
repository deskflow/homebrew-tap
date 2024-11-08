cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.17.1.0"
  sha256 arm:   "1afa4a16ea320554771592ab987e7e81e364219b870dcf290c7a90ee92d28a4c", intel: "0876bedb40c2fdbe316d667439aef3a94446b7919fb6655aa4cc0c37e33cd5d0"

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
                     "-c", "/Applications/Deskflow.app"
                   ]
  end

  zap trash: [
     "~/Library/Saved Application State/Deskflow.savedState",
    "~/Library/Application Support/Deskflow",
  ]
end
