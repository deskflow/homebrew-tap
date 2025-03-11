cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.20.1.9"
  sha256 arm:   "fa015f938d7204a91773c1c28e65227117effbc88ad6efecc34bcde9e9653924", intel: "57069570ca90cc0418458fc4e084b22d315a54ea83aab1b7c1189dcd150c4c46"

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
