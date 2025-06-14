cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.22.0.60"
  sha256 arm:   "6f5c6e07bc4e6b588c749b13085634d84bbfeca2024e0db63d70b75d14b54657", intel: "8cb72915ea51c12fc82ec9ebe5867c1aa8315e12800aa516c5dbbf71889c8165"

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
