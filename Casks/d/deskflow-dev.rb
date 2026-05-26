cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.210"
  sha256 arm:   "398757bb5e7c3958597830ff035bb8f5aec148e90224e9187e52d3e6024b8840", intel: "f5aa765e35c08751093cc420f3271cd4454833d39c288bd3351d35865254509c"

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
