cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.177"
  sha256 arm:   "f4a78f79f282d1a5d5b3f2cc27c12510d30a03fdc16ac5052467664817b283c2", intel: "ce6212fa19ac4672767fec2d718e1349412e239d4634a91001a9348feba0cf05"

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
