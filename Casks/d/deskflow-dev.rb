cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.23.0.203"
  sha256 arm:   "a3737cf066ca76536adb56460b87a1d2b442bda7849308c9446ff770919b1d48", intel: "16eff664ca9df8796145e708561ba21c98623a86001d370c72b149fc444827f6"

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
