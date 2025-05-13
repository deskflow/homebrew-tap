cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.21.2.230"
  sha256 arm:   "a8e36caf62b5501da1c7251c97791f703f8776f508203452fc4ed1cfd82687ab", intel: "aa182b295ac4a312bf64a8560e0b1b67ab82908c7c6e327cd929a4d853d718ef"

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
