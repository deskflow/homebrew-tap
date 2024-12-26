cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.17.2.94"
  sha256 arm:   "bd3af26032ce5360785ef86c5f10475ff306e4d68674d9824de79598be96b8df", intel: "64ad4bd5728c59db842801445e2cf84f5d671c084ff20efb106a1812b55e1a80"

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
