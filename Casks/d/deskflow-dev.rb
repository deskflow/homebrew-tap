cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.22.0.107"
  sha256 arm:   "ac3aac3e11e9ca58df960ccbad0c0d0b7f0e5b5c1875d10a6ea91f88f2e42868", intel: "6ecd1be5fadc31fb328c43de13b6cbe8bd49d659f19c5280386c86105ea555c0"

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
