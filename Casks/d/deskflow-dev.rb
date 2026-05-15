cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.196"
  sha256 arm:   "a9cfdcab314fa22f3eb1b784561608ac22bc7be2095ae4367bf560d38d809c08", intel: "b5c71e1616b9d4043a2413d9b420d8ac618efaf6a8ca8b21bd784844c8295881"

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
