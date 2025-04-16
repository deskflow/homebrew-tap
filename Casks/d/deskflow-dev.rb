cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.21.2.10"
  sha256 arm:   "a5b0d1558cc97bcdfb9cdd2a636250b0c5541dd7a41ac32ba730ac15535ccbe1", intel: "ecc7eb3833c18ada364785d9cfad39a64e965acc920b3ee27f88038784e09cc6"

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
