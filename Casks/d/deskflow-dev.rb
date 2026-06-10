cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.233"
  sha256 arm:   "e83990a90e49247efbc50aa807ee48159df5cc129db88c6b54f7d7b2bc75b7a3", intel: "79cc8700deb36db60eb312c75f14d09c1c5991767ed1f703281a8f935e3cbff3"

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
