cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.25.0.208"
  sha256 arm:   "5233d2f123232745eab47b9ce5ade8e432d8af7bad0b5c344d93d09f9206d476", intel: "75f4d16da48dd1c55995d7ea4d4d34da7a6da0b836bdd00adb4b9ef950a8b7a0"

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
