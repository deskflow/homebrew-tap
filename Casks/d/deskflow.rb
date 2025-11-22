cask "deskflow" do
  arch arm: "arm64", intel: "x86_64"

  version "1.25.0"
  sha256 arm:   "1ecd0b043049b89717b8650f1ac6cecd56b795df82a45efdfa617c565cfda2d8", intel: "5396dfea389494089417003a0c6c237147a85107eb1db8faa18c849ec0e67fb6"

  url "https://github.com/deskflow/deskflow/releases/download/v#{version}/deskflow-#{version}-macos-#{arch}.dmg",
      verified: "github.com/deskflow/deskflow/"
  name "Deskflow"
  desc "Mouse and keyboard sharing utility"
  homepage "https://github.com/deskflow/deskflow"

  conflicts_with cask: "deskflow-dev"

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
