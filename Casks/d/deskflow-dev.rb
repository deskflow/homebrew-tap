cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.229"
  sha256 arm:   "3bb5d77a26fbb5e0209f24f6181ecdd00bf63b751c94ad2d82ae40ecb25c6162", intel: "bd4fd0682d4b4aa23fdb466c6b6a5be753ffb5a3a35c03faff02db2893390349"

  url "https://github.com/deskflow/deskflow/releases/download/continuous/deskflow-continuous-macos-#{arch}.dmg",
      verified: "github.com/deskflow/deskflow/"
  name "Deskflow"
  desc "Mouse and keyboard sharing utility"
  homepage "https://github.com/deskflow/deskflow"

  conflicts_with cask: "deskflow"

  depends_on macos: :monterey

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
