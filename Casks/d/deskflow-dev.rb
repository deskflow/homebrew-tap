cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.19.0.94"
  sha256 arm:   "543a7a59b47b5c6a81315df3909dd27e5d350d531572f13091323ef9883491d1", intel: "ae906a643d7f5f924c8edcf6c0686fa9a8ea5b1014cf38d6385780225b5b1448"

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
