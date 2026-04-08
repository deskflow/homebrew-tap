cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.134"
  sha256 arm:   "c9bed0f4ff6a1ac63c8acfd9f95dfee4e029a2e0b1a26165fc9917caa76ec3bc", intel: "de11cf8871336c90549e73df9f1df9684c700e4576cf59cb277133718557e29e"

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
