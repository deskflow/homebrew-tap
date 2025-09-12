cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.24.0.3"
  sha256 arm:   "634822f31ce19bb415ebb7842f0730ee2b2aff4012c4d58ae9c896e2be2f047e", intel: "e807228a24472a3630e9783bf909126c4c9745fe00faf21a5d7a464946abd938"

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
