cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.25.0.220"
  sha256 arm:   "94922212ed29d53743ac8c138415963d7466266852ecf1fd916b55c3850bdc9e", intel: "43c64a71a80125137de721b53eac371c2b4349e3c2ca5db39de4b6ea7ea590dd"

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
