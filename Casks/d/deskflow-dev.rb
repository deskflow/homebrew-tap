cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.21.2.40"
  sha256 arm:   "2a9d7428d8fe911cf5b1c5117dfede573a15e507bf649acb4bccda67a4d3bfc7", intel: "b7c04df553453cd746c8549a96e25d221fec0bc4d1215854f1857e7ce3708e94"

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
