cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.19.0.88"
  sha256 arm:   "c48082192fd0eea0f18ac610dbbf1f271d02ddd0697fbb7de4a5e46ee65392e0", intel: "18c5387e394d14016a01e763ae08c617103eafe8f253d9203ee0b86d7bb8694f"

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
