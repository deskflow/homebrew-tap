cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.20.0.5"
  sha256 arm:   "f8c5616afc0bc0d49577bcb1b30780b0ad3bf50b1169db3c0d372ac9f686ff3e", intel: "7f14dcb547562e4978446ff75dbedcaef1a59283c639185eeaa83af39330403f"

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
