cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.21.2.29"
  sha256 arm:   "00b39c12651f7cacfd452ac014e7cb399221f022f772ff69c39aed30ae737298", intel: "1fb05368403e12648dc22b261606dbf99a73c74b39ee217a5ced4be78863d5ce"

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
