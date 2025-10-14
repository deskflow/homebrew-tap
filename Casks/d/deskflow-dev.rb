cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.24.0.109"
  sha256 arm:   "644b97a847931b71f404e95164d9c70885b062675cd057a7da9ea8ebb3921035", intel: "f818e4155cce3f1e66e0059368266ae62dfaba65318d9c39b808bf21e8d17cfe"

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
