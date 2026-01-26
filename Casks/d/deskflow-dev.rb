cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.25.0.207"
  sha256 arm:   "ed74a41183e51499645a0df67053bbd0f5c8d117113d378c5177d41ef9868127", intel: "924059c304e5392fa9a7342fbd04f9a62cb3b99fe55d68d3490bf521f60e1c95"

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
