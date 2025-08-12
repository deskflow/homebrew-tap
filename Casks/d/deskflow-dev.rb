cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.23.0.107"
  sha256 arm:   "5b8544b54a25f37a21eef7e8719c63192d8ac1b1dc09cf0f145d8f6d615995f4", intel: "ba3bcfa1457a5c11478b1531de4a51d3cc55a3595a4d66c0b74c0c1c434c6eea"

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
