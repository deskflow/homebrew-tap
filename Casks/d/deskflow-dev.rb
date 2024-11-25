cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.17.2.15"
  sha256 arm:   "16aa81bbe8e9cd4eac3ebcbfa2f2c04fae850d2c7b2a970ad5e8fbc56f79e72f", intel: "4a86b5720b537981865d53db79c17373c36b9ab5ef6b7f6a7390a85afec36dee"

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
                     "-c", "/Applications/Deskflow.app"
                   ]
  end

  zap trash: [
     "~/Library/Saved Application State/Deskflow.savedState",
    "~/Library/Application Support/Deskflow",
  ]
end
