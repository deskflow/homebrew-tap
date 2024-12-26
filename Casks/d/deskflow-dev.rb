cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.17.2.109"
  sha256 arm:   "25f09a889ae40dfa89eed37718ea0e33ebecc6eeb933712ba79975b06bccdd3c", intel: "be6ae71ed94c0451cb34a5e80d270c6c1caa20b23ab05860a50e9c9df9df8948"

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
