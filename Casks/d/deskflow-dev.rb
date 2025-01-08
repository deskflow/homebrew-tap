cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.18.0.41"
  sha256 arm:   "0a68eaf28cb18ca4a7fe31b9e4c62a95d8fcfe55d83fcb32dfb87572a1724509", intel: "6c5d3bb95cc868c0b3b156510d2aa1d07bcea72b49124ff63fb732c3fd332b6b"

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
