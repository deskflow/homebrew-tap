cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.18.0.3"
  sha256 arm:   "0faa662180d344185b6a2bdbd7dc75e27487196cf3d8b8d001c3a4191d81869c", intel: "fe539d7bccadef067d6e06412e35bf2a16d9847e56f0a43f1b2778df6fa3b22a"

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
