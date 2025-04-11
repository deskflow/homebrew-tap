cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.21.2.7"
  sha256 arm:   "fecaf6ef876485445f34ff88a424ba167b87597c6419b4da92c4f0e2433290a6", intel: "8db442f1a6da6bf47b8d9dc7a3b7d4b985f9938d1dc475d52324269a323d292c"

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
