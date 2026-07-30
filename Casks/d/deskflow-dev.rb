cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.342"
  sha256 arm:   "0f7630e08380c98ec576f793f79d765517911054e2b182827a60cc5398f86fc1", intel: "095699986d275167fa1512b10f581a8f49fb452199f90ff8b06bfdbbb995329b"

  url "https://github.com/deskflow/deskflow/releases/download/continuous/deskflow-continuous-macos-#{arch}.dmg",
      verified: "github.com/deskflow/deskflow/"
  name "Deskflow"
  desc "Mouse and keyboard sharing utility"
  homepage "https://github.com/deskflow/deskflow"

  conflicts_with cask: "deskflow"

  depends_on macos: :monterey

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
