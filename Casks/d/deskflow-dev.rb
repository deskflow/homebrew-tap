cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.18.0.0"
  sha256 arm:   "8bbe1023f481ab93c8f50b22d2f5f26e98205494f3a4d0ce2a02c3d727e1ff53", intel: "f27c7ed634b19ba0b3c0d9513e7f7619abc05a270b67bd12e466b75474c9caba"

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
