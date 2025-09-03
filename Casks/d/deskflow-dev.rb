cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.23.0.184"
  sha256 arm:   "369db8d8fb0da6fb9cd9209ce5335176c1e6c250346b7470233dc16e5f72b5ac", intel: "c473558a913bbab5ddd13b5e855a20366d856648df92c2de05fd1f6c11d4a787"

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
