cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.21.2.42"
  sha256 arm:   "ca7f976115eff8d927771879b2cc24ed41f1fee3b817966aff7ca2a394dd9fbd", intel: "382734356dcd6eed876633d65ad7d6d6b1d059104c9bfdf883b3a27d0e2a7a6b"

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
