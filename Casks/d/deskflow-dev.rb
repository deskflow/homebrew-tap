cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.25.0.155"
  sha256 arm:   "bb24f966537a849d68b65338cdc6a8080bff1ec7c69a36d84e0b41035bee21b1", intel: "015c333853782c093556848bfaa26f42e1ffc7822739b2e90f89e5520ed1a885"

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
