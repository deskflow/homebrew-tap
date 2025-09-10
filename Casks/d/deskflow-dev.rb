cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.23.0.204"
  sha256 arm:   "b24e8421f2fb0e7ee89ec8367e78c87254d49d7fc70e48dad962761bca98d4eb", intel: "69deb02ec2a1ce35213471224a1bd5d2714735a3a4ce041d156dcc9864bd21d0"

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
