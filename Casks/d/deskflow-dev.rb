cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.20.1.157"
  sha256 arm:   "785529a023ad7c61d7218a9e93be03e8aca6fe49320a4d3f446fad0d60e556a0", intel: "1a7f75bdbef50197220ca640591290a358ac383e6dcd1cc9790ee7cd61dccf9e"

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
