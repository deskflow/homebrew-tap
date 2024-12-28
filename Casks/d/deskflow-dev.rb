cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.18.0.2"
  sha256 arm:   "69d8747d354e2f4eeb7d27ba67e5bc3005243f192a78a6c6c219069a4059aa71", intel: "56b9fbfb56fe75f5a901c1b179a4fbf594313f9fd1a8b72e4e94089a3ad3737b"

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
