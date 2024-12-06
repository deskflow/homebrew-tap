cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.17.2.52"
  sha256 arm:   "d454860a438f908d16e4fe16f74d9b2dfc95e7b58f6949a53b6b5e9d017b06eb", intel: "44eb23dbaf558efd1d5cc8ebf6fb8c5f4cde008679881b8187342341f6beb8af"

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
