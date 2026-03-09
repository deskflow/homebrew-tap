cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.79"
  sha256 arm:   "7b62cb7920d2e81a908619b2abf62a464200b3ce5dcbee57cb274e4c4e1b050f", intel: "1d100a6e67a57147ef2cf15a1af04231ffd594263723e4c819f48effa7c74e38"

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
