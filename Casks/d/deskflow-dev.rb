cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.24.0.178"
  sha256 arm:   "82cc7c11975b87fca03af82177a74ccbb9e3cb703f43f3db53317d6ea21335d5", intel: "b7cf7352bf1f2c2eaf363cfc80743faf8fe272fb987ab02c7df47831fd07447b"

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
