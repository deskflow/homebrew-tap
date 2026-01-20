cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.25.0.182"
  sha256 arm:   "b81e770132d6dc216cf134a0d9d79220b85c7ac7ceefdbd2cfc84d7b202479a7", intel: "b44ccbe556c33b41b8f19c6f71990d5105c00ae5d1185f38f44df0b3e65a59db"

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
