cask "deskflow" do
  arch arm: "arm64", intel: "x64"

  version "1.17.0"
  sha256 arm:   "cf0421257bb5c1ae1c14ec1f470c119619527e0b1f1b7f9fa1e66213c6bc88f4",
         intel: "64fc270052c31fe0843c1c1374ccfefe0d646bd7abf600ca3a9bd978dab4ed88"

  url "https://github.com/deskflow/deskflow/releases/download/v#{version}/deskflow-#{version}.0_mac_#{arch}.dmg",
      verified: "github.com/deskflow/deskflow/"
  name "Deskflow"
  desc "Mouse and keyboard sharing utility"
  homepage "https://github.com/deskflow/deskflow"

  livecheck do
    url :url
    strategy :github_latest
  end

  conflicts_with cask: "deskflow-dev"

  depends_on macos: ">= :monterey"

  app "Deskflow.app"

  postflight do
    system_command "xattr",
                   args: [
                     "-c", "/Applications/Deskflow.app"
                   ]
  end

  zap trash: [
     "~/Library/Saved Application State/Deskflow.savedState",
    "~/Library/Application Support/Deskflow",
  ]
end
