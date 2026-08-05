cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.349"
  sha256 arm:   "cd84ef0c0319964d5c31359d814f89e6e8848afdb42cbb946a381be241927974", intel: "d7cae0af1156955882ae47f7fb15f059cd3e40f8d4ac66785757c4c937c33b3c"

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
