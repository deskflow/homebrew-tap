cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.21.2.290"
  sha256 arm:   "2cb842ce1a7408a27be2a5ab45ee502faf6824f720e41976bed9a1493fe3a7f9", intel: "95dd4a2f0a8f9fcd82f25c47a8c48991c9bb166d671c8a8afeda1e4ef0170f0a"

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
