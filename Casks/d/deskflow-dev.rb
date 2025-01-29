cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.18.0.163"
  sha256 arm:   "7816d86e49ab06d3aba1502a4165fae4a9acb7e48fb4132cddacc5e353772551", intel: "2379f68d57e71e1a73b2531586c79afaf49e2c93556e7338c81349256460127f"

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
