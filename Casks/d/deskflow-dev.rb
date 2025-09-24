cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.24.0.17"
  sha256 arm:   "36dfa569547ea0b9fd333a41d5a950120f7f297499fd49b8a39f0c724d9d232b", intel: "8b9661a5ba27a3addadb6ca239786a534d10533a4cde02fcd23d8b15a7d11bb6"

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
