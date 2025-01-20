cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.18.0.96"
  sha256 arm:   "409f3929344b903d2ac818610ea364fa386c682d8df387693f9957f83f88dc2d", intel: "198a31afed8e228df6eb2a73fe0f6c4ef277ae2fc24b5e25d161be3534478c80"

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
