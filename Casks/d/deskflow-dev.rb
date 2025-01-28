cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.18.0.162"
  sha256 arm:   "0a4b0a5f60359f6c0efa82bb7e7d8dbe088340d6e6a967f68a14cad1d07a0001", intel: "afc82552236b3a8172998b702945e8190d13bcac41d71a7551659e44bf039caf"

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
