cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.21.2.30"
  sha256 arm:   "64d9033ca4f5d35c8fe1508fa9fc0d3f8552c02bbac015a9b99c56e5cec887bf", intel: "6925475f2785d7cfe3d94316e230a62ae9891eb4b7bd7925a2354ff12eaa7b27"

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
