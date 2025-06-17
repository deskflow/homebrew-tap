cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.22.0.68"
  sha256 arm:   "a7d32ef60ed0fa5055fd5626773c8ee6964d1a47537b6b2e570a99f3b3893235", intel: "80715db0e07fac1b2a9b25dbccddcfce9786cdfb6ef3beaba8b1b9f52d8b28b7"

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
