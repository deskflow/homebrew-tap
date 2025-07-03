cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.22.0.129"
  sha256 arm:   "ad32b7e388560940bb906faa303ea1ce4344014738b11b00d67d0ec08807804e", intel: "2170f2991a00b2fa9665653cf647da0ec1789a90e1af2751667727fcc8ec5ebc"

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
