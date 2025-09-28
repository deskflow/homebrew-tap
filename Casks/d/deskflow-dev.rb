cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.24.0.28"
  sha256 arm:   "6da63377828d5a4a730d47593380cb261b19e336389590071bbd6e49b9777598", intel: "6560e07468391be0c3217b8664fe303c73ed4b4f7d0ad346825904f8cccb0eba"

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
