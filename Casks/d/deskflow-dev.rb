cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.18.0.159"
  sha256 arm:   "0466c5aae32a7fd0c5a2502cd19ebe4c9e9c06c4aa82259eed79e658df9827e9", intel: "32d90d5ee2eb77d35a5bc346eff6bef512922ff1484a6226b0afe5499429c65b"

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
