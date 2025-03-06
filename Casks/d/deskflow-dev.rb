cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.20.0.8"
  sha256 arm:   "b8f53d34af9741ad2847fc2134fb1e467af33bffaa5c50c5a03e5c0975caf56c", intel: "bf33326603d839df1394f3d44f99e13be0d13e30dcdfcdd4e6ab9ba02153da37"

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
