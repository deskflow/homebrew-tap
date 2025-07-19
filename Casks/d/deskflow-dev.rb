cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.22.0.197"
  sha256 arm:   "9f221a5f30f032b3e947c983376150d8b96ace598323cde7f002922af1dbf294", intel: "81118139e07d6b1bd088eafa92e35f32c8d79bc0487fa24d48ef2f71a1926824"

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
