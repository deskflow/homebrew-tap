cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.110"
  sha256 arm:   "e0a22694a8456a13767d1aca758cdabe5c195abfa28eacf47d33ef3672b06ba9", intel: "4d342dbc5245a8dc2d39fc40b405a9f0277502cda42c1ad45ea257c78b118a69"

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
