cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.18.0.46"
  sha256 arm:   "3a1d216ae32c6e7c00866a86f34f1dd6919e4e51ef10ede63df3e92207e14d9c", intel: "f1f4055dabb4ef9cfc003e84e174870dc7a1345d575bd50e28d9bf4339b04e7f"

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
