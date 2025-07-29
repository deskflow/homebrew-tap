cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.23.0.13"
  sha256 arm:   "58b77a1e30f84d86993694844f7b990ed6ddc3440debe1a57b8785031eea2ac1", intel: "2682398deee544fa5a99dcb0ab5147887a34f7a4d0a009d39b063ed323a17a8d"

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
