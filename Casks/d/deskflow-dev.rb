cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.18.0.158"
  sha256 arm:   "2096bda42970aacc7dd301bae231566bd44294c72570aa4125608dd0e775e73b", intel: "936ee7d50dcc052600573ac2b941b677c1dbf08537ac03f4496f3fe3f01c59c5"

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
