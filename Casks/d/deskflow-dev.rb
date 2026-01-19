cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.25.0.179"
  sha256 arm:   "beb62a3a6215c63db6f915e590754b562f9efbee5a79313afa897509e2dc08c8", intel: "4804124812072700e2fe389fa15a8b0556f199383cceaeb50ddb1e41bbf8c1e0"

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
