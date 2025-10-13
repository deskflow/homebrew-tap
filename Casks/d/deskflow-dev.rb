cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.24.0.79"
  sha256 arm:   "725d53469eff8eb529578643e2066025184df4069b1add43f560f50e0126ef6c", intel: "ab9c81d71be88d4c8764dbbe0b41eed85547ac0963741cb629a6601165be7c75"

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
