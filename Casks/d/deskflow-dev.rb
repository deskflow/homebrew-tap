cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.19.0.56"
  sha256 arm:   "08d5124a2445413b97c5310fe9cdbc28047df39ab79642c7d81cc09ee89895b0", intel: "e502021ae18d4d7e42b025d114ce55991b5c68c8a9c611d24d0e4706899e9765"

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
