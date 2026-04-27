cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.166"
  sha256 arm:   "d28ff6fb429698c52aa502cbc5e91864d69e3a07e7a7806e6800914ccb3619d9", intel: "bf5ee613919b5d369994b35e51ab7fa15e1909232b06618cac55dd25689eac79"

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
