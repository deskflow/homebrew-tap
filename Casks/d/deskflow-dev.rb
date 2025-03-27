cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.20.1.225"
  sha256 arm:   "558234bf59fc8e3c598edb8f9bce8fba893a981682b1323ca93514144deff75b", intel: "09033387d4542c4dff769800756f657bc7497650be861b7dc2acc341dc6bcf01"

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
