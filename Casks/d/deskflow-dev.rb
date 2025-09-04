cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.23.0.186"
  sha256 arm:   "bf94561aa45a4b875f600950389ef99f5d5236c64ed3c70c96df941e731a35db", intel: "daf2c796d16d6223551ed6f559e2e75ae4191e61e06c7a58e0c47f199f8124b6"

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
