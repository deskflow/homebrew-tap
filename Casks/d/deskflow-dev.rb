cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.19.0.85"
  sha256 arm:   "976c22e76ccebab28ab331dacf14064be89ca01b99734031258f611f7362a498", intel: "99dd8254c16ac3033e4106ac93296718c75dfe4ef18e8345f4a9d38eb42883ae"

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
