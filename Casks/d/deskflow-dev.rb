cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.25.0.192"
  sha256 arm:   "8f7e1598737ebc1868b578cb317966fd58c153ce2745058343d1c5eda2dca492", intel: "989fee8922d35cb165c39722648ea5e81949faa4f911146185844d53a6194e84"

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
