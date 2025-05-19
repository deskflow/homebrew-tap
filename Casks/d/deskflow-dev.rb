cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.21.2.239"
  sha256 arm:   "5597561f92526f5ccaebc5356bf68cca4b1ad9a56016b955171ac84e738120fc", intel: "50f97f37913c6a587be2e0efb751a30097a44f780abdc6d654376db6e756841d"

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
