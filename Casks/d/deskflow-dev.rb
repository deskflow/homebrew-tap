cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.17.2.60"
  sha256 arm:   "7002bd732629fe4b2f7b978cf2686634e6cf7b4d50d8497d88b58344cbe1eb86", intel: "15e4d116d75e06d59948f4a9af2a8c2001333f2d916c1c16b5dfe0e4edbdab79"

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
