cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.24.0.20"
  sha256 arm:   "e1c1c649aa4c7533938c4551be2d58ef3d5c44a98f33ae89b9a75684f81abbe2", intel: "7d12a48dd859e9874d06e1ebe5ebc106b6ca5783a3897420a02062507fb680c7"

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
