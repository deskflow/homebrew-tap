cask "deskflow" do
  arch arm: "arm64", intel: "x86_64"

  version "1.21.0"
  sha256 arm:   "2794a3bc7a541d5fdaac79e3ed9449d8e4b06054497d0581d7970b4259a70aa9", intel: "f4a51ffa3a4c0ff9a425931d045e78afb06643ad739cd6b0c5c87d98479c342e"

  url "https://github.com/deskflow/deskflow/releases/download/v#{version}/deskflow-#{version}-macos-#{arch}.dmg",
      verified: "github.com/deskflow/deskflow/"
  name "Deskflow"
  desc "Mouse and keyboard sharing utility"
  homepage "https://github.com/deskflow/deskflow"

  conflicts_with cask: "deskflow-dev"

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
