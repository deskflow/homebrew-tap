cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.17.1.48"
  sha256 arm:   "57d0b73f316bfb8768e5b130a7496405e020f518ed3a424ef08571bf9bb27a43", intel: "f6aeb248714753fc7557dd487625298f7df5099948aa5d1252f7c15cb80a6c3a"

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
                     "-c", "/Applications/Deskflow.app"
                   ]
  end

  zap trash: [
     "~/Library/Saved Application State/Deskflow.savedState",
    "~/Library/Application Support/Deskflow",
  ]
end
