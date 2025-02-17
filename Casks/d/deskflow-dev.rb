cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.19.0.44"
  sha256 arm:   "5d2554de932972b391caacf4d483028f5f6704960f3a5f0dbe2dc3c1d6186829", intel: "849ea717a568fea68316a97308fd52ec88cd28c5db1b5e10f165f7e6c5a16cb2"

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
