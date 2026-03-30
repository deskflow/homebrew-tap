cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.104"
  sha256 arm:   "6dec271b4ac7d36da8fc0afc0026fda0a31fdc9951e50b21c554fb47a88f0887", intel: "d47d0a128873729df9c3c23102e83690136c0cbff3e38e427ef24be927d14016"

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
